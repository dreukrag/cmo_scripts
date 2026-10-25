### <a name="ScenEdit_ExecuteSpecialAction"></a>ScenEdit_ExecuteSpecialAction (eventNameOrId)

This function executes a Lua Special action script but does not show results.

#### Parameters

- eventNameOrId string The name/guid of the event action

#### Returns

string "Ok" on execution or nothing.

##### Example

`local event = ScenEdit_ExecuteSpecialAction('My action')`
