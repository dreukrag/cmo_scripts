### <a name="ScenEdit_SetLoadoutAvailable"></a>ScenEdit_SetLoadoutAvailable(table)

This function sets the availability/visibility of aircraft loadouts on the Ready/Arm menu. This is not unit DBID specific, all aircraft that use the loadoutID will have the loadout hidden.

#### Parameters

- table {} of
  - LoadoutDBID = number The ID of the loadout
  - Available = True/False Set the availability of the loadout. If set to False the loadout will be hidden on the Ready/Arm menu.

#### Returns

booleanTrue/False

#### Returns

True/False True if loadout is valid

##### Example

` ScenEdit_SetLoadoutAvailable( {loadoutDBID=26462, available=false} ) `
