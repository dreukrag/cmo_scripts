### <a name="ScenEdit_GetEvents"></a>ScenEdit_GetEvents (level)

This function returns the properties of all event; the full set of triggers, conditions and actions, or just limited to a subset.

`Level` is optional and defaults to all details if not supplied.

#### Parameters

- level number1 = triggers  
  2 = conditions  
  3 = actions  
  4 = event The detail to return from the function.

#### Returns

Table {} of [Event](Wrappers.md#wrapper_Event) Event wrappers

Retrieve the trigger details for all events `local u = ScenEdit_GetEvents( 1 )`
