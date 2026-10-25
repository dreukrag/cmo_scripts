- [Cargo](#wrapper_Cargo)
- [Contact](#wrapper_Contact)
- [Doctrine](#wrapper_Doctrine)
- [DoctrineWRA](#wrapper_DoctrineWRA)
- [Event](#wrapper_Event)
- [Flight](#wrapper_Flight)
- [Group](#wrapper_Group)
- [Loadout](#wrapper_Loadout)
- [Magazine](#wrapper_Magazine)
- [Mission](#wrapper_Mission)
- [Mount Device](#wrapper_Mount)
- [Operation](#wrapper_Operation)
- [ReferencePoint](#wrapper_ReferencePoint)
- [Scenario](#wrapper_Scenario)
- [Sensor Device](#wrapper_Sensor)
- [Serial](#wrapper_Serial)
- [Side](#wrapper_Side)
- [SpecialAction](#wrapper_SpecialAction)
- [Unit](#wrapper_Unit)
- [Waypoint](#wrapper_WayPoint)
- [Weapon Device](#wrapper_Weapon)
- [Zone](#wrapper_Zone)

------------------------------------------------------------------------

<a name="wrapper_Cargo"></a>

### Cargo

The cargo information being held in a unit.

| Field | Type | Description | Comments |
|---|---|---|---|
| guid | string |  | [READ ONLY] |
| type | [CargoObjectType](DataTypes.md#dataType_CargoObjectType) | The type of cargo object | [READ ONLY] |
| storageType | [CargoStorageType](DataTypes.md#dataType_CargoStorageType) | The type of cargo storage | [READ ONLY] |
| dbid | number | The DBID of the cargo | [READ ONLY] |
| name | number | The name of the cargo | [READ ONLY] |
| requiredSize | [CargoType](DataTypes.md#dataType_CargoType) | The size | [READ ONLY] |
| requiredMass | number | The mass metric tons | [READ ONLY] |
| requiredArea | number | The area sq m | [READ ONLY] |
| requiredPAX | number | The PAX (Crew Space) | [READ ONLY] |
| requiredAreaAsStored | number | The area | [READ ONLY] |
| requiredPAXAsStored | number | The PAX | [READ ONLY] |
| isParadropCapable | True/False | Can be dropped by parachute | [READ ONLY] |
| unit | [Unit](#wrapper_Unit) | The unit holding cargo | [READ ONLY] |
| containerCargo | { name, Type, dbid, guid, area,pax,mass,<br>[contentType,<br>[fuelType, fuelQuantity,]<br>[weaponDBID, weaponQuantity]] } | Table of items held as cargo inside container | [READ ONLY] |
| createContainerContentCustom | method(name, size, mass, area, volume) |  | Returns [{ cargo }](#wrapper_Cargo) |
| createContainerContentFuel | method(fuelType, fuelLiters) |  | Returns [{ cargo }](#wrapper_Cargo) |
| createContainerContentAmmunition | method(weaponDBID, quantity) |  | Returns [{ cargo }](#wrapper_Cargo) |
| deleteContainerContents | method(contentGuid) |  | Returns True if successful |

  

------------------------------------------------------------------------

<a name="wrapper_Contact"></a>

### Contact

This is from the perspective of the side being looked at. What is a contact for one side, may not be the same contact on another side.  
Note also the GUID of the contact is not the same as the actual unit. So depending on what functions you call, you may need to 'convert' the contact 'GUID' into the actual 'GUID' and call [ScenEdit_GetUnit()](Function_ScenEdit_GetUnit.md) to process the actual GUID.

| Field | Type | Description | Comments |
|---|---|---|---|
| actualunitdbid | number | The Actual unit DB id based on detection classification, else 0 | [READ ONLY] |
| actualunitid | string | The actual unit GUID of this contact, else "" | [READ ONLY] |
| age | number | The number of seconds this contact has been detected for | [READ ONLY] |
| altitude | number | The current Altitude of this contact if known, else nil | [READ ONLY] |
| areaofuncertainty | [{ LatLon, ... }](Tables.md#table_LatLon) | Table of LatLon points defining the area of contact | [READ ONLY] |
| BDA | { FIRES, FLOOD, STRUCTURAL } | Battle Damage Assessment on this contact, else nil | [READ ONLY] |
| classificationlevel | [ContactIdStatus](DataTypes.md#dataType_ContactIdStatus) | The Level of classification on this contact | [READ ONLY] |
| detectedBySide | [Side](#wrapper_Side) | The side who actually detected this contact (instead of having it shared by someone else) | [READ ONLY] |
| detectionBy | { Visual, Infrared, Radar,<br>ESM, SonarActive, SonarPassive } | How long ago was this contact detected by these sensor types | [READ ONLY]<br>Not all sensor types need to be present |
| emissions | [{ Emissions, ... }](Tables.md#table_Emissions) | Table of detected emmissions from this contact, else nil if no detected emissions | [READ ONLY] |
| FilterOut | True/False | Is this contact filtered out? |  |
| firedOn | { string, ... } | Table of unit guids that are firing on this contact, else nil if none | [READ ONLY]<br>(Note that the starting idex of this table is '0' rather than<br>'1' as normal Lua tables) |
| firingAt | { string, ... } | Table of contact guids that this contact is firing at, else nil if none | [READ ONLY]<br>(Note that the starting idex of this table is '0' rather than<br>'1' as normal Lua tables) |
| fromside | [Side](#wrapper_Side) | The side who 'owns' this contact, else nil | [READ ONLY] |
| guid | string | This contact identifying GUID | [READ ONLY] |
| heading | number | This contact's Heading if known, else nil | [READ ONLY] |
| lastDetections | [{ LastDetections, ... }](Tables.md#table_LastDetections) | Table of recent detections on this contact, else nil if none | [READ ONLY] |
| latitude | [Latitude](DataTypes.md#dataType_Latitude) | The suspected latitude of this contact | [READ ONLY] |
| longitude | [Longitude](DataTypes.md#dataType_Longitude) | The suspected longitude of this contact | [READ ONLY] |
| markedAsDecoy | True/False | Marked as a decoy contact for 'fromside' |  |
| missile_defence | number | Applicable to Facility and Ships. If the classification level is 'known class' or higher, show Missile<br>Defence from database, else -1 for unknown contact | [READ ONLY] |
| name | string | This contact name |  |
| observer | [Side](#wrapper_Side) | The contact's original detecting side or nil if it is the same as requesting side<br>This tells if the<br>contact was shared from another side | [READ ONLY] |
| observer_posture | [Stance(letter)](DataTypes.md#dataType_Stance) | The Posture from the perspective of the original detector of this contact |  |
| posture | [Stance(letter)](DataTypes.md#dataType_Stance) | The Posture from the perspective of the owner of this contact |  |
| potentialmatches | [{ EMmatch, ... }](Tables.md#table_EMmatch) | Table of potential EMCON emission matches for this contact | [READ ONLY] |
| side | [Side](#wrapper_Side) | This Contact actual side if known, else nil | [READ ONLY] |
| speed | number | This Contact Speed if known, else nil | [READ ONLY] |
| targetedBy | { string, ... } | Table of unit guids that have this contact as a target but necessarily firing on it, else nil if none | [READ ONLY]<br>(Note that the starting idex of this table is '0' rather than<br>'1' as normal Lua tables) |
| type | [ContactType](DataTypes.md#dataType_ContactType) | This Contact type string | [READ ONLY] |
| type_description | string | This Contact description based on detection classification | [READ ONLY] |
| typed | number | The [ContactType](DataTypes.md#dataType_ContactType) of this<br>contact as a number | [READ ONLY] |
| weather | [{ Weather }](Tables.md#table_Weather) | Table of weather parameters at this Contact location, else nil | [READ ONLY] |
| DropContact | method() | Drops this contact from the perspective side (who is looking at this contact) |  |
| inArea | method([{ area<br>}](Tables.md#table_Area)) | Is this contact in the 'area' defined by a table of RPs | Returns True if in the area |

  

#### [Examples](Examples.md#Example_Wrapper_Contact)

------------------------------------------------------------------------

<a name="wrapper_Doctrine"></a>

### Doctrine

Doctrine options. These are used by the Set/Get_Doctrine commands currently.  
Generally, the 'doctrine' object returned by the functions will only show the items that are not set to 'inherit'.  
The 'side' doctrine will return all items as that is the top level parent and is not inherited.

For each field, adding the suffix "\_player_editable" determines if the player can alter the setting. Not applicable to the Withdraw/Deploy options.

When there is a string(number) option, the indicated string or it's number can be used.

  

| Field | Type | Description | Comments |  |
|---|---|---|---|---|
| aaw_guidance | valueAlways Continue Guidance = 0<br>Drop Guidance = 1 | 'drop guidance' -> the firing platform will drop guidance when it becomes impossible for the guided missile to intercept the target. | This can allow a following weapon to make the intercept, or the firing platform to fire another shot, as it frees up the guidance system. |  |
| aaw_rearward_fire | valueAlways Fire = 0<br>Fire vs Aircraft or Weapons ONLY if interception is between shooter and target = 1<br>Fire vs Aircraft Only if interception is between shoter and target = 2<br>Fire vs Weapons Only if interception is between shoter and target = 3 | 'Rearward' is based on the heading of the target -- if the target is heading away from the firing platform then it is 'to the rear.You can imagine a line perpendicular to the heading of the incoming target -- if the target goes 'behind' this line OR if the intercept point is behind this line, then the firing platform will drop the target | This can apply to aircraft and missile targets or just aircraft or just missiles, depending on the option chosen |  |
| aaw_wra_qty | valueFor All targets WRA is fullfilled Separatelly = 0<br>For Aircraft or Weapons, WRA is fullfilled by ANY guided weapon = 1<br>For Aircraft, WRA is fullfilled by ANY guided weapon = 2<br>For Weapons, WRA is fullfilled by ANY guided weapon = 3 | How many different weapons needs to be fired against Target Aircrafts or Target weapons or both. Fullfilled separately means if two different weapons from two different units can fire at the target, they will fire to allocate the weapon salvo. If the setting is by ANY guided weapon, only one weapon type will be used |  |  |
| air_operations_tempo | valueSurge = 0<br>Sustained = 1 | Tempo of operations | Surge is the normal mode. There may be a 'sustained' turnaround time on some loadouts. |  |
| automatic_evasion | True/False | True if the unit should automatically evade |  |  |
| avoid_contact | valueNo = 0<br>Yes_ExceptSelfDefence = 1<br>Yes_Always = 2 | How should 'detection' be treated |  |  |
| bvr_logic | valueStraightIn = 0<br>Crank = 1<br>Drag = 2 | BVR (Beyond-visual-range) behaviour |  |  |
| deploy_on_attack | valueIgnore = 0<br>Exhausted = 1<br>Percent25 = 2<br>Percent50 = 3<br>Percent75 = 4<br>Percent100 = 5<br>LoadFullWeapons =<br>6 | Level of attacking weapons remaining to allow deployment |  |  |
| deploy_on_damage | valueIgnore = 0<br>Percent5 = 1<br>Percent25 = 2<br>Percent50 = 3<br>Percent75 = 4 | Level of damage remaining to allow deployment |  |  |
| deploy_on_defence | valueIgnore = 0<br>Exhausted = 1<br>Percent25 = 2<br>Percent50 = 3<br>Percent75 = 4<br>Percent100 = 5<br>LoadFullWeapons =<br>6 | Level of defending weapons remaining to allow deployment |  |  |
| deploy_on_fuel | valueIgnore = 0<br>Bingo = 1<br>Percent25 = 2<br>Percent50 = 3<br>Percent75 = 4<br>Percent100 = 5 | Level of fuel remaining to allow deployment |  |  |
| dipping_sonar | valueAutomatically_HoverAnd150ft = 0<br>ManualAndMissionOnly = 1 | Dipping sonar behaviour |  |  |
| dive_on_threat | valueYes = 0<br>Yes_ESM_Only = 1<br>Yes_Ships20nm_Aircraft30nm = 2<br>No = 3 | Should sub dive when threatened |  |  |
| emcon | { radar, sonar, oecm } | The EMCON status (acive [1]/passive [0]) |  |  |
| engage_non_hostile_targets | True/False | True if the unit should attempt hostile action against units that are not hostile |  |  |
| engage_opportunity_targets | True/False | True if the unit should take opportunistic shots |  |  |
| engaging_ambiguous_targets | [AmbiguousTtargets](DataTypes.md#dataType_ROE#BTAT) | How is the ambiguosity of the target treated? Is the target location good enough to shoot at? |  |  |
| fuel_state_planned | [JokerFuelLevel](DataTypes.md#dataType_ROE#FuelLevel) | Planned action when fuel is at ... |  |  |
| fuel_state_rtb | [OnFuelRTB](DataTypes.md#dataType_ROE#RTB_Behaviour) | Action to take when RTB initiated due to fuel |  |  |
| gun_strafing | valueNo = 0<br>Yes =<br>1 | Can gun straffing be used |  |  |
| ignore_emcon_while_under_attack | True/False | True if EMCON should be ignored and all systems should go active when engaged |  |  |
| ignore_plotted_course | True/False | True if the unit should ignore plotted course when attacking/investigating |  |  |
| jettison_ordnance | valueNo = 0<br>Yes =<br>1 | Can ordnance be jettison |  |  |
| kinematic_range_for_torpedoes | valueAutomaticAndManualFire = 0<br>ManualFireOnly = 1<br>No = 2 | Use the maximum range for torpedoes? |  |  |
| maintain_standoff | True/False | True if the unit should try to avoid approaching its target | Only valid for ships, subs and some facilities attacking surface/land targets |  |
| quick_turnaround_for_aircraft | valueYes = 0<br>FightersAndASW = 1<br>No = 2 | Can aircraft be used for 'quick turnaround' | Shorter time between loadout reloads before longer down time |  |
| recharge_on_attack | [BatteryRecharge](DataTypes.md#dataType_ROE#BatteryRecharge) | Level to recharge batteries while engaged |  |  |
| recharge_on_patrol | [BatteryRecharge](DataTypes.md#dataType_ROE#BatteryRecharge) | Level to recharge batteries while on patrol |  |  |
| refuel_unrep_allied | [UNREP Allies](DataTypes.md#dataType_ROE#UNREP) | Can Allied uniits be replenished |  |  |
| rtb_when_winchester | True/False | True if the unit should return to base when out of weapons | Obsolete, see the new doctrine options |  |
| StrikeMemberFocus | value0 = Opportunity Scrambling<br>1 = Focus on mission targets<br>2 = Only engage mission specific targets | Mission focus |  |  |
| TargetPriority | [{ TargetPriority }](Tables.md#table_TargetPriority) | Target priority list | [READ ONLY] |  |
| ThreatMaxDist | number | Maximum range at which an inbound weapon is considered a threat.<br>Missiles beyond this distance are ignored for threat evaluation and defensive reactions |  |  |
| use_aip | valueNo = 0<br>Yes_AttackOnly = 1<br>Yes_Always = 2 | Use AIP (Air-independent propulsion) if present |  |  |
| use_nuclear_weapons | True/False | True if the unit should be able to employ nuclear weapons |  |  |
| use_refuel_unrep | [UNREP](DataTypes.md#dataType_ROE#UNREP) | How is underway replenishment used |  |  |
| use_sams_in_anti_surface_mode | True/False | True if SAMs can be used to engage surface targets |  |  |
| use_wp_missile_in_anti_surface_mode | True/False | True if missile WP are used to engage surface targets |  |  |
| weapon_control_status_air | [WCS](DataTypes.md#dataType_ROE#WCS) | Weapon control for engaging air units |  |  |
| weapon_control_status_land | [WCS](DataTypes.md#dataType_ROE#WCS) | Weapon control for engaging land units |  |  |
| weapon_control_status_subsurface | [WCS](DataTypes.md#dataType_ROE#WCS) | Weapon control for engaging subsurface units |  |  |
| weapon_control_status_surface | [WCS](DataTypes.md#dataType_ROE#WCS) | Weapon control for engaging surface units |  |  |
| weapon_state_planned | [WeaponDoctrine](DataTypes.md#dataType_WeaponDoctrine) | Planned action when weapons are at ... |  |  |
| weapon_state_rtb | [OnWeaponRTB](DataTypes.md#dataType_ROE#RTB_Behaviour) | Action to take when RTB initiated due to weapons |  |  |
| withdraw_on_attack | valueIgnore = 0<br>Exhausted = 1<br>Percent25 = 2<br>Percent50 = 3<br>Percent75 = 4<br>Percent100 = 5 | Level of attacking weapons to cause withdrawal |  |  |
| withdraw_on_damage | valueIgnore = 0<br>Percent5 = 1<br>Percent25 = 2<br>Percent50 = 3<br>Percent75 = 4 | Level of damage to cause withdrawal |  |  |
| withdraw_on_defence | valueIgnore = 0<br>Exhausted = 1<br>Percent25 = 2<br>Percent50 = 3<br>Percent75 = 4<br>Percent100 = 5 | Level of defending weapons to cause withdrawal |  |  |
| withdraw_on_fuel | valueIgnore = 0<br>Bingo = 1<br>Percent25 = 2<br>Percent50 = 3<br>Percent75 = 4<br>Percent100 = 5 | Level of fuel to cause withdrawal |  |  |
| addTargetPriorityEntry | method(type, subtype, isfixedfacilitysubtype, dbid,<br>listIndex) |  | Returns [{<br>TargetPriority }](Tables.md#table_TargetPriority) |  |
| deleteTargetPriorityEntry | method(listIndex) |  | Returns [{<br>TargetPriority }](Tables.md#table_TargetPriority) |  |

  

#### [Examples](Examples.md#Example_Wrapper_Doctrine)

------------------------------------------------------------------------

<a name="wrapper_DoctrineWRA"></a>

### DoctrineWRA

Weapon Release Authority Doctrine options as defined by the combination of target type and weapon.  
Options can not be changed thru the wrapper.

| Field | Type | Description | Comments |
|---|---|---|---|
| level | string | The doctrine selected (at unit/mission/side) - useful Is just using GUIDs [info] |  |
| target_type | [TargetTypeWRA](DataTypes.md#dataType_TargetTypeWRA) | Type of applicable target |  |
| wra_? | { [WRA](Tables.md#table_WRA) } | The WRA weapon settings for the various weapon systems |  |

  

#### [Examples](Examples.md#Example_Wrapper_DoctrineWRA)

------------------------------------------------------------------------

<a name="wrapper_Event"></a>

### Event

Event details

| Field | Type | Description | Comments |
|---|---|---|---|
| actions | table | The details of the actions in event [READ ONLY] |  |
| conditions | table | The details of the conditions in event [READ ONLY] |  |
| description | string | The event description/name. |  |
| details | table | The complete details of the event in one table. The triggers/conditions/actions tables are repeated<br>within this. [READ ONLY] |  |
| guid | string | The event GUID. [READ ONLY] |  |
| isActive | Yes/No | The event is active |  |
| isRepeatable | True/False | The event repeats |  |
| isShown | True/False | The event shows on log |  |
| name | string | The event name (currently not used). |  |
| probability | string | The event chance to occur (0-100) |  |
| triggers | table | The details of the triggers in event [READ ONLY] |  |

  

#### [Examples](Examples.md#Example_Wrapper_Event)

------------------------------------------------------------------------

<a name="wrapper_Flight"></a>

### Flight

Flight details

| Field | Type | Description | Comments |
|---|---|---|---|
| course | table | Table of the course's [waypoint](#wrapper_WayPoint) details. See example for difference. |  |
| courseWrapper | table | Table of the course's waypoints as waypoint wrappers. This allows you to reference the waypoint itself before course details were extended. See example for difference. |  |
| guid | string | The flight GUID [READ ONLY] |  |
| name | string | The flight call sign |  |
| deleteWaypoint | method( index , [ optional True/False] ) | Delete a waypoint at the numbered position | Returns (a) Error message as a string<br>(b) [deleted waypoint](#wrapper_WayPoint) |
| insertWaypoint | method( indexBefore , [waypoint](#wrapper_WayPoint)) | Insert a waypoint before the numbered position from the waypoint table | Returns nil |
| refreshWaypoints | method() | Refresh the wapoints for fuel and time | Returns nil |

  

#### [Examples](Examples.md#Example_Wrapper_Flight)

------------------------------------------------------------------------

<a name="wrapper_Group"></a>

### Group

Group details.

| Field | Type | Description | Comments |
|---|---|---|---|
| doctrine | [Doctrine](#wrapper_Doctrine) | [READ ONLY] |  |
| guid | string | [READ ONLY] |  |
| lead | string | Group leader guid |  |
| name | string | Group/unit name |  |
| side | string | Name of the group side [READ ONLY] |  |
| type | string | Type of group [READ ONLY] |  |
| unitlist | { string, ... } | A table of unit GUIDs assigned to group. [READ ONLY] |  |

  

#### [Examples](Examples.md#Example_Wrapper_Group)

------------------------------------------------------------------------

<a name="wrapper_Loadout"></a>

### Loadout

Loadout.

| Field | Type | Description | Comments |
|---|---|---|---|
| additionalData | { [AdditionalData](Tables.md#table_Loadout_AdditionalData) } | Additional data for the loadout |  |
| dbid | string | ID from database |  |
| name | string | Name of loadout |  |
| quickTurnaround | { [QuickTurnaround](Tables.md#table_Loadout_QuickTurnaround) } | Quick turnaround settings for the loadout |  |
| roles | { [role](DataTypes.md#dataType_LoadoutRole), [TOD](DataTypes.md#dataType_LoadoutTimeOfDay), [weather](DataTypes.md#dataType_LoadoutWeather) } | Table of the loadout usage |  |
| weapons | { [WeaponLoaded, ...](Tables.md#table_WeaponLoaded) } | Table of weapons in loadout |  |
| setExactWeaponQuantity | method( guid, quantity) | Sets the current load of the weapon defined by 'guid' to the value 'quantity' |  |

  

#### [Examples](Examples.md#Example_Wrapper_Loadout)

------------------------------------------------------------------------

<a name="wrapper_Magazine"></a>

### Magazine

Magazine.

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| armor | number | Armor rating on magazine |  |
| capacity | number | Total capacity of magazine |  |
| dbid | number | Database ID |  |
| guid | string | GUID of magazine |  |
| isaviationmagazine | True/False | Is this an Aviation magazine? |  |
| name | string | Name of magazine |  |
| parentunitguid | string | Parent guid of unit supporting this magazine |  |
| rof | number | Magazine reload time |  |
| weapons | { [WeaponLoaded, ...](Tables.md#table_WeaponLoaded) } | Table of weapon loads in magazine |  |
| setExactWeaponQuantity | method( guid, quantity) | Sets the current load of the weapon defined by 'guid' to the value 'quantity' |  |

  

#### [Examples](Examples.md#Example_Wrapper_Magazine)

------------------------------------------------------------------------

<a name="wrapper_Mission"></a>

### Mission

Standard Mission Options

| Field | Type | Description | Comments |
|---|---|---|---|
| aar | { [AAR](Tables.md#table_AAR) } | A table of the air-to-air refueling options. [READ ONLY] |  |
| assignedCargo | [{ CargoItem, ... }](Tables.md#table_CargoItem) | Table of CargoItems assigned to be moved by this mission. [READ ONLY] |  |
| doctrine | [Doctrine](#wrapper_Doctrine) | [READ ONLY] |  |
| endtime | [DateTime](DataTypes.md#dataType_DateTime) | Time mission ends (assumes DDMMYYYY for ambiguous date) |  |
| flightlist | { [Flight](Wrappers.md#wrapper_Flight), ... } | Table of flights and flightplans for a mission |  |
| guid | string | The GUID of the mission. [READ ONLY] |  |
| isactive | True/False | True if mission is currently active |  |
| name | string | Name of mission |  |
| OnDeactivateUassign | True/False | 'On mission deactivation unassign units' tick box |  |
| OnDeactivateRTB | True/False | 'On mission deactivation RTB units' tick box |  |
| OnDeactivateDelete | True/False | 'On mission deactivation delete mission' tick box |  |
| side | string | Mission belongs to side |  |
| starttime | [DateTime](DataTypes.md#dataType_DateTime) | Time mission starts (assumes DDMMYYYY for ambiguous date) |  |
| SISH | True/False | 'Scrub if side human' tick box |  |
| targetlist | { string, ... } | A table of target GUIDs assigned to mission. [READ ONLY] |  |
| TakeOffTime | [DateTime](DataTypes.md#dataType_DateTime) | Time mission flights take off (assumes DDMMYYYY for ambiguous date) |  |
| TimeOnTargetStation | [DateTime](DataTypes.md#dataType_DateTime) | Time mission expects flights to be at target or on station (assumes DDMMYYYY for ambiguous date) |  |
| type | MissionClassNone = 0<br>Strike = 1<br>Patrol = 2<br>Support = 3<br>Ferry = 4<br>Mining = 5<br>MineClearing = 6<br>Escort = 7<br>Cargo = 8 | Mission class. [READ ONLY] |  |
| typeS | string | Mission class as a string |  |
| unitlist | { string, ... } | A table of unit GUIDs assigned to mission. [READ ONLY] |  |
| packagelist | table | A table with the missions in a task pool (only if wrapper is a taskpool) |  |
| parentTaskPool | string | GUID of the parent taskpool (only if wrapper is a package |  |
| cargomission | { [CargoMission](Tables.md#table_CargoMission) } | A table of the mission specific options. [READ ONLY] |  |
| ferrymission | { [FerryMission](Tables.md#table_FerryMission) } | A table of the mission specific options. [READ ONLY] |  |
| mineclearmission | { [MineClearMission](Tables.md#table_MineClearMission) } | A table of the mission specific options. [READ ONLY] |  |
| minemission | { [MineMission](Tables.md#table_MineMission) } | A table of the mission specific options. [READ ONLY] |  |
| strikemission | { [StrikeMission](Tables.md#table_StrikeMission) } | A table of the mission specific options. [READ ONLY] |  |
| supportmission | { [SupportMission](Tables.md#table_SupportMission) } | A table of the mission specific options. [READ ONLY] |  |
| patrolmission | { [PatrolMission](Tables.md#table_PatrolMission) } | A table of the mission specific options. [READ ONLY] |  |
| addAssignedCargo | method(CargoObjectType, dbid, guid) | Add a non-mount cargo item to assigned cargo | Returns [{ CargoItem<br>}](Tables.md#table_CargoItem) |
| removeAssignedCargo | method(CargoObjectType, dbid, guid) | Remove a non-mount cargo item from assigned cargo | Returns [{ CargoItem<br>}](Tables.md#table_CargoItem) |
| addAssignedCargoMount | method(dbid, quantity) | Add a mount cargo item to assigned cargo | Returns [{ CargoItem<br>}](Tables.md#table_CargoItem) |
| removeAssignedCargoMount | method(dbid, quantity) | Remove a mount cargo item from assigned cargo | Returns [{ CargoItem<br>}](Tables.md#table_CargoItem) |
| createFlightPlans | method({}) | Create mission flight plans | Returns [{ First Flight<br>}](#table_Flight) |
| updateWPtimes | method() | Refresh the flight WP times | No return |

#### [Examples](Examples.md#Example_Wrapper_Mission)

  

Amphibious & Operation Planner Related Options

| Field | Type | Description | Comments |
|---|---|---|---|
| PriorityWeight | integer | How important this mission is (0 = most important); affects multi-mission units assignment dynamic. |  |
| OperationName | string | Used to organize mission into groups, it is an informational element shown on the operation planner UI |  |
| Completion | number | From 0.0 to 1.0, it designates how complete this mission is. This value is mostly unused in most cases<br>at the moment and should be ignored. |  |
| Phase | phaseNone = 9999<br>Auto = 0<br>Completed = 10<br>Active = 20<br>OnHold = 30 | The phase as interpreted by the operation planner, this rules the whole dynamic in the operation planner<br>and the assignment of multi-mission units. |  |
| MissionStartTrigger_Time | integer | The H +/- time condition (in seconds) for the start trigger. |  |
| MissionStartTrigger_Time_Enabled | True/False | Is this trigger used or not ? |  |
| MissionStartTrigger_Time_LastResult | True/False | What was the result of the trigger when it last ran ? |  |
| MissionStartTrigger_Time_Operator | True/False | The trigger's operator. True = 'AND', False = 'OR' |  |
| MissionStartTrigger_MissionCompleted | { string, ... } | The condition for the trigger, defined as all the missions (GUID) that need to be completed (phase as<br>"satisfied") for the trigger to check. |  |
| MissionStartTrigger_MissionCompleted_Enabled | True/False | Is this trigger used or not ? |  |
| MissionStartTrigger_MissionCompleted_LastResult | True/False | What was the result of the trigger when it last ran ? |  |
| MissionStartTrigger_MissionCompleted_Operator | True/False | The trigger's operator. True = 'AND', False = 'OR' |  |
| MissionStartTrigger_LUADescription | string | The label of the lua script as an indicator of its purpose |  |
| MissionStartTrigger_LUA | string | The lua script to be executed for this trigger conditions, must return a boolean as a condition result. |  |
| MissionStartTrigger_LUA_Enabled | True/False | Is this trigger used or not ? |  |
| MissionStartTrigger_LUA_LastResult | True/False | What was the result of the trigger when it last ran ? |  |
| MissionStartTrigger_LUA_Operator | True/False | The trigger's operator. True = 'AND', False = 'OR' |  |
| MissionCompletedTrigger_ElapsedTime | integer | The elapsed time (in seconds) since mission execution for the trigger's condition to return true. |  |
| MissionCompletedTrigger_ElapsedTime_Current | integer | The current elapsed time (in seconds). |  |
| MissionCompletedTrigger_ElapsedTime_Enabled | True/False | Is this trigger used or not ? |  |
| MissionCompletedTrigger_ElapsedTime_LastResult | True/False | What was the result of the trigger when it last ran ? |  |
| MissionCompletedTrigger_ElapsedTime_Operator | True/False | The trigger's operator. True = 'AND', False = 'OR' |  |
| MissionCompletedTrigger_LUADescription | string | The label of the lua script as an indicator of its purpose |  |
| MissionCompletedTrigger_LUA | string | The lua script to be executed for this trigger conditions, must return a boolean as a condition result. |  |
| MissionCompletedTrigger_LUA_Enabled | True/False | Is this trigger used or not ? |  |
| MissionCompletedTrigger_LUA_LastResult | True/False | What was the result of the trigger when it last ran ? |  |
| MissionCompletedTrigger_LUA_Operator | True/False | The trigger's operator. True = 'AND', False = 'OR' |  |

  

------------------------------------------------------------------------

<a name="wrapper_Mount"></a>

### Mount

A mount consistes of `weapon(s)` and the actual `loads` on them , rather than in a storage area.

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| armor | number | Armor rating on mount |  |
| capacity | number | Total capacity of mount |  |
| dbid | number | Database ID |  |
| guid | string | GUID of mount |  |
| rof | number | Mount reload time |  |
| weapons | { [WeaponLoaded, ...](Tables.md#table_WeaponLoaded) } | Table of weapon loads on mount |  |
| setExactWeaponQuantity | method( guid, quantity) | Sets the current load of the weapon defined by 'guid' to the value 'quantity' |  |

  

#### [Examples](Examples.md#Example_Wrapper_Mount)

------------------------------------------------------------------------

<a name="wrapper_Operation"></a>

### Operation

The ‘Operation’ object can be fetched from the side object. There is only one operation object per side.

| Field | Type | Description | Comments |
|---|---|---|---|
| LHourMission | [Mission](#wrapper_Mission) | The mission designated to start at L-Hour. As soon as the L-Hour is reached, the mission will change<br>phase to “Running”. |  |
| HHourMission | [Mission](#wrapper_Mission) | The mission designated to start at H-Hour. As soon as the H-Hour is reached, the mission will change<br>phase to “Running”. |  |
| HHour | string | The time set as H-Hour. |  |
| LHour | string | The time set as L-Hour. |  |
| HHourEffectiveStartTime | string | The effective time at which the H-Hour started counting. Sometimes the actual H-Hour can be different<br>from the one planned initially, or in the past.<br>[READ ONLY] |  |
| LHourEffectiveStartTime | string | The effective time at which the L-Hour started counting. Sometimes the actual L-Hour can be different<br>from the one planned initially, or in the past.<br>[READ ONLY] |  |
| H_LHourAreRelative | True/False | Whether or not the H-Hour and the L-Hour have a static time delta.<br>With this option on TRUE, the H-hour and L-hour will always have the same time difference and will adjust<br>automatically when changing either the H-Hour or the L-Hour |  |

------------------------------------------------------------------------

<a name="wrapper_ReferencePoint"></a>

### ReferencePoint

Reference point information.

| Field | Type | Description | Comments |
|---|---|---|---|
| bearingtype | bearingTypefixed = 0<br>rotating =<br>1 | Type of bearing to 'relativeto' unit | no value if no 'relativeto' unit |
| color | string | The HTML color code expressed as a number - convert to hex to check against a HTML color chart |  |
| guid | string | The unique identifier for the reference point |  |
| highlighted | True/False | True if the point should be selected |  |
| latitude | [Latitude](DataTypes.md#dataType_Latitude) | The latitude of the reference point |  |
| locked | True/False | True if the point is locked |  |
| longitude | [Longitude](DataTypes.md#dataType_Longitude) | The longitude of the reference point |  |
| name | string | The name of the reference point |  |
| relativeDistance | number | Relative distance of RP to 'relativeto' unit | no value if no 'relativeto' unit |
| relativeBearing | number | Relative bearing ( 0 - 360) of RP to 'relativeto' unit | no value if no 'relativeto' unit |
| relativeto | [Unit](#wrapper_Unit) | The unit that the reference point is relative to |  |
| relativeto_type | UnitType | The type of unit being used for the relative to part (contact, rp, or type on actual unit) |  |
| side | string | The side the reference point is visible to |  |

  

#### [Examples](Examples.md#Example_Wrapper_RP)

------------------------------------------------------------------------

<a name="wrapper_Scenario"></a>

### Scenario

Details of the current scenario. Note the mixed case of the field names.

| Field | Type | Description | Comments |
|---|---|---|---|
| CampaignID | string | Campaign guid |  |
| CampaignSessionID | string | Current campaign session id |  |
| CampaignScore | number | Current campaign score |  |
| Complexity | number | Complexity rating |  |
| CurrentTime | number | Current scenario time as a number (of seconds) equivalent |  |
| CurrentTime | string | Current scenario time |  |
| DBUsed | string | Name of database being used |  |
| Difficulty | number | Difficulty rating |  |
| Duration | string | Length of scenario as days:hours:minutes:seconds |  |
| DurationNum | number | Length of scenario as a number (of seconds) equivalent |  |
| FileName | string | Name of the scenario file (.scen/.save) |  |
| guid | string | Current scenario GUID |  |
| HasStarted | True/False | Scenario in play |  |
| InCampaignMode | True/False | Currently in campaign mode |  |
| PlayerSide | string | Current player side GUID |  |
| SaveVersion | string | Game version last saved under |  |
| ScenDate | number | Year of settings |  |
| ScenSetting | string | The setting of the scenario |  |
| Sides | number | Number of sides in scenario |  |
| StartTime | string | Starting time |  |
| StartTimeNum | number | Starting time as a number (of seconds) equivalent |  |
| Title | string | Title of the scenario |  |
| TimeCompression | number | Compression mode |  |
| ResetLossExp | method() | Clears the loss and expenditure logs in scenario |  |
| ResetScore | method() | Clears the score and log in scenario |  |

  

#### [Examples](Examples.md#Example_Wrapper_Scenario)

------------------------------------------------------------------------

<a name="wrapper_Sensor"></a>

### Sensor

Some details of a sensor device

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| altitudes | { min, max } | Returns a table of altitudes |  |
| dbid | string | The DBID of the sensor. |  |
| guid | string | The GUID of the sensor. |  |
| MaxElevationAngle | number | The maximum elevation of the sensor (applicable to Satellite) [PRO ONLY] |  |
| MinElevationAngle | number | The minimum elevation of the sensor (applicable to Satellite) [PRO ONLY] |  |
| name | string | The name of the sensor. |  |
| role | string | The role of the sensor (e.g. 3D Air Search - Medium Range). |  |
| ranges | { min, max } | Returns a table of ranges |  |
| scaninterval | number | The scanning interval of the sensor.<br>[READ ONLY] unless [PRO ONLY] |  |
| type | string | The high-level type of sensor. |  |
| IsPreciseCheck | method( detector, detected) | Returns True/False |  |
| RangeAgainstTarget | method( detector, detected) | Returns a table of { maxIR, MaxVisual } as max range between units for IR<br>and Visual |  |

**Caution:** The GUID returned here is the GUID of the individual sensor component, not the GUID of the parent unit.

------------------------------------------------------------------------

<a name="wrapper_Serial"></a>

### Serial

Serials/Chalks can be fetched from the side object the name of the collection is “Chalks”.

| Field | Type | Description | Comments |
|---|---|---|---|
| ID | ID | The serial’s visible ID. |  |
| AssociatedMothership | string | The GUID of the mothership this chalk is associated to. [READ ONLY] |  |
| LargestCargoType | LargestCargoTypeNoCargo = 0<br>Personnel = 1000<br>SmallCargo = 2000<br>MediumCargo = 3000<br>LargeCargo = 4000<br>VLargeCargo = 5000 | Get the largest cargo this serial currently contains. [READ ONLY] |  |
| Mass | number | The total mass of the serial. [READ ONLY] |  |
| Area | number | The total area taken by the serial. [READ ONLY] |  |
| PAX | number | The total personnel this serial contains. [READ ONLY] |  |

  

------------------------------------------------------------------------

<a name="wrapper_Side"></a>

### Side

Side perspective

| Field | Type | Description | Comments |
|---|---|---|---|
| awareness | [Awareness](DataTypes.md#dataType_Awareness) |  |  |
| canAutoTrackCivillians | True/False | Auto track civilians |  |
| Chalks | { [Serial, ...](#wrapper_Serial) } | Table of serials within the Chalk. [READ ONLY] |  |
| collectiveResponsibility | True/False | Collective Responsibility |  |
| computerControlledOnly | True/False | AI controlled only |  |
| contacts | { [UnitList](Tables.md#table_UnitList) } | Table of current contacts for the designated side. The 'guid' in table are contact references [READ ONLY] |  |
| doctrine | [Doctrine](#wrapper_Doctrine) | [READ ONLY] |  |
| customenvironmentzones | { { giud, description, name }, ... } | Table of Zone identifiers for the designated side [READ ONLY] | Use the method 'getcustomenvironmentzone' to get specific details of the zone |
| exclusionzones | { { giud, description, name }, ... } | Table of Zone identifiers for the designated side [READ ONLY] | Use the method 'getexclusionzone' to get specific details of the zone |
| expenditures | { {type,dbid,name,number},<br>... } | A table of expenditure to date |  |
| guid | string | The GUID of the side. |  |
| hasmines | True/False | [READ ONLY] |  |
| losses | { {type,dbid,name,number},<br>... } | A table of losses to date |  |
| missions | { [Mission, ...](#wrapper_Mission) } | A table of missions on the side |  |
| name | string | The name of the side. |  |
| nonavzones | { { giud, description, name }, ... } | Table of Zone identifiers for the designated side [READ ONLY] | Use the method 'getnonavzone' to get specific details of the zone |
| Operation | [Operation](#wrapper_Operation) | [READ ONLY] |  |
| proficiency | [Proficiency](DataTypes.md#dataType_Proficiency) |  |  |
| rps | { [RP, ...](Tables.md#table_ReferencePoint) } | RPs for the designated side [READ ONLY] |  |
| units | { [UnitList](Tables.md#table_UnitList) } | Table of units for the designated side. [READ ONLY] |  |
| standardzones | { { giud, description, name }, ... } | Table of Zone identifiers for the designated side [READ ONLY] | Use the method 'getstandardzone' to get specific details of the zone |
| enablers | { [Enablers](Tables.md#table_Enablers) } | Table of enablers for the designated side. |  |
| contactsBy | method(UnitType) | Returns table [UnitList](Tables.md#table_UnitList) of current<br>contacts filtered by type of unit or nil. |  |
| getcustomenvironmentzone | method(ZoneGUID\|ZoneName\|ZoneDescription) | Returns matching [Zone](#wrapper_Zone)<br>or nil |  |
| getexclusionzone | method(ZoneGUID\|ZoneName\|ZoneDescription) | Returns matching [Zone](#wrapper_Zone)<br>or nil |  |
| getnonavzone | method(ZoneGUID\|ZoneName\|ZoneDescription) | Returns matching [Zone](#wrapper_Zone)<br>or nil |  |
| getstandardzone | method(ZoneGUID\|ZoneName\|ZoneDescription) | Returns matching [Zone](#wrapper_Zone)<br>or nil |  |
| unitsBy | method(UnitType[[,Category],Subtype]) | Returns table [UnitList](Tables.md#table_UnitList) of units ,<br>optionally filtered or nil. |  |
| unitsInArea | method({Area[,TargetFilter]}) | Returns table [UnitList](Tables.md#table_UnitList) of units in<br>area, optionally filtered |  |

  

#### [Examples](Examples.md#Example_Wrapper_Side)

------------------------------------------------------------------------

<a name="wrapper_SpecialAction"></a>

### Special action

Special action details

| Field | Type | Description | Comments |
|---|---|---|---|
| description | string | The event GUID. |  |
| guid | string | The event GUID. [READ ONLY] |  |
| isActive | True/False | The event is active |  |
| isRepeatable | True/False | The event repeats |  |
| name | string | The event name. |  |
| ScriptText | string | The Lua script |  |
| side | string | The side GUID |  |

  

#### [Examples](Examples.md#Example_Wrapper_SA)

------------------------------------------------------------------------

<a name="wrapper_Unit"></a>

### Unit

Represents an active unit.

| Field | Type | Description | Comments |
|---|---|---|---|
| AI_EvaluateTargets_enabled | True/False | AI evaluates targets |  |
| AI_DeterminePrimaryTarget_enabled | True/False | AI determines primary target |  |
| airbornetime | datetime | how long aircraft has been flying as "days:hours:minutes:seconds". [READ ONLY] |  |
| airbornetime_v | number | how long aircraft has been flying in seconds. [READ ONLY] |  |
| AllowMultiMission | True/False | Is the mission allowed to have multiple missions assigned to it and will it be considered by the operation<br>planner logic ? |  |
| altitude | number | The altitude of the unit in meters. |  |
| areaTriggersFired | { string, ... } | Table of active 'in area' triggers (GUID) that have fired for unit |  |
| ascontact | { {side, guid, name}, ... } | A table of how this unit is seen from the other sides (as contacts). [READ ONLY] |  |
| AssignedMissionsQueue | { mission_guid, ... } | The list of missions assigned to this unit. This is the missions the operation planner evaluate every<br>tick. |  |
| assignedUnits | { Boats, Aircraft } | Table of boats and aircraft GUID assigned to the unit (base). |  |
| autodetectable | True/False | True if the unit is automatically detected. |  |
| avoidCavitation | True/False | Avoid cavitation 'True/False' |  |
| base | [Unit](#wrapper_Unit) | The unit's assigned base. |  |
| beingPickedUp | True/False | unit is marked to be pickedup |  |
| cargo | { [Cargo](Tables.md#table_Cargo), ... } | Unit's current cargo |  |
| category | String | The unit category code (as a string rather than a number) for the [Aircraft](DataTypes.md#dataType_Unit_Aircraft), [Facility](DataTypes.md#dataType_Unit_Facility), [Ship](DataTypes.md#dataType_Unit_Ship), [Submarine](DataTypes.md#dataType_Unit_Submarine) or [Satellite](DataTypes.md#dataType_Unit_Satellite). |  |
| classname | string | Unit class name [READ ONLY] |  |
| components | { [Component, ...](Tables.md#table_Component) } | A table of components on the unit. [READ ONLY] |  |
| condition | string | Message on unit dock/air ops status. [READ ONLY] |  |
| condition_v | string | Docking/Air Ops condition value. [READ ONLY] |  |
| course | [WayPoint](#wrapper_WayPoint) | The unit's course, as a table of waypoints (latitude,longitude) |  |
| crew | number | crew size (nil if not defined) [READ ONLY] |  |
| damage | { DP, FLOOD, FIRES, STARTDP,<br>DP_PERCENT, DP_PERCENT_NOW } | Table of start and current DP, flood and fire level, and the damage percentage of unit. [READ ONLY] |  |
| doctrine | [Doctrine](#wrapper_Doctrine) | [READ ONLY] |  |
| dbid | number | The database ID of the unit [READ ONLY] |  |
| desiredAltitude | number | unit desired altitude to go to |  |
| desiredSpeed | number | unit desired speed to go to |  |
| desiredHeading | number | unit desired heading to go to |  |
| desiredPitch | number | unit desired pitch to go to if is controlable else nil |  |
| desiredRoll | number | unit desired roll to go to |  |
| DISEntityID | string | The DIS entity ID of the unit, in the format SiteID.ApplicationID.EntityID [PRO ONLY] |  |
| embarkedUnits | { Boats, Aircraft } | Table of boats and aircraft GUID docked/embarked on the unit |  |
| currentExhaustion | time | Number of seconds toward exhaustion limit |  |
| maxExhaustion | time | Maximum seconds before exhaustion. |  |
| firedOn | { string, ... } | Table of guids that are firing on this unit<br>(Note that the starting idex of this table is '0' rather than '1' as normal Lua tables) |  |
| firingAt | { string, ... } | Table of contact guids that this unit is firing at<br>(Note that the starting idex of this table is '0' rather than '1' as normal Lua tables) |  |
| formation | { [Formation, ...](Tables.md#table_Formation) } | Table of unit's formation info {bearing, type (of bearing), distance, sprint (and drift) |  |
| fuel | { [Fuel, ...](DataTypes.md#dataType_Fuel) } | A table of fuel types used by unit based on the type of fuel as the index. |  |
| fuels | { [Fuel, ...](DataTypes.md#dataType_Fuel) } | A table of fuels used by unit. |  |
| fuelstate | string | Message on unit fuel status. [READ ONLY] |  |
| groundSpeed | number | aircraft or missile speed [READ ONLY] |  |
| group | [Group](#wrapper_Group) | The unit's group.<br>If setting the group, use a text name of an existing group<br>or a new name to create a group.<br>To<br>remove unit from a group, use "none" as the name. |  |
| groupLead | set: string or [get: Unit wrapper](#wrapper_Group) | The group lead if a group.<br>If setting the group lead, use the name or GUID of the new lead unit. |  |
| guid | string | The unit's unique ID. [READ ONLY] |  |
| heading | number | The unit's heading . |  |
| holdfire | {air, surface, subsurface, land} | Doctrine WCS setting [READ ONLY] |  |
| holdposition | True/False | True if the unit should hold. |  |
| hostFacility | [Facility](Tables.md#table_Facility) | Where unit is hosted |  |
| IsBallisticMissile | True/False | is weapon a Ballistic Weapon [READ ONLY] |  |
| IsDecoy | True/False | is weapon a decoy [READ ONLY] |  |
| IsDestroyed | True/False | is unit destroyed (present until object purged) [READ ONLY] |  |
| isEscort | True/False | is unit asssigned to escort in mission [READ ONLY] |  |
| IsLoadedAsCargo | True/False | is unit being transferred as cargo [READ ONLY] |  |
| IsMine | True/False | is weapon a mine [READ ONLY] |  |
| IsNuke | True/False | is weapon a nuke [READ ONLY] |  |
| isSinking | True/False | is ship is sinking (which means it will still show as an 'active' unit [READ ONLY] |  |
| isOperating | True/False | is unit is operational, not landed or docked [READ ONLY] |  |
| IsUnguidedBallisticWeapon | True/False | is weapon a Unguided Ballistic Weapon [READ ONLY] |  |
| jammed | True/False | unit is being jammed [READ ONLY] |  |
| jammer | True/False | unit is acting as a jammer [READ ONLY] |  |
| latitude | [Latitude](DataTypes.md#dataType_Latitude) | The latitude of the unit. |  |
| loadout | [Loadout](#wrapper_Loadout) | current aircraft loadout as a wrapper. [READ ONLY] |  |
| loadoutdbid | number | current aircraft loadout DBID. [READ ONLY] |  |
| longitude | [Longitude](DataTypes.md#dataType_Longitude) | The longitude of the unit . |  |
| magazines | { [Magazine, ...](Tables.md#table_Magazine) } | A table of magazines (with weapon loads) in the unit or group.<br>Can be updated by [ScenEdit_AddWeaponToUnitMagazine](Tables.md#table_ScenEdit_AddWeaponToUnitMagazine)<br>[READ ONLY] |  |
| manualAltitude | string or number | Desired altitude/depth or 'OFF' to turn off manual mode |  |
| manualSpeed | string or number | Desired speed or 'OFF' to turn off manual mode |  |
| mission | [Mission](#wrapper_Mission) | The unit's assigned mission.<br>Can be changed by setting to the Mission name<br>or guid (calls<br>ScenEdit_AssignUnitToMission) |  |
| mounts | { [Mount, ...](Tables.md#table_Mount) } | A table of mounts (with weapon loads) in the unit or group.<br>Can be updated by [ScenEdit_AddReloadsToUnit](Tables.md#table_ScenEdit_AddReloadsToUnit) [READ ONLY] |  |
| name | string | The unit's name. |  |
| newname | string | If changing existing unit, the unit's new name . |  |
| noiseLevel | { front, side, rear } | Table containing the unit current decibel values if applicable, else nil |  |
| obeyEMCON | True/False | Unit obeys EMCON. Turn off to manually set sensors |  |
| oldDamagePercent | single | changes the last damage percent used by damage trigger |  |
| OODA | { evasion, targeting, detection } | Table contain unit's "observe, orient, decide, act" values |  |
| outOfComms | True/False | is unit connected to side comms network (false = connected) [READ ONLY] |  |
| pickedUpBy | GUID | The unit GUID that has picked up this unit (useful to the destroyed Event) |  |
| pickUpTarget | [Unit](#wrapper_Unit) | The unit being picked up. |  |
| pitch | number | unit pitch if is controlable else nil [READ ONLY] |  |
| proficiency | string | The unit proficiency, "Novice"\|0, "Cadet"\|1,"Regular"\|2, "Veteran"\|3, "Ace"\|4. |  |
| quickTurnaround | { [QuickTurnaround](Tables.md#table_Unit_QuickTurnaround) } | Current quick turnaround values if an aircraft with a loadout |  |
| readytime | string [READ] or number<br>[SET] | how long aircraft/ship takes to be ready as "days:hours:minutes:seconds".<br>Set the time in seconds<br>Can use 'TimeToReady_Minutes=' in SetUnit() to set the ready time in minutes for aircraft and ship/sub. |  |
| readytime_v | number | how long aircraft/ship takes to be ready in seconds. [READ ONLY] |  |
| roll | number | unit roll [READ ONLY] |  |
| SAR_enabled | True/False | unit can conduct SAR |  |
| sensors | { [Sensor, ...](Tables.md#table_Sensor) } | Unit sensor information |  |
| side | string | The unit's side. [READ ONLY] |  |
| signature | { [Signature](Tables.md#table_Signature) } | Table containing the unit signature profile (for the current loadout if an aircraft) if applicable, else<br>nil |  |
| speed | number | The unit's current speed. |  |
| sprintDrift | True/False | Sprint and drift 'True/False' |  |
| subtype | string | The unit's subtype (if applicable). [READ ONLY] |  |
| target | object | The primary taget of the unit.<br>On reading, it will return the targeted contact [Contact](#wrapper_Contact)<br>On setting, supply a table of the contact/actual unit GUID or 'BOL' and the activation point (see<br>ScenEdit_AttackContact)<br>{ guid = value } |  |
| targetedBy | { string, ... } | Table of unit guids that have this unit as a target<br>(Note that the starting idex of this table is '0' rather than '1' as normal Lua tables) |  |
| throttle | Throttle | The unit's current throttle setting. |  |
| type | string | The type of object, may be 'Facility', 'Ship', 'Submarine', or 'Aircraft'. [READ ONLY] |  |
| unassign | True/False | unassign unit (performs basic actions of hotkey 'u') |  |
| unitstate | string | Message on unit status. [READ ONLY] |  |
| UseCustomIntermittentEmissionOnly | True/False | Activate the custom intermittent emissions |  |
| WasPickedUp | True/False | Unit was picked up? Useful when unit is destroyed after a pickup |  |
| weapon | { [shooter](wrapper_Unit), [contact](wrapper_Contact),<br>detonated } | Table of shooter unit, at contact unit and detonated (when destroyed) if a weapon [READ ONLY] |  |
| weaponstate | string | Message on unit weapon status. [READ ONLY] |  |
| weather | { [Weather](Tables.md#table_Weather) } | Table of weather parameters (temp, rainfall, underrain, seastate) |  |
| delete | method() | Immediately removes unit object |  |
| filterOnComponent | method(type) | Filters unit on `type` of component and returns a<br>[Component](Tables.md#table_Component)<br>table. |  |
| getwaypoint | method(guid=string) | Returns a [Waypoint](#wrapper_WayPoint) based on the GUID of<br>the waypoint passed. |  |
| inArea | method({area}) | Is unit in the 'area' defined by table of RPs - returns True/False |  |
| Launch | method(True/False) | Trigger the unit to launch from base (true) or abort launch (false) |  |
| rangetotarget | method('contactid') | Calculate flat distance to a contact location |  |
| RTB | method() | Trigger the unit to return to base, or cancel an RTB. |  |
| updateorbit | method({TLE=...}) | Update the orbit for a satellite by specifying a TLE |  |
| createUnitCargo | method(type, dbid [,customname]) | Create an item in cargo area. Returns [cargo](#wrapper_Cargo) |  |
| deleteUnitCargo | method(guid) | Delete cargo item by it's guid. Returns True/False |  |
| deployDippingSonar | method(true) | Send the unit to deploy the dipping sonar. Parameter should be true |  |
| dropSonobuoy | method(active, shallow) | where active = true for active sonobuoy, false for passive<br>and shallow = true for above layer, and false for below |  |
| getUnitCargo | method(guid) | Get an item in cargo area. Returns [cargo](#wrapper_Cargo) or nil |  |
| getUnitMagazine | method(mag_guid) | Get specific magazine GUID details. Returns [magazine](#wrapper_Magazine)<br>or nil |  |
| getUnitMountMagazine | method(mount_guid) | Get magazine details of the specific mount GUID. Returns [magazine](#wrapper_Magazine) or nil |  |
| ReplenishUnit | method([{ tanker = ..., mission = {...}}]) | Send the unit to replenish. Returns { success, reason } success = false if<br>method call fails, reason = why replenishment failed where blank reason means unit is set to replenish. |  |

  

#### [Examples](Examples.md#Example_Wrapper_Unit)

  

##### Modifiable through ScenEdit_SetUnit function only

| Field | Type | Description | Comments |
|---|---|---|---|
| refuel | True/False | Trigger the unit to attempt an UNREP |  |
| manualAltitude | string or number | Desired altitude/depth or 'OFF' to turn off manual mode |  |
| manualThrottle | string or number | Desired throttle or 'OFF' to turn off manual mode |  |
| manualSpeed | string or number | Desired speed or 'OFF' to turn off manual mode |  |
| moveto | True/False | Set a desired alt/depth instead of jumping to actual |  |
| RTB | True/False | Trigger the unit to return to base |  |
| sensors | [Sensor](Tables.md#table_Sensor) | Sensors set to active or inactive in table format (sensor_guid,sensor_isactive) |  |

------------------------------------------------------------------------

<a name="wrapper_Zone"></a>

### Zone

Exclusion/No navigatation/Standard zone/Custom Environment zone.

| Field | Type | Description | Comments |
|---|---|---|---|
| affects | unitTypes | List of unit types (ship, submarine, aircraft, facility) affected by a No-nav or exclusion zone. |  |
| area | { [ZoneMarker, ...](Tables.md#table_ReferencePoint) } | A set of reference points marking the zone. |  |
| areacolor | string | The HTML color code expressed as a number - convert to hex to check against a HTML color chart | When set via [ScenEdit_SetZone](Function_ScenEdit_SetZone.md), transparency can be included as `'#AARRGGBB'` or `'Alpha,Red,Green,Blue'` |
| description | string | The description of the zone. |  |
| enablers | { [Enablers](Tables.md#table_Enablers) } | Table of enablers for the designated side. |  |
| guid | string | The GUID of the zone. [READ ONLY] |  |
| isactive | True/False | Zone is currently active. |  |
| hascustomlandcoverheight | True/False | Custom environment zone has a custom land cover height set. |  |
| landcoverheight | integer | The height of the land cover within a custom environment zone. |  |
| landcovertype | [LandCoverType](DataTypes.md#dataType_LandCover) | The land cover type override (if any) within a custom environment zone. |  |
| locked | True/False | Zone is locked. |  |
| markas | Posture | Posture of violator of exclusion zone. |  |
| noFire | True/False | NoNav-Zone: is a no Fire zone? |  |
| name | string | The name of the zone. |  |
| type | string | The type of the zone. [READ ONLY] |  |
| thermallayerceiling | integer | The depth of the thermal layer ceiling within a custom environment zone. |  |
| thermallayerfloor | integer | The depth of the thermal layer floor within a custom environment zone. |  |
| thermallayerstrength | single | The strength of the thermal layer within a custom environment zone. |  |
| convergencezoneinterval | single | The interval (in nm) between convergence zones within a custom environment zone. |  |
| weatherprofile | table | The weather profile within a custom environment zone. |  |

  

#### [Examples](Examples.md#Example_Wrapper_Zone)

------------------------------------------------------------------------

<a name="wrapper_WayPoint"></a>

### WayPoint

Information about a waypoint.  
The extended fields can be used in when setting a course for a unit.  
For retrieval of a waypoint, the minimum content is latitude and longitude.

| Field | Type | Description | Comments |
|---|---|---|---|
| actionId | string | The Event Action GUID that will execute when this waypoint is reached.<br>Use the normal Event Editor to create these types of events which can be added under Waypoint editing |  |
| altitude | number | Location altitude/depth in meters |  |
| description | string | Description |  |
| desiredAltitude | number | Desired altitude/depth in meters | for setting a course thru the unit wrapper,<br>desiredAltitudeTF is used if 'terrain following' |
| desiredSpeed | number | Desired speed |  |
| guid | string | GUID defining waypoint | Older alternative field name was 'objectid' |
| latitude | [latitude](DataTypes.md#dataType_Latitude) | Location latitude |  |
| longitude | [longitude](DataTypes.md#dataType_Longitude) | Location longitude |  |
| name | string | Name |  |
| presetAltitude | [PresetAltitude](DataTypes.md#dataType_Preset) | Using preset |  |
| presetDepth | [PresetDepth](DataTypes.md#dataType_Preset) | Using preset |  |
| presetThrottle | [PresetThrottle](DataTypes.md#dataType_Preset) | Using preset |  |
| TF | True/False | Altitude using terrain following |  |
| type | [WaypointType](DataTypes.md#dataType_Waypoint) | Type of waypoint |  |

  

#### [Examples](Examples.md#Example_Wrapper_WP)

------------------------------------------------------------------------

<a name="wrapper_Weapon"></a>

### Weapon

Information about a weapon

#### Fields

| Field | Type | Description | Comments |
|---|---|---|---|
| classname | string | The class of weapon. |  |
| dbid | number | The database ID of the weapon. |  |
| directors | table | directors that can control weapon |  |
| guid | string | The GUID of this weapon. |  |
| guidance | number | Guidance device code |  |
| launchLimits | table | launch altitude limits of weapon at general target types. |  |
| name | string | The name of the weapon. |  |
| OODA | table | The OODA. |  |
| ranges | table | range of weapon at general target types. |  |
| sensors | table | sensors carried by weapon |  |
| subtype | string | Description of weapon subtype |  |
| subtypeN | number | Numeric value of weapon subtype |  |
| targetLimits | table | target altitude limits of weapon at general target types. |  |
| type | string | The type of weapon. |  |
| validTargetList | table | valid target list applicable |  |
| warheads | table | warheads carried by weapon |  |

  

#### [Examples](Examples.md#Example_Wrapper_Weapon)

<a name="footer"></a>

Copyright © WarfareSims 2020
