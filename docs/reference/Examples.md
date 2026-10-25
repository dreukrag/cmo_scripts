# <a name="Example_Wrapper_Contact"></a>Wrapper Contact

## Retreiving the Contact details

` `

------------------------------------------------------------------------

# <a name="Example_Wrapper_Doctrine"></a>Wrapper Doctrine

## Retreiving the mission doctrine object

` local d = ScenEdit_GetDoctrine( { side='united states', mission='AEW East' } )`  
`print(d)`  
  

{ unrep_selection = '2' }  

local d = ScenEdit_GetDoctrine({side='united states',mission='AEW East',actual='yes'})  
print(d)  
  

{  
weapon_control_status_land = '2', weapon_state_planned = '0', navigation_land = '0', engage_opportunity_targets = '0',  
dive_on_threat = '0', weapon_control_status_air = '2', bvr_logic = '1', gun_strafing = '0', recharge_on_attack = '10',  
automatic_evasion = '1', bingo_threshold = '3', fuel_state_rtb = '2', unrep_selection = '2', quick_turnaround_for_aircraft = '1',  
maintain_standoff = '1', avoid_contact = '0', use_nuclear_weapons = '0', recharge_on_patrol = '60',  
kinematic_range_for_torpedoes = '1', ignore_emcon_while_under_attack = '1', weapon_state_rtb = '0', dipping_sonar = '0',  
deploy_on_damage = '1', ignore_plotted_course = '0', jettison_ordnance = '0', weapon_control_status_subsurface = '2',  
navigation_surface = '0', withdraw_on_attack = '0', deploy_on_defence = '5', rtb_when_winchester = '0', deploy_on_fuel = '5',  
withdraw_on_defence = '0', withdraw_on_fuel = '1', use_aip = '1', use_refuel_unrep = '1', use_sams_in_anti_surface_mode = '1',  
air_operations_tempo = '0', engaging_ambiguous_targets = '2', fuel_state_planned = '0', refuel_unrep_allied = '0',  
weapon_control_status_surface = '2', deploy_on_attack = '5', withdraw_on_damage = '0'  
}

------------------------------------------------------------------------

# <a name="Example_Wrapper_DoctrineWRA"></a>Wrapper DoctrineWRA

## Retreiving a Doctrine WRA

There is a WRA\_??? item for each weapon system in the LEVEL selected, in this case a unit, and for the type of target selected ( 2000 = 'Aircraft_Unspecified').  
It can be filtered by using the weapon DBID in which case the WEAPON_DBID and WEAPON_NAME (from WRA) will be shown on the parent side with LEVEL and TARGET_TYPE.

` local a = local a = ScenEdit_GetDoctrineWRA({guid='a1a52edf-3541-4b55-bea4-58d4e1ab11dc',target_type=2000})`  
`print(a)`  

{  
LEVEL = 'UNIT',  
WRA_2 = { WEAPON_DBID = 858, QTY_SALVO = 'Max', WEAPON_NAME = '76mm/62 Compact HE Burst \[4 rnds\]', SHOOTER_SALVO = 'Max', FIRING_RANGE = 'Max', SELF_DEFENCE = 'Max' },  
WRA_1 = { WEAPON_DBID = 1630, QTY_SALVO = 'Max', WEAPON_NAME = '20mm/85 Mk15 Phalanx Blk 1 Burst \[300 rnds\]', SHOOTER_SALVO = 'Max', FIRING_RANGE = 'Max', SELF_DEFENCE = 'Max' },  
WRA_3 = { WEAPON_DBID = 926, QTY_SALVO = 1, WEAPON_NAME = 'RIM-162C ESSM', SHOOTER_SALVO = 1, FIRING_RANGE = 'Max', SELF_DEFENCE = 5 },  
TARGET_TYPE = Aircraft_Unspecified  
}

------------------------------------------------------------------------

# <a name="Example_Wrapper_Event"></a>Wrapper Event

## 1. Showing the full attributes of the event

` local a = ScenEdit_GetEvent( "Aircraft entering ship's exclusion zone" )`  
`for k,v in pairs(a.fields) do`  
` if string.find(k,'property_') ~= nil then -- is a property`  
`  local vt = {}`  
`  local i = 0`  
`  for w in string.gmatch(v,'%g+[^, ]') do`  
`   vt[i] = w`  
`   i=i+1`  
`  end`  
`  print("\r\n[object] = " .. string.sub(vt[0],2) ) -- property name`  
`  if vt[3] == 'True' then`  
`   print( a[ string.sub(vt[0],2) ] ) -- value of property`  
`  else`  
`   print( 'no get function' ) -- value of property`  
`  end`  
` end`  
`end`  
  

\[object\] = description  
Aircraft entering ship's exclusion zone  
  
\[object\] = isActive  
'Yes'  
  
\[object\] = guid  
dc7a2fe6-4786-4e8f-ba04-f7d152c39265  
  
\[object\] = probability  
100  
  
