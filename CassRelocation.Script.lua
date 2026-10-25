-- CassRelocation main loop. Attach to a repeatable 1 minute "Regular Time" event.
-- Requires CassRelocation.Settings.lua to have run (repeatable "Scenario is Loaded" event).
--
-- Each unit cycles through these states:
--   deployed -> teardown -> moving (or transit, if teleported) -> setup -> deployed
-- State is saved in the key store, so it survives save/load.

if CassRelocation == nil or CassRelocation.Defaults == nil then
    print("[CassRelocation] Settings not loaded; skipping tick")
    return
end

local R = CassRelocation
local log = R.log
local now = ScenEdit_CurrentTime()

------------------------- Helpers -------------------------

local function count(t)
    local n = 0
    if t then for _ in pairs(t) do n = n + 1 end end
    return n
end

local function randf(a, b) return a + math.random() * (b - a) end

local function serialize(v)
    local t = type(v)
    if t == "number" or t == "boolean" then return tostring(v)
    elseif t == "string" then return string.format("%q", v)
    elseif t == "table" then
        local parts = {}
        for k, val in pairs(v) do
            parts[#parts + 1] = "[" .. serialize(k) .. "]=" .. serialize(val)
        end
        return "{" .. table.concat(parts, ",") .. "}"
    end
    return "nil"
end

local function deserialize(s)
    if s == nil or s == "" then return nil end
    local f = load("return " .. s, "kv", "t", {})
    if not f then return nil end
    local ok, res = pcall(f)
    if ok then return res end
    return nil
end

local function getUnit(guid)
    local ok, u = pcall(ScenEdit_GetUnit, { guid = guid })
    if ok and u ~= nil and not u.IsDestroyed then return u end
    return nil
end

------------------------- Profiles -------------------------

local function matches(match, u)
    if match == nil then return true end
    if match.dbid ~= nil and match.dbid ~= u.dbid then return false end
    if match.classname ~= nil and match.classname ~= u.classname then return false end
    if match.namePattern ~= nil and not string.find(u.name, match.namePattern, 1, true) then return false end
    if match.category ~= nil then
        local c = tostring(match.category)
        if c ~= tostring(u.category) and c ~= tostring(u.subtype) then return false end
    end
    return true
end

-- Merged profiles are cached per tick by profile index
local merged = {}
local function mergeProfile(index, profile)
    if merged[index] == nil then
        local p = {}
        for k, v in pairs(R.Defaults) do p[k] = v end
        for k, v in pairs(profile or {}) do p[k] = v end
        p.name = p.name or (profile and ("profile " .. index)) or "defaults"
        merged[index] = p
    end
    return merged[index]
end

local function profileFor(u)
    for i, profile in ipairs(R.Profiles) do
        if matches(profile.match, u) then return mergeProfile(i, profile) end
    end
    return mergeProfile(0, nil)
end

------------------------- Posture -------------------------

local function goDark(u)
    u.obeyEMCON = true
    ScenEdit_SetEMCON('Unit', u.guid, 'Radar=Passive;Sonar=Passive;OECM=Passive')
    ScenEdit_SetDoctrine({ side = R.SideName, guid = u.guid }, {
        weapon_control_status_air = 2,
        weapon_control_status_surface = 2,
        weapon_control_status_subsurface = 2,
        weapon_control_status_land = 2,
    })
end

local function goHot(u, p)
    u.obeyEMCON = true
    ScenEdit_SetEMCON('Unit', u.guid, p.deployedEmcon)
    ScenEdit_SetDoctrine({ side = R.SideName, guid = u.guid }, {
        weapon_control_status_air = p.deployedWcs,
        weapon_control_status_surface = p.deployedWcs,
        weapon_control_status_subsurface = p.deployedWcs,
        weapon_control_status_land = p.deployedWcs,
    })
end

local function isEngaged(u)
    return count(u.firingAt) > 0 or count(u.firedOn) > 0
end

------------------------- Destinations -------------------------

local function isValidSite(lat, lon, p)
    local elevation = World_GetElevation({ latitude = lat, longitude = lon })
    if elevation == nil or elevation <= p.minElevation then return false end
    if p.maxSlope ~= nil then
        local location = World_GetLocation({ latitude = lat, longitude = lon })
        if location == nil or location.slope == nil or location.slope > p.maxSlope then return false end
    end
    return true
end

-- Random point relocateMin..relocateMax away from the unit, inside the anchor radius, on valid ground.
-- Returns nil if no point was found.
local function pickDestination(u, s, p)
    local anchor = { latitude = s.alat, longitude = s.alon }
    for _ = 1, R.DestinationTries do
        local point = World_GetPointFromBearing({
            latitude = u.latitude, longitude = u.longitude,
            distance = randf(p.relocateMin, p.relocateMax), bearing = math.random() * 360 })
        if point ~= nil and Tool_Range(anchor, point) <= p.radius
            and isValidSite(point.latitude, point.longitude, p) then
            return point
        end
    end
    -- The unit may be too close to the edge of its radius for a full hop: try anywhere inside the radius
    for _ = 1, R.DestinationTries do
        local point = World_GetPointFromBearing({
            latitude = s.alat, longitude = s.alon,
            distance = math.sqrt(math.random()) * p.radius, bearing = math.random() * 360 })
        if point ~= nil and isValidSite(point.latitude, point.longitude, p) then
            return point
        end
    end
    return nil
end

------------------------- State transitions -------------------------

local enterRelocate, enterSetup

local function enterDeployed(u, s, p, firstTime)
    u.holdposition = true
    goHot(u, p)
    s.st = "deployed"
    if firstTime and R.StartDesync then
        s.t = now + randf(0, p.deployedMax)
    else
        s.t = now + randf(p.deployedMin, p.deployedMax)
    end
    s.eng, s.hot = false, false
    log(u.name, "deployed until", s.t)
end

local function enterTeardown(u, s, p)
    u.holdposition = true
    if p.teardown <= 0 then return enterRelocate(u, s, p) end
    goDark(u)
    s.st, s.t = "teardown", now + p.teardown
    log(u.name, "tearing down")
end

local function teleport(u, s)
    ScenEdit_SetUnit({ guid = u.guid, latitude = s.dlat, longitude = s.dlon })
end

enterRelocate = function(u, s, p)
    local dest = pickDestination(u, s, p)
    if dest == nil then
        log(u.name, "no valid destination found, staying deployed")
        return enterDeployed(u, s, p, false)
    end
    s.dlat, s.dlon = dest.latitude, dest.longitude
    if p.mobility == "teleport" then
        goDark(u)
        teleport(u, s)
        s.st, s.t = "transit", now + p.transitTime
        log(u.name, "teleported, inactive until", s.t)
        return
    end
    if p.fireOnMove then goHot(u, p) else goDark(u) end
    u.holdposition = false
    u.course = { { latitude = s.dlat, longitude = s.dlon } }
    s.st = "moving"
    s.pd, s.pt = Tool_Range(u.guid, { latitude = s.dlat, longitude = s.dlon }), now
    log(u.name, "moving", s.pd, "nm")
end

enterSetup = function(u, s, p)
    u.holdposition = true
    if p.setup <= 0 then return enterDeployed(u, s, p, false) end
    goDark(u)
    s.st, s.t = "setup", now + p.setup
    log(u.name, "setting up")
end

------------------------- Main loop -------------------------

local state = deserialize(ScenEdit_GetKeyValue(R.StateKey)) or {}
local lastTick = tonumber(ScenEdit_GetKeyValue(R.LastTickKey)) or now
local dt = math.max(0, now - lastTick)

local function processUnit(u, s, p)
    if s.st == "deployed" then
        if p.pauseWhenEngaged and isEngaged(u) then
            s.t = s.t + dt
            s.eng, s.hot = true, true
        elseif s.hot then
            -- Engagement just ended: relocate sooner
            s.hot = false
            if p.afterEngagementMin ~= nil and p.afterEngagementMax ~= nil then
                s.t = math.min(s.t, now + randf(p.afterEngagementMin, p.afterEngagementMax))
                log(u.name, "engagement over, relocating by", s.t)
            end
        end
        if now >= s.t then enterTeardown(u, s, p) end

    elseif s.st == "teardown" then
        if now >= s.t then enterRelocate(u, s, p) end

    elseif s.st == "moving" then
        local dest = { latitude = s.dlat, longitude = s.dlon }
        local d = Tool_Range(u.guid, dest)
        if d <= R.ArriveDistance then
            enterSetup(u, s, p)
        else
            if d < s.pd - 0.1 then
                s.pd, s.pt = d, now
            elseif p.stuckTimeout > 0 and now - s.pt >= p.stuckTimeout then
                log(u.name, "stuck, teleporting to destination")
                teleport(u, s)
                return enterSetup(u, s, p)
            end
            -- Something cleared the course (e.g. the unit was given another order): re-issue it
            if count(u.course) == 0 then
                u.holdposition = false
                u.course = { dest }
            end
        end

    elseif s.st == "transit" then
        if now >= s.t then enterSetup(u, s, p) end

    elseif s.st == "setup" then
        if now >= s.t then enterDeployed(u, s, p, false) end
    end
end

local side = VP_GetSide({ side = R.SideName })
if side == nil then
    print("[CassRelocation] Side '" .. tostring(R.SideName) .. "' not found")
    return
end

local seen = {}
for _, entry in pairs(side.units or {}) do
    local u = getUnit(entry.guid)
    if u ~= nil and u.type == "Facility"
        and not (R.IgnoreNamePattern and string.find(u.name, R.IgnoreNamePattern, 1, true)) then
        local p = profileFor(u)
        if p.enabled ~= false then
            seen[u.guid] = true
            local ok, err = pcall(function()
                local s = state[u.guid]
                if s == nil then
                    s = { alat = u.latitude, alon = u.longitude }
                    state[u.guid] = s
                    log(u.name, "registered with profile", p.name)
                    enterDeployed(u, s, p, true)
                else
                    processUnit(u, s, p)
                end
            end)
            if not ok then print("[CassRelocation] Error on " .. tostring(u.name) .. ": " .. tostring(err)) end
        end
    end
end

-- Forget units that died, left the side or were excluded
for guid in pairs(state) do
    if not seen[guid] then state[guid] = nil end
end

ScenEdit_SetKeyValue(R.StateKey, serialize(state))
ScenEdit_SetKeyValue(R.LastTickKey, tostring(now))
