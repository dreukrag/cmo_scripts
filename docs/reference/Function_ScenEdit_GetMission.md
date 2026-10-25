### <a name="ScenEdit_GetMission"></a>ScenEdit_GetMission ( SideNameOrId, MissionNameOrId)

This function retrieves the specific mission details

#### Parameters

- SideNameOrId string The side name/guid
- MissionNameOrId string The mission name/guid

#### Returns

[Mission](Wrappers.md#wrapper_Mission) The mission wrapper if the it exists or`nil`otherwise.

##### Example

`local mission = ScenEdit_GetMission( 'USA', 'CV CAP Left' )`
