### <a name="World_GetCircleFromPoint"></a> World_GetCircleFromPoint ( table )

This function returns a circle around point.

#### Parameters

- table { }
  - latitude = [latitude](DataTypes.md#dataType_Latitude) The location of the central point
  - longitude = [longitude](DataTypes.md#dataType_Longitude) The location of the central point
  - numpoints = number The number of points to generate on the circle's arc. A minimum of 3 is required
  - radius = number The radius (NM) around the central point

#### Returns

{ } of multiple Points on the circle

- latitude [latitude](DataTypes.md#dataType_Latitude) The latitude of a point on the circle
- longitude [longitude](DataTypes.md#dataType_Longitude) The longitude of a point on the circle

##### Example

` local circle = World_GetCircleFromPoint( { latitude = '-37.8307390636104', longitude = '144.932549348204', numpoints = 12, radius = 50 } )`
