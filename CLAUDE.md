# cmo_scripts

Lua scripts for **Command: Modern Operations (CMO)** scenarios.

## Before writing or changing a script

1. Read `docs/cmo-lua-guide.md`. It covers the execution model (globals vs the
   key store), events, GUIDs, wrappers and gotchas.
2. Look for an existing pattern in `docs/cookbook.md`.
3. Confirm every API call against `docs/function-index.md` →
   `docs/reference/Function_<Name>.md`, and wrapper fields against
   `docs/reference/Wrappers.md`. Don't guess parameter names: they are
   case-insensitive in function tables, but wrapper fields must be lowercase
   (documented exceptions aside).

## Conventions

- One feature = `<Feature>.Settings.lua` (global namespace table + config, run
  on a repeatable "Scenario is Loaded" event) + `<Feature>.Script.lua` (logic,
  usually a repeatable "Regular Time" event).
- Namespace all globals under one table per feature.
- Nil-check every `ScenEdit_GetUnit` / `GetMission` / `GetContact` result.
  Event scripts fail silently and return `nil`.
- Put state that must survive save/load in `ScenEdit_SetKeyValue` (strings
  only), with keys prefixed by the feature name.
- Document the required editor setup (events, triggers, missions) in
  `README.md`.
- The CMO runtime isn't available here. Syntax-check with any Lua 5.3
  interpreter, and test in the in-game console with `Tool_EmulateNoConsole(true)`.

## Regenerating the API mirror

`python3 tools/fetch_cmo_docs.py` (needs `beautifulsoup4`, `lxml`, `pandoc`).
