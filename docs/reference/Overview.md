<a name="News"></a>

## News

#### Command: Modern Operations v1.10 Beta (Build 1900.5)

- Added ScenEdit_GetGameIsRTMP
- Added ScenEdit_GetSideIsPlayer

#### Lua Documents Update (25 July 2025)

- Added missing pages for

- - ScenEdit_ClearAllMagazines
  - ScenEdit_GetFormation
  - ScenEdit_SetLoadoutAvailable
  - ScenEdit_UpdateRSetting
  - ScenEdit_WeaponAllocation
  - ScenEdit_ResetMessageLog
  - SetScenarioTitle
  - Tool_UIwindow
  - UI_OpenNewDatabaseViewWindow
  - UI_SetCameraView

#### Command: Modern Operations 1.08

- Added packagelist and parentTaskPool to mission wrapper
- Added ability for air/docking facilities to be updated on unit

#### Command: Modern Operations 1.07

- Added Tool_BuildBlankScenario to create a blank scenario
- Added mount magazine to magazine wrapper (see unit magazine table)
- Added to 'No Fire Zone' to zone wrapper (for non-nav)
- Added FocusOnStrike property to strike mission wrapper
- Added ability to create task pool and package under AddMission()

#### Command: Modern Operations 1.06 v1328.13

- Added target property to unit wrapper
- Added TimeOnTargetStaion, TakeOffTime properties to mission wrapper
- Added markedAsDecoy to contact wrapper

#### Command: Modern Operations 1.06 v1328.11

- Added UI_CallAdvancedHTMLDialog()

#### Command: Modern Operations 1.06 v1328.10/CPE 2.2.5

- Added method :GetSensor() to Unit wrapper **[PRO ONLY]**
- Added Tool_SatelliteCoveragePrediction() **[PRO ONLY]**

#### Command: Modern Operations 1.06 v1328.9

- Added cargo types to ScenEdit_UpdateUnitCargo()
- Added add/remove fuel source to ScenEdit_UpdateUnit()

#### Command: Modern Operations v1334

- Added a 'slant' distance option to Tool_Range()

#### Command: Modern Operations v1317

- Added ScenEdit_GetKeyStore() to dump out key store as Lua table
- Added .groupLead to Unit wrapper
- Updated ScenEdit_HostUnitToParent()
- Added UseCustomIntermittentEmissionOnly to wrapper Unit

#### Command: Modern Operations v1309/1307.1

- Add EMCON to ScenEdit_GetDoctrine() list
- Tweaked ScenEdit_AttackContact() to handle course for mode 1 attacks
- Tweaked ScenEdit_AttackContact() to use first availsble mount if none specified

#### Command: Modern Operations v1308

- Add .IsLoadedAsCargo to unit wrapper

#### Command: Modern Operations v1298

- Add .SAR_enabled to unit wrapper
- Add .beingPickedUp to unit wrapper
- Add .pickUpTarget to unit wrapper
- Add .pickedUpBy to unit wrapper

#### Command: Modern Operations v1290

- Add .IsDestroyed to unit wrapper

#### Command: Modern Operations v1288

- Add .noiseLevel and .signature to unit wrapper

#### Command: Modern Operations v1287

- **[PRO ONLY]** ScenEdit_GetSensorData() - recall some sensor data

#### Command: Modern Operations v1283

- Tool_LOS() - permit location points to be used as observer or target

#### Command: Modern Operations v1280

- Added Tool_LOS_Points() - checks the status of the LOS between 2 points

#### Command: Modern Operations v1278

- Added ESM horizon to function Tool_LOS()

#### Command: Modern Operations v1268

- Added function Tool_LOS() for radar/LOS checks

- Added DATEFORMAT to ScenEdit_SetStartTime() for consistency

- Updated Cargo functions - the base Lua cargo wrapper was added in 1268

- - LuaWrapper_ActiveUnit
  - LuaWrapper_Cargo

#### Command: Modern Operations v1266

- Added function Tool_LOS() for radar/LOS checks
- Added DATEFORMAT to ScenEdit_SetStartTime() for consistency

#### Command: Modern Operations v1265

