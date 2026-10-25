### <a name="ScenEdit_CurrentTime"></a>ScenEdit_CurrentTime ()

This function returns the current scenario date/time.  
This can then be customised to show in various ways for the in-game messages

#### Parameters

- None

#### Returns

[TimeStamp](DataTypes.md#dataType_TimeStamp) The UTC Unix timestamp of the current time in-game.

##### Example

` local now = ScenEdit_CurrentTime()`  
`local elapsed = now - timeFromLastTiggered`  
`if elapsed > 60*5 then`  
`-- been more than 5 minutes, set the lastTriggered time to now`  
`timeFromLastTiggered = now`  
`end `
