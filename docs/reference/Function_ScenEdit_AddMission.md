### <a name="ScenEdit_AddMission"></a>ScenEdit_AddMission (SideNameOrId, MissionNameOrId, MissionType, MissionOptions)

This function adds a new mission to the side based on the supplied options  
It is suggested to make the mission name unique across the scenario to ensure there are no conflicts as to the side it is applicable to  
Once the core mission is added, the mission can be adjusted through a wrapper or [ScenEdit_SetMission](Function_ScenEdit_SetMission.md)

#### Parameters

- SideNameOrId string The mission side name/guid
- MissionNameOrId string The mission name as this is a new mission
- MissionType [MissionType](DataTypes.md#dataType_MissionType) The type of mission which will control what is valid for the following options
- MissionOptions {} The mission specific options
  - category = MissionCategoryMission (0), Package (1), Taskpool (2) The category of mission being added. The default is 'Mission'.  
  - destination = string A mission destination location name/guid (This only applies to a 'Ferry' mission)
  - pool = ParentTaskpool The name or GUID of the task pool this package draws from. (This only applies to mission category 'package')  
  - type = [MissionSubType](DataTypes.md#dataType_MissionType) Mission sub-type (This only applies to mission types 'Patrol' and 'Strike')  
  - zone = {} of multiple The area to operate in (This only applies to 'Patrol', 'Support', 'Mining', 'Cargo' missions)
    - string The reference point guid/name

#### Returns

[Mission](Wrappers.md#wrapper_Mission) A mission wrapper for the new mission or `nil` otherwise.  
Retaining the mission guid for updating would be desirable rather than rely on the name itself.

##### Example

`local mission = ScenEdit_AddMission( 'USA', 'Marker strike', 'strike',{ type = 'land'} )local missionReferencePoints={'rp-1','rp-2','rp-3'}`  
`local mission = ScenEdit_AddMission (OPFORsideName, 'OPFOR Mission', 'Patrol', {type= 'AAW',zone= missionReferencePoints} ) `  
` -- create a task pool`  
`local m = ScenEdit_AddMission('sidea', 'Strike Pool', 'Strike', {category='taskpool',type='land',pool='strike pool'})`  
`-- create a package under the task pool`  
`m = ScenEdit_AddMission('sidea', 'Package 1', 'Strike', {category='package',type='land',pool='strike pool'})`  
`m = ScenEdit_AddMission('sidea', 'mission', 'Strike', {type='land',pool='strike pool'}) print(m)`
