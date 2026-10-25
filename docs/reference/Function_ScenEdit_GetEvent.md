### <a name="ScenEdit_GetEvent"></a>ScenEdit_GetEvent ( EventDescriptionOrID, level )

This function returns the properties of an event; the full set of triggers, conditions and actions, or just limited to a subset.

`Level` is optional and defaults to all details if not supplied.

The event can be extracted in XML format by adding '10' to the level.  
The XML can then be used in [ScenEdit_SetEvent()](#ScenEdit_SetEvent) to import details into an event

#### Parameters

- EventDescriptionOrID string The event name/guid to retrieve
- level number1 = triggers  
  2 = conditions  
  3 = actions  
  4 = event The detail to return from the function.

#### Returns

[Event](Wrappers.md#wrapper_Event) The event wrapper containing the details

##### Example

Retrieve all the details about the event `local u = ScenEdit_GetEvent( 'Unit destroyed' )` Retrieve just the action details about the event `local u = ScenEdit_GetEvent( 'Unit destroyed', 3 )`
