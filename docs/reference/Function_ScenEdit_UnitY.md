### <a name="ScenEdit_UnitY"></a> ScenEdit_UnitY ( )

This function returns unit detail for a specific case generated from an Event.  

\(a\) the Detecting Unit from a Unit Detected event trigger, or  
(b) the Damaging causing unit from a damage/destroyed event. The unit is the last one to actually cause damage during the event.

A table of details will be returned. Otherwise, a ` nil` is returned.  
Note that UnitY() can also be used as a shortcut for ScenEdit_UnitY().

#### Parameters

- None

#### Returns

{ } of

- unit [Unit](Wrappers.md#wrapper_Unit) The unit object
- sensor { } of multiple sensors making contact
  - name string Sensor name
  - type string Sensor type

##### Example

` local by = ScenEdit_UnitY() print('Y:'); print( by)`  
`print('Detected by: '); print( by.unit.name ..' of type ' .. by.unit.type ..' from ' .. by.unit.side)`  
`print('Sensor: '); print( by.sensor[1].name .. ' of type ' .. by.sensor[1].type); `
