### <a name="World_GetElevation"></a> World_GetElevation ( table )

This function returns the elevation in meters of a given point

#### Parameters

- table { }
  - latitude = [latitude](DataTypes.md#dataType_Latitude) The latitude of the point
  - longitude = [longitude](DataTypes.md#dataType_Longitude) The longitude of the point

#### Returns

number The elevation of the point in meters. Altitude (+) or depth (-).

##### Example

` local value = World_GetElevation ( { latitude = '-37.8307390636104', longitude = '144.932549348204' } ) `
