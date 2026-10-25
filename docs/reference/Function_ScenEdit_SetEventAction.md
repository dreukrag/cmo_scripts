### <a name="ScenEdit_SetEventAction"></a>ScenEdit_SetEventAction (EventDescriptionOrID, options)

This function Sets the action of a Event.

#### Parameters

- EventDescriptionOrID string Event GUID or Description
- options {} of
  - mode = string "add", "remove", "replace" Mode to perform
  - description = string Action description/name or GUID

#### Returns

actions{} of

- mode string Mode performed
- xml string Action details in XML - new details if mode is 'add', previous details if mode is 'remove' or 'replace'

##### Example

`ScenEdit_SetEventAction('MyEvent',{mode = 'remove', description = 'MyAction')`
