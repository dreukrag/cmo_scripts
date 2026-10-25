### <a name="ScenEdit_GetSpecialAction"></a>ScenEdit_GetSpecialAction ( action_info )

This function retrieves the properties of special action

#### Parameters

- table {}
  - side = string Side name/guid
  - mode = 'list' Extracts all special actions for all sides if 'side' not supplied, else filters just for 'side'
  - ActionNameOrID = string Specific Special action event name/guid

#### Returns

table {} for a specific event or  
table {} of multiple

- guid string Event guid
- name string Event name
- description string Event description
- isActive True/False Event is active?
- IsRepeatable True/False Event is active?
- ScriptText string Event script

##### Example

`ScenEdit_GetSpecialAction( { side='SideA', ActionNameOrID='Perform SAR' } )ScenEdit_GetSpecialAction( { side='SideA', mode='list' } )`
