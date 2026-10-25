## <a name="FunctioName"></a>Function ScenEdit_MergeUnits( )

Merge the selected units in to the first one on the list

### Parameters

- List the parameters as in the Syntax line

### Returns

- Unit wrapper of the merged unit

#### Example

` local a = ScenEdit_MergeUnits()`  
`print(a)`  

unit { type = 'Facility', subtype = '5001', name = 'Mech Inf', side = 'SideA', guid = 'ff0ef686-bf03-4228-af7c-a726f8c178cf', class = 'Mech Inf Plt (Type 96 APC x 4)', proficiency = 'Regular', latitude = '34.7079918909088', longitude = '136.197564336924', altitude = '243', heading = '0', speed = '0', throttle = 'FullStop', autodetectable = 'False', mounts = '4', magazines = '4', unitstate = 'Unassigned', fuelstate = 'None', weaponstate = 'None', AllowMultiMission = 'False', AssignedMissionsQueue = 'table', }
