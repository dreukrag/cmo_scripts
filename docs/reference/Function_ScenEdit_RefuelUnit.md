### <a name="ScenEdit_RefuelUnit"></a>ScenEdit_RefuelUnit ( table )

This function will make the unit attempt to refuel.

The unit should follow it's AAR configuration.You can force it use a specific tanker or ones from a set of missions.

#### Parameters

- table {}
  - side = string The side name/GUID of the unit
  - unitname = string The name of unit
  - guid = string The GUID of the unit
  - tanker = string A specific tanker defined by its name (side is assumed to be the same as unit) or GUID.
  - missions = {} of multiple string A table of mission names or mission GUIDs.

#### Returns

string If successful, then it returns an empty string. Otherwise, a message showing why it failed to refuel is returned

##### Example

` ScenEdit_RefuelUnit( {side="United States", unitname="USS Test" } ) ScenEdit_RefuelUnit( {side="United States", unitname="USS Test", tanker="Hose #1" } ) ScenEdit_RefuelUnit( {side="United States", unitname="USS Test", missions={ "Pitstop" } } ) `
