### <a name="ScenEdit_AssignUnitAsTarget"></a>ScenEdit_AssignUnitAsTarget (AUNameOrIDOrTable, MissionNameOrID)

This function assigns targets to a Strike mission target list.  
The target list can be (a) one single unit/contact name/guid, or (b) a table of unit/contact name/guid

'UnitX' as the triggering unit, can be used as the unit name.  
Contacts can also be assigned. Refer to the VP\_ functions for details

#### Parameters

- AUNameOrIDOrTable string or table {} The name/GUID of the unit, or a table of unit/contact name/GUID to add
- MissionNameOrID string The strike mission name/guid to be updated

#### Returns

table {} of string A table of target GUIDs that were added

##### Example

`ScenEdit_AssignUnitAsTarget( {'target1', 'target2' }, 'Land strike' )ScenEdit_AssignUnitAsTarget('UnitX', 'Land strike' )`
