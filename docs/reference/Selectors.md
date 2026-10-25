<a name="Selectors"></a>

## Selectors

NOTE:  
Some of the 'selectors' below may have been made redundant as the functions themsleves have been expanded to include the specific (rather than general) parameters that are required. They may be removed at a later time.

These define the information required as part of the 'select' process for the functions. In the case of functions that 'add' things, these are also key elements to the adding process. Other properties may be included in the 'selector' such as when updating an existing table.

When selecting units, it is preferrable to use the GUID as the identifier for a precise match. If not, then the side and name for a more limited search. And as a last option, just the name which search all units in the scenario. When using just the name, usually the first matching name is returned. This is okay if the names are unique. Thus including the side, it will only check the units on that side for a match.

- [AttackOptions](#selector_AttackOptions)
- [ContactSelector](#selector_ContactSelector)
- [DamageOptions](#selector_DamageOptions)
- [DoctrineSelector](#selector_DoctrineSelector)
- [DoctrineWRASelector](#selector_DoctrineWRASelector)
- [EventActionUpdate](#selector_ActionUpdate)
- [EventConditionUpdate](#selector_ConditionUpdate)
- [EventSpecialAction](#selector_SpecialAction)
- [EventTCAUpdate](#selector_EventTCAUpdate)
- [EventTriggerUpdate](#selector_TriggerUpdate)
- [EventUpdate](#selector_EventUpdate)
- [NewMission](#selector_NewMission)
- [NewUnit](#selector_NewUnit)
- [ReferencePointSelector](#selector_ReferencePointSelector)
- [SideOption](#selector_SideOption)
- [TargetFilter](#selector_TargetFilter)
- [UnitSelector](#selector_UnitSelector)
- [UnitUpdate](#selector_UpdateUnit)
- [UnitCargoUpdate](#selector_UpdateUnitCargo)
- [VPContactSelector](#selector_VPContactSelector)
- [Weapon2Magazine](#selector_Weapon2Magazine)
- [Weapon2Mount](#selector_Weapon2Mount)

------------------------------------------------------------------------

<a name="selector_ActionUpdate"></a>

### ActionUpdate

Update the Event Action.

- ID string The GUID of the action \[READONLY\]
- Description string Description or GUID of action
- NewName string If specified, the new name of the action
- Mode string Operation to do - 'list', 'add', 'remove', 'update' (default) SE_Set...()
- Type string Type of action \[required only for 'add' option\]

**Note:** Other various values apply to the type of action.

------------------------------------------------------------------------

<a name="selector_AttackOptions"></a>

### AttackOptions

What weapons to attack with.

| Field | Type | Description | Comments |
|---|---|---|---|
| mode | [TargetingMode](DataTypes.md#dataType_TargetingMode) | Targeting mode |  |
| mount | number | The attacker's mount DBID |  |
| weapon | number | The attacker's weapon DBID |  |
| qty | number | How many to allocate |  |

------------------------------------------------------------------------

<a name="selector_ConditionUpdate"></a>

### ConditionUpdate

Condition update.

- ID string The GUID of the condition \[READONLY\]
- Description string Description or GUID of condition
- NewName string If specified, the new name of the condition
- Mode string Operation to do - 'list', 'add', 'remove', 'update' (default) SE_Set...()
- Type string Type of condition \[required only for 'add' option\]

**Note:** Other various values apply to the type of condition.

------------------------------------------------------------------------

<a name="selector_ContactSelector"></a>

### ContactSelector

Contact selector.

**Note:** A unit and its contact GUIDs are different for the same physical unit. The contact GUIDs represent contacts associated with this unit from the perspective of any detecting sides.

- side string The side to find the the contact on.
- guid string The GUID of the contact. Interrogate ScenEdit_GetContacts(side) for the side's contacts and use the GUID from there.

------------------------------------------------------------------------

<a name="selector_DamageOptions"></a>

### DamageOptions

Unit damage. The component table list consists of entries for each component, identified by guid and new level.

##### Special Cases

- if guid is 'type', then you can set a type of component to be damaged,
- if damageLevel is 'none', then the component will be repaired.
- if damageLevel is 'destroyed', then the component will be destroyed.
- Specific component names ( 'RUDDER','CIC','CARGO','PRESSUREHULL' ) can be referenced.

&nbsp;

- side string
- unitname string
- guid string
- fires string
- flood string
- dp number Damage points
- components table Table of component damage setting { guid, damageLevel }

##### Example

` components={{'16a883a2-8e7f-4313-aae7-0af644c16337','none'},{'rudder','Medium'},{'type',type='sensor',1}}}') `

------------------------------------------------------------------------

<a name="selector_DoctrineSelector"></a>

### DoctrineSelector

Selects a doctrine for a side, mission, group or unit.

- side string The side to select/from
- mission string The name of the mission to select
- unitname string The name of the unit (or group) to select
- actual boolean =true Show the actual doctrine setting based on doctrine inheritance (defaults to only showing non-inherited values)
- escort boolean If a strike mission, adding 'escort=true' will update the escort doctrine

------------------------------------------------------------------------

<a name="selector_DoctrineWRASelector"></a>

### DoctrineWRASelector

Selects a WRA doctrine for on a side, group, mission, or unit. `weapon_id` is mandatory.

One of `side`, `mission`, `unitname` or `guid` is mandatory. One of contact_id or target_type is mandatory

If no `weapon_id` is supplied but just the target_type, then a WRA table (WRA\_#) is returned for each weapon for the doctrine that can engage the target_type

- side string The side to select/from
- mission string The name of the mission to select
- unitname string The name of the unit to select
- guid string The unit GUID to select
- weapon_id string The weapon database id
- contact_id string A contact GUID (mutually exclusive with target_type)
- target_type string The target type (mutually exclusive with contact_id)

------------------------------------------------------------------------

<a name="selector_EventTCAUpdate"></a>

### EventTCAUpdate

Event Trigger/Condition/Action update.

- GUID string The GUID of the trigger
- Description string The description or ID of the T/C/A
- Mode string Operation to do - 'add', 'remove', replace', 'update' (default) SE_Set...()

------------------------------------------------------------------------

<a name="selector_EventUpdate"></a>

### EventUpdate

Event update.

- ID string The GUID of the event \[READONLY\]
- Description string If specified, the new description for the event
- NewName string If specified, the new name of the event
- IsActive boolean If the event is active
- IsRepeatable boolean If the event can occur multiple times
- IsShown boolean If the event is shown in message log
- Probability number Chance of it happening
- Mode string Operation to do - 'add', 'update' (default), 'remove'

------------------------------------------------------------------------

<a name="selector_NewMission"></a>

### NewMission

New mission options.

- type string Mission sub-type (Applies to Patrol and Strike)
- destination string Ferry mission destination
- zone string A table of reference points as names or GUIDs (Can apply to Patrol, Support, Mining, Cargo)

------------------------------------------------------------------------

<a name="selector_NewUnit"></a>

### NewUnit

New unit selector.

... lists minimum fields required. Other fields from[Unit](Wrappers.md#wrapper_Unit) may be included.

- type string The type of unit (Ship, Sub, Aircraft, Facility, Satellite, Weapon)
- unitname string The name of the unit
- side string The side name or GUID to add unit to
- dbid number The database id of the unit
- latitude [Latitude](Overview.md#Latitude) Not required if a`base` is defined
- longitude [Longitude](Overview.md#Longitude) Not required if a`base` is defined
- base string Unit base name or GUID where the unit will be 'hosted' (applicable to AIR, SHIP, SUB)
- loadoutid number Aircraft database loadout id (applicable to AIR)
- altitude number Unit altitude (applicable to AIR)
- depth number Unit depth (applicable to SUBMARINE - note no sign)
- orbit number Orbit index (applicable to SATELLITE)
- guid string Optional custom GUID to override auto one

------------------------------------------------------------------------

<a name="selector_ReferencePointSelector"></a>

### ReferencePointSelector

Reference point selector.

To select reference point(s), specify either

- `name` and`side`, to select a reference point`name` belonging to`side` \[name AND side if possible\] or
- `guid`, if the unique ID of the reference point is known \[preferred\] or
- `area`, table of reference points (name or guid)

GUID method takes precedence over name/side if both present.

- side string The side the reference point is visible to
- name string The name of the reference point
- guid string The unique identifier for the reference point
- area name or GUID Table of reference points by name and/or guid (used with the Set()/Get() functions)

------------------------------------------------------------------------

<a name="selector_SideOption"></a>

### SideOption

Side options.

- side string Side name
- guid string Side guid
- awareness string Side awareness
- proficiency string Side proficiency
- switchto boolean Change game side to above (only applicable with SetSideOptions)

------------------------------------------------------------------------

<a name="selector_SpecialAction"></a>

### SpecialAction

Special action selector.

- GUID string The GUID of the special action \[READONLY\]
- ActionNameOrID string The name or ID of the special action
- IsActive boolean If the action is visible to the player
- IsRepeatable boolean If the player can use the action multiple times
- NewName string If specified, the new name of the action
- Description string If specified, the new description for the action
- Side string The name/GUID of the side for the action. Mandatory for AddSpeciaAction()
- Mode string If specified, the action to apply. Use "mode='remove'" to delete the SA. Use "mode='list'" to list the SAs - all are listed unless 'side=' is supplied.
- ScriptText string The Lua script for the SA. Note as the script is a multi line string, it requires a '\r\n' to be appended after each line so it is formated in the Editor.

------------------------------------------------------------------------

<a name="selector_TargetFilter"></a>

### TargetFilter

Filter by side, type, subtype, unitclass, unit in that order.

- TargetSide string The side name or GUID
- TargetType string Type of unit (ship, sub, etc)
- targetSubType string Subtype of unit ( )
- SpecificUnitClass number Class of unit ( )
- SpecificUnit string Name or GUID of unit

------------------------------------------------------------------------

<a name="selector_TriggerUpdate"></a>

### TriggerUpdate

Trigger update.

- ID string The GUID of the trigger \[READONLY\]
- Description string Description or GUID of trigger
- NewName string If specified, the new name of the trigger
- Mode string Operation to do - 'list', 'add', 'remove', 'update' (default) SE_Set...()
- Type string Type of trigger \[required only for 'add' option\]

**Note:** Other various values apply to the type of trigger.

------------------------------------------------------------------------

<a name="selector_UnitSelector"></a>

### UnitSelector

Select a unit based on either the side and name or the unique identifier (GUID).

You can use either:

- `name` **and** `side`;
- **or** `GUID`.

If both are given, then the `GUID` is used preferentially.

- name string The name of the unit to select
- side string The side of the unit to select
- guid string The guid of the unit to select

------------------------------------------------------------------------

<a name="selector_UpdateUnit"></a>

### UpdateUnit

Lists minimum fields required. Other fields from [Unit](Wrappers.md#wrapper_Unit) may be included. For the 'delta' mode, the function willl look for a matching GUID (or unit name if no GUID match) in the INI file.

- guid string The unit identifier
- mode string The function to perform (add\_ sensor,remove\_ sensor,add\_ mount,remove\_ mount,add\_ weapon,remove\_ weapon,add_comms,remove_comms,add_magazine,remove_magazine,add_magazine_only,delta)
- dbid number The database id of the item to add \[required for 'add\_' mode\]. If used with 'remove\_' mode, and no sensorid/mountid/commsid/magid, the first matching DBID will be removed.
- sensorid string The identifier (guid) of the particular sensor to remove \[required for remove\_ sensor mode\]
- mountid string The identifier (guid) of the particular mount to remove \[required for remove\_ mount mode\]
- weaponid string The identifier (guid) of the particular weapon to remove \[required for remove\_ weapon mode\]. Must have a preceeding mountid to update
- commsid string The identifier (guid) of the particular communication device to remove \[required for remove\_ comms mode\]
- magid string The identifier (guid) of the particular magazine to remove \[required for remove\_ magazine mode\]
- file string File name of the INI delta to apply \[required for delta mode\]
- arc_detect [Arc](DataTypes.md#dataType_Arc) The effective arcs for the particular sensor to detect in \[override defaults\]
- arc_track [Arc](#DataTypes.htmldataType_Arc) The effective arcs for the particular sensor to track/illuminate in \[override defaults\]
- arc_mount [Arc](#DataTypes.htmldataType_Arc) The effective arcs for the particular mount \[override defaults\]

------------------------------------------------------------------------

<a name="selector_UpdateUnitCargo"></a>

### UpdateUnitCargo

Lists minimum fields required. Other fields from [Unit](Wrappers.md#wrapper_Unit) may be included.

- guid string The unit identifier
- mode string The function to perform (add\_ cargo,remove\_ cargo)
- cargoList [{ Cargo }](Overview.md#Cargo) List of cargo to update: table of {guids}, or { {number, DBID}}

------------------------------------------------------------------------

<a name="selector_VPContactSelector"></a>

### VPContactSelector

Contact selector.

- guid string The GUID of the contact. Interrogate VP_GetSide().contacts for the side's contacts and use the GUID from there.

**Note:** A unit and its contact GUIDs are different for the same physical unit. The contact GUIDs represent contacts associated with this unit from the perspective of any detecting sides.

------------------------------------------------------------------------

<a name="selector_Weapon2Magazine"></a>

### Weapon2Magazine

Select magazine and weapon. A group magazine, for example, tend to have multiple magazines, with the same name. So you can specify a particular magazine by the GUID--or leave it out and the function will try to fill up any available space with the weapon.

- side string The side name/GUID of the unit with magazine
- unitname string The name/GUID of unit with magazine
- guid string GUID of the unit with magazine
- mag_guid string The magazine GUID
- wpn_dbid string The weapon database ID
- number number Number to add
- maxcap number Maximum capacity of the weapon to store
- remove boolean If true, this will debuct the number of weapons
- new boolean If true, will add the weapon if it does not exist
- fillout boolean If true, will fill out the weapon record to its maximum

------------------------------------------------------------------------

<a name="selector_Weapon2Mount"></a>

### Weapon2Mount

Select mount and weapon. You can specify a particular mount by the GUID--or leave it out and the function will try to fill up any available space with the weapon.

- side string The side name/GUID of the unit with mount
- unitname string The name/GUID of unit with mount
- guid string GUID of the unit with mount
- mount_guid string The mount GUID
- wpn_dbid string The weapon database ID
- number number Number to add
- remove boolean If true, this will debuct the number of weapons
- fillout boolean If true, will fill out the weapon record to its maximum

<a name="footer"></a>

Copyright © WarfareSims 2020
