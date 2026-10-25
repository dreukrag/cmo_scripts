### <a name="ScenEdit_GetScore"></a>ScenEdit_GetScore( side )

This function retrieves the current score on a side.  
'PlayerSide' can be used for the `side` to access the current playing side.

#### Parameters

- side string The side name/guid

#### Returns

number The side's score

##### Example

`local a = ScenEdit_GetScore("PlayerSide")`
