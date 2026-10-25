## <a name="Tool_SatelliteCoveragePrediction"></a>Tool_SatelliteCoveragePrediction (theSatellite, locationTable, timeTable, maxRange, minGrazingAngle)

The function purpose is to predict when the satellite will be able to cover the indicated area.

### Parameters

- theSatellite string GUID of the satellite
- locationTable { } of the location point
  - latitude = [latitude](DataTypes.md#dataType_Latitude)
  - longitude = [longitude](DataTypes.md#dataType_Longitude)
  - altitude = [altitude](DataTypes.md#dataType_Latitude)
- timeTable { } of the time frame (start and duration) to check for coverage
  - dateformat = value "DDMMYYYY"  
    "MMDDYYYY"  
    "YYYYMMDD" Overriding format of the date (optional) Default format is "DDMMYYYY"
  - startDate = StartDate Start date as 'DD:MM:YYYY' unless overriding dateFormat supplied.
  - startTime = StartTime Start time as 'HH:MM:SS'
  - duration = Duration Duration as 'day:hours:minutes:seconds'
- maxRange number range from the location point to cover
- minGrazingAngle number

### Returns

- { } of the periods when the location point is covered by satellite. This could be empty or multiple entries
  - - start StartDateTime 'DD:MM:YYYY HH:MM:SS' If overriding dateFormat supplied, then date will be in that format.
    - duration Duration Duration in 'seconds'

#### Example

` local l = Tool_SatelliteCoveragePrediction("ZY-1 02D", {latitude=33.352, longitude=-162.795, altitude=0},`  
`{startdate='11:09:2023', dateformat='DDMMYYYY', starttime='18:13:07', duration='2:00:00'}, 450, 95)`  
`print(l)`  

{ \[1\] = { duration = 50, start = '11:09:2023 19:22:37' }, \[2\] = { duration = 60, start = '12:09:2023 06:34:47' } }

With custom elevation angles:

` local u = ScenEdit_GetUnit({name="ZY-1 02D", side="Red"})`  
`local sensorTable = u.sensors`  
`local firstSensor = u:GetSensor(sensorTable[1]['sensor_guid'])`  
`firstSensor.MaxElevationAngle = -71`  
`local OffZenithAngle = 90 + firstSensor.MaxElevationAngle`  
  
`local coverage = Tool_SatelliteCoveragePrediction("ZY-1 02D", {latitude=33.064, longitude=-162.804, altitude=0},`  
`{startdate='11:09:2023', dateformat='DDMMYYYY', starttime='18:13:07', duration='2:00:00'}, 450, OffZenithAngle)`  
`print(coverage)`  

{ \[1\] = { start = '11:09:2023 19:22:57', duration = 20 }, \[2\] = { start = '12:09:2023 06:34:47', duration = 50 } }
