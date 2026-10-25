### <a name="ScenEdit_GetTimeOfDay"></a>ScenEdit_GetTimeOfDay ( table )

This function retrieves the current time of day at a location  
The location can be an unit (guid or side/name) or a position (latitude,longitude).  
Only one pair is required to identify the location for the TimeOfDay.  

#### Parameters

- table {}
  - side = string Side name/guid
  - unitname = string Unit name
  - guid = string Unit guid
  - latitude = string Unit guid
  - longitude = string Unit guid

#### Returns

table {}

- tod number Time of day number \[0=Day, 2=Night, 3=Dawn, 4=Dusk\]
- localtime string Local time
- zulutime string Local time
- TOD string Time of day text

##### Example

`local u = ScenEdit_GetTimeOfDay( {side='NATO', unitname='FFG Dispair'} )`
