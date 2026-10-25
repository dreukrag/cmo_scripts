# CMO Lua knowledge base

Reference material for writing Lua scripts for **Command: Modern Operations
(CMO)**.

| File | What it is | Read it when |
|---|---|---|
| [cmo-lua-guide.md](cmo-lua-guide.md) | **Start here.** How Lua runs inside CMO: entry points, globals vs the persistent key store, events/triggers/actions, GUIDs, wrappers, doctrine/EMCON, missions, error handling, units of measure, gotchas | You're designing a feature, or something behaves strangely |
| [cookbook.md](cookbook.md) | Copy-paste patterns: Settings+Script skeleton, helper library, key-store persistence, periodic state machines, destroyed/detected reactions, spawning, movement, doctrine switching, attacks, building events from Lua, special actions, scoring, randomisation, geometry, debugging | You're writing a script |
| [function-index.md](function-index.md) | Every API function, one line each: signature, summary, link to the full page (auto-generated) | You need to find the right function |
| [reference/](reference/) | Offline Markdown mirror of the official docs at <https://commandlua.github.io/> (auto-generated) | You need exact parameters, wrapper fields or enum codes |

## Key reference pages

- [reference/Overview.md](reference/Overview.md): official intro, changelog, event-handling tables (trigger/condition/action keywords), error handling, globals, date formats
- [reference/Functions.md](reference/Functions.md): function list by category
- [reference/Wrappers.md](reference/Wrappers.md): fields and methods of Unit, Contact, Side, Mission, Doctrine, Event, Zone, ReferencePoint, Loadout, Mount, Magazine, …
- [reference/Tables.md](reference/Tables.md): structure of the tables passed to and returned from functions
- [reference/DataTypes.md](reference/DataTypes.md): enums and codes (unit types and subtypes, WCS, stance, mission types, proficiency, sensor types, …)
- [reference/Selectors.md](reference/Selectors.md): how to identify units, contacts, doctrine levels and so on in function arguments
- [reference/Examples.md](reference/Examples.md): official wrapper usage examples
- `reference/Function_<Name>.md`: one page per function

## Refreshing the mirror

```sh
pip install beautifulsoup4 lxml   # plus pandoc on PATH
python3 tools/fetch_cmo_docs.py
git diff --stat docs/            # see what changed upstream
```

The hand-written files (`cmo-lua-guide.md`, `cookbook.md`, this README) are
never overwritten by the tool.

## Searching

```sh
grep -rn "holdposition" docs/reference/          # which pages mention a field
grep -n "weapon_control_status" docs/reference/Wrappers.md
ls docs/reference | grep -i emcon                 # find function pages by name
```
