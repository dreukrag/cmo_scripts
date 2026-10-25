### <a name="Tool_Bearing"></a> Tool_Bearing ( fromHere, toHere)

This function returns the bearing between two points, which can be a GUID of a unit/contact or a latitude/longitude point.

#### Parameters

- fromHere string or { } of latitude = [latitude](DataTypes.md#dataType_Latitude) longitude = [longitude](DataTypes.md#dataType_Longitude) Unit/Contact guid or a location point
- toHere string or { } of latitude = [latitude](DataTypes.md#dataType_Latitude) longitude = [longitude](DataTypes.md#dataType_Longitude) Unit/Contact guid or a location point

#### Returns

number (0-360) The bearing from 'here' to 'there'.

##### Example

` local b = Tool_Bearing('8269b881-20ce-4f2e-baa0-6823e46d55a4', '004aa55d-d553-428d-a727-26853737c8f4' ) local b = Tool_Bearing( { latitude='33.1991547589118', longitude='138.376876749942' }, '8269b881-20ce-4f2e-baa0-6823e46d55a4' )`
