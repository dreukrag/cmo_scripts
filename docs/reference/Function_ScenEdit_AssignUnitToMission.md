### <a name="ScenEdit_AssignUnitToMission"></a>ScenEdit_AssignUnitToMission (unitname, mission, escort)

This function assign a unit to a mission.  
The 'UnitX' can be used as the unitname.

#### Parameters

- unitname string The name/GUID of the unit to assign
- mission string The mission name/GUID to assign to
- escort True/False If the mission is a strike one, then assign unit to the 'Escort' for the strike \[Default=False\]

#### Returns

True/False True if Successful

##### Example

`ScenEdit_AssignUnitToMission( "Bar #1", "Strike" )`
