### <a name="ScenEdit_SetWeather"></a> ScenEdit_SetWeather (temperature, rainfall, undercloud, seastate)

This function Sets the current weather conditions.  
It takes four numbers that describe the desired weather conditions.These conditions are applied globally.

#### Parameters

- temperature number The current baseline temperature (in deg C). Varies by latitude.
- rainfall number The rainfall rate, 0-50.
- undercloud number The amount of sky that is covered in cloud, 0.0-1.0
- seastate number The current sea state 0-9.

#### Returns

boolean True/False for Successful/Failure

##### Example

` ScenEdit_SetWeather(math.random(0,25), math.random(0,50), math.random(0,10)/10.0, math.random(0,9) )`
