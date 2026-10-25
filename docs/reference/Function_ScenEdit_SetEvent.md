### <a name="ScenEdit_SetEvent"></a>ScenEdit_SetEvent (EventDescriptionOrID, options)

This function sets the attributes of an event.  
  
Use the SetEventAction/Trigger/Condition to associate those to the event.

#### Parameters

- EventDescriptionOrID string Event GUID or Description
- options {} of
  - mode = string "add", "remove", "update" Mode to perform
  - description = string Event description
  - newname = string New name for event if renaming the event. Not suggested as it can cause issues if scripts are using event names to perform tasks on.
  - isActive = True/False Event active
  - isShown = True/False Event is shown
  - IsRepeatable = True/False Event can repeat
  - Probability = Number 0 -100 Event can repeat

#### Returns

[Event](Wrappers.md#wrapper_Event) The event wrapper containing the details

##### Example

`ScenEdit_SetEvent('MyEvent',{mode = 'remove')`
