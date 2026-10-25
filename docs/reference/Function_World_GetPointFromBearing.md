## <a name="World_GetPointFromBearing"></a> World_GetPointFromBearing ( table )

This function returns a location (as a set of longitude/latitude) based on bearing and distance from a point.

#### Parameters

- table { }
  - latitude = [latitude](DataTypes.md#dataType_Latitude) The latitude of the start point
  - longitude = [longitude](DataTypes.md#dataType_Longitude) The longitude of the start point
  - distance = number The distance from the start point (NM)
  - bearing = number (0-360) The Bearing from the start point

#### Returns

{ } of the new location point

- latitude [latitude](DataTypes.md#dataType_Latitude) The latitude of the new point
- longitude [longitude](DataTypes.md#dataType_Longitude) The longitude of the new point

##### Example

` local new_pos = World_GetPointFromBearing( { latitude = '-37.8307390636104', longitude = '144.932549348204',`  
`distance = 12, bearing = 90 } )`  

{ Latitude = -37.8304685191991, longitude = 145.184996787893, Longitude = 145.184996787893, latitude = -37.8304685191991 }  

-- Note the double entry. The mixed case was an error but not picked up for a few builds  
-- lowercase names is the norm, except under specific circumstances
