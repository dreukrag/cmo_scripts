# CMO Lua cookbook

Patterns you can copy and adapt. Each recipe says **where to put it** (console,
event action, special action, …) and which trigger to use. Function details:
[function-index.md](function-index.md). Concepts and pitfalls:
[cmo-lua-guide.md](cmo-lua-guide.md).

> All snippets are syntax-checked as Lua 5.3. The API calls follow the
> official docs, but they haven't been run against every CMO build. Test in
> the console first, with `Tool_EmulateNoConsole(true)`.

Contents

1. [Feature skeleton: Settings + Script](#1-feature-skeleton-settings--script)
2. [Shared helper library](#2-shared-helper-library)
3. [Persisting a table in the key store](#3-persisting-a-table-in-the-key-store)
4. [Periodic per-unit state machine (main loop)](#4-periodic-per-unit-state-machine-main-loop)
5. [Iterating units: side, mission, type, area](#5-iterating-units-side-mission-type-area)
6. [Reacting to a unit being destroyed (downed pilot)](#6-reacting-to-a-unit-being-destroyed-downed-pilot)
7. [Reacting to detection](#7-reacting-to-detection)
8. [Spawning units](#8-spawning-units)
9. [Moving units: courses, speed, hold, RTB](#9-moving-units-courses-speed-hold-rtb)
10. [Doctrine/EMCON switching (go active, weapons free)](#10-doctrineemcon-switching-go-active-weapons-free)
11. [Forcing an attack](#11-forcing-an-attack)
12. [Creating an event entirely from Lua](#12-creating-an-event-entirely-from-lua)
13. [Special action using the player's selection](#13-special-action-using-the-players-selection)
14. [Messages, scoring, ending the scenario](#14-messages-scoring-ending-the-scenario)
15. [Randomisation (weather, positions, chance)](#15-randomisation-weather-positions-chance)
16. [Geometry helpers](#16-geometry-helpers)
17. [Run-once guards and self-disabling events](#17-run-once-guards-and-self-disabling-events)
18. [Exploring and debugging](#18-exploring-and-debugging)

---

## 1. Feature skeleton: Settings + Script

The layout this repo uses. **Settings** goes in an event action with a
repeatable **Scenario is Loaded** trigger. Also run it once in the console
while editing. **Script** goes in an event action with a repeatable
**Regular Time** trigger, or whatever trigger fits the feature.

```lua
-- MyFeature.Settings.lua
MyFeature = MyFeature or {}          -- keep the table if it already exists
MyFeature.Config = {
    SideName    = "OPFOR",
    MissionName = "Patrol",
    TickSeconds = 60,
    Debug       = false,
}

function MyFeature.log(...)
    if MyFeature.Config.Debug then print("[MyFeature]", ...) end
end
```

```lua
-- MyFeature.Script.lua
if MyFeature == nil or MyFeature.Config == nil then
    print("[MyFeature] Settings not loaded; skipping tick")
    return
end
local cfg = MyFeature.Config
local now = ScenEdit_CurrentTime()
-- ... per-tick logic ...
```

---

## 2. Shared helper library

Define these once in a Settings or ScenLoaded script. You can also save them
as `Lua/cmo_helpers.lua` and load them with `ScenEdit_RunScript('cmo_helpers.lua')`,
or attach the file to the scenario and use `ScenEdit_UseAttachment`.

```lua
H = H or {}

-- Safe unit lookup by GUID (never throws, returns nil if gone/destroyed)
function H.unit(guid)
    local ok, u = pcall(ScenEdit_GetUnit, { guid = guid })
    if ok and u ~= nil and not u.IsDestroyed then return u end
    return nil
end

-- Safe unit lookup by side + name
function H.unitByName(side, name)
    local ok, u = pcall(ScenEdit_GetUnit, { side = side, unitname = name })
    if ok then return u end
    return nil
end

-- Message to the player side (HTML allowed)
function H.msg(text, side)
    ScenEdit_SpecialMessage(side or 'playerside', text)
end

-- Count entries in any table (works for 0-based CMO tables too)
function H.count(t)
    local n = 0
    if t then for _ in pairs(t) do n = n + 1 end end
    return n
end

-- Random float in [a, b)
function H.randf(a, b) return a + math.random() * (b - a) end

-- Does a value exist in a list?
function H.contains(list, value)
    for _, v in pairs(list or {}) do if v == value then return true end end
    return false
end
```

---

## 3. Persisting a table in the key store

The key store holds **strings only**, but it survives save/load. This is a
minimal serialiser for flat or nested tables of strings, numbers and booleans
(no functions or wrappers):

```lua
H = H or {}

function H.serialize(v)
    local t = type(v)
    if t == "number" or t == "boolean" then return tostring(v)
    elseif t == "string" then return string.format("%q", v)
    elseif t == "table" then
        local parts = {}
        for k, val in pairs(v) do
            parts[#parts + 1] = "[" .. H.serialize(k) .. "]=" .. H.serialize(val)
        end
        return "{" .. table.concat(parts, ",") .. "}"
    end
    return "nil"
end

function H.deserialize(s)
    if s == nil or s == "" then return nil end
    local f = load("return " .. s, "kv", "t", {})   -- empty env: data only
    if not f then return nil end
    local ok, res = pcall(f)
    if ok then return res end
    return nil
end

function H.saveTable(key, tbl) ScenEdit_SetKeyValue(key, H.serialize(tbl)) end
function H.loadTable(key)      return H.deserialize(ScenEdit_GetKeyValue(key)) end
```

Usage:

```lua
local state = H.loadTable("MyFeature.State") or { kills = 0, timers = {} }
state.kills = state.kills + 1
H.saveTable("MyFeature.State", state)
```

---

## 4. Periodic per-unit state machine (main loop)

A generalised version of the SAM shoot-and-scoot script. **Trigger:**
Regular Time, 1 min, repeatable. State is kept in the key store so a save/load
doesn't reset the schedule.

```lua
-- requires H (recipes 2 and 3) and a Settings script defining Scoot.Config
local cfg   = Scoot.Config            -- { SideName, MissionName, DeployedSecs, MovingSecs, MaxDesync }
local KEY   = "Scoot.State"
local now   = ScenEdit_CurrentTime()
local state = H.loadTable(KEY) or {}

local mission = ScenEdit_GetMission(cfg.SideName, cfg.MissionName)
if mission == nil then print("Scoot: mission not found"); return end

for _, guid in pairs(mission.unitlist) do
    local u = H.unit(guid)
    if u ~= nil then
        local s = state[guid]
        if s == nil then                       -- first time we see this unit
            s = { mode = "deployed", nextTick = now + cfg.DeployedSecs - math.random() * cfg.MaxDesync }
            state[guid] = s
            u.holdposition = true
        end
        if now >= s.nextTick then
            if s.mode == "deployed" then       -- -> move
                u.holdposition = false
                ScenEdit_SetEMCON('Unit', guid, 'Radar=Passive')
                ScenEdit_SetDoctrine({ side = cfg.SideName, guid = guid }, { weapon_control_status_air = 2 })
                s.mode, s.nextTick = "moving", now + cfg.MovingSecs - math.random() * cfg.MaxDesync
            else                               -- -> deploy
                u.holdposition = true
                ScenEdit_SetEMCON('Unit', guid, 'Radar=Active')
                ScenEdit_SetDoctrine({ side = cfg.SideName, guid = guid }, { weapon_control_status_air = 1 })
                s.mode, s.nextTick = "deployed", now + cfg.DeployedSecs - math.random() * cfg.MaxDesync
            end
        end
    else
        state[guid] = nil                      -- unit gone: forget it
    end
end

H.saveTable(KEY, state)
```

---

## 5. Iterating units: side, mission, type, area

```lua
-- All units of a side (entries are { guid = ..., name = ... })
local side = VP_GetSide({ side = "Blue" })
for _, entry in pairs(side.units) do
    local u = ScenEdit_GetUnit({ guid = entry.guid })
    if u and u.type == "Aircraft" then print(u.name, u.loadoutdbid) end
end

-- Filtered by type / category / subtype (see DataTypes for codes)
local ships = side:unitsBy('Ship')
local aircraft = side:unitsBy('Aircraft')

-- Units in an area (list of RP names/GUIDs), optionally filtered
local inBox = side:unitsInArea({ Area = { 'RP-1', 'RP-2', 'RP-3', 'RP-4' },
                                 TargetFilter = { TargetType = 'Ship' } })

-- Units assigned to a mission (plain list of GUID strings)
local m = ScenEdit_GetMission("Blue", "CAP North")
for _, guid in pairs(m.unitlist) do
    local u = ScenEdit_GetUnit({ guid = guid })
end

-- Contacts a side holds, and resolving them to real units
for _, c in pairs(ScenEdit_GetContacts("Blue") or {}) do
    if c.actualunitid ~= "" then
        local real = ScenEdit_GetUnit({ guid = c.actualunitid })
    end
end

-- Hostile air contacts only
local airContacts = side:contactsBy('Aircraft')
```

---

## 6. Reacting to a unit being destroyed (downed pilot)

**Event:** repeatable, trigger **Unit Destroyed** (TargetFilter: side Blue,
type Aircraft). **Action:** Lua script below.

```lua
local dead = ScenEdit_UnitX()
if dead == nil or dead.type ~= "Aircraft" then return end

-- 70% chance the crew ejected
if math.random() > 0.7 then return end

-- Drift the survivor a little from the crash point
local p = World_GetPointFromBearing({
    latitude = dead.latitude, longitude = dead.longitude,
    distance = math.random() * 2, bearing = math.random(0, 359) })

-- Is it over water? (elevation < 0 means sea)
local elev = World_GetElevation({ latitude = p.latitude, longitude = p.longitude })

-- Spawn a "pilot" facility (pick a DBID from your database, e.g. a 'Downed Pilot' / 'Life Raft' entry)
local PILOT_DBID = 2441   -- placeholder: look up the right DBID for your DB
local pilot = ScenEdit_AddUnit({
    type = 'Facility', side = dead.side, dbid = PILOT_DBID,
    unitname = 'Pilot of ' .. dead.name,
    latitude = p.latitude, longitude = p.longitude })

if pilot ~= nil then
    ScenEdit_AddReferencePoint({ side = dead.side, name = 'CSAR ' .. dead.name,
        latitude = p.latitude, longitude = p.longitude, highlighted = true })
    ScenEdit_SpecialMessage(dead.side,
        '<b>' .. dead.name .. '</b> is down. Beacon detected' ..
        (elev < 0 and ' over water.' or ' over land.'),
        { latitude = p.latitude, longitude = p.longitude })
end

-- Who did it?
local killer = ScenEdit_UnitY()
if killer and killer.unit then print('Killed by ' .. killer.unit.name) end
```

---

## 7. Reacting to detection

**Event:** trigger **Unit Detected** (detector side Red, target side Blue,
type Ship, MCL = Known Domain). **Action:**

```lua
local target   = ScenEdit_UnitX()      -- the real unit detected
local detector = ScenEdit_UnitY()      -- { unit = ..., sensor = { {name,type}, ... } }
local contact  = ScenEdit_UnitC()      -- Red's contact object for it

if contact == nil then return end
print(string.format('%s detected %s via %s', detector.unit.name, contact.name,
      detector.sensor[1] and detector.sensor[1].name or '?'))

-- Activate a strike mission once the fleet is spotted
ScenEdit_SetMission('Red', 'Anti-ship Strike', { isactive = true })
ScenEdit_AssignUnitAsTarget(contact.guid, 'Anti-ship Strike')
```

---

## 8. Spawning units

```lua
-- Ship / sub / facility at a point
local s = ScenEdit_AddUnit({ type = 'Ship', side = 'Blue', dbid = 3127,
    unitname = 'DDG Spawned', latitude = 35.0, longitude = 139.5,
    heading = 90, speed = 12, proficiency = 'Veteran' })

-- Aircraft airborne (needs loadoutid + altitude)
local a = ScenEdit_AddUnit({ type = 'Aircraft', side = 'Blue', dbid = 3500,
    loadoutid = 16934, unitname = 'Viper #1',
    latitude = 35.2, longitude = 139.0, altitude = 6000 })

-- Aircraft parked at a base (adopts base location)
local b = ScenEdit_AddUnit({ type = 'Aircraft', side = 'Blue', dbid = 3500,
    loadoutid = 16934, unitname = 'Viper #2', base = 'Misawa AB' })

-- Put it straight onto a mission and into a group (SetUnit fields pass through)
local c = ScenEdit_AddUnit({ type = 'Aircraft', side = 'Blue', dbid = 3500,
    loadoutid = 16934, unitname = 'Viper #3', base = 'Misawa AB',
    mission = 'CAP North' })

if s == nil then print('AddUnit failed: ' .. tostring(_errmsg_)) end
```

Finding DBIDs: in the editor, add the unit once by hand and run
`print(ScenEdit_GetUnit({side='Blue', unitname='...'}).dbid)`. You can also use
the in-game database viewer. For weapon, mount and sensor DBIDs you can also
use `ScenEdit_QueryDB('weapon', dbid)` to inspect an entry
([reference](reference/Function_ScenEdit_QueryDB.md)).

---

## 9. Moving units: courses, speed, hold, RTB

```lua
local u = ScenEdit_GetUnit({ guid = g })

u.course = {                          -- replace plotted course
    { latitude = 35.0, longitude = 139.0 },
    { latitude = 35.5, longitude = 139.8 },
}
u.manualSpeed = 25                    -- knots; 'OFF' returns control to AI/throttle
u.desiredAltitude = 3000              -- metres (aircraft)
u.holdposition = true                 -- stay put
u:RTB()                               -- return to base (call again to cancel)
u.unassign = true                     -- drop from mission (like hotkey 'U')

-- Several at once
ScenEdit_SetUnit({ guid = g, throttle = 'Cruise', heading = 270, holdFire = true })

-- Teleport
ScenEdit_SetUnit({ guid = g, latitude = 36.0, longitude = 140.0 })
```

---

## 10. Doctrine/EMCON switching (go active, weapons free)

```lua
local SIDE = 'Red'
local function goHot(guid)
    ScenEdit_SetEMCON('Unit', guid, 'Radar=Active;Sonar=Active')
    ScenEdit_SetDoctrine({ side = SIDE, guid = guid }, {
        weapon_control_status_air     = 0,   -- Free
        weapon_control_status_surface = 0,
        engage_opportunity_targets    = true })
    local u = ScenEdit_GetUnit({ guid = guid })
    if u then u.obeyEMCON = true end
end

local function goCold(guid)
    ScenEdit_SetEMCON('Unit', guid, 'Radar=Passive;Sonar=Passive')
    ScenEdit_SetDoctrine({ side = SIDE, guid = guid }, { weapon_control_status_air = 2 })  -- Hold
end

-- Reset a unit's doctrine to inherit from mission/side
ScenEdit_SetDoctrine({ side = SIDE, guid = someGuid }, {})
```

---

## 11. Forcing an attack

```lua
-- Let the unit pick weapons automatically
ScenEdit_AttackContact(attackerGuid, contactGuid, { mode = 0 })

-- Manual weapon allocation: mount DBID, weapon DBID, quantity
ScenEdit_AttackContact(attackerGuid, contactGuid, { mode = 1, mount = 438, weapon = 1413, qty = 2 })

-- Bearing-only launch at a point
ScenEdit_AttackContact(attackerGuid, 'BOL', { mode = 1, weapon = 1413, qty = 1,
    latitude = 35.1, longitude = 139.9 })

-- Detonate a warhead somewhere (no shooter needed)
ScenEdit_AddExplosion({ warheadid = 253, latitude = 35.1, longitude = 139.9 })
```

To find mount and weapon DBIDs, use `print(u.mounts)`, `print(u.loadout)` or
`print(u.magazines)` on the attacker.

---

## 12. Creating an event entirely from Lua

Useful for tooling that sets up a scenario, or for events created at runtime.

```lua
local CRLF = '\r\n'

-- 1. Trigger
ScenEdit_SetTrigger({ mode = 'add', type = 'RegularTime', name = 'MyFeature tick', Interval = 5 })
-- Interval is an enum of the editor choices; check with mode='list' after creating one by hand.

-- 2. Action (script text uses \r\n between lines)
local script = table.concat({
    "if MyFeature and MyFeature.tick then",
    "  MyFeature.tick()",
    "end",
}, CRLF)
ScenEdit_SetAction({ mode = 'add', type = 'LuaScript', name = 'MyFeature tick action', ScriptText = script })

-- 3. Event + wiring
ScenEdit_SetEvent('MyFeature loop', { mode = 'add', IsRepeatable = true, IsShown = false })
ScenEdit_SetEventTrigger('MyFeature loop', { mode = 'add', name = 'MyFeature tick' })
ScenEdit_SetEventAction('MyFeature loop',  { mode = 'add', name = 'MyFeature tick action' })

-- Inspect
print(ScenEdit_GetEvent('MyFeature loop', 0))
```

An area trigger example (from the docs):

```lua
ScenEdit_SetTrigger({ mode = 'add', type = 'UnitEntersArea', name = 'Blue ship enters box',
    targetfilter = { TargetSide = 'Blue', TargetType = 2 },
    area = { 'RP-1', 'RP-2', 'RP-3', 'RP-4' } })
```

---

## 13. Special action using the player's selection

```lua
-- Special Action: "Send selected ship to the nearest friendly port"
local sel = ScenEdit_SelectedUnits()
if sel == nil or sel.units == nil or H.count(sel.units) == 0 then
    ScenEdit_MsgBox('Select one of your ships first.', 0)
    return
end
for _, e in pairs(sel.units) do
    local u = ScenEdit_GetUnit({ guid = e.guid })
    if u and u.type == 'Ship' then u:RTB() end
end
ScenEdit_SpecialMessage('playerside', 'Orders sent.')
```

Creating it from Lua:

```lua
local CRLF = '\r\n'
ScenEdit_AddSpecialAction({ side = 'Blue', ActionNameOrID = 'Call CSAR',
    description = 'Dispatch the alert helicopter to the most recent downed pilot.',
    IsActive = true, IsRepeatable = false,
    ScriptText = 'if MyCSAR then MyCSAR.dispatch() end' .. CRLF })
```

---

## 14. Messages, scoring, ending the scenario

```lua
ScenEdit_SpecialMessage('Blue', '<h3>Phase 2</h3><p>Strike package is cleared hot.</p>',
    { latitude = 35, longitude = 139 }, true)          -- jump-to button + recenter

local score = ScenEdit_GetScore('Blue')
ScenEdit_SetScore('Blue', score + 50, 'Convoy reached port')

-- End when a condition holds (e.g. in a Regular Time event)
local hvU = ScenEdit_GetUnit({ side = 'Red', unitname = 'Kirov' })
if hvU == nil or hvU.IsDestroyed or hvU.damage.DP_PERCENT_NOW >= 90 then
    ScenEdit_SpecialMessage('playerside', 'Primary target neutralised.')
    ScenEdit_EndScenario()
end
```

---

## 15. Randomisation (weather, positions, chance)

```lua
-- Run once on Scenario Loaded / scenario start
math.randomseed(ScenEdit_CurrentTime())

-- Random weather: temp C, rain 0-50, cloud 0.0-1.0, sea state 0-9
ScenEdit_SetWeather(math.random(5, 25), math.random(0, 20), math.random(0, 10) / 10, math.random(1, 5))

-- Random start position within R nm of a point
local function randomPointNear(lat, lon, radiusNm)
    return World_GetPointFromBearing({ latitude = lat, longitude = lon,
        distance = math.sqrt(math.random()) * radiusNm, bearing = math.random(0, 359) })
end
local p = randomPointNear(35.0, 139.0, 20)
ScenEdit_SetUnit({ side = 'Red', unitname = 'Sub 1', latitude = p.latitude, longitude = p.longitude })

-- Pick one of N units to exist (delete the rest; no destroy events fire)
local candidates = { 'Decoy A', 'Decoy B', 'Real SAM' }
local keep = math.random(#candidates)
for i, name in ipairs(candidates) do
    if i ~= keep then ScenEdit_DeleteUnit({ side = 'Red', unitname = name }) end
end
```

---

## 16. Geometry helpers

```lua
local d   = Tool_Range(guidA, guidB)                -- nm, horizontal
local s   = Tool_Range(guidA, guidB, true)          -- nm, slant
local brg = Tool_Bearing(guidA, guidB)              -- degrees
local p   = World_GetPointFromBearing({ latitude = 35, longitude = 139, distance = 10, bearing = 45 })
local elev = World_GetElevation({ latitude = 35, longitude = 139 })          -- metres, <0 = sea
local ring = World_GetCircleFromPoint({ latitude = 35, longitude = 139, radius = 20, numpoints = 12 })
local los  = Tool_LOS({ mode = 1, observer = { guid = guidA }, target = { guid = contactGuid } })

-- Nearest unit of a list to a point
local function nearest(guids, lat, lon)
    local best, bestD
    for _, g in pairs(guids) do
        local dist = Tool_Range(g, { latitude = lat, longitude = lon })
        if dist and (bestD == nil or dist < bestD) then best, bestD = g, dist end
    end
    return best, bestD
end
```


---

## 17. Run-once guards and self-disabling events

```lua
-- Run-once across save/load
if ScenEdit_GetKeyValue('MyFeature.introShown') == '' then
    ScenEdit_SpecialMessage('playerside', 'Welcome, commander.')
    ScenEdit_SetKeyValue('MyFeature.introShown', '1')
end

-- Disable the current event from inside its own action
local evt = ScenEdit_EventX()
if evt then evt.isActive = false end

-- Throttle: only act every 10 game-minutes even if the trigger fires every minute
local now  = ScenEdit_CurrentTime()
local last = tonumber(ScenEdit_GetKeyValue('MyFeature.last')) or 0
if now - last < 600 then return end
ScenEdit_SetKeyValue('MyFeature.last', tostring(now))
```

---

## 18. Exploring and debugging

```lua
Tool_EmulateNoConsole(true)                 -- behave like an event (nil instead of throw)

print(ScenEdit_GetUnit({ side = 'Blue', unitname = 'Viper #1' }))   -- dump a wrapper
print(VP_GetScenario())                     -- scenario info (CurrentTime, Title, ...)
print(VP_GetSide({ side = 'Blue' }).missions)
print(ScenEdit_GetEvents(4))                -- all events (detail level 4 = event info only)
Tool_DumpEvents()                           -- writes '<scenario> events.xml' next to the scenario file

-- After any nil return
print(_errnum_, _errfnc_, _errmsg_)

-- Dump any table recursively with keys (CMO's print already pretty-prints wrappers)
local function dump(t, indent)
    indent = indent or ''
    for k, v in pairs(t) do
        if type(v) == 'table' then print(indent .. tostring(k) .. ':'); dump(v, indent .. '  ')
        else print(indent .. tostring(k) .. ' = ' .. tostring(v)) end
    end
end
```
