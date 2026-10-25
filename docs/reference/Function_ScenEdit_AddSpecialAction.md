### <a name="ScenEdit_AddSpecialAction"></a>ScenEdit_AddSpecialAction(table)

This function adds a new special action event to the side. The event will then show under the Special Events button.

#### Parameters

- table {} The Special Action event details
  - side = string The name/GUID of the side for the action
  - ActionNameOrID = string The name or ID of the special action
  - description = string If specified, the new description for the action
  - IsActive = True/False If the action is visible to the player
  - IsRepeatable = True/False If the player can use the action multiple times
  - ScriptText = string The Lua script for the SA.  
    Note as the script is a multi line string, it requires a '\r\n' to be appended after each line so it is correctly interpreted/formated by the Editor.

#### Returns

True/False Returns True if successful

##### Example

` local LfCR = '\r\n'`  
`local myScript = '-- comment 1' .. LfCR .. '-- comment 2' .. LfCR ..'local a = GetBuildNumber()' .. LfCR .. "ScenEdit_MsgBox( 'My build is ' .. a, 0)" .. LfCR`  
`local s = ScenEdit_AddSpecialAction({ Side = 'usa', ActionNameOrID = 'sp1', description = 'test for special actions', ScriptText = myScript})`
