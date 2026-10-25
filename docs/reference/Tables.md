<a name="Tables"></a>

## Tables

Tables are sections that have related data attached to them.  
In general, they are referenced as Lua tables.  
Like wrappers, the content of these may be modified either directly (**object.field**) or by some ScenEdit_Setxxx( {..**field=**....} ) function.  

- [AAR](#table_AAR)
- [Area](#table_Area)
- [Cargo](#table_Cargo)
- [CargoItem](#table_CargoItem)
- [Component](#table_Component)
- [EMmatch](#table_EMmatch)
- [Emissions](#table_Emissions)
- [Enablers](#table_Enablers)
- [Facility](#table_Facility)
- [Formation](#table_Formation)
- [LastDetections](#table_LastDetections)
- [LatLon](#table_LatLon)
- [LoadoutInfo](#table_LoadoutInfo)
- [Magazine](#table_Magazine)
- [MissionCargo](#table_CargoMission)
- [MissionFerry](#table_FerryMission)
- [MissionMine](#table_MineMission)
- [MissionMineClear](#table_MineClearMission)
- [MissionPatrol](#table_PatrolMission)
- [MissionStrike](#table_StrikeMission)
- [MissionSupport](#table_SupportMission)
- [Mount](#table_Mount)
- [ReferencePoint](#table_ReferencePoint)
- [Sensor](#table_Sensor)
- [Signature](#table_Signature)
- [TargetPriority](#table_TargetPriority)
- [WRA](#table_WRA)
- [WeaponLoaded](#table_WeaponLoaded)
- [Weather](#table_Weather)

  

------------------------------------------------------------------------

<a name="table_AAR"></a>

### AAR

Air-to-Air Refueling options; these are updated by [ScenEdit_SetMission()](Function_ScenEdit_SetMission.md).

| Field | Type | Description | Comments |
|---|---|---|---|
| use_refuel_unrep | string | Can use refuel/replenishment? |  |
| tankerUsage | string or<br>number | Is tanker reserved for missions? | Automatic(0), Mission(1) |
| launchMissionWithoutTankersInPlace | boolean |  | If true, mission will launch even if no tankers are in place. |
| TankerFollowsReceivers | boolean |  | If true, tankers will move to mission/flightplan when aircraft starts refueling. False, the tanker will remain in its current track. |
| KeepOnMissionWithoutTankersInPlace | boolean |  | If true, units will ignore bingo status and continue on mission waiting for a tanker. (Only use on flightplans) |
| tankerMissionList | mission name or<br>GUID | Table of missions to use as source of refuellers |  |
| tankerMinNumber_total | number |  |  |
| tankerMinNumber_airborne | number |  |  |
| tankerMinNumber_station | number |  |  |
| maxReceiversInQueuePerTanker_airborne | number |  |  |
| fuelQtyToStartLookingForTanker_airborne | number | Minimum percentage of fuel (0-100) that tanking will be requested |  |
| tankerMaxDistance_airborne | string or<br>number | A tanker will be selected within this range | Use 'internal' range or set a range. |

------------------------------------------------------------------------

<a name="table_Area"></a>

### Area

This defines an area bounded by Reference Points or LatLon points  

1.  Using Reference Point Names or GUIDs  
    { 'RP-3137', 'RP-3139', 'RP-3136', 'RP-3138' }  
      

------------------------------------------------------------------------

<a name="table_Cargo"></a>

### Cargo

Cargo stored in a ship/aircraft or dock facility usually referenced from a 'unit' wrapper.  
To add/modify/remove cargo, use the function [UpdateUnitCargo()](Function_ScenEdit_UpdateUnitCargo.md).

| Field | Type | Description | Comments |
|---|---|---|---|
| GUID | string | GUID |  |
| dbid | number | Database ID |  |
| name | string | Name |  |
| type | number | Type |  |
| status | string | Status |  |
| area | number | Cargo unit area |  |
| crew | number | Cargo unit crew |  |
| mass | number | Cargo unit mass |  |
| quantity | number | Items present |  |
| damage | string | Damage |  |
| statusR | string | Inoperative reason |  |

------------------------------------------------------------------------

<a name="table_CargoItem"></a>

### CargoItem

Cargo item is used to identify the cargo assigned to be moved via a cargo mission.  

| Field | Type | Description | Comments |
|---|---|---|---|
| type | number | CargoObjectType |  |
| dbid | number | Database ID of the CargoObjectType |  |
| GUID | string | GUID of the specific item to move, or an empty string |  |
| quantity | number | Number of items to be moved (for Mount type cargo.) |  |

------------------------------------------------------------------------

<a name="table_CargoMission"></a>

### CargoMission

CargoMission options; these are updated by ScenEdit_SetMission()

| Field | Type | Description | Comments |
|---|---|---|---|
| subtype | string | Subtype of mission ('transfer', 'delivery') |  |
| OneThirdRule | boolean | True if activated |  |
| TransitThrottleAircraft | string |  |  |
| TransitAltitudeAircraft | string |  |  |
| StationThrottleAircraft | string |  |  |
| StationAltitudeAircraft | string |  |  |
| TransitThrottleSubmarine | string |  |  |
| TransitDepthSubmarine | string |  |  |
| StationThrottleSubmarine | string |  |  |
| StationDepthSubmarine | string |  |  |
| TransitThrottleShip | string |  |  |
| StationThrottleShip | string |  |  |
| UseFlightSize | boolean | True if minimum size required |  |
| UseGroupSize | boolean | True if minimum size required |  |
| Zone | name or<br>GUID | Table of reference point names and/or GUIDs |  |
| DestinationUnitID | GUID | The GUID of the transfer mission destination unit |  |
| MoveAllCargo | boolean | If true, mission units ignore assigned cargo list and move all possible cargo. |  |
| AllowGroundUnitSelfDeliveryFromCargo | boolean | If true, ground units that are assigned to the mission AND begin inside cargo will exit<br>cargo and attempt to self-transport. |  |

------------------------------------------------------------------------

<a name="table_Component"></a>

### Component

This identifies the component/item(s) that are present in a unit. See [Unit](Wrappers.md#wrapper_Unit):filterOnComponent on how to filter this table

| Field | Type | Description | Comments |
|---|---|---|---|
| comp_GUID | string | GUID |  |
| comp_dbid | string | Database ID |  |
| comp_name | string | Name |  |
| comp_type | string | Type of component (mount, sensor, rudder, etc) |  |
| comp_status | string | Status |  |
| comp_statusR | string | Reason why inoperative [if not operational] |  |
| comp_damage | string | Damage Severity [if not operational] |  |
| comp_comms_jammed | true/false | Communication component being jammed |  |
| comp_sensor_jammed | true/false | Sensor component being jammed |  |
| comp_comms_datalink_parent | [Unit](#wrapper_Unit) | Communication (as datalink) parent unit, else nil |  |

------------------------------------------------------------------------

<a name="table_EMmatch"></a>

### EMmatch

EM matches from database. Note the table items are in uppercase

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| DBID | number | Databse id. |  |
| NAME | string | Matching id name. |  |
| CATEGORY | string | Not applicable to weapons (Missile,Torpedo) |  |
| TYPE | string | Not applicable to Facility |  |
| SUBTYPE | number | Type of item within the contact type ( subtype is "Fighter" within scope of Aircraft) |  |
| MISSILE_DEFENCE | number | Applicable to Facility and Ships |  |

##### Example

` local u = ScenEdit_GetContact( { side='united states', guid='Y5QK8V-0HM1KMFEQFV13'} )`  
`print(u.potentialmatches)`  
  

{  
\[1\] = { DBID = 2835, CATEGORY = SurfaceCombatant, SUBTYPE = 3303, TYPE = FFG, MISSILE_DEFENCE = 16, NAME = 'F 495 Gediz \[Perry, Gabya Class\]' }  
}

------------------------------------------------------------------------

<a name="table_Emissions"></a>

### Emissions

Contact emission details

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| name | string |  |  |
| age | number | Time detection held |  |
| solid | True/false | Precise type/id of emitter detected |  |
| sensor_dbid | number | Sensor detecting databse id |  |
| sensor_name | string | Sensor name |  |
| sensor_type | string | Sensor type |  |
| sensor_role | string | Sensor role |  |
| sensor_maxrange | number | Sensor maximum range (nm) |  |

##### Example

` local u = ScenEdit_GetContact({side='united states',guid='Y5QK8V-0HM1KMFEQFV13'})`  
`print(u.emissions)`  

{  
\[1\] = { sensor_role = 2143, sensor_dbid = 1484, sensor_type = 2001, sensor_maxrange = 48, Name = 'AN/SPG-60 STIR \[Mk86 FCS, Radar\] (Radar, FCR, Surface-to-Air & Surface-to-Surface, Short-Range)', Age = 0.300000011920929, name = 'AN/SPG-60 STIR \[Mk86 FCS, Radar\] (Radar, FCR, Surface-to-Air & Surface-to-Surface, Short-Range)', Solid = 'Yes', solid = 'Yes', sensor_name = 'AN/SPG-60 STIR \[Mk86 FCS, Radar\]', age = 0.300000011920929 },  
\[2\] = { sensor_role = 2028, sensor_dbid = 1642, sensor_type = 2001, sensor_maxrange = 35, Name = 'AN/SPS-55 (Radar, Surface Search & Navigation)', Age = 0.300000011920929, name = 'AN/SPS-55 (Radar, Surface Search & Navigation)', Solid = 'Yes', solid = 'Yes', sensor_name = 'AN/SPS-55', age = 0.300000011920929 },  
\[3\] = { sensor_role = 2028, sensor_dbid = 1501, sensor_type = 2001, sensor_maxrange = 20, Name = 'Furuno (Radar, Surface Search & Navigation)', Age = 0.300000011920929, name = 'Furuno (Radar, Surface Search & Navigation)', Solid = 'Yes', solid = 'Yes', sensor_name = 'Furuno', age = 0.300000011920929 },  
\[4\] = { sensor_role = 2201, sensor_dbid = 3115, sensor_type = 2001, sensor_maxrange = 128, Name = 'Mk92 Mod 12 CAS (Radar Illuminator, Long-Range)', Age = 0.300000011920929, name = 'Mk92 Mod 12 CAS (Radar Illuminator, Long-Range)', Solid = 'Yes', solid = 'Yes', sensor_name = 'Mk92 Mod 12 CAS', age = 0.300000011920929 },  
\[5\] = { sensor_role = 2014, sensor_dbid = 2238, sensor_type = 2001, sensor_maxrange = 135, Name = 'SMART-S Mk2 (Radar, Air & Surface Search, 3D Medium-Range)', Age = 0.300000011920929, name = 'SMART-S Mk2 (Radar, Air & Surface Search, 3D Medium-Range)', Solid = 'Yes', solid = 'Yes', sensor_name = 'SMART-S Mk2', age = 0.300000011920929 },  
\[6\] = { sensor_role = 2133, sensor_dbid = 4226, sensor_type = 2001, sensor_maxrange = 2.70000004768372, Name = 'AN/VPS-2 Search/Track \[Mk16 CWIS\] (Radar, FCR, Surface-to-Air, Short-Range)', Age = 0.300000011920929, name = 'AN/VPS-2 Search/Track \[Mk16 CWIS\] (Radar, FCR, Surface-to-Air, Short-Range)', Solid = 'Yes', solid = 'Yes', sensor_name = 'AN/VPS-2 Search/Track \[Mk16 CWIS\]', age = 0.300000011920929 }  
}

<a name="table_Enablers"></a>

### Enablers

Enablers

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| GNSS_NavIC | True/false |  |  |
| GNSS_BeiDou | True/false |  |  |
| GNSS_GLONASS | True/false |  |  |
| GNSS_GPS | True/false |  |  |

##### Example

` local side = VP_GetSide({side='BLUE'})`  
`print(side.enablers)`  

{ GNSS_NavIC = 'Yes', GNSS_BeiDou = 'Yes', GNSS_GLONASS = 'Yes', GNSS_GPS = 'Yes' }  

side.enablers = {GNSS_GLONASS=false}  
print(side.enablers)  

{ GNSS_NavIC = 'Yes', GNSS_BeiDou = 'Yes', GNSS_GLONASS = 'No', GNSS_GPS = 'Yes' }  

------------------------------------------------------------------------

<a name="table_Facility"></a>

### Facility

Facility air or dock facility

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| GUID | string | GUID |  |
| dbid | number | Database ID |  |
| name | string | Name |  |
| type | number | Type |  |
| status | string | Status |  |
| capacity | number | Units present |  |

------------------------------------------------------------------------

<a name="table_FerryMission"></a>

### FerryMission

FerryMission options; these are updated by ScenEdit_SetMission()  
Note that 'random' behavior basically finds a new destination base within range each time the mission is executed.

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| FerryBehavior | string | Values OneWay(0), Cycle(1), Random(2) |  |
| FerryThrottleAircraft | string |  |  |
| FerryAltitudeAircraft | string |  |  |
| FerryTerrainFollowingAircraft | boolean |  |  |
| FlightSize | [Size](DataTypes.md#dataType_Size) |  |  |
| MinAircraftReq | string |  |  |
| UseFlightSize | boolean |  |  |

------------------------------------------------------------------------

<a name="table_Formation"></a>

### Formation

This contains the information related to keeping units of a group in formation.  
There are several predefined formation settings located in 'Resources\Formation\StandardFormations.txt'. These can be used to set a group's base formation stations.  
Indivdual units in the formation can have their station changed.

The field values for a selected unit are "bearing", "type", "distance", "sprint"  
The field values for a selected group are "name", "spacing", "spacing_unit", "bearing", "transpose"  

#### Fields

For setting a unit's station in the current formation

| Field | Type | Description | Comments |
|---|---|---|---|
| type | valuefixed = 0<br>rotating = 1 | Type of bearing |  |
| bearing | number | Bearing from formation lead (0-360) |  |
| distance | number | Distance (NM) from formation lead |  |
| sprint | True/False | Use 'sprint and drift' mode while on formation station |  |
| transpose | True | Unit jumps to the new stations immediately |  |

For setting a group's formation and underlying unit stations

| Field | Type | Description | Comments |
|---|---|---|---|
| name | string | Formation name | The name from the formation setting file |
| spacing | number | Base distance (m) from formation lead | Used to determine stations of group units |
| spacing_unit | string | Multipler to the spacing if required. | Used to determine stations of group units<br>Optional |
| bearing | number | Desired bearing of formation lead (0-360) | Uses the group lead's current heading if not used |
| transpose | True | Units jump to the new stations immediately |  |

The formation name can also contain your own formation settings to initally set up the group's formation.  
The name starts with "Custom:" followed by a string in the format designated in the 'Resources\Formation\StandardFormations.txt' file.  
Look at this file to get a feeling of these fields and how they are used,  
The character '\t' is used in the Lua string to represent tabs which is needed to separate the fields in the line.  
For example: Custom:\t0\t2\t1\t135\t1\t1\t225\t1  

##### Example

` local g = ScenEdit_GetUnit( {name='CVN BG', guid='9506a165-6e44-40dd-b721-f9c07e056bdb'})`  
`print (g.group.unitlist ) -- list of units in the group`  
`local u_gid = g.group.unitlist[6] -- changing station of 6th unit in the group`  
`local u = ScenEdit_GetUnit( {guid=u_gid})`  
`print(u.formation) -- before update`  
`u.formation = {type='fixed', sprint=false, bearing=45, distance=5} -- station = fixed bearing 45 deg at 5 NM from lead`  
`print(u.formation) -- after update`  
  

-- list of units in the group  
{ \[1\] = 'ee495732-1637-463a-b6c9-e2564150c8bf', \[2\] = '34c6939a-8aef-452b-9186-31763fe82e14',  
\[3\] = 'b75cf3ed-c2f9-4a70-b8a2-f9506d2c2678', \[4\] = 'a113ca86-ce8f-4dae-8351-7b89ff3a3e81',  
\[5\] = '7d149655-bfca-4364-a06a-3652a9b701ed', \[6\] = 'e65feada-4529-4223-82df-522be44c7af9',  
\[7\] = '3edf9d1d-9439-49cf-a28f-0ea99e551ca0', \[8\] = 'e0ad9db3-730b-45e5-8c45-2daa8f08a419' }  
-- before update  
{ sprint = 'False', longitude = 138.234750179072, bearing = 48.5445709228516, latitude = 34.2548706829701, guid = 'e65feada-4529-4223-82df-522be44c7af9', type = 'Rotating', distance = 0.663772463798523 }  
-- after update  
{ sprint = 'False', longitude = 138.295780804378, bearing = 44.8684692382813, latitude = 34.3064951630114, guid = 'e65feada-4529-4223-82df-522be44c7af9', type = 'Fixed', distance = 4.99721479415894 }  

------------------------------------------------------------------------

<a name="table_LastDetections"></a>

### LastDetection

Contact detection details

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| detector_guid | string | The GUID of the detecting unit |  |
| detect_sensor_guid | string | The GUID of the sensor on the detecting unit |  |
| age | number | Seconds since detection made |  |
| range | number | Estimated range at detect time |  |
| special_mode | string | Special detect mode. This identifies detection as special. | The values, which should be self-explaining, are:<br>None,<br>SubAssumedFromTorpedoDetection,<br>SubAssumedFromMissileDetection,<br>FlamingDatum,<br>AutoDetection,<br>MissileAssumedFromSemiActiveIllumination |

##### Example

` local u = ScenEdit_GetContact( { side='united states', guid='Y5QK8V-0HM1KMFEQFV13'} )`  
`print(u.lastDetections)`  
  

{  
\[1\] = { detect_sensor_guid = 'Y5QK8V-0HM1KMFEOGK6H', special_mode = None, detector_guid = 'Y5QK8V-0HM1KMFEOGK6C', age = 0, range = 81.1426696777344 },  
\[2\] = { detect_sensor_guid = 'Y5QK8V-0HM1KMFEOGK6H', special_mode = None, detector_guid = 'Y5QK8V-0HM1KMFEOGK6C', age = 0, range = 81.1426696777344 },  
\[3\] = { detect_sensor_guid = 'Y5QK8V-0HM1KMFEOGJVP', special_mode = None, detector_guid = 'Y5QK8V-0HM1KMFEOGJVK', age = 0, range = 60.0935401916504 },  
..  
\[48\] = { detect_sensor_guid = 'Y5QK8V-0HM1KMFEOGLD1', special_mode = None, detector_guid = 'Y5QK8V-0HM1KMFEOGLCU', age = 1, range = 58.4287376403809 },  
\[49\] = { detect_sensor_guid = 'Y5QK8V-0HM1KMFEOGLH6', special_mode = None, detector_guid = 'Y5QK8V-0HM1KMFEOGLH2', age = 1, range = 64.2896118164063 },  
\[50\] = { detect_sensor_guid = 'Y5QK8V-0HM1KMFEOGLH6', special_mode = None, detector_guid = 'Y5QK8V-0HM1KMFEOGLH2', age = 1, range = 64.2896118164063 }  
}

------------------------------------------------------------------------

<a name="table_LatLon"></a>

### LatLon

A Position on the map, referred to with latitude (north/south) and longitude (east/west) coordinates. These can be represented in two forms, degrees minutes seconds, and decimal degrees. The Command Lua API supports both forms.

A set of latitude and longitude to define a point. Within the simulation, the values are recorded in decimal degrees.

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| latitude | [latitude](DataTypes.md#dataType_Latitude) |  |  |
| longitude | [longitude](DataTypes.md#dataType_Longitude) |  |  |

##### Example

` au = ScenEdit_GetUnit({name='B-1B Lancer', guid='0SOLWP-0HMB9OFB9A66F'})`  
`print(au.course)`  
`{ [1] = { latitude = 38.477990037757, longitude = -130.951197534651 },`  
`[2] = { latitude = 36.3838438349146, longitude = -133.491860024409} } `

------------------------------------------------------------------------

<a name="table_LoadoutInfo"></a>

### Loadout_Info

Information on a loadout to add/alter

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| UnitName | string | The name/GUID of the unit to change the loadout on |  |
| LoadoutID | number | The ID of the new loadout; 0 = use the current loadout |  |
| TimeToReady_Minutes | number | How many minutes until the loadout is ready (default = database loadout time) | (_optional_) |
| IgnoreMagazines | boolean | If the new loadout should rely on the magazines having the right weapons ready (default =<br>false) | (_optional_) |
| ExcludeOptionalWeapons | boolean | Exclude optional weapons from loadout (default = false) | (_optional_) |
| Wpn_DBID | number | Weapon DB number - required if WPN_GUID is not supplied |  |
| Wpn_GUID | string | Actual weapon to update - DBID is not required as this take precedence | (_optional_) |
| Number | number | Number to change current weapon load by (sign ignored) |  |
| Remove | boolean | Deduct 'number' rather than add |  |

------------------------------------------------------------------------

<a name="table_Loadout_QuickTurnaround"></a>

### Loadout_QuickTurnaround

QuickTurnaround details on a loadout

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| state | boolean | is quick turnaround active for loadout |  |
| maxsorties | number | Maximum number of sorties when in quick turnaround mode |  |
| readytime | number | Time (minutes) to ready loadout in quick turnaround mode |  |
| extratime | number | Additional Penalty time (minutes) to ready loadout in quick turnaround mode |  |
| airborne | number | Airborne time (minutes) while in quick turnaround mode |  |
| tod | [tod](DataTypes.md#dataType_LoadoutTimeOfDay) | Time of day supported while in quick turnaround mode |  |

------------------------------------------------------------------------

<a name="table_Unit_QuickTurnaround"></a>

### Quick Turnaround (unit)

QuickTurnaround details for the aircraft

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| state | boolean | is quick turnaround enabled for the aircraft |  |
| sorties | number | The number of sorties the aircraft has flown in quick turnaround mode |  |
| totalsorties | number | The total number of sorties the aircraft has flown in quick turnaround mode |  |
| extratime | number | The Penalty time (minutes) to apply to the aircraft on reaching quick turnaround |  |
| airborne | number | Total Airborne time (seconds) while in quick turnaround mode |  |
| avgsortietime | number | Average sortie time while in quick turnaround mode |  |
| reset | Either True/False | When setting unit quick turnaround, adding this parameter will reset the above numbers as if just starting in quick turnaround mode. The value does not matter. |  |

------------------------------------------------------------------------

<a name="table_Loadout_AdditionalData"></a>

### Loadout_AdditionalData

Additional details specific to the loadout

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| readytime | number | Time (minutes) to ready loadout in normal mode |  |
| readytime_sustained | number | Time (minutes) to ready loadout in sustained mode |  |

------------------------------------------------------------------------

<a name="table_Magazine"></a>

### Magazine

Magazine.

**Note:** When dealing with a magazine in a unit, it may constist of one or more actual magazine 'blocks'. This is what is being referred to here, rather than the ONE magazine group for the unit/group.  
A magazine on a mount as distint from a normal mgazine of multiple weapons does not have a mag_dbid value (=0).

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| mag_capacity | string | Capacity\|Storage |  |
| mag_dbid | string | Database ID |  |
| mag_guid | string | GUID |  |
| mag_name | string | Name |  |
| mag_weapons | [WeaponLoaded](#table_WeaponLoaded) | Table of weapon loads in magazine |  |

##### Example

` local u = ScenEdit_GetUnit({name='LST 4001 Osumi', guid='8269b881-20ce-4f2e-baa0-6823e46d55a4'})`  
`print( "Unit Magazines " .. "\r\n")`  
`for k,v in pairs(u.magazines) do`  
`local s = ''`  
`s = s .. k .. " - " .. v.mag_name .. " with capacity of " .. v.mag_capacity .. ' units\r\n'`  
`s = s .. "\t[ containing " .. #v.mag_weapons .. " weapon(s)]\r\n"`  
`for k,v in pairs(v.mag_weapons) do`  
`s = s .. "\t\t" .. v.wpn_name .. " with load " .. v.wpn_current .. " of " .. v.wpn_default .. '\r\n'`  
`end`  
`print(s)`  
`end`  
  

Unit Magazines  
  
1 - 12.7mm/50 MGwith capacity of 200 units  
\[ containing 1 weapon(s)\]  
12.7mm/50 MG Burst \[10 rnds\] with load 180 of 200  
  
2 - 20mm/85 Mk15 Phalanx Blk 1with capacity of 20 units  
\[ containing 1 weapon(s)\]  
20mm/85 Mk15 Phalanx Blk 1 Burst \[300 rnds\] with load 20 of 20  
  
3 - Helicopter Magazinewith capacity of 10000 units  
\[ containing 2 weapon(s)\]  
AGM-114M Hellfire II with load 24 of 24  
Mk46 NEARTIP Mod 5 with load 40 of 40  
  
4 - Mk36 SRBOCwith capacity of 80 units  
\[ containing 2 weapon(s)\]  
Mk182 SRBOC Chaff \[Seduction\] with load 2 of 64  
Mk186 TORCH Flare \[Seduction\] with load 2 of 16  

Compare the above example to the example in the wrapper [Magazine](Wrappers.md#wrapper_Magazine).  

------------------------------------------------------------------------

<a name="table_MineClearMission"></a>

### MineClearMission

MineClearMission options; these are updated by ScenEdit_SetMission()

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| OneThirdRule | boolean |  |  |
| LoopType | string | Values of ContinousLoop(0) or SingleLoop(1) |  |
| TransitThrottleAircraft | string |  |  |
| TransitAltitudeAircraft | string |  |  |
| TransitTerrainFollowingAircraft | boolean |  |  |
| TransitAltitudePreset | string |  |  |
| UseTransitAltitudePreset | True/False |  |  |
| StationThrottleAircraft | string |  |  |
| StationAltitudeAircraft | string |  |  |
| StationTerrainFollowingAircraft | boolean |  |  |
| StationAltitudePreset | string |  |  |
| UseStationAltitudePreset | True/False |  |  |
| TransitThrottleSubmarine | string |  |  |
| TransitDepthSubmarine | string |  |  |
| TransitDepthSubmarinePreset | string |  |  |
| UseTransitDepthSubmarine | True/False |  |  |
| StationThrottleSubmarine | string |  |  |
| StationDepthSubmarine | string |  |  |
| StationDepthSubmarinePreset | string |  |  |
| UseStationDepthSubmarine | True/False |  |  |
| TransitThrottleShip | string |  |  |
| StationThrottleShip | string |  |  |
| FlightSize | [Size](#Size) |  |  |
| MinAircraftReq | string |  |  |
| UseFlightSize | boolean |  |  |
| GroupSize | [Size](#Size) |  |  |
| UseGroupSize | boolean |  |  |
| Zone | name or<br>GUID<br>Table of reference point names and/or GUIDs |  |  |

------------------------------------------------------------------------

<a name="table_MineMission"></a>

### MineMission

MineMission. .. options; these are updated by ScenEdit_SetMission()

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| OneThirdRule | boolean |  |  |
| TransitThrottleAircraft | string |  |  |
| TransitAltitudeAircraft | string |  |  |
| TransitTerrainFollowingAircraft | boolean |  |  |
| TransitAltitudePreset | string |  |  |
| UseTransitAltitudePreset | True/False |  |  |
| StationThrottleAircraft | string |  |  |
| StationAltitudeAircraft | string |  |  |
| StationTerrainFollowingAircraft | boolean |  |  |
| StationAltitudePreset | string |  |  |
| UseStationAltitudePreset | True/False |  |  |
| TransitThrottleSubmarine | string |  |  |
| TransitDepthSubmarine | string |  |  |
| TransitDepthSubmarinePreset | string |  |  |
| UseTransitDepthSubmarinePreset | True/False |  |  |
| StationThrottleSubmarine | string |  |  |
| StationDepthSubmarine | string |  |  |
| StationDepthSubmarinePreset | string |  |  |
| UseStationDepthSubmarinePreset | True/False |  |  |
| TransitThrottleShip | string |  |  |
| StationThrottleShip | string |  |  |
| FlightSize | [Size](#Size) |  |  |
| Minaircraftreq | string |  |  |
| UseFlightSize | boolean |  |  |
| GroupSize | [Size](#Size) |  |  |
| UseGroupSize | boolean |  |  |
| Zone | table | Table of reference point names and/or GUIDs |  |
| Armingdelay | time | In format of 'days:hours:minutes:seconds' e.g. 1 day, 4 hours, 30 minutes would be<br>'1:4:30:0' |  |
| MinesLaidInSet | number | Mines can be laid in a group/set of 'number' of mines, example lay mines in groups of 10.<br>Default is all. |  |
| MinesLaidInterval | number | Interval in meters between mines. Default is normal safe distance. |  |
| MinesLaidSetInterval | number | Interval in meters between groups of mines. Default is none. |  |
| MinesLaidMethod | number | How mines are deployed, in a line (0) or randomly (1). Default is random. |  |

------------------------------------------------------------------------

<a name="table_Mount"></a>

### Mount

A mount is similar to a magazine, but it refers to the actual `loads` on the `weapon`, rather than a storage area.

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| mount_dbid | string | Database ID |  |
| mount_GUID | string | GUID |  |
| mount_name | string | Name |  |
| mount_status | string | Status |  |
| mount_statusR | string | Reason why inoperative [if not operational] |  |
| mount_damage | string | Damage Severity [if not operational] |  |
| mount_weapons | [WeaponLoaded](#table_WeaponLoaded) | Table of weapon loads on mount |  |

##### Example

` local u = ScenEdit_GetUnit({name='LST 4001 Osumi', guid='8269b881-20ce-4f2e-baa0-6823e46d55a4'})`  
`print( "Unit Mounts " )`  
`for k,v in pairs(u.mounts) do`  
`local s = ''`  
`s = s .. k .. " - " .. v.mount_name .. " [ " .. v.mount_status .. ' ]\r\n'`  
`s = s .. "\t[ containing " .. #v.mount_weapons .. " weapon(s) ]\r\n"`  
`for k,v in pairs(v.mount_weapons) do`  
`s = s .. "\t\t" .. v.wpn_name .. " with load " .. v.wpn_current .. " of " .. v.wpn_default .. '\r\n'`  
`end`  
`print(s)`  
`end`  
  

Unit Mounts  
1 - 12.7mm/50 MG \[ Operational \]  
\[ containing 1 weapon(s) \]  
12.7mm/50 MG Burst \[10 rnds\] with load 10 of 10  
  
2 - 12.7mm/50 MG \[ Operational \]  
\[ containing 1 weapon(s) \]  
12.7mm/50 MG Burst \[10 rnds\] with load 10 of 10  
  
3 - 20mm/85 Mk15 Phalanx Blk 1 CIWS \[ Operational \]  
\[ containing 1 weapon(s) \]  
20mm/85 Mk15 Phalanx Blk 1 Burst \[300 rnds\] with load 5 of 5  
  
4 - 20mm/85 Mk15 Phalanx Blk 1 CIWS \[ Operational \]  
\[ containing 1 weapon(s) \]  
20mm/85 Mk15 Phalanx Blk 1 Burst \[300 rnds\] with load 5 of 5  
  
5 - Mk36 SRBOC \[ Operational \]  
\[ containing 2 weapon(s) \]  
Mk182 SRBOC Chaff \[Seduction\] with load 4 of 4  
Mk186 TORCH Flare \[Seduction\] with load 2 of 2  
  
6 - Mk36 SRBOC \[ Operational \]  
\[ containing 2 weapon(s) \]  
Mk182 SRBOC Chaff \[Seduction\] with load 4 of 4  
Mk186 TORCH Flare \[Seduction\] with load 2 of 2  
  
7 - Mk36 SRBOC \[ Operational \]  
\[ containing 2 weapon(s) \]  
Mk182 SRBOC Chaff \[Seduction\] with load 4 of 4  
Mk186 TORCH Flare \[Seduction\] with load 2 of 2  
  
8 - Mk36 SRBOC \[ Operational \]  
\[ containing 2 weapon(s) \]  
Mk182 SRBOC Chaff \[Seduction\] with load 4 of 4  
Mk186 TORCH Flare \[Seduction\] with load 2 of 2  

Compare the above example to the example in thw wrapper [Mount](Wrappers.md#wrapper_Mount).  

------------------------------------------------------------------------

<a name="table_PatrolMission"></a>

### PatrolMission

PatrolMission options; these are updated by ScenEdit_SetMission()

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| subtype | string | Subtype of mission (ASW = 'asw', ASuW_Naval = 'naval', AAW = 'aaw', ASuW_Land = 'land',<br>ASuW_Mixed =<br>'mixed', SEAD = 'sead', SeaControl = 'sea') |  |
| OneThirdRule | boolean | True if activated |  |
| OnStation | number | Number of units to be on station |  |
| StationGroupingType | number | ByLoadout = 0; ByUnitClass = 1; NoGrouping = 2 |  |
| LoopType | string | Movement style: Random within area (0), Repeatable loop (1), ChainsawLoop (2) |  |
| CheckOPA | boolean | True if can investigate outside zones |  |
| CheckWWR | boolean | True if can investigate within weapon range |  |
| ActiveEMCON | boolean | True if active EMCON in patrol zone |  |
| TransitThrottleAircraft | string |  |  |
| TransitAltitudeAircraft | string |  |  |
| TransitTerrainFollowingAircraft | boolean | True if terrain following |  |
| TransitAltitudePreset | string |  |  |
| UseTransitAltitudePreset | True/False |  |  |
| StationThrottleAircraft | string |  |  |
| StationAltitudeAircraft | string |  |  |
| StationTerrainFollowingAircraft | boolean | True if terrain following |  |
| StationAltitudePreset | string |  |  |
| UseStationAltitudePreset | True/False |  |  |
| AttackThrottleAircraft | string |  |  |
| AttackAltitudeAircraft | string |  |  |
| AttackTerrainFollowingAircraft | boolean | True if terrain following |  |
| AttackAltitudePreset | string |  |  |
| UseAttackAltitudePreset | True/False |  |  |
| AttackDistanceAircraft | string |  |  |
| TransitThrottleSubmarine | string |  |  |
| TransitDepthSubmarine | string |  |  |
| TransitDepthSubmarinePreset | string |  |  |
| UseTransitDepthSubmarinePreset | True/False |  |  |
| StationThrottleSubmarine | string |  |  |
| StationDepthSubmarine | string |  |  |
| StationDepthSubmarinePreset | string |  |  |
| UseStationDepthSubmarinePreset | True/False |  |  |
| AttackThrottleSubmarine | string |  |  |
| AttackDepthSubmarine | string |  |  |
| AttackDepthSubmarinePreset | string |  |  |
| UseAttackDepthSubmarinePreset | True/False |  |  |
| AttackDistanceSubmarine | string |  |  |
| TransitThrottleShip | string |  |  |
| StationThrottleShip | string |  |  |
| AttackThrottleShip | string |  |  |
| AttackDistanceShip | string |  |  |
| FlightSize | [Size](#Size) | Aircraft group size |  |
| MinAircraftReq | string |  |  |
| UseFlightSize | boolean | True if min size required |  |
| GroupSize | [Size](#Size) | Ship/Submarine group size |  |
| UseGroupSize | boolean | True if min size required |  |
| ProsecutionZone | name or<br>GUID | Table of reference point names and/or GUIDs |  |
| PatrolZone | name or<br>GUID | Table of reference point names and/or GUIDs |  |
| FlightsToInvestigate | string |  |  |
| FlightsToEngage | string |  |  |
| WingmanEngageDistance | string |  |  |
| BoatsToInvestigate | string |  |  |
| BoatsToEngage | string |  |  |
| GroupMemberEngageDistance | string |  |  |

------------------------------------------------------------------------

<a name="table_ReferencePoint"></a>

### ReferencePoint

Reference point information.  
This data should reflect the corresponding wrapper. In several places, a table is used rather than references to the actual RP wrapper.

| Field | Type | Description | Comments |
|---|---|---|---|
| bearingtype | bearingTypefixed = 0<br>rotating = 1 | Type of bearing to 'relativeto' unit | no value if no 'relativeto' unit |
| color | string | The HTML color code expressed as a number - convert to hex to check against a HTML color<br>chart |  |
| guid | string | The unique identifier for the reference point |  |
| highlighted | True/False | True if the point should be selected |  |
| latitude | [Latitude](DataTypes.md#dataType_Latitude) | The latitude of the reference point |  |
| locked | True/False | True if the point is locked |  |
| longitude | [Longitude](DataTypes.md#dataType_Longitude) | The longitude of the reference point |  |
| name | string | The name of the reference point |  |
| relativeDistance | number | Relative distance of RP to 'relativeto' unit | no value if no 'relativeto' unit |
| relativeBearing | number | Relative bearing ( 0 - 360) of RP to 'relativeto' unit | no value if no 'relativeto' unit |
| relativeto | [Unit](#wrapper_Unit) | The unit that the reference point is relative to |  |
| side | string | The side the reference point is visible to |  |

------------------------------------------------------------------------

<a name="table_Sensor"></a>

### Sensor

Sensor.

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| sensor_dbid | number | Database ID |  |
| sensor_guid | string | GUID |  |
| sensor_name | string | Name |  |
| sensor_maxrange | number | Maximum range |  |
| sensor_isactive | True/False | Active? |  |
| sensor_status | string | Status |  |
| sensor_role | [SensorRole](DataTypes.md#dataType_Sensor) | Sensor role |  |
| sensor_type | [SensorType](DataTypes.md#dataType_Sensor) | Sensor type |  |

##### Example

` local u = ScenEdit_GetUnit({name='LST 4001 Osumi', guid='8269b881-20ce-4f2e-baa0-6823e46d55a4'})`  
`print( "Unit Sensor " )`  
`for k,v in pairs(u.sensors) do`  
`local s = ''`  
`s = s .. k .. " - " .. v.sensor_name .. " [ " .. v.sensor_status .. ' ] Max Range: ' .. v.sensor_maxrange .. '\r\n'`  
`s = s .. "\t[ Active: " .. string.format('%s',v.sensor_isactive) .. " , type: " .. v.sensor_type .. " role: " .. v.sensor_role .. "]\r\n"`  
`print(s)`  
`end`  
  

Unit Sensor  
1 - J/OPS-14C \[ Operational \] Max Range: 120.0  
\[ Active: false , type: 2001 role: 2003\]  
  
2 - J/OPS-18A \[ Operational \] Max Range: 40.0  
\[ Active: false , type: 2001 role: 2023\]  
  
3 - J/OPS-20 \[ Operational \] Max Range: 25.0  
\[ Active: false , type: 2001 role: 2028\]  
  
4 - J/OPS-28C \[ Operational \] Max Range: 110.0  
\[ Active: false , type: 2001 role: 2103\]  
  
5 - Mk1 Eyeball \[ Operational \] Max Range: 50.0  
\[ Active: false , type: 2003 role: 2016\]  
  
6 - AN/VPS-2 Search/Track \[Mk16 CWIS\] \[ Operational \] Max Range: 2.7000000476837  
\[ Active: false , type: 2001 role: 2133\]  
  
7 - AN/VPS-2 Search/Track \[Mk16 CWIS\] \[ Operational \] Max Range: 2.7000000476837  
\[ Active: false , type: 2001 role: 2133\]

local unit = SE_GetUnit({name='DDG 104 Sterett \[Arleigh Burke Flight IIA\]', guid='WT2BOY-0HN5INRGCHL31'})  
for \_,s in ipairs(unit.sensors) do  
if string.find(s.sensor_name, 'SPY') then  
print(s.sensor_name..' - Active: '..tostring(s.sensor_isactive))  
if s.sensor_isactive == false then unit.sensors = {sensor_guid = s.sensor_guid, sensor_isactive = true } end  
end  
end  

------------------------------------------------------------------------

<a name="table_Signature"></a>

### Signature

Signature profile by various detection methods

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| loadout | number | Loadout ID from database. Only applicable if unit is aircraft |  |
| ... | { type, typeN, text, rcs, sqm } | Profile for each sonsor category |  |

Sonsor category profile

| type | string | Sensor category as text |
|---|---|---|
| typeN | number | Sensor category as number |
| text | { front, side, rear } | Profile as text similar to the internal DB viewer |
| rcs | { front, side, rear } | The raw profile values |
| sqm | { front, side, rear } | Square metre values |

##### Example

` `

{  
loadout = 19867  
\[2\] = { text = { rear = '3.56 nm', front = '3.56 nm', side = '7.94 nm' }, rcs = { rear = 3.56, front = 3.56, side = 7.94 }, typeN = 3001, type = 'Visual_Detect' },  
\[3\] = { text = { rear = '3.26 nm', front = '1.90 nm', side = '4.30 nm' }, rcs = { rear = 3.26, front = 1.9, side = 4.3 }, typeN = 3002, type = 'Visual_ID' },  
\[4\] = { text = { rear = '11.94 nm', front = '3.56 nm', side = '8.00 nm' }, rcs = { rear = 11.9425, front = 3.56, side = 7.9985 }, typeN = 4001, type = 'IR_Detect' },  
\[5\] = { text = { rear = '1.90 nm', front = '1.90 nm', side = '4.30 nm' }, rcs = { rear = 1.9, front = 1.9, side = 4.3 }, typeN = 4002, type = 'IR_ID' },  
\[6\] = { text = { rear = '9.04 dBsm, 8.0 sq.m.', front = '9.04 dBsm, 8.0 sq.m.', side = '11.15 dBsm, 13.0 sq.m.' }, typeN = 5001, rcs = { rear = 9.03988, front = 9.03988, side = 11.14721 }, sqm = { rear = 8.016566, front = 8.016566, side = 13.023313 }, type = 'Radar_A_D' },  
\[7\] = { text = { rear = '9.04 dBsm, 8.0 sq.m.', front = '9.04 dBsm, 8.0 sq.m.', side = '11.15 dBsm, 13.0 sq.m.' }, typeN = 5002, rcs = { rear = 9.03988, front = 9.03988, side = 11.14721 }, sqm = { rear = 8.016566, front = 8.016566, side = 13.023313 }, type = 'Radar_E_M' },  
}  

------------------------------------------------------------------------

<a name="table_StrikeMission"></a>

### StrikeMission

StrikeMission options; these are updated by ScenEdit_SetMission(). Note that these are split between the escorts and strikers

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| subtype | string | Subtype of mission (Air_Intercept = 'air', Land_Strike = 'land', Maritime_Strike = 'sea',<br>Sub_Strike =<br>'sub') |  |
| EscortFlightSizeShooter | [Size](#Size) |  |  |
| EscortMinShooter | number |  |  |
| EscortMaxShooter | number |  |  |
| EscortResponseRadius | number |  |  |
| EscortUseFlightSize | boolean | True if minimum size required |  |
| EscortFlightSizeNonshooter | [Size](#Size) |  |  |
| EscortMinNonshooter | number |  |  |
| EscortMaxNonshooter | number |  |  |
| EscortGroupSize | [Size](#Size) |  |  |
| EscortUseGroupSize | boolean | True if minimum size required |  |
| StrikeOneTimeOnly | boolean | True if activated |  |
| StrikeMinimumTrigger | string | Minimun stance of contact to trigger the mission |  |
| StrikeMax | number | Max number of flights allowed |  |
| StrikeFlightSize | [Size](#Size) |  |  |
| StrikeMinAircraftReq | number |  |  |
| StrikeUseFlightSize | boolean | True if minimum size required |  |
| StrikeGroupSize | [Size](#Size) |  |  |
| StrikeUseGroupSize | boolean | True if minimum size required |  |
| StrikeAutoPlanner | boolean | True if activated |  |
| StrikePreplan | boolean | True if pre-planned target list only |  |
| StrikeRadarUsage | number | Radar usage |  |
| StrikeMinDistAircraft | number | Strike minimum distance |  |
| StrikeMaxDistAircraft | number | Strike maximum distance |  |
| StrikeMinDistShip | number | Strike minimum distance |  |
| StrikeMaxDistShip | number | Strike maximum distance |  |
| StrikeMax | string |  |  |
| WingmanEngageDistance | string |  |  |
| BoatsToInvestigate | string |  |  |
| BoatsToEngage | string |  |  |
| GroupMemberEngageDistance | string |  |  |
| PrePlannedOnly | boolean | True , mission will RTB upon target being destroyed (same as StrikePreplan) |  |
| FocusOnStrike | boolean | True, focus entirely on striking targets |  |

------------------------------------------------------------------------

<a name="table_SupportMission"></a>

### SupportMission

SupportMission options; these are updated by ScenEdit_SetMission()

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| OneThirdRule | boolean |  |  |
| OnStation | number | Number of units to be on station |  |
| StationGroupingType | number | ByLoadout = 0; ByUnitClass = 1; NoGrouping = 2 |  |
| LoopType | string | Navigation type: Continous loop (0) or Single loop (1) |  |
| OneTimeOnly | boolean |  |  |
| ActiveEMCON | boolean | Active EMCON only on the mission track |  |
| TransitThrottleAircraft | string |  |  |
| TransitAltitudeAircraft | string |  |  |
| TransitTerrainFollowingAircraft | boolean |  |  |
| TransitAltitudePreset | string |  |  |
| UseTransitAltitudePreset | True/False |  |  |
| StationThrottleAircraft | string |  |  |
| StationAltitudeAircraft | string |  |  |
| StationTerrainFollowingAircraft | boolean |  |  |
| StationAltitudePreset | string |  |  |
| UseStationAltitudePreset | True/False |  |  |
| TransitThrottleSubmarine | string |  |  |
| TransitDepthSubmarine | string |  |  |
| TransitDepthSubmarinePreset | string |  |  |
| UseTransitDepthSubmarinePreset | True/False |  |  |
| StationThrottleSubmarine | string |  |  |
| StationDepthSubmarine | string |  |  |
| StationDepthSubmarinePreset | string |  |  |
| UseStationDepthSubmarinePreset | True/False |  |  |
| TransitThrottleShip | string |  |  |
| StationThrottleShip | string |  |  |
| FlightSize | [Size](#Size) | Aircraft group size |  |
| MinAircraftReq | string |  |  |
| UseFlightSize | True/False |  |  |
| GroupSize | [Size](#Size) | Ship/Submarine group size |  |
| UseGroupSize | boolean |  |  |
| Zone | name or<br>GUID | Table of reference point names and/or GUIDs |  |
| TankerOneTime | boolean |  |  |
| TankerMaxReceivers | string |  |  |

------------------------------------------------------------------------

<a name="table_UnitList"></a>

### UnitList

List of unit or contact guids.

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| guid | string | The GUID of the unit. |  |
| name | string | The name of the unit. |  |

------------------------------------------------------------------------

<a name="table_TargetPriority"></a>

### Doctrine Target Priority

Target priority list format for the Doctrine wrapper.

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| unit_type | [Unit Type](DataTypes.md#dataType_Unit__Types) | The general unit type. Only the default priority entry may have unit type 0 (any unit type.) |  |
| unit_subtype | number | The unit subtype, based off unit type. 0 = any sub-type.<br>[Aircraft subtype](DataTypes.md#dataType_Unit_Aircraft)<br>[Ship<br>subtype](DataTypes.md#dataType_Unit_Ship)<br>[Submarine<br>subtype](DataTypes.md#dataType_Unit_Submarine)<br>[Fixed facility<br>category](DataTypes.md#dataType_Unit_Facility)<br>[Ground/Mobile facility<br>category](DataTypes.md#dataType_Unit_Facility)<br>[Weapon<br>type](DataTypes.md#dataType_WeaponType) |  |
| isfixedfacilitysubtype | True/False | For facility unit_type only, TRUE indicates that unit_subtype is a fixed facility category.<br>Otherwise unit_subtype is a Mobile unit category. |  |
| dbid | number | The database ID of the specific unit class. 0 = any class. |  |
| priority | number | 0 = delayed, 1 = default, 2 = immediate |  |

------------------------------------------------------------------------

<a name="table_WRA"></a>

### WRA

WRA (Weapon Release Authority) settings

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| weapon_dbid | string | Weapon DB number |  |
| weapon_name | string | Weapon name |  |
| qty_salvo | string | Weapons per salvo ('Max','None' or a number) |  |
| shooter_salvo | string | Shooters per salvo ('Max','None' or a number) |  |
| firing_range | string | Firing range ('Max','None' or a number) |  |
| self_defence | string | Self-defence range ('Max','None' or a number) |  |

**Note:** The absence of a field implies that it is **not** used or being changed.

------------------------------------------------------------------------

<a name="table_WeaponLoaded"></a>

### WeaponLoaded

Weapon loads on mount, in magazine or in loadout.

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| wpn_guid | string | GUID |  |
| wpn_current | number | Current loads available |  |
| wpn_maxcap | number | Maximum loads |  |
| wpn_default | number | Default loads (to fill out) |  |
| wpn_name | string | Weapon name |  |
| wpn_dbid | number | Database ID of weapon |  |
| wpn_type | [WeaponType](DataTypes.md#dataType_WeaponType) | Type of weapon |  |

------------------------------------------------------------------------

<a name="table_Weather"></a>

### Weather

Weather conditions.

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| temp | number | Temperature (average for GetWeather(), or time-of-day for unit/contact) |  |
| rainfall | number | Rainfall rate |  |
| undercloud | number | Fraction under cloud |  |
| seastate | number | Sea state |  |
