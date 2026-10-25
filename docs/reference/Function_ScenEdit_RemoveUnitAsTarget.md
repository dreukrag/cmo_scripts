### <a name="ScenEdit_RemoveUnitAsTarget"></a>ScenEdit_RemoveUnitAsTarget (AUNameOrIDOrTable,MissionNameOrID)

This function removes target(s) from a Strike mission.

The value 'UnitX' can be used in an event for AUNameOrIDOrTable.

#### Parameters

- AUNameOrIDOrTable
  - string The name/GUID of the single unit
  - {} of multiple string A table of `name/GUID` to remove from target list
- MissionNameOrID string The strike mission name/guid

#### Returns

table {} of string A table of target GUIDs removed

##### Example

`ScenEdit_RemoveUnitAsTarget( { 'target1','target2' }, 'Land strike' )ScenEdit_RemoveUnitAsTarget( 'UnitX', 'Land strike' )`