\[object\] = details  
{ conditions = { \[1\] = { LuaScript = { ID = '8635d4bd-5642-4b9b-af0f-877953f25459', Description = 'Detected by SideB', ScriptText = 'local answer = false  
local unit = ScenEdit_UnitX();  
print(unit)  
--local unit = ScenEdit_GetUnit({name='Happy \#1', guid='3d9e9a78-091f-4745-b48d-0fbaba6fe8ce'})  
local contacts = unit.ascontact -- what other sides see me as  
print(contacts)  
local base = ScenEdit_GetUnit({name='DDG 138 Taizhou \[Pr.956ME Sovremenny\]', guid='4761b40d-01e0-416c-a3e9-43880de92c3c'}) -- unit doing the detecting  
local side = VP_GetSide({side=base.side}).guid; print(side)  
for x = 1, \#contacts do  
if contacts\[x\].side == side then  
-- contact on my side  
local mycontact = contacts\[x\].guid  
local con = ScenEdit_GetContact({side = contacts\[x\].side, guid = contacts\[x\].guid}); print(con);print(con.posture)  
answer=true  
end  
end  
return answer' } } }, actions = { \[1\] = { type = 'LuaScript', LuaScript = { ID = '4594c3bf-421d-43cd-a077-7f0d40294ae6', Description = 'Change posture', ScriptText = 'local unit = ScenEdit_UnitX();  
print(unit)  
--local unit = ScenEdit_GetUnit({name='Happy \#1', guid='3d9e9a78-091f-4745-b48d-0fbaba6fe8ce'})  
local contacts = unit.ascontact -- what other sides see me as  
print(contacts)  
local base = ScenEdit_GetUnit({name='DDG 138 Taizhou \[Pr.956ME Sovremenny\]', guid='4761b40d-01e0-416c-a3e9-43880de92c3c'}) -- unit doing the detecting  
local side = VP_GetSide({side=base.side}).guid; print(side)  
local answer = false  
for x = 1, \#contacts do  
if contacts\[x\].side == side then  
-- contact on my side  
local mycontact = contacts\[x\].guid  
local con = ScenEdit_GetContact({side = contacts\[x\].side, guid = contacts\[x\].guid}); print(con);print(con.posture)  
-- distance between my unit and the contact  
local dist = base:rangetotarget( mycontact)  
if dist ~= nil and dist \< 10 then  
print('target in range (' .. dist ..'NM)')  
if con.side == nil then  
con.posture = 'H'  
else  
con.posture = 'U'  
end  
answer=true  
else  
print('target not in range (' .. dist ..'NM)')  
end  
end  
end  
' } } }, triggers = { \[1\] = { UnitEntersArea = { ID = '580d7284-cb24-474b-a137-3e5f4aa2338f', LTOA = '636299676000000000', TargetFilter = { ID = '44117c69-a74e-4697-ac60-31e534546001', TargetSubType = '0', TargetSide = '2c728e58-fc85-4c9d-952c-b62a195b2051', TargetType = '1' }, Area = { RPoint2 = { RD = '21.79107', ColorR = '255', ColorB = '255', ID = '073a5227-9cde-4b4d-9020-f78aa12297f4', IH = 'True', Lat = '33.879419548290649', Lon = '139.09893527841047', Name = 'RP-3006', ColorG = '255', IRT = '4761b40d-01e0-416c-a3e9-43880de92c3c', RB = '126.9126' }, RPoint1 = { RD = '23.86684', ColorR = '255', ColorB = '255', ID = '18bb5404-de45-4c9e-bec3-33a4fd904c9f', IH = 'True', Lat = '34.368804155042334', Lon = '139.10100045240316', Name = 'RP-3005', ColorG = '255', IRT = '4761b40d-01e0-416c-a3e9-43880de92c3c', RB = '46.89403' }, RPoint = { RD = '23.26058', ColorR = '255', ColorB = '255', ID = '3f563b7f-9236-4b14-a1d4-7299dfe395da', IH = 'True', Lat = '34.36889226716081', Lon = '138.41511917002865', Name = 'RP-3004', ColorG = '255', IRT = '4761b40d-01e0-416c-a3e9-43880de92c3c', RB = '314.5287' }, RPoint3 = { RD = '21.12538', ColorR = '255', ColorB = '255', ID = 'db940f3e-1112-4e55-ae89-59772b27c526', IH = 'True', Lat = '33.879523369216351', Lon = '138.41698363796547', Name = 'RP-3007', ColorG = '255', IRT = '4761b40d-01e0-416c-a3e9-43880de92c3c', RB = '231.7307' } }, Description = 'Aircraft enters exclusion zone', ETOA = '635984136000000000' } }, \[2\] = { UnitRemainsInArea = { ID = '9aa99e0c-9f67-4d3c-ae24-29a327b548d3', TargetFilter = { ID = '3fd45ed7-fc36-4807-923f-7299631a29c0', TargetSubType = '0', TargetSide = '2c728e58-fc85-4c9d-952c-b62a195b2051', TargetType = '1' }, Area = { RPoint = 'db940f3e-1112-4e55-ae89-59772b27c526' }, TD = '120', Description = 'Aircraft remains in exclsuion zone', TA = '0' } } }, isShown = 'Yes', guid = 'dc7a2fe6-4786-4e8f-ba04-f7d152c39265', isRepeatable = 'Yes', isActive = 'Yes', description = 'Aircraft entering ship's exclusion zone', probability = 100 }  
  
\[object\] = isShown  
True  
  
\[object\] = conditions  
{ \[1\] = { LuaScript = { ID = '8635d4bd-5642-4b9b-af0f-877953f25459', Description = 'Detected by SideB', ScriptText = 'local answer = false  
local unit = ScenEdit_UnitX();  
print(unit)  
--local unit = ScenEdit_GetUnit({name='Happy \#1', guid='3d9e9a78-091f-4745-b48d-0fbaba6fe8ce'})  
local contacts = unit.ascontact -- what other sides see me as  
print(contacts)  
local base = ScenEdit_GetUnit({name='DDG 138 Taizhou \[Pr.956ME Sovremenny\]', guid='4761b40d-01e0-416c-a3e9-43880de92c3c'}) -- unit doing the detecting  
local side = VP_GetSide({side=base.side}).guid; print(side)  
for x = 1, \#contacts do  
if contacts\[x\].side == side then  
-- contact on my side  
local mycontact = contacts\[x\].guid  
local con = ScenEdit_GetContact({side = contacts\[x\].side, guid = contacts\[x\].guid}); print(con);print(con.posture)  
answer=true  
end  
end  
return answer' } } }  
  
\[object\] = triggers  
{ \[1\] = { UnitEntersArea = { ID = '580d7284-cb24-474b-a137-3e5f4aa2338f', LTOA = '636299676000000000', TargetFilter = { ID = '44117c69-a74e-4697-ac60-31e534546001', TargetSubType = '0', TargetSide = '2c728e58-fc85-4c9d-952c-b62a195b2051', TargetType = '1' }, Area = { RPoint2 = { RD = '21.79107', ColorR = '255', ColorB = '255', ID = '073a5227-9cde-4b4d-9020-f78aa12297f4', IH = 'True', Lat = '33.879419548290649', Lon = '139.09893527841047', Name = 'RP-3006', ColorG = '255', IRT = '4761b40d-01e0-416c-a3e9-43880de92c3c', RB = '126.9126' }, RPoint1 = { RD = '23.86684', ColorR = '255', ColorB = '255', ID = '18bb5404-de45-4c9e-bec3-33a4fd904c9f', IH = 'True', Lat = '34.368804155042334', Lon = '139.10100045240316', Name = 'RP-3005', ColorG = '255', IRT = '4761b40d-01e0-416c-a3e9-43880de92c3c', RB = '46.89403' }, RPoint = { RD = '23.26058', ColorR = '255', ColorB = '255', ID = '3f563b7f-9236-4b14-a1d4-7299dfe395da', IH = 'True', Lat = '34.36889226716081', Lon = '138.41511917002865', Name = 'RP-3004', ColorG = '255', IRT = '4761b40d-01e0-416c-a3e9-43880de92c3c', RB = '314.5287' }, RPoint3 = { RD = '21.12538', ColorR = '255', ColorB = '255', ID = 'db940f3e-1112-4e55-ae89-59772b27c526', IH = 'True', Lat = '33.879523369216351', Lon = '138.41698363796547', Name = 'RP-3007', ColorG = '255', IRT = '4761b40d-01e0-416c-a3e9-43880de92c3c', RB = '231.7307' } }, Description = 'Aircraft enters exclusion zone', ETOA = '635984136000000000' } }, \[2\] = { UnitRemainsInArea = { ID = '9aa99e0c-9f67-4d3c-ae24-29a327b548d3', TargetFilter = { ID = '3fd45ed7-fc36-4807-923f-7299631a29c0', TargetSubType = '0', TargetSide = '2c728e58-fc85-4c9d-952c-b62a195b2051', TargetType = '1' }, Area = { RPoint = 'db940f3e-1112-4e55-ae89-59772b27c526' }, TD = '120', Description = 'Aircraft remains in exclsuion zone', TA = '0' } } }  
  
\[object\] = isRepeatable  
True  
  
\[object\] = actions  
{ \[1\] = { type = 'LuaScript', LuaScript = { ID = '4594c3bf-421d-43cd-a077-7f0d40294ae6', Description = 'Change posture', ScriptText = 'local unit = ScenEdit_UnitX();  
print(unit)  
--local unit = ScenEdit_GetUnit({name='Happy \#1', guid='3d9e9a78-091f-4745-b48d-0fbaba6fe8ce'})  
local contacts = unit.ascontact -- what other sides see me as  
print(contacts)  
local base = ScenEdit_GetUnit({name='DDG 138 Taizhou \[Pr.956ME Sovremenny\]', guid='4761b40d-01e0-416c-a3e9-43880de92c3c'}) -- unit doing the detecting  
local side = VP_GetSide({side=base.side}).guid; print(side)  
local answer = false  
for x = 1, \#contacts do  
if contacts\[x\].side == side then  
-- contact on my side  
local mycontact = contacts\[x\].guid  
local con = ScenEdit_GetContact({side = contacts\[x\].side, guid = contacts\[x\].guid}); print(con);print(con.posture)  
-- distance between my unit and the contact  
local dist = base:rangetotarget( mycontact)  
if dist ~= nil and dist \< 10 then  
print('target in range (' .. dist ..'NM)')  
if con.side == nil then  
con.posture = 'H'  
else  
con.posture = 'U'  
end  
answer=true  
else  
print('target not in range (' .. dist ..'NM)')  
end  
end  
end  
' } } }  
  
\[object\] = name  
nil  

## 2. Retreiving some details from the Event

` local f = ScenEdit_EventX() -- the event that has triggered`  
`print("EventID: " .. string.format('%s (\'%s\')',f.description, f.guid))`  
`print("Active: " .. string.format('%s',f.isActive))`  
`print("Shown: " .. string.format('%s',f.isShown))`  
`print("Repeats: " .. string.format('%s',f.isRepeatable))`  
`print("Trigger(s):")`  
`print(f.triggers)`  
`print("Conditions(s):")`  
`print(f.conditions)`  
`print("Action(s):")`  
`print(f.actions)`  
  

EventID: Turkish FFG destroyed ('cf4eb993-25bd-4626-a944-b2b3cf6ae3b6')  
Active: true  
Shown: False  
Repeats: True  
Trigger(s)  
{ \[1\] = { UnitDestroyed = { TargetFilter = { TargetType = '2', TargetSubType = '3303', ID = '88b4407d-f90f-4161-abea-357a69a66f13', TargetSide = '257e0c83-c955-4ab8-841b-49a46544b54f' }, ID = '4e5f16f3-8e65-40fe-b7e0-f95e99910eb1', Description = 'Turkish FFG destroyed' } } }  
Conditions(s)  
{ }  
Action(s)  
{ \[1\] = { Points = { Description = 'United States plus 01000 points', SideID = '2b7905cd-e798-494b-95fb-a01f5d9f4eec', ID = 'b1a3e26e-5c88-48a5-a866-88a7f7d737df', PointChange = '1000' }, type = 'Points' } }  

  
The active event has one trigger (UnitDestroyed) and one action (update points).

------------------------------------------------------------------------

# <a name="Example_Wrapper_Flight"></a>Wrapper Flight

## Retrieving a mission flights

` local m = ScenEdit_GetMission('BLUE','STRIKE')`  
`print(m.flightlist)`  

{ \[1\] = flight {  
guid = 'WT2BOY-0HNGTRKT3R1B9', name = 'Zombie21', course = 'table' },  
\[2\] = flight {  
guid = 'WT2BOY-0HNGTRKT3R1BL', name = 'Bat93', course = 'table' }  
}

## Retrieving a mission flight course

` local m = ScenEdit_GetMission('BLUE','STRIKE')`  
`print(m.flightlist[1].course)`  

{  
\[1\] = { latitude = 31.34, Name = 'Take-Off', DesiredAltitude = '609.6', TypeOf = 'TakeOff', Zulu = '20260222074857', Category = 'FlightPlan', PresetThrottle = 'Loiter', Description = '1', DesiredSpeed = '350', longitude = -82.73, GUID = 'WT2BOY-0HNGTRKT3R1BA' },  
\[2\] = { latitude = 31.5336110622656, Name = 'Hold Start', DesiredAltitude = '609.6', TypeOf = 'HoldStart', Zulu = '20260222075057', Category = 'FlightPlan', PresetThrottle = 'Loiter', Description = '2', DesiredSpeed = '350', longitude = -82.7480391781246, GUID = 'WT2BOY-0HNGTRKT3R1BB' },  
\[3\] = { latitude = 31.7716837201755, Name = 'Hold End', DesiredAltitude = '10972.8', TypeOf = 'HoldEnd', Zulu = '20260222075857', Category = 'FlightPlan', PresetThrottle = 'Cruise', Description = '3', DesiredSpeed = '480', longitude = -82.83656280014, GUID = 'WT2BOY-0HNGTRKT3R1BC' },  
\[4\] = { DesiredAltitudeTF = '0', latitude = 31.4474025820786, PresetThrottle = 'Cruise', DesiredAltitude = '10972.8', TypeOf = 'StrikeIngress', Zulu = '20260222075938', Category = 'FlightPlan', Name = 'Turning Point (Ingress)', Description = '4', DesiredSpeed = '480', longitude = -82.7168745136583, GUID = 'WT2BOY-0HNGTRKT3R1BE' },  
\[5\] = { DesiredAltitudeTF = '0', latitude = 29.0413181565301, PresetThrottle = 'Cruise', DesiredAltitude = '10972.8', TypeOf = 'WeaponLaunch', Zulu = '20260222082714', Category = 'FlightPlan', Name = 'Weapon Launch', Description = '5', DesiredSpeed = '480', longitude = -85.9351066028473, GUID = 'WT2BOY-0HNGTRKT3R1BF' },  
\[6\] = { latitude = 26.13, Name = 'Weapon Target', DesiredAltitude = '10972.8', TypeOf = 'WeaponTarget', Zulu = '20260222082807', Category = 'FlightPlan', PresetThrottle = 'Cruise', Description = '-', DesiredSpeed = '480', longitude = -80.9183333333333, GUID = 'WT2BOY-0HNGTRKT3R1BG' },  
\[7\] = { latitude = 31.4474064758234, Name = 'Turning Point (Egress)', DesiredAltitude = '10972.8', TypeOf = 'StrikeEgress', Zulu = '20260222085544', Category = 'FlightPlan', PresetThrottle = 'Cruise', Description = '6', DesiredSpeed = '480', longitude = -82.7168585268741, GUID = 'WT2BOY-0HNGTRKT3R1BH' },  
\[8\] = { latitude = 31.1735241174604, Name = 'Landing Marshal Point', DesiredAltitude = '914.4', TypeOf = 'LandingMarshal', Zulu = '20260222085959', Category = 'FlightPlan', PresetThrottle = 'Cruise', Description = '7', DesiredSpeed = '480', longitude = -82.73, GUID = 'WT2BOY-0HNGTRKT3R1BI' },  
\[9\] = { latitude = 31.34, Name = 'Land', DesiredAltitude = '0', TypeOf = 'Land', Zulu = '20260222090142', Category = 'FlightPlan', PresetThrottle = 'Loiter', Description = '8', DesiredSpeed = '350', longitude = -82.73, GUID = 'WT2BOY-0HNGTRKT3R1BJ' }  
}

## Retrieving a mission flight course by waypoint wrapper

` local m = ScenEdit_GetMission('BLUE','STRIKE')`  
`print(m.flightlist[1].coursewrapper)`  

{  
\[1\] = waypoint { type = 'TakeOff', name = 'Take-Off', description = '1', guid = 'WT2BOY-0HNGTRKT3R1BA', time = '20260222074857', latitude = '31.34', longitude = '-82.73', },  
\[2\] = waypoint { type = 'HoldStart', name = 'Hold Start', description = '2', guid = 'WT2BOY-0HNGTRKT3R1BB', time = '20260222075057', latitude = '31.5336110622656', longitude = '-82.7480391781246', },  
\[3\] = waypoint { type = 'HoldEnd', name = 'Hold End', description = '3', guid = 'WT2BOY-0HNGTRKT3R1BC', time = '20260222075857', latitude = '31.7716837201755', longitude = '-82.83656280014', },  
\[4\] = waypoint { type = 'StrikeIngress', name = 'Turning Point (Ingress)', description = '4', guid = 'WT2BOY-0HNGTRKT3R1BE', time = '20260222075938', latitude = '31.4474025820786', longitude = '-82.7168745136583', },  
\[5\] = waypoint { type = 'WeaponLaunch', name = 'Weapon Launch', description = '5', guid = 'WT2BOY-0HNGTRKT3R1BF', time = '20260222082714', latitude = '29.0413181565301', longitude = '-85.9351066028473', },  
\[6\] = waypoint { type = 'WeaponTarget', name = 'Weapon Target', description = '-', guid = 'WT2BOY-0HNGTRKT3R1BG', time = '20260222082807', latitude = '26.13', longitude = '-80.9183333333333', },  
\[7\] = waypoint { type = 'StrikeEgress', name = 'Turning Point (Egress)', description = '6', guid = 'WT2BOY-0HNGTRKT3R1BH', time = '20260222085544', latitude = '31.4474064758234', longitude = '-82.7168585268741', },  
\[8\] = waypoint { type = 'LandingMarshal', name = 'Landing Marshal Point', description = '7', guid = 'WT2BOY-0HNGTRKT3R1BI', time = '20260222085959', latitude = '31.1735241174604', longitude = '-82.73', },  
\[9\] = waypoint { type = 'Land', name = 'Land', description = '8', guid = 'WT2BOY-0HNGTRKT3R1BJ', time = '20260222090142', latitude = '31.34', longitude = '-82.73', }  
}

## Inserting a waypoint into a Flight plan

` local mission = ScenEdit_GetMission('BLUE','STRIKE')`  
`mission.flightlist[1]:insertWaypoint(4,{ latitude = 39.610, longitude = -100.225, TypeOf = 'Refuel', DesiredSpeed = '350', DesiredAltitude = '7000' })`  
`print(m.flightlist[1].course)`  

{  
\[1\] = { latitude = 31.34, Name = 'Take-Off', DesiredAltitude = '609.6', TypeOf = 'TakeOff', Zulu = '20260222034448', Category = 'FlightPlan', PresetThrottle = 'Loiter', Description = '1', DesiredSpeed = '350', longitude = -82.73, GUID = 'WT2BOY-0HNGTRKT3R1BA' },  
\[2\] = { latitude = 31.5336110622656, Name = 'Hold Start', DesiredAltitude = '609.6', TypeOf = 'HoldStart', Zulu = '20260222034648', Category = 'FlightPlan', PresetThrottle = 'Loiter', Description = '2', DesiredSpeed = '350', longitude = -82.7480391781246, GUID = 'WT2BOY-0HNGTRKT3R1BB' },  
\[3\] = { latitude = 31.7716837201755, Name = 'Hold End', DesiredAltitude = '10972.8', TypeOf = 'HoldEnd', Zulu = '20260222035448', Category = 'FlightPlan', PresetThrottle = 'Cruise', Description = '3', DesiredSpeed = '480', longitude = -82.83656280014, GUID = 'WT2BOY-0HNGTRKT3R1BC' },  
**\[4\] = { latitude = 39.61, Name = '', DesiredAltitude = '7000', TypeOf = 'Refuel', Zulu = '20260222055706', Category = 'FlightPlan', PresetThrottle = 'Cruise', Description = '4', DesiredSpeed = '480', longitude = -100.225, GUID = 'CY41MA-0HNM2RO50J0U9' },**  
\[5\] = { DesiredAltitudeTF = '0', latitude = 31.4474025820786, PresetThrottle = 'Cruise', DesiredAltitude = '10972.8', TypeOf = 'StrikeIngress', Zulu = '20260222080024', Category = 'FlightPlan', Name = 'Turning Point (Ingress)', Description = '5', DesiredSpeed = '480', longitude = -82.7168745136583, GUID = 'WT2BOY-0HNGTRKT3R1BE' },  
\[6\] = { DesiredAltitudeTF = '0', latitude = 29.0413181565301, PresetThrottle = 'Cruise', DesiredAltitude = '10972.8', TypeOf = 'WeaponLaunch', Zulu = '20260222082806', Category = 'FlightPlan', Name = 'Weapon Launch', Description = '6', DesiredSpeed = '480', longitude = -85.9351066028473, GUID = 'WT2BOY-0HNGTRKT3R1BF' },  
\[7\] = { latitude = 26.13, Name = 'Weapon Target', DesiredAltitude = '10972.8', TypeOf = 'WeaponTarget', Zulu = '20260222082806', Category = 'FlightPlan', PresetThrottle = 'Cruise', Description = '-', DesiredSpeed = '480', longitude = -80.9183333333333, GUID = 'WT2BOY-0HNGTRKT3R1BG' },  
\[8\] = { latitude = 31.4474064758234, Name = 'Turning Point (Egress)', DesiredAltitude = '10972.8', TypeOf = 'StrikeEgress', Zulu = '20260222085543', Category = 'FlightPlan', PresetThrottle = 'Cruise', Description = '7', DesiredSpeed = '480', longitude = -82.7168585268741, GUID = 'WT2BOY-0HNGTRKT3R1BH' },  
\[9\] = { latitude = 31.1735241174604, Name = 'Landing Marshal Point', DesiredAltitude = '914.4', TypeOf = 'LandingMarshal', Zulu = '20260222085959', Category = 'FlightPlan', PresetThrottle = 'Cruise', Description = '8', DesiredSpeed = '480', longitude = -82.73, GUID = 'WT2BOY-0HNGTRKT3R1BI' },  
\[10\] = { latitude = 31.34, Name = 'Land', DesiredAltitude = '0', TypeOf = 'Land', Zulu = '20260222090141', Category = 'FlightPlan', PresetThrottle = 'Loiter', Description = '9', DesiredSpeed = '350', longitude = -82.73, GUID = 'WT2BOY-0HNGTRKT3R1BJ' }  
}

------------------------------------------------------------------------

# <a name="Example_Wrapper_Group"></a>Wrapper Group

## Retreiving the Group details

` local u = ScenEdit_GetUnit({name='CVN BG', guid='9506a165-6e44-40dd-b721-f9c07e056bdb'})`  
`print("Group [" .. u.group.name .. "] \r\n" .. " Lead ship is " .. ScenEdit_GetUnit({ guid= u.group.lead}).name)`  
`-- group contains units`  
`local s = "Group units:" .. "\r\n"`  
`for k,v in pairs(u.group.unitlist) do`  
`if v ~= u.group.lead then`  
`s = s .. k .. " - " .. ScenEdit_GetUnit({ guid= v}).name .. "\r\n"`  
`end`  
`end`  
`print(s)`  

Group \[CVN BG\]  
Lead ship is CVN 70 Carl Vinson \[Nimitz Class\]  
Group units:  
1 - USS Rentz  
2 - USS McClusky  
3 - USS Stockdale  
4 - USS Gridley  
5 - USS Higgins  
6 - USS Lake Champlain  
7 - USS Bunker Hill  

------------------------------------------------------------------------

# <a name="Example_Wrapper_Loadout"></a>Wrapper LoadOut

## Retreiving the Group details

` local u = ScenEdit_GetLoadout({name='MiG-31BM Foxhound', unitname='NZZYVJ-0HM0G1F7MPTLQ'}`  
`print("Loadout [" .. u.name .. "] \r\n" )`  
`--print(u.weapons)`  
`local s = "Weapon load:" .. "\r\n"`  
`for k,v in pairs(u.weapons) do`  
`print( v)`  
`s = s .. k .. " - " .. v.wpn_name`  
`s = s .. "\t(Carrying " .. v.wpn_current .. " of " .. v.wpn_maxcap .. ")\r\n"`  
`u:setExactWeaponQuantity(v.wpn_guid, v.wpn_maxcap) -- set the current load back to full if any have been expended`  
`end`  
`print(s)`  
  

Loadout \[AA-13 Arrow \[R-37M\], AA-12 Adder B \[R-77-1\], Long-Range\]  
Weapon load:  
1 - AA-12 Adder B \[R-77-1, RVV-SD\] (Carrying 2 of 2)  
2 - AA-13 Arrow \[R-37M, RVV-BD\] (Carrying 4 of 4)  
3 - 2500 liter Drop Tank (Carrying 2 of 2)  

------------------------------------------------------------------------

# <a name="Example_Wrapper_Magazine"></a>Wrapper Magazine

## Retreiving the Magazine details

` local u = ScenEdit_GetUnit({name='LST 4001 Osumi', guid='8269b881-20ce-4f2e-baa0-6823e46d55a4'})`  
`print( "Unit Magazines " .. "\r\n")`  
`for k,v in pairs(u.magazines) do`  
`local s = ''`  
`local m = u:getUnitMagazine(v.mag_guid) -- details on magazine`  
`s = s .. k .. " - " .. m.name .. "with capacity of " .. m.capacity .. ' units\r\n'`  
`s = s .. "\t[Armor rating = " .. m.armor .. ", ROF = " .. m.rof .. ", containing " .. #m.weapons .. " weapon(s)]\r\n"`  
`for k,v in pairs(m.weapons) do`  
`s = s .. "\t\t" .. v.wpn_name .. " with load " .. v.wpn_current .. " of " .. v.wpn_default .. '\r\n'`  
`m:setExactWeaponQuantity(v.wpn_guid, v.wpn_default) -- set the current load back to full if any have been expended`  
`end`  
`print(s)`  
`end`  
  

Unit Magazines  
  
1 - 12.7mm/50 MGwith capacity of 200 units  
\[Armor rating = 1001, ROF = 15, containing 1 weapon(s)\]  
12.7mm/50 MG Burst \[10 rnds\] with load 180 of 200  
  
2 - 20mm/85 Mk15 Phalanx Blk 1with capacity of 20 units  
\[Armor rating = 2001, ROF = 300, containing 1 weapon(s)\]  
20mm/85 Mk15 Phalanx Blk 1 Burst \[300 rnds\] with load 20 of 20  
  
3 - Helicopter Magazinewith capacity of 10000 units  
\[Armor rating = 1001, ROF = 60, containing 2 weapon(s)\]  
AGM-114M Hellfire II with load 24 of 24  
Mk46 NEARTIP Mod 5 with load 40 of 40  
  
4 - Mk36 SRBOCwith capacity of 80 units  
\[Armor rating = 1001, ROF = 300, containing 2 weapon(s)\]  
Mk182 SRBOC Chaff \[Seduction\] with load 2 of 64  
Mk186 TORCH Flare \[Seduction\] with load 2 of 16  

------------------------------------------------------------------------

# <a name="Example_Wrapper_Mission"></a>Wrapper Mission

## Retreiving the Mission details

` `

------------------------------------------------------------------------

# <a name="Example_Wrapper_Mount"></a>Wrapper Mount

## Retreiving the Mount details

` local u = ScenEdit_GetUnit({name='LST 4001 Osumi', guid='8269b881-20ce-4f2e-baa0-6823e46d55a4'})`  
`print( "Unit Mounts " )`  
`for k,v in pairs(u.mounts) do`  
`local s = ''`  
`local m = u:getUnitMount(v.mount_guid) -- details on mount`  
`s = s .. k .. " - " .. m.name .. " [ " .. v.mount_status .. ' ]\r\n'`  
`s = s .. "\t[ containing " .. #m.weapons .. " weapon(s) ]\r\n"`  
`for k,v in pairs(m.weapons) do`  
`s = s .. "\t\t" .. v.wpn_name .. " with load " .. v.wpn_current .. " of " .. v.wpn_default .. '\r\n'`  
`--m:setExactWeaponQuantity(v.wpn_guid, v.wpn_default) -- set the current load back to full if any have been expended`  
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

------------------------------------------------------------------------

# <a name="Example_Wrapper_RP"></a>Wrapper Reference Point

## Retreiving the RP details

` `

------------------------------------------------------------------------

# <a name="Example_Wrapper_Scenario"></a>Wrapper Scenario

## Retreiving the Scenario details

` `

------------------------------------------------------------------------

# <a name="Example_Wrapper_Side"></a>Wrapper Side

## Retreiving the Side details

Find units in an area

`local u = side:unitsInArea({Area = { 'RP-3137', 'RP-3139', 'RP-3136', 'RP-3138'},`  
`TargetFilter = { TargetType = 'Ship' } }) `

Find units on side by a filter

`local u = side:side:unitsBy('Ship') -- all ships`  
`u = side:unitsBy('Ship', 2002, 3003) -- ships fitered for 'Surface combatant' and 'BBC' `

------------------------------------------------------------------------

# <a name="Example_Wrapper_SA"></a>Wrapper Special Action

## Retreiving the SA details

` `

------------------------------------------------------------------------

# <a name="Example_Wrapper_Unit"></a>Wrapper Unit

## Retreiving the Unit details

Update the orbit for a satellite by specifying a TLE

` theSat = ScenEdit_GetUnit({guid='56f830c1-d0e2-430a-985e-0e301cc01eff'})`  
`theTLE = 'Resurs P1\n1 39186U 13030A 17013.12537468 .00000446 00000-0 16942-4 0 9992\n2 39186 97.3847 79.3911 0015157 247.7411 195.8488 15.31966970198820'`  
`theSat:updateorbit({TLE=theTLE}) `

Change the type of waypoint

` au = ScenEdit_GetUnit({name='AGM-158A JASSM [Penetrator] #967', guid='46skox-0hmf72m6q6bdj'})`  
`print(au.course)`  
`wp = au:getwaypoint({GUID='46SKOX-0HMF72M6Q6L64'})`  
`wp.type = 0 -- This changes the waypoint type, in this case to manual plotted-course waypoint`  
`print(wp.type)`  

Change group's formation - reposition individual units - via teleport (transpose = true)

    1. to 'line abreast' (one of the pre-defined formations)

` local a = ScenEdit_GetUnit( { guid='9506a165-6e44-40dd-b721-f9c07e056bdb' } )`  
`a.formation = {name='line', spacing_unit = 1, transpose='true'}`  

    2. to a customised formation

` local a = ScenEdit_GetUnit( { guid='9506a165-6e44-40dd-b721-f9c07e056bdb' } )`  
`a.formation = {name='Custom:\t0\t2\t1\t135\t1\t1\t225\t1', spacing_unit = 1, transpose='true'}`  

Change unit's location in group's formation

` local a = ScenEdit_GetUnit( { guid='9506a165-6e44-40dd-b721-f9c07e056bdb' } )`  
`a.formation = {type='fixed', sprint=false, bearing=45, distance=5}`  

Retrieve the noise level of ship (as appears on map)

` local u = ScenEdit_GetUnit({name='SS 583 Harushio', guid='3a5f2a57-36e2-48f6-9352-00b819789a18'})`  
`--print(u.noiseLevel)`  
`print '----Noise Level----------'`  
`print("Front: " .. tostring(u.noiseLevel.front))`  
`print("Side: " .. tostring(u.noiseLevel.side))`  
`print("Rear: " .. tostring(u.noiseLevel.rear))`  

----Noise Level----------  
Front: 19.0  
Side: 19.2  
Rear: 19.4  

Retrieve the signature profile of aircraft with loadout

` local u = ScenEdit_GetUnit({name='MiG-31BM Foxhound', guid='NZZYVJ-0HM0G1F7MPTLQ'})`  
`print(u.signature)`  
`local sigs = u.signature`  
`if sigs.loadout ~= nil then`  
`print("A/c Loadout id = " .. sigs.loadout)`  
`end`  
`print '----Signatures----------'`  
`for k,v in pairs(sigs) do`  
`if k ~= 'loadout' then`  
`print("Type: " .. tostring(v.type) .. " / " .. v.typeN) -- type of device related to signature. Both text and number are supplied`  
`-- the text string similar to DB viewer`  
`print("Front: " .. tostring(v.text.front))`  
`print("Side: " .. tostring(v.text.side))`  
`print("Rear: " .. tostring(v.text.rear))`  
`--print(v.text)`  
`-- the RCS values`  
`print("RCS: " )`  
`print("Front: " .. tostring(v.rcs.front))`  
`print("Side: " .. tostring(v.rcs.side))`  
`print("Rear: " .. tostring(v.rcs.rear))`  
`--print(v.rcs)`  
`if v.sqm ~= nil then`  
`-- the square metre values`  
`print("SQM: " )`  
`print("Front: " .. tostring(v.sqm.front))`  
`print("Side: " .. tostring(v.sqm.side))`  
`print("Rear: " .. tostring(v.sqm.rear))`  
`--print(v.rcs)`  
`end`  
`print '---------------'`  
`end`  
`end`  

{ \[2\] = { text = { rear = '3.56 nm', front = '3.56 nm', side = '7.94 nm' }, rcs = { rear = 3.56, front = 3.56, side = 7.94 }, typeN = 3001, type = 'Visual_Detect' }, \[3\] = { text = { rear = '3.26 nm', front = '1.90 nm', side = '4.30 nm' }, rcs = { rear = 3.26, front = 1.9, side = 4.3 }, typeN = 3002, type = 'Visual_ID' }, \[4\] = { text = { rear = '11.94 nm', front = '3.56 nm', side = '8.00 nm' }, rcs = { rear = 11.9425, front = 3.56, side = 7.9985 }, typeN = 4001, type = 'IR_Detect' }, \[5\] = { text = { rear = '1.90 nm', front = '1.90 nm', side = '4.30 nm' }, rcs = { rear = 1.9, front = 1.9, side = 4.3 }, typeN = 4002, type = 'IR_ID' }, \[6\] = { text = { rear = '9.04 dBsm, 8.0 sq.m.', front = '9.04 dBsm, 8.0 sq.m.', side = '11.15 dBsm, 13.0 sq.m.' }, typeN = 5001, rcs = { rear = 9.03988, front = 9.03988, side = 11.14721 }, sqm = { rear = 8.016566, front = 8.016566, side = 13.023313 }, type = 'Radar_A_D' }, \[7\] = { text = { rear = '9.04 dBsm, 8.0 sq.m.', front = '9.04 dBsm, 8.0 sq.m.', side = '11.15 dBsm, 13.0 sq.m.' }, typeN = 5002, rcs = { rear = 9.03988, front = 9.03988, side = 11.14721 }, sqm = { rear = 8.016566, front = 8.016566, side = 13.023313 }, type = 'Radar_E_M' }, loadout = 19867 }  
A/c Loadout id = 19867  
----Signatures----------  
Type: Visual_Detect / 3001  
Front: 3.56 nm  
Side: 7.94 nm  
Rear: 3.56 nm  
RCS:  
Front: 3.56  
Side: 7.94  
Rear: 3.56  
---------------  
Type: Visual_ID / 3002  
Front: 1.90 nm  
Side: 4.30 nm  
Rear: 3.26 nm  
RCS:  
Front: 1.9  
Side: 4.3  
Rear: 3.26  
---------------  
Type: IR_Detect / 4001  
Front: 3.56 nm  
Side: 8.00 nm  
Rear: 11.94 nm  
RCS:  
Front: 3.56  
Side: 7.9985  
Rear: 11.9425  
---------------  
Type: IR_ID / 4002  
Front: 1.90 nm  
Side: 4.30 nm  
Rear: 1.90 nm  
RCS:  
Front: 1.9  
Side: 4.3  
Rear: 1.9  
---------------  
Type: Radar_A_D / 5001  
Front: 9.04 dBsm, 8.0 sq.m.  
Side: 11.15 dBsm, 13.0 sq.m.  
Rear: 9.04 dBsm, 8.0 sq.m.  
RCS:  
Front: 9.03988  
Side: 11.14721  
Rear: 9.03988  
SQM:  
Front: 8.016566  
Side: 13.023313  
Rear: 8.016566  
---------------  
Type: Radar_E_M / 5002  
Front: 9.04 dBsm, 8.0 sq.m.  
Side: 11.15 dBsm, 13.0 sq.m.  
Rear: 9.04 dBsm, 8.0 sq.m.  
RCS:  
Front: 9.03988  
Side: 11.14721  
Rear: 9.03988  
SQM:  
Front: 8.016566  
Side: 13.023313  
Rear: 8.016566  
---------------  

------------------------------------------------------------------------

Order unit to attempt replenishment

` local u = ScenEdit_GetUnit({name='MiG-31BM Foxhound', guid='NZZYVJ-0HM0G1F7MPTLQ'})`  
`-- use any available replenishment unit`  
`print( u:ReplenishUnit() )`  
`-- use specific replenishment unit`  
`print( u:ReplenishUnit({ tanker = 'd5eedc59-2541-4b7a-b540-607e84e579f8'}) )`  
`-- use any available replenishment unit from set of missions`  
`print( u:ReplenishUnit({ mission={'test support'}}) )`  

------------------------------------------------------------------------

# <a name="Example_Wrapper_Zone"></a>Wrapper Zone (non-navigation and exclusion)

## Retreiving the Zone details

` local a = VP_GetSide({Side ='side1'})`  
`-- a side object`  
`local z = a.nonavzones`  
`--List Of no-nav zones For the side If you need To find it`  
`For i, zone in ipairs(z) do print("Zone #" .. i) print(zone) local n = a : getnonavzone(z[i].guid) -- zone object print('Details: ' .. n.description .. ' Active: ' .. tostring(n.isactive) ) n.area = {'rp-9','rp-10', 'rp-8' -- replace with a list of visible RPs for the side n.area = { name='area test rp0', latitude='35.5480335331354', longitude='15.8184476823186', highlighted=true, bearingtype=1, relativeto='Tracking #1', hidden = false, name='area test rp1', latitude='35.5480335331354', longitude='16.8184476823186', highlighted=true,, name='area test rp2', latitude='38.5480335331354', longitude='18.8184476823186', highlighted=false, -- replace with a new set of RPs that might not be visible to the side End `

------------------------------------------------------------------------

# <a name="Example_Wrapper_WP"></a>Wrapper WayPoint

## Retreiving the WP details

` `

------------------------------------------------------------------------

# <a name="Example_Wrapper_Weapon"></a>Wrapper Weapon

## Retreiving the Weapon details

` `
