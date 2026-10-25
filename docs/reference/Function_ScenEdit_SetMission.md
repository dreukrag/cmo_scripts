### <a name="ScenEdit_SetMission"></a>ScenEdit_SetMission (SideName, MissionNameOrId, MissionOptions)

This function Sets details for a mission.

#### Parameters

- SideName string The mission side
- MissionNameOrId string The mission name/guid
- MissionOptions {} Refer to the Mission object [Mission](Wrappers.md#wrapper_Mission) for the possible values  
  Only the items to be updated need to be added as 'item = value'.  

#### Returns

[Mission](Wrappers.md#wrapper_Mission) The mission object if the mission exists or `nil`otherwise.

##### Example

`local mission = ScenEdit_SetMission('USA','CV CAP Left',{TankerUsage=1,OnStation=2})`