- Added function ScenEdit_SplitUnit() and ScenEdit_MergeUnits of Facility units
- Added function ScenEdit_TransferMount() for buildup/breakdown of Facility units
- Allow setting of a custome formation in ScenEdit_SetUnit()
- Add color to Add/SetReferencePoint and Add/SetZone
- Add endurance to unit wrapper

#### Command: Modern Operations v1260

- Adjusted ScenEdit_SetTime() to be aware of Public/Pro default formats

#### Command: Modern Operations v1243.3 {codename 'Tiny')

This release aligns the Public and Professional version Lua procedures.  
Also the format of the pages has been updated to better align the information and allow more details to be made available.

#### Command: Modern Operations v1147.37

- Added function ScenEdit_GetMissions()
- Updated method on "Scenario" wrapper: Title can be updated now
- Corrected function ScenEdit_SetStartTime()
- New method on "Unit" wrapper - :getwaypoint()
- New wrapper 'waypoints' used by :getwaypoint()

#### Command: Modern Operations v1147.34

- New method on "Loadout" wrapper: setExactWeaponQuantity(string wpn_guid, integer quantity) sets weapon current quantity and returns the resulting quantity.
- New method on "Unit" wrapper: getUnitMagazine(string magazineguid) returns the specified magazine, if magazine exists on unit  
  getUnitMountMagazine(string mountguid) returns the magazine for the specified mount, if mount exists on unit
- Updated method on "Unit" wrapper: filterOnComponent() optional DBID to apply in addition to 'type'

#### Command: Modern Operations v1147.33

- New property on "Unit" wrapper: jammed, jammer, pitch, groundSpeed
- New property on "Unit" wrapper: airbornetime_v, readytime_v, crew
- New property on "Contact" wrapper: lastDetections
- New method on "Scenario" wrapper: ResetLossExp, ResetScore

#### Command: Modern Operations v1147.30

- New property on "Unit" wrapper: isEscort

#### Command: Modern Operations v1147.26

_(30th June 2021)

- New property on "Unit" wrapper: avoidCavitation, readytime, unassign, oldDamagePercent
- New property on "SetUnit" function: AvoidCavitation, TimeToReady_Minutes, Unassign

#### Command: Modern Operations v1147.10

_(11th June 2020)

Build 1147.10 brings new tools to work with sides and their missions:

- New function: VP_GetSides()
- New method on "Side" wrapper: unitsInArea()
- New property on "Side" wrapper: missions

#### Command: Modern Operations v1143.1

_(21st April 2020)

Build 1143.1 provides new features to manage aircraft and their munitions at airbases:

- New function: ScenEdit_DistributeWeaponAtAirbase()
- New function: ScenEdit_ClearAllAircraft()
- New function: ScenEdit_ClearAllMagazines()

#### Command Lua Docs gets a makeover!

_(April 17th 2020)

