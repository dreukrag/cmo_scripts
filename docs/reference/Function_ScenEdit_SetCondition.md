### <a name="ScenEdit_SetCondition"></a>ScenEdit_SetCondition ( table )

This function Sets the attributes of an Event Condition.

#### Parameters

- table {}
  - description = string Condition GUID or Description
  - mode = string "add", "remove", "update", "list" Type of action to take on details
  - rename = or newname = string New Description for the Condition. Applicable to mode 'update' only
  - type = string Type of Condition. Applicable to mode 'add' only

#### Returns

table {} Table of condition values (needs to be expanded )

##### Example

` local action = ScenEdit_SetContion( { description='my condition', mode = 'list' } )`  
`print(action) -- list of condition settings local action = ScenEdit_SetContion( { description='my condition', mode = 'remove' } )`  
`print(action) -- list of the removed condition settings `
