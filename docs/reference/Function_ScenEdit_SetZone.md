### <a name="ScenEdit_SetZone"></a> ScenEdit_SetZone (sideName, zoneType, table)

This function updates a non-navigation or exclusion zone for a side.  
You only need to pass the parameters that need to be updated.

#### Parameters

- sideName string Side name/GUID
- zoneType number 0 = non-navigation, 1 = exclusion, 2 = custom environment, -925 = standard The type of zone
- table { } of
  - description = string The Zone name
  - isactive = True/False Is the zone active?
  - locked = True/False Are Zone RPs locked?
  - hidden = True/False Are Zone RPs hidden?
  - affects = table { } list of core unit types ('SHIP', 'AIRCRAFT', etc) affected Zone applies to these core unit types
  - markAs = [posture](DataTypes.md#dataType_Stance) Units entering the zone are treated as (posture towards them) \[exclusion zone only\]
  - relativeto = string The unit name/guid that all the RP(s) relate to, if required
  - areaColor = string The zone color to show as a HTML color code. Transparency can also be specified, either as `'#AARRGGBB'` (AA: 00 fully transparent, FF fully opaque) or as `'Alpha,Red,Green,Blue'` (Alpha: 0 fully transparent, 255 fully opaque)
  - rename = string Description to change zone to
  - area = { } of multiple The area defining the zone
    - name = string The name of the new reference point
    - latitude = [latitude](DataTypes.md#dataType_Latitude) The latitude of the new reference point
    - longitude = [longitude](DataTypes.md#dataType_Longitude) The longitude of the new reference point
    - highlighted = True/False True if the reference point should be selected
    - locked = True/False True if the reference point is locked
    - distance = distance Distance from the 'relative' unit
    - bearing = number (0-360) Bearing from the 'relative' unit
    - bearingtype = type Fixed (0) or Rotating (1) Bearing aspect of the reference point

#### Returns

[Zone](Wrappers.md#wrapper_Zone) The update Zone object

##### Example

` local zone = ScenEdit_SetZone( 'sideA', 0, { rename = 'new zone', affects = {'ship', 'submarine'} } )`

##### Example 2

Change a zone color to half-opacity red

` local zone = ScenEdit_SetZone( 'sideA', -925, { description = 'test', areaColor = '#80FF0000' } )`  
`local zone = ScenEdit_SetZone( 'sideA', -925, { description = 'test', areaColor = '128,255,0,0' } )`
