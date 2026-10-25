### <a name="ScenEdit_GetUnit"></a>ScenEdit_GetUnit (table)

This function gets the properties of the Unit.

#### Parameters

- table {}
  - side = string The side name/GUID of the unit
  - unitname = string The name of unit
  - guid = string The GUID of the unit
  - DISEntityID = string The DIS entity ID of the unit, in the format SiteID.ApplicationID.EntityID **[PRO ONLY]**

#### Returns

[Unit wrapper](Wrappers.md#wrapper_Unit) if the unit exists, or `nil` otherwise

**Note:** When run interactively (i.e. in the console) ScenEdit_GetUnit() will raise an exception if the selected unit is not found. This can be prevented using [Tool_EmulateNoConsole()](#Tool_EmulateNoConsole()).

##### Example 1

` local myUnit = ScenEdit_GetUnit( { guid= 'f4f9e0af-15c2-4582-8e80-b827c2ec2f56'} )`  
`print( myUnit)`  

unit {  
type = 'Ship',  
subtype = '3106',  
name = 'CG 56 San Jacinto',  
side = 'United States',  
guid = 'f4f9e0af-15c2-4582-8e80-b827c2ec2f56',  
class = 'CG 56 San Jacinto \[Ticonderoga Baseline 3, VLS\]',  
proficiency = 'Regular',  
latitude = '22.3252605703301',  
longitude = '62.1828983227462',  
altitude = '0',  
heading = '0',  
speed = '10',  
throttle = 'FullStop',  
autodetectable = 'False',  
group = 'Bush CSG',  
mounts = '25',  
magazines = '32',  
unitstate = 'Unassigned',  
fuelstate = 'None',  
weaponstate = 'None',  
}  

##### Example 2

` local myUnit = ScenEdit_GetUnit( { side='United States', unitname='CG 56 San Jacinto'} )`  
`print( myUnit)`  

unit {  
type = 'Ship',  
subtype = '3106',  
name = 'CG 56 San Jacinto',  
side = 'United States',  
guid = 'f4f9e0af-15c2-4582-8e80-b827c2ec2f56',  
class = 'CG 56 San Jacinto \[Ticonderoga Baseline 3, VLS\]',  
proficiency = 'Regular',  
latitude = '22.3252605703301',  
longitude = '62.1828983227462',  
altitude = '0',  
heading = '0',  
speed = '10',  
throttle = 'FullStop',  
autodetectable = 'False',  
group = 'Bush CSG',  
mounts = '25',  
magazines = '32',  
unitstate = 'Unassigned',  
fuelstate = 'None',  
weaponstate = 'None',  
}  

##### Example 3 **[PRO ONLY]**

` local myUnit = ScenEdit_GetUnit( { DISEntityID='01.15.35546'} )`  
`print( myUnit)`
