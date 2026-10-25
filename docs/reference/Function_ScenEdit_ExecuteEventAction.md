### <a name="ScenEdit_ExecuteEventAction"></a>ScenEdit_ExecuteEventAction (EventDescriptionOrID)

This function executes an event action Lua script but does not show the results.

#### Parameters

- EventDescriptionOrID string The description/guid of the event action

#### Returns

string "Ok" on execution or nothing.

##### Example

`local event = ScenEdit_ExecuteEventAction('My action')`
