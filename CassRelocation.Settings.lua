-- CassRelocation: shoot-and-scoot relocation for ground units (SAM, AAA, radar, EW, ELINT, MANPADS, ...)
-- Run this on a repeatable "Scenario is Loaded" event (and once in the console while editing).
-- The logic lives in CassRelocation.Script.lua, on a repeatable 1 minute "Regular Time" event.
-- See README.md for the full editor setup.

-- Don't change these 2 lines, the script uses them internally
CassRelocation = {}
CassRelocation.Profiles = {}

------------------------- Settings Start -------------------------
-- All times are in seconds, all distances in nautical miles.

-- Every ground unit (Facility) on this side is controlled by the script.
-- Use a dedicated side so nothing else (missions, player orders, side doctrine changes) fights the script.
-- Make it an ally of the side it supports so they share contacts.
CassRelocation.SideName = "OPFOR SAM"

-- Units whose name contains this text are left alone. Set to nil to disable.
CassRelocation.IgnoreNamePattern = "[NORELOC]"

-- If true, the first deployed timer of each unit is a random value between 0 and deployedMax,
-- so units don't all move together on the first cycle. If false, it's a normal deployedMin..deployedMax timer.
CassRelocation.StartDesync = true

-- A moving unit closer than this to its destination counts as arrived
CassRelocation.ArriveDistance = 0.3

-- How many random points to try when picking a destination before giving up for this cycle
CassRelocation.DestinationTries = 30

-- Print what the script is doing to the Lua log
CassRelocation.Debug = false

-- Values used by every profile unless the profile sets its own
CassRelocation.Defaults = {
    -- Time spent deployed (emitting, weapons free) before relocating, random between min and max
    deployedMin = 60 * 40,
    deployedMax = 60 * 50,
    -- Time spent stationary, dark and holding fire before moving (0 = skip)
    teardown = 60 * 5,
    -- Time spent stationary, dark and holding fire after arriving (0 = skip)
    setup = 60 * 5,
    -- "move": drive to the new site. "teleport": jump to the new site and stay inactive for transitTime
    mobility = "move",
    -- teleport only: how long the unit stays inactive after the jump (before setup starts)
    transitTime = 60 * 20,
    -- move only: if the unit gets no closer to its destination for this long, it's teleported there (0 = never)
    stuckTimeout = 60 * 10,
    -- If true the unit keeps emitting and stays weapons free while moving (teardown/setup still apply if > 0)
    fireOnMove = false,
    -- Distance of each relocation hop, random between min and max
    relocateMin = 3,
    relocateMax = 10,
    -- Every new site stays within this radius of the unit's anchor (its position when the script first saw it)
    radius = 24,
    -- Sites at or below this elevation (meters) are rejected, so units don't relocate into the sea
    minElevation = 0,
    -- Sites with a slope rating (0-100) above this are rejected. nil = no slope check
    maxSlope = nil,
    -- While the unit is firing or being fired on, its deployed timer is paused
    pauseWhenEngaged = true,
    -- Once an engagement ends, the unit relocates within afterEngagementMin..afterEngagementMax
    -- (only if that's sooner than its normal timer). Set both to nil to disable.
    afterEngagementMin = 60 * 2,
    afterEngagementMax = 60 * 8,
    -- EMCON applied when deployed. "Inherit" uses the side's EMCON, or use e.g. "Radar=Active"
    deployedEmcon = "Inherit",
    -- WCS applied when deployed: 0 Free, 1 Tight, 2 Hold. "inherit" uses the side's doctrine
    deployedWcs = "inherit",
}

-- Profiles per unit type. Each unit uses the FIRST profile whose match fields all fit, so list specific
-- profiles first. Match fields (all optional, but a profile with no match fields matches everything):
--   dbid        = database ID (print(ScenEdit_GetUnit({guid = ...}).dbid))
--   classname   = exact class name, e.g. "SAM Bn (SA-11 Gadfly)"
--   namePattern = plain text the unit name must contain
--   category    = unit category / subtype code, e.g. 6000 SAM, 5000 AAA, 9000 Surveillance
--                 (check with print(u.category, u.subtype) for your build)
-- Any value from Defaults can be overridden. Set enabled = false to make matching units ignored.
-- Units that match no profile use Defaults.
CassRelocation.Profiles[#CassRelocation.Profiles + 1] = {
    name = "SA-10a",
    match = { classname = "SAM Bn (SA-10a Grumble [S-300PT-1])" },
    deployedMin = 60 * 50, deployedMax = 60 * 70,
    teardown = 60 * 30, setup = 60 * 30,
    relocateMin = 5, relocateMax = 15,
}
CassRelocation.Profiles[#CassRelocation.Profiles + 1] = {
    name = "SA-15 (fire on the move)",
    match = { namePattern = "SA-15" },
    deployedMin = 60 * 20, deployedMax = 60 * 30,
    teardown = 0, setup = 0,
    fireOnMove = true,
    relocateMin = 2, relocateMax = 5,
}
CassRelocation.Profiles[#CassRelocation.Profiles + 1] = {
    name = "Fixed radar site",
    match = { namePattern = "EW Site" },
    mobility = "teleport",
    teardown = 60 * 10, setup = 60 * 15, transitTime = 60 * 30,
}
------------------------- Settings End -------------------------

CassRelocation.StateKey = "CassRelocation.State"
CassRelocation.LastTickKey = "CassRelocation.LastTick"

math.randomseed(math.floor(ScenEdit_CurrentTime()))

function CassRelocation.log(...)
    if CassRelocation.Debug then print("[CassRelocation]", ...) end
end

-- Forget every unit's anchor and schedule. On the next tick each unit is re-registered at its
-- current position. Run it from the console or a Special Action: CassRelocation.Reset()
function CassRelocation.Reset()
    ScenEdit_ClearKeyValue(CassRelocation.StateKey)
    ScenEdit_ClearKeyValue(CassRelocation.LastTickKey)
    print("[CassRelocation] State cleared, units will be re-anchored on the next tick")
end

-- Before the scenario starts, always re-anchor, so units moved in the editor never keep stale anchors
if not ScenEdit_GetScenHasStarted() then
    CassRelocation.Reset()
end
