### <a name="ScenEdit_SetEventTrigger"></a>ScenEdit_SetEventTrigger (EventDescriptionOrID,options)

This function Sets the Trigger of an Event.

#### Parameters

- EventDescriptionOrID string Event GUID or Description
- options {} of
  - mode = string "add", "remove", "replace" Mode to perform
  - description = string Trigger description/name or GUID

#### Returns

triggers{} of

- mode string Mode performed
- xml string Trigger details in XML - new details if mode is 'add', previous details if mode is 'remove' or 'replace'

##### Example

`ScenEdit_SetEventTrigger('MyEvent',{mode = 'add', description = 'MyNewTrigger')`
