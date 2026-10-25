### <a name="ScenEdit_GetSideIsHuman"></a>ScenEdit_GetSideIsHuman (sidename)

This function indicates if side is played by a human player.

#### Parameters

- sidename string The side's name/guid

#### Returns

True/False True if the side is human controlled. Will return true for player sides, observers, or umpires.

##### Example

`local a = ScenEdit_GetSideIsHuman("NATO")`
