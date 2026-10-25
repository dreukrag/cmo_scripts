### <a name="ScenEdit_SetSideOptions"></a>ScenEdit_GetSensorData (Sensor_DBID)

**[PRO ONLY]**

This function returns a table about the sensor passed

#### Parameters

- Sensor_DBID number The sensor database id

#### Returns

table {}

- The items in the table are dependent on the data kept in the database,  
  and will be known to the user.

##### Example

To get the databse information about sensor \#1234 ` local a = ScenEdit_Sensor_DBID( 1234 )`  
`print(a)`  
  
`Output`  

{ .... }
