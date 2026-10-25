### <a name="ScenEdit_ExportMission"></a>ScenEdit_ExportMission (SideNameOrId, MissionNameOrId)

This function exports a mission's parameters as a XML file in folder Command_base/Defaults.  

#### Parameters

- SideNameOrId string The mission side name/guid
- MissionNameOrId string The mission name/guid

#### Returns

table {} of string A table of mission GUIDs that were exported.

##### Example

`local mission = ScenEdit_ExportMission( 'USA', 'Marker strike' )`
