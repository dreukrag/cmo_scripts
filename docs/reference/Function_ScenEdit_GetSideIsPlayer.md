### <a name="ScenEdit_GetSideIsPlayer"></a>ScenEdit_GetSideIsPlayer(sidename)

This function indicates if side is played by a human player.

#### Parameters

- sidename string The side's name/guid

#### Returns

True/False Will return true if the side matching the input name or id is player controlled. Will return nil for observers or umpires.

##### Example

`local side = ScenEdit_GetSideIsPlayer("NATO")`
