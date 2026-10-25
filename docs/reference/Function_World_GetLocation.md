### <a name="World_GetLocation"></a> World_GetLocation ( table )

This function returns details of a given position. These details are similar to what is shown by the map cursor box.

#### Parameters

- table { }
  - latitude = [latitude](DataTypes.md#dataType_Latitude) The latitude of the point
  - longitude = [longitude](DataTypes.md#dataType_Longitude) The longitude of the point

#### Returns

{ } of

- altitude number Altitude (+) or depth (-)
- layer { } of Layer information
  - ceiling number
  - floor number
  - strength number
- cz { } of Convergence zone information
  - 1 number
  - 2 number
  - 3 number
  - 4 number
- slope number The slope rating (0 - 100)
- cover { } of Cover information
  - text string The description of the cover at location
  - value number The numeric value of the cover at location (need table of value/description)

##### Example

` local position_data = World_GetLocation ( { latitude = '-37.8307390636104', longitude = '144.932549348204' } ) `
