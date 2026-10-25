### <a name="ScenEdit_DeleteUnit"></a>ScenEdit_DeleteUnit (table, include)

This function will delete a unit( and any attached units) and no event is triggered.

#### Parameters

- include True/False If a group, delete the attached units
- table {}
  - side = string The side name/GUID of the unit
  - unitname = or guid = string The unit name/guid to delete.

#### Returns

True/FalseTrue if successful

##### Example

`ScenEdit_DeleteUnit( { side="United States", unitname="USS Abcd" } )ScenEdit_DeleteUnit( { side="United States", unitname="TaskForce #1", 'true' } )`
