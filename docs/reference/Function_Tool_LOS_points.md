### <a name="Tool_LOS_Points"></a> Tool_LOS_Points ( from, to, type)

This function returns the status of the LOS check between the points defined by 'from' and 'to'.  
The type of check can be for radar, EO/IR or ESM.

#### Parameters

- from { }
  - altitude = number or string Altitude of the from location. The keyword can be shortened to 'alt = '.
  - latitude = number or string Latitude of the from location
  - longitude = number or string Longitude of the from location
- to { }
  - altitude = number or string Altitude of the to location. The keyword can be shortened to 'alt = '.
  - latitude = number or string Latitude of the to location
  - longitude = number or string Longitude of the to location
- type valueRadar = 0  
  EO/IR = 1  
  ESM = 2 The type of 'horizon'.

#### Returns

The status of the check between the two points CodeSUCCESS  
FAIL_BEYONDHORIZON  
FAIL_TERRAINBLOCK

##### Example

` local los = Tool_LOS_Points( {latitude='3', longitude='3', alt=3000}, {latitude='9', longitude='9', alt=3000}, 1)`  
`if type(los) == 'boolean' then`  
`print(string.format('Line of sight to target = %s', los) )`  
`else`  
`print(string.format('Distance to horizon = %.2f NM', los) )`  
`end`  

Line of sight to target = true
