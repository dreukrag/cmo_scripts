### <a name="ScenEdit_RemoveSide"></a>ScenEdit_RemoveSide (table)

This function remove a side from play. This removes **ALL** units and contacts for the side.

#### Parameters

- table {}
  - side = string The side name/GUID to remove

#### Returns

[Side](Wrappers.md#wrapper_Side) A wrapper for the side removed, or `nil` otherwise

##### Example

` local s = ScenEdit_RemoveSide( {side="United States" } )`  
`print( s.name .. ' was removed') `
