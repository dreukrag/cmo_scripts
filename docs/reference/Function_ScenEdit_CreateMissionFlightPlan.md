### <a name="ScenEdit_CreateMissionFlightPlan"></a>ScenEdit_CreateMissionFlightPlan (SideName, MissionName, options)

This function creates flights for a mission.

### Parameters

- SideName string The mission side
- MissionName string The mission name/guid
- options {} of
  - DATEONTARGET = string The mission time on target day, YYYY/MM/DD
  - TIMEONTARGET = string The mission time on target, HH:MM:SS
  - TAKEOFFDATE = string The mission takeoff day, YYYY/MM/DD
  - TAKEOFFTIME = string The mission takeoff time, HH:MM:SS

### Returns

- Returns all the flights on the mission. *Currently only returns the first flight, will be fixed in a upcoming release.*

#### Example

Time on Target ` ScenEdit_CreateMissionFlightPlan('Blue', 'Strike', {DATEONTARGET = '2025/08/01', TIMEONTARGET = '12:00:00'}) `

#### Example

Takeoff Time ` ScenEdit_CreateMissionFlightPlan('Blue', 'Strike', {TAKEOFFDATE = '2025/08/01', TAKEOFFTIME = '08:00:00'}) `
