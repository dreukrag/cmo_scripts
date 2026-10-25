### <a name="ScenEdit_RemoveZone"></a>ScenEdit_RemoveZone (sideName, zoneType, table)

This function removes a no-nav or exclusion zone.

The RPs attached to the zone will also be removed as they are unique to the zone.

#### Parameters

- sideName string The Side name/GUID that owes the zone. Custom environment zones always belong to the Nature side.
- zoneType number 0 = non-navigation, 1 = exclusion, 2 = custom environment, -925 = standard The Type of zone to remove
- table {}
  - Description = string The Zone GUID or Name or Description to identify it

#### Returns

[Zone](Wrappers.md#wrapper_Zone) A zone wrapper for the removed Zone

##### Example

`local oldZone = ScenEdit_RemoveZone( 'Red', 0, { Description = 'my zone' } )`
