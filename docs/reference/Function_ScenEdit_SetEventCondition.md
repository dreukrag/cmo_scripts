### <a name="ScenEdit_SetEventCondition"></a>ScenEdit_SetEventCondition (EventDescriptionOrID, options)

This function Sets the Condition of an Event.

#### Parameters

- EventDescriptionOrID string Event GUID or Description
- options {} of
  - mode = string "add", "remove", "replace" Mode to perform
  - description = string Condition description/name or GUID

#### Returns

conditions{} of

- mode string Mode performed
- xml string Condition details in XML - new details if mode is 'add', previous details if mode is 'remove' or 'replace'

##### Example

`ScenEdit_SetEventCondition('MyEvent',{mode = 'replace', description = 'MyCondition')`
