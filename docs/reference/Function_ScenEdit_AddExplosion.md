### <a name="ScenEdit_AddExplosion"></a>ScenEdit_AddExplosion( table )

This function creates a detonation of a warhead at a specific location.  
Useful for simulating explosions where no weapon is fired such as a bomb being detonated.  
\*\*\* Does not currently support under surface explosions \*\*\*\*

#### Parameters

- table {}
  - altitude = [altitude](DataTypes.md#dataType_Altitude) The altitude of the detonation. If no 'altitude' is passed, or the value of the parameter is 'surface', the explosion will occur at 'ground zero' at that location.
  - latitude = [latitude](DataTypes.md#dataType_Latitude) The latitude of the detonation
  - longitude = [longitude](DataTypes.md#dataType_Longitude) The longitude of the detonation
  - warheadid = number The database ID of the warhead to detonate

#### Returns

- True/False True if function successful

##### Example

Simulating an explosion of device '1.4kg HE' at the unit 'myUnit' location

`ScenEdit_AddExplosion({warheadid = 253, latitude = myUnit.latitude, longitude = myUnit.longitude, altitude = myUnit.altitude})`
