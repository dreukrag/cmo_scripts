### <a name="VP_GetSide"></a> VP_GetSide ( table )

This function returns the Side object from the perspective of the player.

#### Parameters

- table { }
  - side = string The name of the side
  - guid = string The GUID of the side

#### Returns

[Side](Wrappers.md#wrapper_Side) The side object

##### Example

` local side = VP_GetSide( { Side ='sidea' } ) `
