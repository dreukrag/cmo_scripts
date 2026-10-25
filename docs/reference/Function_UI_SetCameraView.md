### <a name="UI_SetCameraView"></a>UI_SetCameraView (latitude, longitude, altitude)

This function sets the camera to the specified latitude, longitude, and altitude

#### Parameters

- latitude [latitude](DataTypes.md#dataType_Latitude) The camera latitude. Must be decimal degrees. String of degree/minutes/seconds is currently not valid
- longitude [longitude](DataTypes.md#dataType_Longitude) The camera longtitude. Must be decimal degrees. String of degree/minutes/seconds is currently not valid
- altitude [altitude](DataTypes.md#dataType_Altitude) The camera altitude in meters

#### Returns

- None

##### Example

`UI_SetCameraView(50, 0, 2500000)`
