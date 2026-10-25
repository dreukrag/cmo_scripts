### <a name="ScenEdit_SetScore"></a>ScenEdit_SetScore (side, score, reason)

This function updates a given side's score.

#### Parameters

- side string The name/GUID of the side
- score number The new score for the side
- reason string The reason for the score change

#### Returns

numberThe new score for the side

##### Example

`ScenEdit_SetScore("PlayerSide",20,"Reset score")`
