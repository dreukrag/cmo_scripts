# How Lua works in Command: Modern Operations

This is the hand-written part of the knowledge base: how CMO runs Lua, the
mental model behind the API, and the traps. For exact signatures, see
[function-index.md](function-index.md) and the mirrored official pages in
[reference/](reference/).

Labels used below:

- **(docs)**: stated in the official docs (link given).
- **(practice)**: common community or scenario-design practice that the
  official docs don't spell out. Check these in your game build before you
  depend on them.

---

## 1. Where Lua code runs

| Entry point | How it's created | Typical use |
|---|---|---|
| **Lua Script Console** (Editor → Lua Script Console) | Paste and run | Developing and testing, one-off editor operations (placing units, bulk edits) |
| **Event Action: Lua Script** | Editor → Events → Actions → *Lua Script* | Main gameplay logic; runs when the event fires |
| **Event Condition: Lua Script** | Editor → Events → Conditions → *Lua Script* | Gate an event; the script must `return true` / `return false` |
| **Special Action** | Editor → Special Actions, or `ScenEdit_AddSpecialAction` | A button the player clicks (for example "Call in CSAR") |
| **Waypoint action** | `ScenEdit_SetAction{ ..., scriptfor = 1 }` | Runs when a unit reaches a waypoint ([SetAction](reference/Function_ScenEdit_SetAction.md)) |
| **Mission Lua triggers** | Mission wrapper `MissionStartTrigger_LUA` / `MissionCompletedTrigger_LUA` | Operation-planner start/complete conditions; must return a boolean ([Mission wrapper](reference/Wrappers.md#wrapper_Mission)) |
| **File** | `ScenEdit_RunScript('sub/dir/file.lua')` | Shared libraries. The path is relative to `[Command dir]/Lua/` ([RunScript](reference/Function_ScenEdit_RunScript.md)) |
| **Attachment** | `ScenEdit_UseAttachment(guid)` | Ship a `.lua` file *inside* the scenario so players don't have to copy files ([UseAttachment](reference/Function_ScenEdit_UseAttachment.md)) |

The language is standard Lua. The docs link the **Lua 5.3** manual
([Overview](reference/Overview.md#ExternalResources)). Everything CMO-specific
comes from global functions with these prefixes:

| Prefix | Domain |
|---|---|
| `ScenEdit_*` | Scenario editing and the game state: units, missions, events, doctrine, sides, key store |
| `VP_*` | "Viewpoint" queries: side, scenario and contact objects as seen by a side. Some are Pro-only sim control |
| `Tool_*` | Utilities: range, bearing, LOS, debugging helpers |
| `World_*` | Geography: elevation, points from bearing, circles |
| `UI_*` | Dialogs, camera, unit-selection prompts |
| `Command_*`, `Exporter_*`, `GetBuildNumber`, … | Miscellaneous |

---

## 2. Execution model: state, globals and persistence

Get this section right first. Most broken CMO scripts get it wrong.

### 2.1 Each script runs top to bottom, and globals are shared

- Every console run, event action, condition or special action executes its
  code as a chunk from top to bottom, then ends. Nothing keeps running in the
  background. To repeat work, you need an event that fires again (see §3).
- `local` variables die when the chunk ends.
- **Global** variables (anything assigned without `local`) live in the
  shared Lua state, so later scripts in the same session can read them.
  **(practice)** That's how the repo's
  [`CassSamDeploymentScript`](../CassSamDeploymentScript.Settings.lua) works:
  the Settings script builds a global table, and the 1-minute Script event
  reads and updates it.

### 2.2 Globals do not survive save/load. The key store does.

- **(practice)** Treat the Lua global state as volatile. It is not written to
  the `.save` file. After a save is loaded, your globals are gone until
  something rebuilds them.
- The standard fix is a repeatable event with the trigger **Scenario is
  Loaded** (`ScenLoaded`) whose action rebuilds globals: define helper
  functions, load settings. Then any later event can rely on them.
- **(docs)** For *state* that must survive a save (timers, counters, flags, who
  is already dead), use the **persistent key store**:

  ```lua
  ScenEdit_SetKeyValue("myScript.counter", tostring(n))       -- strings only
  local n = tonumber(ScenEdit_GetKeyValue("myScript.counter")) or 0  -- "" if missing
  ScenEdit_ClearKeyValue("myScript.counter")                 -- "" clears ALL keys!
  ```

  Keys and values are **non-nil strings**. Store numbers with `tostring` and
  read them back with `tonumber`. Store tables by serialising them (see the
  cookbook). The optional third argument `forCampaign=true` carries the value
  into the next scenario of a campaign
  ([SetKeyValue](reference/Function_ScenEdit_SetKeyValue.md),
  [GetKeyValue](reference/Function_ScenEdit_GetKeyValue.md),
  [ClearKeyValue](reference/Function_ScenEdit_ClearKeyValue.md)).

**Rule of thumb:** keep *code and config* in globals, rebuilt on
ScenLoaded. Keep *state* in the key store, or rebuild it from the game itself
(unit positions, mission membership and so on).

### 2.3 Namespace your globals

All scripts in a scenario share one global namespace. Put everything under one
table per feature, as the SAM script does with `CassSamDeploymentScript = {}`,
and never assign bare names like `units` or `timer` at top level.

### 2.4 Don't block

Scripts run on the simulation thread. A long loop, for example over every
contact of every side every second, stalls the game. Keep per-tick work small,
cache what doesn't change, and use the longest trigger interval that still
works.

---

## 3. Events: triggers → conditions → actions

**(docs)** An event = one or more **triggers** + optional **conditions** + one
or more **actions** ([Overview § Event Handling](reference/Overview.md#EventHandling)).
Event flags: `isActive`, `isRepeatable`, `isShown` (in the log), `probability`
(0–100) ([Event wrapper](reference/Wrappers.md#wrapper_Event)).

> Non-repeatable events fire **once**. For any loop (a periodic tick, reacting
> to *every* unit destroyed), tick **Repeatable**.

### 3.1 Trigger types and the context they give you

| Trigger (`type=`) | Fires when | Context available in the action |
|---|---|---|
| `ScenLoaded` | Scenario loaded, including a save | Use it for init / re-init of globals |
| `ScenEnded` | Scenario ends | Final scoring, summary messages |
| `Time` | At a fixed date/time | |
| `RandomTime` | Once at a random time between `EarliestTime` and `LatestTime` | |
| `RegularTime` | Every `Interval` (1 s, 5 s, 15 s, 30 s, 1 min, 5 min, …) | **Main-loop pattern** |
| `Points` | A side's score goes over, under or to a value | |
| `UnitDestroyed` | A unit matching `TargetFilter` dies | `UnitX()` = the dead unit, `UnitY()` = last unit to damage it |
| `UnitDamaged` | Matching unit passes `DamagePercent` | `UnitX()`, `UnitY()` |
| `UnitDetected` | `DetectorSideID` detects a matching unit at classification ≥ `MCL`, optionally in an `Area` | `UnitX()` = detected unit, `UnitY()` = detecting unit + sensors, `UnitC()` = the **contact** |
| `UnitEmissions` | Like Detected, for emissions | as above |
| `UnitEntersArea` | Matching unit enters an area (RP list). Options: `ExitArea`, `NOT`, `ETOA`/`LTOA` | `UnitX()` |
| `UnitRemainsInArea` | Matching unit stays in an area for `TD` | `UnitX()` |
| `UnitBaseStatus` | Aircraft/ship base status changes | `UnitX()` |
| `UnitCargoMoved` | Cargo transfer thresholds | |

`TargetFilter` keys: `TargetSide` (required), then **either** `SpecificUnitID`
**or** `TargetType` [+ `TargetSubType`] [+ `SpecificUnitClass` (DBID)].
TargetType codes: 1 Aircraft, 2 Ship, 3 Submarine, 4 Facility, 5 Aimpoint,
6 Weapon, 7 Satellite.

Context accessors **(docs)**. Each returns `nil` when not applicable:

```lua
local u   = ScenEdit_UnitX()   -- or UnitX()  : Unit wrapper that triggered the event
local y   = ScenEdit_UnitY()   -- or UnitY()  : { unit = <Unit>, sensor = { {name,type}, ... } }
local c   = ScenEdit_UnitC()   -- or UnitC()  : Contact wrapper (detection triggers)
local evt = ScenEdit_EventX()  -- or EventX() : Event wrapper of the running event
evt.isActive = false           -- e.g. switch the event off from inside itself
```

Note that `UnitY()` returns a **table**: use `UnitY().unit.name`, not `UnitY().name`.

### 3.2 Conditions

Built-in conditions: `SidePosture` (A sees B as …), `ScenHasStarted`, and
`LuaScript`. A Lua condition **must `return true` or `return false`**.
Anything else counts as false.

### 3.3 Building events from Lua

Every part has its own CRUD function with `mode = 'add' | 'update' | 'remove' | 'list'`:

```
ScenEdit_SetTrigger{...}   ScenEdit_SetCondition{...}   ScenEdit_SetAction{...}
ScenEdit_SetEvent(name, {mode='add', IsRepeatable=true, ...})
ScenEdit_SetEventTrigger(eventName, {mode='add', description=triggerName})
ScenEdit_SetEventCondition(...) / ScenEdit_SetEventAction(...)   -- mode add/remove/replace
```

When you pass a script as a string to `SetAction`, `SetCondition` or
`AddSpecialAction`, **separate lines with `'\r\n'`** or multi-line scripts may
not run **(docs)**. You can't remove a trigger, condition or action while an
event still uses it. Detach it first. `Tool_DumpEvents()` and
`ScenEdit_GetEvent(name, 0)` dump what exists. The cookbook has a full example.

### 3.4 Special actions

Player-clickable scripts, per side. Typical flow inside one: read
`ScenEdit_SelectedUnits()` → validate → act → message the player. They can be
active or inactive and repeatable or not, so scripts can reveal them later
(`ScenEdit_SetSpecialAction`).

---

## 4. Referring to things: GUIDs, names, sides

**(docs)** Prefer **GUIDs**. Use name + side as the fallback, and a bare name
only if it's unique scenario-wide (the first match wins)
([Selectors](reference/Selectors.md),
[Functions § GUID and Name](reference/Functions.md)).

- Names change: a player renames a unit, or a contact's name changes as its
  classification improves. GUIDs don't.
- Get GUIDs from: `unit.guid`, `mission.unitlist`, `side.units`,
  `ScenEdit_SelectedUnits()`, or the editor (unit → *Copy GUID*, or print
  from the console).
- Units, missions, reference points and zones all have GUIDs. Most functions
  accept "name **or** GUID" in the same parameter.
- **A contact's GUID is not the unit's GUID.** A contact is one *side's
  perception* of a unit. `contact.actualunitid` gives the real unit's GUID
  (`""` if unknown). `unit.ascontact` lists how other sides see a unit.

### Case rules (docs)

- **Wrapper properties are lowercase** when you access them directly:
  `unit.name`, `unit.latitude`, `unit.holdposition`. There are documented
  exceptions with mixed case: `mission.SISH`, `unit.AI_EvaluateTargets_enabled`,
  `unit.IsDestroyed`, and the whole Scenario wrapper (`scen.CurrentTime`,
  `scen.Title`).
- **Keys in tables passed to functions are case-insensitive**, and so are
  most string values: `{side='nato', unitname='Viper #1'}` ==
  `{Side='NATO', UnitName='Viper #1'}`. Short aliases such as `lat` / `lon` /
  `alt` / `name` are often accepted too.

---

## 5. Wrappers: live game objects

Getter functions return **wrappers**, which are proxies to live simulation
objects, not copies ([Wrappers](reference/Wrappers.md)).

| Get it with | Wrapper | Notes |
|---|---|---|
| `ScenEdit_GetUnit{guid=…}` / `{side=…, unitname=…}` | **Unit** | Most-used object. Covers ships, subs, aircraft, facilities, satellites, and weapons in flight |
| `ScenEdit_GetContact{side=…, guid=…}`, `ScenEdit_GetContacts(side)` | **Contact** | From one side's point of view |
| `VP_GetSide{side=…}` | **Side** | `.units`, `.contacts`, `.missions`, `:unitsBy()`, `:unitsInArea()`, `:contactsBy()` |
| `ScenEdit_GetMission(side, name)` | **Mission** | `.unitlist`, `.targetlist`, `.isactive`, `.starttime`, … |
| `ScenEdit_GetDoctrine{…}` | **Doctrine** | Only shows non-inherited fields, except at side level |
| `ScenEdit_GetReferencePoint(s)` | **ReferencePoint** | |
| `VP_GetScenario()` | **Scenario** | Mixed-case fields: `CurrentTime`, `Title`, `HasStarted`, … |
| `ScenEdit_GetEvent`, `ScenEdit_EventX()` | **Event** | |
| `unit.group`, `unit.loadout`, `unit.mounts`, `unit.magazines`, `unit.sensors` | Group / Loadout / Mount / Magazine / Sensor | |

Working with wrappers:

```lua
local u = ScenEdit_GetUnit({guid = g})
if u == nil then return end              -- ALWAYS nil-check (deleted, wrong side, typo)

print(u.name, u.latitude, u.longitude, u.altitude)   -- read
u.holdposition = true                                -- write (fields not marked READ ONLY)
u.manualSpeed  = 10                                  -- or 'OFF' to return control to AI
u.course = { {latitude = 10.0, longitude = 20.0} }   -- plot a course
u:RTB()                                              -- methods use the COLON
local inZone = u:inArea({'RP-1','RP-2','RP-3','RP-4'})
print(u)                                             -- prints a summary table, good for exploring
```

- Fields marked **READ ONLY** in [Wrappers.md](reference/Wrappers.md) can't be
  assigned. Some settings are **only** settable through `ScenEdit_SetUnit`
  (`refuel`, `manualThrottle`, `moveto`, `RTB`, sensor on/off).
- `ScenEdit_SetUnit{guid=…, <many fields>}` changes several things in one
  call. It accepts the same field names as `ScenEdit_AddUnit`, and `AddUnit`
  calls `SetUnit` internally, so you can pass extra fields straight to
  `AddUnit`.
- A wrapper can go stale: the unit dies, gets deleted, or lands and is
  absorbed. Re-fetch by GUID each tick instead of caching wrappers across
  events. Cache **GUIDs**.
- **0-based tables**: `unit.firedOn`, `unit.firingAt`, `unit.targetedBy` and
  the matching contact fields start at index **0**, so `ipairs` skips the
  first element. Use `pairs`.
- `side.units` / `side.contacts` / `mission.unitlist` return lists of GUIDs
  (`{guid, name}` entries for side lists, bare GUID strings for
  `mission.unitlist`). Fetch each wrapper when you need it.

---

## 6. Doctrine, ROE, WCS and EMCON

### Doctrine (docs: [SetDoctrine](reference/Function_ScenEdit_SetDoctrine.md), [Doctrine wrapper](reference/Wrappers.md#wrapper_Doctrine))

The level is chosen by which selector keys you pass:

```lua
ScenEdit_SetDoctrine({side='Blue'},                    {weapon_control_status_air = 0})   -- side
ScenEdit_SetDoctrine({side='Blue', mission='CAP N'},   {weapon_control_status_air = 1})   -- mission
ScenEdit_SetDoctrine({side='Blue', guid=unitGuid},     {weapon_control_status_air = 2})   -- unit/group
ScenEdit_SetDoctrine({side='Blue', guid=unitGuid},     {weapon_control_status_air = 'inherit'})
```

Common fields and codes:

| Field | Values |
|---|---|
| `weapon_control_status_air` / `_surface` / `_subsurface` / `_land` | **0 Free, 1 Tight, 2 Hold** |
| `engage_opportunity_targets`, `ignore_plotted_course`, `automatic_evasion`, `use_nuclear_weapons`, `ignore_emcon_while_under_attack`, `maintain_standoff` | true/false |
| `engaging_ambiguous_targets` | 0 Ignore, 1 Optimistic, 2 Pessimistic |
| `fuel_state_planned` | 0 Bingo … 11 Joker90Percent |
| `weapon_state_rtb`, `fuel_state_rtb` | 0 No, 1 YesLastUnit, 2 YesFirstUnit, 3 YesLeaveGroup |
| `withdraw_on_*` / `deploy_on_*` | see wrapper table |
| `bvr_logic` | 0 StraightIn, 1 Crank, 2 Drag |
| `avoid_contact` | 0 No, 1 Yes_ExceptSelfDefence, 2 Yes_Always |

Add the suffix `_player_editable` to a field name to lock or unlock it for the player.

### Weapon Release Authority

`ScenEdit_GetDoctrineWRA` / `ScenEdit_SetDoctrineWRA` set per-weapon,
per-target-type salvo sizes and ranges. See
[SetDoctrineWRA](reference/Function_ScenEdit_SetDoctrineWRA.md).

### EMCON (docs: [SetEMCON](reference/Function_ScenEdit_SetEMCON.md))

```lua
ScenEdit_SetEMCON('Side',    'Blue',      'Radar=Passive;Sonar=Passive')
ScenEdit_SetEMCON('Mission', 'ASW Patrol','Inherit;Sonar=Active')   -- 'Inherit' must come first
ScenEdit_SetEMCON('Group',   'SAG 1',     'Radar=Active')
ScenEdit_SetEMCON('Unit',    unitGuid,    'Radar=Active;OECM=Active')
```

The type is `Side | Mission | Group | Unit`. A unit only follows doctrine
EMCON while `unit.obeyEMCON == true`. Set it to `true` to force the new EMCON
immediately, or `false` to control sensors manually.

---

## 7. Missions

```lua
local m = ScenEdit_AddMission('Blue', 'CAP North', 'Patrol', {type='AAW', zone={'RP-1','RP-2','RP-3','RP-4'}})
ScenEdit_AssignUnitToMission(unitGuid, m.guid)       -- or u.mission = 'CAP North'
ScenEdit_SetMission('Blue', m.guid, {isactive=false})
m.starttime = '2026-06-09 01:30:00!yyyy-MM-dd HH:mm:ss'   -- explicit date format after '!'
for _, g in pairs(m.unitlist) do print(g) end      -- unitlist = GUID strings
```

- Types: `Strike` (sub-types AIR / LAND / SEA / SUB), `Patrol` (AAW / ASW /
  NAVAL / LAND / MIXED / SEAD / SEA), `Support`, `Ferry`, `Mining`,
  `Mineclearing`, `Cargo` ([DataTypes § Type of mission](reference/DataTypes.md)).
- Strike targets: `ScenEdit_AssignUnitAsTarget(targets, missionName)`.
- Mission-specific option tables: `m.patrolmission`, `m.strikemission`, and so
  on (read-only views). Change them with `ScenEdit_SetMission` using the keys
  from [Tables.md](reference/Tables.md).
- Dates on wrappers assume **DDMMYYYY** when ambiguous. Append `!format` to
  remove the ambiguity ([Overview § Date and Time](reference/Overview.md#DateTimeStamp)).
- **(practice)** Patrol missions handle pathfinding for you. Toggling
  `unit.holdposition` on a unit in a patrol mission is a cheap way to switch
  between "move around the patrol zone" and "stay put". The SAM script uses
  this.

---

## 8. Errors and debugging

**(docs: [Overview § Error Handling](reference/Overview.md#ErrorHandling))**

| Where the code runs | When a `ScenEdit_*` call fails |
|---|---|
| **Console** | The error is raised and the script stops (red message) |
| **Event, condition or special action** | **Silent**: the function returns `nil` (or similar), the script *continues*, and nothing appears on screen |

After a failed call, check these globals: `_errmsg_` (message), `_errfnc_`
(function name), `_errnum_` (0 = no error).

```lua
local m = ScenEdit_AddMission('Blue', 'Strike 1', 'Strike', {type='land'})
if m == nil then
    if _errnum_ ~= 0 then print('AddMission failed: ' .. tostring(_errmsg_)) end
    return
end
```

- Put **`Tool_EmulateNoConsole(true)`** at the top of a console test to get
  event-style behaviour: nil returns instead of thrown errors. This matters
  because, for example, `ScenEdit_GetUnit` *throws* in the console when the
  unit is missing but returns `nil` in events.
- Plain Lua errors (indexing `nil`, calling a missing function) still abort
  the chunk. Guard your inputs, or wrap risky blocks in `pcall`.
- `print()` writes to the Lua console window and the Lua history log. Event
  script errors are logged there as well. In-game, players only see what you
  send with `ScenEdit_SpecialMessage` or `ScenEdit_MsgBox`.
- `print(wrapperOrTable)` pretty-prints the object, which is the fastest way to
  explore unfamiliar data.
- Special globals: `_scriptfolder_`, `_scenariofolder_`, `_outputfolder_`
  ([Overview § Globals](reference/Overview.md#Globals)).

---

## 9. Units of measure and data types

| Quantity | Unit / format | Source |
|---|---|---|
| Distance (`Tool_Range`, `World_GetPointFromBearing`, RP `distance`) | **nautical miles** | docs |
| Altitude / depth | **metres** (strings like `'10000 ft'` are accepted by some functions, e.g. `Tool_LOS`) | docs |
| Speed | knots | **(practice)** |
| Bearing / heading | degrees 0–360, true | docs |
| Latitude / longitude | decimal degrees (number or string); some functions also accept `'N50.20.10'` style | docs |
| Time (`ScenEdit_CurrentTime()`) | Unix timestamp in seconds, UTC, **game time** | docs |
| Booleans in tables | `true/false`; many functions also accept `'yes'/'no'`, `1/0` | docs ([DataTypes § True/False](reference/DataTypes.md)) |
| Sides' posture | `'F' 'H' 'N' 'U'` (and `X` unknown); numeric 0 N, 1 F, 2 U, 3 H, 4 X | docs |
| Proficiency | `'Novice'`, `'Cadet'`, `'Regular'`, `'Veteran'`, `'Ace'` (0–4) | docs |

Use `ScenEdit_CurrentTime()` for timers in game seconds, and compare
`now > nextTick` instead of testing for equality. Ticks are not guaranteed to
land on exact values, especially under time compression.

---

## 10. User interaction

| Function | Behaviour |
|---|---|
| `ScenEdit_SpecialMessage(side, html, [ {latitude,longitude} ], [recenter])` | HTML popup for one side. `'playerside'` targets whoever is playing. Players can turn these popups off in the game options |
| `ScenEdit_MsgBox(text, style)` | **Modal**: blocks until clicked. Returns the button (OK = 1, Cancel = 2, Yes = 6, No = 7, …) |
| `ScenEdit_InputBox(prompt)` | Returns the typed string |
| `ScenEdit_CreateBarkNotification_*` | Small notifications attached to a unit or map point |
| `UI_SelectUnitsPrompt_*`, `UI_CallAdvancedHTMLDialog` | Richer dialogs |
| `ScenEdit_PlaySound(file)` | Plays a sound |

Use modal boxes only in special actions or editor tools. A `MsgBox` inside a
1-second `RegularTime` event makes the scenario unplayable.

---

## 11. Gotchas checklist

1. **Nil-check every getter.** Units die mid-scenario, and the next tick's
   `GetUnit` returns `nil`.
2. **Pass a GUID string, not a table.** `ScenEdit_GetUnit({guid = listOfGuids})`
   is wrong. Inside `for _, g in pairs(list)`, use `g`.
3. **Globals vanish on load.** Rebuild them on `ScenLoaded`, and keep durable
   state in the key store.
4. **Key store values are strings.** `GetKeyValue` returns `""` for a missing
   key, not `nil`. `ClearKeyValue("")` wipes *everything*.
5. **Repeatable** must be ticked for any looping or recurring event.
6. **`'\r\n'` line separators** for scripts passed as strings.
7. **0-based** `firedOn` / `firingAt` / `targetedBy`: use `pairs`.
8. **Contacts ≠ units.** Convert with `contact.actualunitid`.
9. **The console behaves differently from events.** Test with
   `Tool_EmulateNoConsole(true)`.
10. **Names are ambiguous across sides.** Pass `side` or use GUIDs.
11. **`UnitY()` is a table** `{unit, sensor}`, not a wrapper.
12. **Ambiguous dates** are read as DDMMYYYY on wrappers. Use the `!format`
    suffix.
13. **`math.random`.** Seed it, or accept the default sequence. **(practice)**
    Many designers call `math.randomseed(os.time())` once on `ScenLoaded`.
    If `os` isn't available in your build, seed from
    `ScenEdit_CurrentTime()`.
14. **Pro-only functions** (marked **[PRO ONLY]**) don't exist in the
    commercial edition. Don't call them in scenarios meant for players.
15. **Mixed-case return keys.** `World_GetPointFromBearing` returns both
    `latitude` and `Latitude`. Always read the lowercase one.

---

## 12. Recommended workflow for this repo

1. **Prototype in the console** with `Tool_EmulateNoConsole(true)` at the top,
   using `print()` heavily.
2. **Split each feature** into:
   - `<Feature>.Settings.lua`: creates the global namespace table and config
     values. Attach it to a repeatable event with a `ScenLoaded` trigger, and
     also run it once in the console while editing.
   - `<Feature>.Script.lua`: the logic. Attach it to an event with a
     `RegularTime` trigger, or with the trigger that matches the feature.
3. **Make the Script idempotent and self-healing.** If the namespace table is
   missing, rebuild it. If a unit is gone, skip it or remove it from your
   lists.
4. **Persist only what can't be recomputed**, in the key store, with keys
   prefixed by the feature name.
5. **Document the in-editor setup** (events, triggers, missions the script
   expects) in the feature's README section, as the SAM script does.

See [cookbook.md](cookbook.md) for ready-to-adapt code for these patterns.
