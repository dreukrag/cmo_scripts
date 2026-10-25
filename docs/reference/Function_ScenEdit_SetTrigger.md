### <a name="ScenEdit_SetTrigger"></a> ScenEdit_SetTrigger ( table )

This function Sets the attributes of a trigger.

#### Parameters

- table { }
  - description = string Trigger GUID or Description
  - mode = string "add", "remove", "update", "list" Type of action to take on details
  - rename = or newname = string New Description for the Trigger. Applicable to mode 'update' only
  - type = string Type of Trigger. Applicable to mode 'add' only

Extra keywords that can be included in the above table can be found in [Event Handling](Overview.md#EventHandling) .

#### Returns

table { } Table of trigger values (needs to be expanded )

##### Example

` local action = ScenEdit_SetTrigger( { description='my trigger', mode = 'list' } )`  
`print(action) -- list of trigger settings local action = ScenEdit_SetTrigger( { description='my trigger', mode = 'remove' } )`  
`print(action) -- list of the removed trigger settings `
