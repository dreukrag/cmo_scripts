### <a name="ScenEdit_ImportMission"></a>ScenEdit_ImportMission (SideNameOrId,MissionNameOrId)

This function imports a mission's parameters as a XML file in folder Command_base/Defaults.  
\[Experimental as this should really be treated like an attachment so can be imported with Scenario\]

#### Parameters

- SideNameOrId string The side to import to
- MissionNameOrId string The mission name in the folder. The imported file will be 'MissionNameOrId.XML'.

#### Returns

table {} string A table of mission GUIDs that were exported.

##### Example

`local mission = ScenEdit_ImportMission('USA', 'Marker strike')`
