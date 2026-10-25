### <a name="ScenEdit_SetLoadout"></a>ScenEdit_SetLoadout (table)

This function Sets the loadout for a aircraft unit

#### Parameters

- table {} of
  - unitname = string Unit description/name or GUID to update. Can use 'UnitX' here if in an Event Action
  - LoadoutID = number The ID of the new loadout; 0 = use the current loadout
  - TimeToReady_Minutes = number How many minutes until the loadout is ready (default = database loadout time) (\_optional\_)
  - IgnoreMagazines = True/False If the new loadout should rely on the magazines having the right weapons ready (default = false) (\_optional\_)
  - ExcludeOptionalWeapons = True/False Exclude optional weapons from loadout (default = false) (\_optional\_)
  - Wpn_DBID = number Weapon DB number - required if WPN_GUID is not supplied
  - Wpn_GUID = string Actual weapon to update - DBID is not required as this take precedence (\_optional\_)
  - Number = number Number to change current weapon load by (sign ignored)
  - Remove = True/False Deduct 'number' rather than add

#### Returns

booleanTrue

##### Example

` ScenEdit_SetLoadout( {unitname=....} ) `
