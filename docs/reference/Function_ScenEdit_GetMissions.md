### <a name="ScenEdit_GetMission"></a>ScenEdit_GetMissions ( SideNameOrId)

This function retrieves the mission details of a side

#### Parameters

- SideNameOrId string The side name/guid

#### Returns

{ } of multiple [Mission](Wrappers.md#wrapper_Mission) The mission wrapper if the it exists or`nil`otherwise.

##### Example

`local missions = ScenEdit_GetMissions( 'USA' )`