**After 5 years using the [LDoc format](https://stevedonovan.github.io/ldoc/), the Command Lua API Documentation struts into the 2020's with a sleek new interface, inspired by industry leaders in web documentation.** The new look is accompanied by an extensive re-write and reorganisation of existing content, consolidation of content from various sources, and brand new content to assist Lua newbies and pros alike in their Command Lua adventures.

The old site can be found [here](./oldsite/index.html) for metathesiophobics, however it won't be updated.

<a name="Introduction"></a>

## Introduction

Welcome to the documentation for the Command Lua Application Programming Interface (API). The Command Lua API allows users to control behaviour of Command directly by using the Lua scripting language, providing a flexible and easy to use tool for users to extend or customize the built-in functionality of Command.

### What Can I Do With the Command Lua API?

Since the Command Lua API interfaces directly with the source code of Command, users are provided with the ability to implement virtually any desired behaviour. Some common uses include:

- Precise placement and orientation of units using the console

- Customised message pop-ups

- Randomising gameplay elements such as weather, unit types, positions etc

- Extending existing AI behaviour

- 'Spawning' of units in conjunction with the event editor

- Implementation of additional features, such as:

- - Downed pilots
  - Combat search and rescue
  - 'Purchasing' additional units
  - Extended communications modelling

While the above items are common uses for the Command Lua API, the integration with source code allows users to custom-design virtually any feature or modification that they desire.

<a name="top"></a>

### <a name="HowToUse"></a>How to Use These Docs

Not everyone is a programmer--and even experienced programmers are daunted by dry, wall-of-text documentation. With this in mind, we have taken steps to make the documentation for the Command Lua API accessible to users of all levels of skill, while retaining the depth and detail of technical documentation. To achieve this:

- Examples are offered where practical
- Color coding and linking are used extensively, and
- Simple language is used to explain concepts wherever possible

##### Need Help?

Even the best written documentation is no match for a discussion with an expert. We have a lively community of users of all levels--from casual Lua neophytes to professional users who work with the Command Lua API as their primary job--and the place to get in touch with them is the [Lua Legion](https://www.matrixgames.com/forums/tt.asp?forumid=1681) subforum on the [Official Command Forums](https://www.matrixgames.com/forums/tt.asp?forumid=1154). The forum is actively monitored by WarfareSims staff, and most questions are answered within 24 hours.

##### Found Something Wrong?

We're human too; there are bound to be mistakes or inaccuracies in documentation for live, complex, evolving software. If you find something that is incorrect or unclear, please let us know by dropping us a message on the [Official Discord](), [Twitter](https://twitter.com/warfaresims) or [FaceBook](https://www.facebook.com/WarfareSims/). Better yet, [come join the community](https://www.matrixgames.com/forums/tt.asp?forumid=1154)!

#### Conventions

The following conventions are used throughout this documentation to allow at-a-glance visualisation of data types, code snippets and example code.

- `Code within text` is differentiated from normal text with a border, additional spacing and a console-like font.

- [Parameter]() references appear similar to in-text code with a light blue background. The text links to the relevant documentation (although not in this example, as a parameter can be any of the types below).

- [Selector](Selectors.md) references appear similar to in-text code with a light green background. The text links to the relevant [Selector](#Selectors) documentation.  
  **Note:** This has been mainly replaced by expanding a Selector in a function parameter to the actual parameters used by that function.

- [Wrapper](Wrappers.md) references appear similar to in-text code with a light purple background. The text links to the relevant [Wrapper](#Wrappers) documentation.

- [Table](Tables.md) references appear similar to in-text code with a light orange background. The text links to the relevant [Table](#Tables) documentation.

- {} indicates items in a following list are elements in a Lua table.  
  {} of multiple indicates the Lua table can occur multiple times.  
  **Note:** If there is no 'named' value, then the Lua table would need to be accessed by the \[\] table convention.

- [Data type](DataTypes.md) descriptions appear similar to in-text code with bold font a dark grey background.  
  If the Data Type is not one of the standard Lua data types, the text is white and  
      a) links to the relevant [Data Type](#DataTypes) documentation or  
      b) shows a hover box containing the valid values.  
  Otherwise, the text is color coded to match the appearance of the standard datatype:

  - string
  - boolean
  - number

- **[READ ONLY]** properties are denoted by a tag with the words READ ONLY in all caps, on a yellow background.

- **[PRO ONLY]** functionality is denoted by a tag with the words PRO ONLY in all caps, on a lavender background.

- Sections with long enumerations or data pools have a drop-down carat to show the relevant data. This reduces visual clutter when looking at other items while allowing quick access to data without leaving the page.
  - Here
  - is
  - an
  - example
  - of
  - visual
  - clutter
  - that
  - is
  - hidden
  - with
  - this
  - convention

  

**Note:** Information that is particularly useful or worthy of special mention appears in centered boxes with a blue background.

**Caution:** Advice on common pitfalls appears in centered boxes with a yellow background.

**Warning:** Information that could prevent you from losing work or otherwise disrupting your workflow appears in centered boxes with a red background. **If you see one of these, pay attention!**

### <a name="FirstSteps"></a>First Steps

If you're already familiar with writing scripts in Lua, dive right in and take a look at the [Functions](#Functions) section. This is the meat of the Command Lua API--the direct interface with the source code that makes things happen.

If you're somewhat familiar with programming in general--but not Lua in particular--take a look at the [External Resources](#ExternalResources) for a primer on Lua as a language, then head on over to the [Functions](#Functions) section to get to grips with the tools at your disposal.

<a name="ExternalResources"></a>

### External Resources

The links below contain useful resources for getting started with Lua in general:

- [Tutorials from the Lua Users Wiki](http://lua-users.org/wiki/TutorialDirectory) - The first four tutorials ([Types](http://lua-users.org/wiki/LuaTypesTutorial), [Assignment](http://lua-users.org/wiki/AssignmentTutorial), [Numbers](http://lua-users.org/wiki/NumbersTutorial) and [Strings](http://lua-users.org/wiki/StringsTutorial)) as well as the [Tables](http://lua-users.org/wiki/TablesTutorial) and [Functions](http://lua-users.org/wiki/FunctionsTutorial) tutorials are recommended reading.
- [The Lua Programming WikiBook](https://en.wikibooks.org/wiki/Lua_Programming)
- [Lua 5.3 Reference Manual](https://www.lua.org/manual/5.3/)

**Note:** These references are external to WarfareSims and are subject to change.

<a name="Overview"></a>

## Overview

<a name="CaseSensitivityandConventions"></a>

### Case Sensitivity and Conventions

Lua is a case sensitve language. When accessing object properties directly as in `unit.name`, the property should be in lowercase which will match the Lua generated code.

However, when accessing the properties through the module functions, both the keyword/property and the value are case insensitive; the code will worry about matching them up.

**Note:** There are some special cases where uppercase letters are used to name fields (e.g. `mission.SISH=true` which is a shortcut for `scrub_if_side_human`). These are documented in the relevant wrapper, selector or table documentation.

------------------------------------------------------------------------

<a name="EventHandling"></a>

### Event Handling

An event consists of one or more triggers, an optional set of conditions, and one or actions to perform when the trigger(s) and condition(s) are fulfilled. With Lua, you can create triggers, conditions and actions independently of the editor, and create or modify events with them.

There are separate functions to handle the creation, update and deletion of the components of an event.

#### ScenEdit_SetTrigger( { table } )

As it sounds, a trigger is something that fires off, and results in a success or fail. Apart from a few common keywords, each trigger has a set of keywords.

The common keywords used in the Lua table are:

- **Description** The name given to the trigger. The keyword 'name' can also be used for this.
- **Mode** The type of operation to perform. Operations are 'list', 'add', 'remove', and 'update'.
- **ID** The GUID used to reference the trigger. This is used internally and is only for reference.

The trigger related keywords are listed below.

| Trigger type | Keyword | Comment |
|---|---|---|
| Points | SideID | Side to adjust points for |
|  | PointValue | Current points |
|  | ReachDirection | GoOver = 0, MatchExactly = 1, GoUnder = 2 |
| RandomTime | EarliestTime | Earliest date/time to start checks |
|  | LatestTime | Latest date/time to stop checks |
| RegularTime | Interval | Time interval (1 sec, 2sec, 5sec, etc) |
| ScenEnded |  | No additional keywords |
| ScenLoaded |  | No additional keywords |
| Time | Time | Actual date/time to fire on |
| UnitDamaged | DamagePercent |  |
|  | TargetFilter | See below |
| UnitDestroyed | TargetFilter | See below |
| UnitDetected | TargetFilter | See below |
|  | DetectorSideID | Side doing the detecting |
|  | MCL | Minimum classification level |
|  | Area | Table of reference points |
| UnitEmissions | TargetFilter | See below |
|  | DetectorSideID | Side doing the detecting |
|  | Area | Table of reference points |
|  | MCL | Minimum classification level |
| UnitEntersArea | TargetFilter | See below |
|  | Area | Table of reference points |
|  | ETOA | Earliest date/time of arrival |
|  | LTOA | Latest date/time of arrival |
|  | NOT | Not in the area |
|  | ExitArea | Leaving area |
| UnitRemainsInArea | TargetFilter | See below |
|  | Area | Table of reference points |
|  | TD | Time to remain in area in seconds (or as days:hours:minutes:seconds) |
| UnitBaseStatus | TargetFilter | See below |
|  | TargetBase | [Optional] The base name/guid to monitor a/c or ships on, or all bases if not present |
|  | TargetCondition | Status number to monitor |
| UnitCargoMoved | CargoFilter | See below |
|  | TargetLimitReceived | Number received to trigger |
|  | TargetLimitSent | Number sent to trigger |

<a name="hook_TargetFilter"></a>

##### TargetFilter

A series of filters to apply to units. Only units matching this filter will fire the trigger.

| TargetFilter | Keyword | Comment |
|---|---|---|
|  | TargetSide | Side to fillter on |
|  | TargetType | Type of unit (ship, submarine, etc) |
|  | TargetSubType | Subtype of the above unit type |
|  | SpecificUnitClass | Unit class (DBID) |
|  | SpecificUnitID | Actual unit |

Note that side is mandatory, but you can specify a unit or type/sub/class. However, if using type/sub/class, you can use

- type, or
- type and subtype, or
- type, subtype (optional as it is inferred from class) and class.

##### TargetType

|  |  |
|---|---|
| Aircraft | 1 |
| Ship | 2 |
| Submarine | 3 |
| Facility | 4 |
| Aimpoint | 5 |
| Weapon | 6 |
| Satellite | 7 |

##### CargoFilter

A series of filters to apply to cargo items, similar to the TargetFilter.

| CargoFilter | Keyword | Comment |
|---|---|---|
|  | TargetType | Type of cargo item (personel[1000],etc) |
|  | SpecificUnitClass | Cargo class (DBID) |
|  | SpecificUnitID | Actual cargo item |

##### TargetType

|  |  |
|---|---|
| Aircraft | 1 |
| Ship | 2 |
| Submarine | 3 |
| Facility | 4 |
| Aimpoint | 5 |
| Weapon | 6 |
| Satellite | 7 |

##### Examples

Create a trigger for a specific unit leaving an area

`local a = ScenEdit_SetTrigger({mode='add',`  
`type='UnitEntersArea',`  
`name='Sagami exiting hot zone',`  
`targetfilter={SPECIFICUNIT='AOE 421 Sagami'},`  
`area={'rp-1126','rp-1127','rp-1128','rp-1129'},`  
`exitarea=true})`

**Note:** The variable `a` will contain the trigger information. It will be `nil` if the trigger failed in a non-interactive script as in an event.

Rename the trigger to *'any type of AOE entering hot zone'*

`local a = ScenEdit_SetTrigger({mode='update',`  
`type='UnitEntersArea',`  
`name='Sagami exiting hot zone',`  
`rename='Any AOE entering hot zone',`  
`targetfilter={TargetSubType = '5023',TargetType = '2',TargetSide='sidea'},`  
`area={'rp-1126','rp-1127','rp-1128','rp-1129'},`  
`exitarea=false})`

Remove the trigger named *'any type of AOE entering hot zone'*

`local a = ScenEdit_SetTrigger({mode='remove',type='UnitEntersArea',name='Any AOE entering hot zone'})`

**Note:** If the trigger is assigned to an event, it can't be removed until removed from the event.

------------------------------------------------------------------------

#### ScenEdit_SetCondition( { table } )

As it sounds, a condition is something that can be further applied once the trigger has fired, and results in a success or fail. Apart from a few common keywords, each condition has a set of keywords.

The common keywords used in the Lua table are:

- **Description:** the name given to the condition. The keyword 'name' can also be used for this.
- **Mode:** type of operation to perform. Operations are 'list', 'add', 'remove', and 'update'.
- **ID:** the GUID used to reference the condition. This is used internally and is only for reference.

The condition related keywords are listed below.

| Condition type | Keyword | Comment |
|---|---|---|
| LuaScript | ScriptText | A Lua script |
| ScenHasStarted | NOT | A NOT modifier for scenario NOT started yet |
| SidePosture | ObserverSideID | Side that views TargetSide as ... |
|  | TargetSideID |  |
|  | TargetPosture |  |
|  | NOT | A NOT modifier to change condition from true to false |

**Caution:** For scripts, use `'\r\n'` to represent new lines, otherwise a multi-line script may not run.

`ScriptTest='--comment\r\nif unit ~= nil then\r\n return true\r\n else\r\n return false\r\n end'`

##### Examples

Create a condition for sideA being hostile to sideB

` local a = ScenEdit_SetCondition({mode='add',`  
`type='SidePosture',`  
`name='sideA hostile to sideB',`  
`ObserverSideId='sidea',`  
`TargetSideId='sideb',`  
`targetposture='hostile'}) `

**Note:** The variable `a` will contain the trigger information. It will be `nil` if the trigger failed in a non-interactive script as in an event.

------------------------------------------------------------------------

#### ScenEdit_SetAction( { table } )

As it sounds, a action is something that will be done once the trigger (and condition) are successful. Apart from a few common keywords, each action has a set of keywords.

The common keywords used in the Lua table are:

- **Description:** the name given to the condition. The keyword 'name' can also be used for this.
- **Mode:** type of operation to perform. Operations are 'list', 'add', 'remove', and 'update'.
- **ID:** the GUID used to reference the condition. This is used internally and is only for reference.

The action related keywords are listed below.  

| Action type | Keyword | Comment |
|---|---|---|
| ChangeMissionStatus | MissionID | Mission identifier |
|  | NewStatus | New status - active(0) or inactive (1) |
| EndScenario |  | No additional keywords |
| LuaScript | ScriptText | A Lua script |
| Message | SideID | Side to see message |
|  | Text | Message text to show |
| Points | PointChange | Value to change points by (+/-) |
|  | SideID | Side affected |
| TeleportInArea | UnitIDs | Table of unit GUIDs |
|  | Area | Table of reference points |

**Caution:** For scripts, use `'\r\n'` to represent new lines, otherwise a multi-line script may not run.

##### Examples

Create a action changes points on SideA

` local a = ScenEdit_SetAction({mode='add', type='Points', name='sideA loses some ..', SideId='sidea', PointChange=-10}) `

**Note:** The variable `a` will contain the trigger information. It will be `nil` if the trigger failed in a non-interactive script as in an event.

------------------------------------------------------------------------

#### Modifying Events

Triggers, conditions and actions (TCA) can be linked to events. A common format is followed for each one.

- \(a\) [ScenEdit_SetEventTrigger( eventName, { table } )](#ScenEdit_SetEventTrigger)
- \(b\) [ScenEdit_SetEventCondition( eventName, { table } )](#ScenEdit_SetEventCondition)
- \(c\) [ScenEdit_SetEventAction( eventName, { table } )](#ScenEdit_SetEventAction)

The common keywords used in the Lua table are:

- **Description:** The name given to the TCA. The keyword 'name' can also be used for this.
- **Mode:** The type of operation to perform. Operations are 'add', 'remove', and 'replace'.
- **ID:** The GUID used to reference the TCA. This is used internally and is only for reference.

The functions will return the TCA on a success as with the commands above. For the mode='replace', there is an extra keyword 'ReplacedBy' that swaps the old TCA with the new one. The previous one is returned by the function

##### Examples

Add a new action to an existing event

`local a = ScenEdit_SetEventAction('test event', {mode='add', name='test action points'})`

**Note:** The variable `a` will contain the trigger information. It will be `nil` if the trigger failed in a non-interactive script as in an event.

Replace an action in an existing event

`local a = ScenEdit_SetEventAction('test event', {mode='replace', name='test action message', replaceby='test action points'})`

Events can also be created and modified through Lua: `ScenEdit_SetEvent( eventName, { table } )`

The common keywords used in the Lua table are:

- **Description:** The name given to the Event. The keyword 'name' can also be used for this.
- **Mode:** The type of operation to perform. Operations are 'add' and 'update'.
- **ID:** The GUID used to reference the Event. This is used internally and is only for reference.

The normal Event keywords are accepted in the 'table'.

##### Examples

Add a new event

`local a = ScenEdit_SetEvent('my new event', {mode='add'})`

**Note:** The variable `a` will contain the trigger information. It will be `nil` if the trigger failed in a non-interactive script as in an event.

The `ScenEdit_SetEvent(Trigger/Condition/Action)` functions then can be run on the new Event to add the required TCAs. In addtion, `ScenEdit_GetEvent(EventDescriptionOrID, level)` has been updated to return information on the Event.

Use level as:

- 0 - all details,
- 1 - triggers,
- 2 - conditions,
- 3 - actions,
- 4 - event detail

Special variables:

- `_enumTable_` List of enumerated variable names and values
- `_errfnc_` Lua Function in which error occurred
- `_errmsg_` Error message from Lua Function failure

------------------------------------------------------------------------

<a name="Globals"></a>

### Global Keywords

Command Lua provides several global keywords that can be useful for file handling and/or reading and writing output from your scripts.

- `_scriptfolder_`: the full path to the folder location of the executing lua script file, or an empty string if the script was not loaded from a lua script file (i.e. run from console, as part of an event action, etc.)
- `_scenariofolder_`: the full path to the folder from which the current scenario file was loaded. An empty string is returned if current scenario was not loaded from a scen or save file (i.e. it is a new scenario that has never been saved.)
- `_outputfolder_`: the full path to the root folder under which any event exporter (Pro-only) output will be written. It returns an empty string if no output folder is set.

------------------------------------------------------------------------

<a name="ErrorHandling"></a>

### Error Handling

Usually when a Lua script fails, an error is thrown that ends the script at that point. While this may be okay in most cases, it is not often desired.

Whenever a Command Lua function gets an error, it will normally return `nil`, and the error message will be available as Lua global variables:

- `_errmsg_`: the last error message
- `_errfnc_`: the Command Lua function that gave the error
- `_errnum_`: the error code (0 is no error, and any value \>0 will be an error)

Thus if you get back `nil`, you can check to see if that is due to an error or no data.

**Note:** Due to how errors are now handled from SR7, if a command fails in the console window, it will show an error. If the command runs outside the console (as in an event script), it will not fail with a visible error but return a nil or or some other value.

##### Example

Without the new error handling, the script below would terminate after the `ScenEdit_AddMission()` function and the rest of script would not run.

` local mission = ScenEdit_AddMission ( 'USA', 'Marker strike', 'strike', { type = 'land' } )`  
`if mission == nil then`  
`    if _errnum_ ~= 0 then`  
`        print ( 'Failed to add:' .. _errmsg_ )`  
`    else`  
`        print ( 'Something else' )`  
`    end`  
`else`  
`    print ( mission )`  
`end `

**Caution:** One issue with commands running in an event is that sometimes they fail with an in-game message that actually stops the rest of the script from running. **Now these event scripts will run without any in-game message showing.** The designer should check the result of the command and handle any error condition, and let the remaining script run as needed.

The design intent is to have all command errors behave in the same fashion in the console window; and the command errors outside a console behave without stopping the script. Which requires the designer to cater for the specific error conditions.

To emulate the expected outcome from an event, put 'Tool_EmulateNoConsole(true)' at the start of the script to be tested; it is not required in the event code as the script is already not running in a console.

Note also, that the Lua history log should also record the event script errors.

------------------------------------------------------------------------

<a name="DateTimeStamp"></a>

### Date and Time \[WORK IN PROGRESS\]

A new way to handle date and time stamps from build 1825+.  

  

Due to the different ways the date and time formats exist in the world, a new approach has been taken to allow more flexible ways to pass this to Lua.  
Most of the ScenEdit functions containing date and time have always had a 'dateformat' parameter to define  
how the date would be passed - DDMMYYYY, MMDDYYYY or YYYYMMDD.  

  

The dates in the object wrappers generally were fixed to one of those formats as there was no 'dateformat' parameter.  
These changes are to assist mainly with setting date/time in a wrapper, such as in the case for mission date/times  
where the default date format is fixed as DDMMYYYY.  
`mission.starttime='09/06/2026 01:30:00'`  

  

The new approach allows the user to explicitly tell the program how to interpret the date/time string by entering the format after a '!' in the parameter, as in ` "2027-06-09 1:30:00`**`!yyyy-MM-dd HH:mm:ss`**` "`  

  

There are some predefined formats which don't require the additional '!' format.  
These will list here shortly.  

  

The changes should be usable in ScenEdit functions also.  

  
  

##### Examples

` local m = ScenEdit_GetMission('sidea', 'test support')`  
`print(m)`  
`m.starttime = "2027-06-09 1:30:00!yyyy-MM-dd HH:mm:ss"`  
`print(m.starttime)`  
`--local d = '03/12/2025 09:03:00!dd/MM/yyyy H:mm:ss'`  

<a name="footer"></a>

Copyright © WarfareSims 2020
