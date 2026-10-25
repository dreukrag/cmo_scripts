### <a name="ScenEdit_DeleteMission"></a>ScenEdit_DeleteMission (SideNameOrId, MissionNameOrId)

This function will delete a mission from the side and unassign any units attached to it.

#### Parameters

- SideNameOrId string The side name/guid
- MissionNameOrId string The side's mission name/guid

#### Returns

True/False True if successful

##### Example

`local mission = ScenEdit_DeleteMission( 'USA', 'Marker strike' )`
