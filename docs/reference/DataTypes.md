<a name="DataTypes"></a>

## Data Types

Aside from the regular string, number, boolean and table data types inherited from Lua, the Command Lua API has a range of unique data types.

- [Altitde](#dataType_Altitude)
- [Arc](#dataType_Arc)
- [Autonomy Levels (Unmanned Systems)](#dataType_AutonomyLevels)
- [Armor](#dataType_Armor)
- [Awareness](#dataType_Awareness)
- [CargoObjectType](#dataType_CargoObjectType)
- [CargoStorageType](#dataType_CargoStorageType)
- [CargoType](#dataType_CargoType)
- [ContactIdStatus](#dataType_ContactIdStatus)
- [ContactType](#dataType_ContactType)
- [DateTime](#dataType_DateTime)
- [Doctrine](#dataType_ROE)
- [Fuel](#dataType_Fuel)
- [GUID](#dataType_GUID)
- [KeyStore](#dataType_KeyStore)
- [LandCover](#dataType_LandCover)
- [Latitude](#dataType_Latitude)
- [LoadoutRole](#dataType_LoadoutRole)
- [LoadoutTimeOfDay](#dataType_LoadoutTimeOfDay)
- [LoadoutWeather](#dataType_LoadoutWeather)
- [Longitude](#dataType_Longitude)
- [MissionType/Subtype](#dataType_MissionType)
- [Presets (Speed/altitude/depth)](#dataType_Preset)
- [Proficiency](#dataType_Proficiency)
- [Realism Settings](#dataType_RealismSetting)
- [Sensor](#dataType_Sensor)
- [Stance](#dataType_Stance)
- [TargetingMode](#dataType_TargetingMode)
- [TargetTypeWRA](#dataType_TargetTypeWRA)
- [TimeStamp](#dataType_TimeStamp)
- [True/False](#dataType_TrueFalse)
- [Unit Types](#dataType_Unit__Types)
- [Aircraft](#dataType_Unit_Aircraft)
- [Facility](#dataType_Unit_Facility)
- [Satellite](#dataType_Unit_Satellite)
- [Ship](#dataType_Unit_Ship)
- [Submarine](#dataType_Unit_Submarine)
- [Size](#dataType_Size)
- [UI Windows](#dataType_UIWindows)
- [WayPoint](#dataType_Waypoint)
- [WeaponControl](#dataType_ROE#WCS)
- [WeaponDoctrine](#dataType_WeaponDoctrine)
- [WeaponType](#dataType_WeaponType)

The various code=value references on this page may not be fully up to date.  
However, you can pull out the current Command listing from Lua by running a couple of commands in the Lua console.  
To see the current list of 'code types' that are recorded, run the following.

`function pairsByKeyNumeric(t)`  
` local a = {}`  
` for n in pairs(t) do a[#a+1] = tonumber(n) end -- convert to numeric so sequence is in order`  
` table.sort(a)`  
` local i = 0`  
` return function()`  
`  i = i +1`  
`  return a[i], t[tostring(a[i])]`  
` end`  
`end`  
  
`for k,v in pairs(_enumTable_.fields) do`  
` if string.find(k,'property_') ~= nil then -- is a property`  
`  local vt = {}`  
`  local i = 0`  
`  for w in string.gmatch(v,'%g+[^, ]') do`  
`   vt[i] = w`  
`   i=i+1`  
`  end`  
`  print("\r\n[object] = " .. string.sub(vt[0],2) ) -- property name`  
`  --local values = "_enumTable_." .. string.sub(vt[0],2) -- values of the property`  
`  print("\r\n[values] = ");`  
`  for key, value in pairsByKeyNumeric(_enumTable_[string.sub(vt[0],2)]) do`  
`   print(key .. ' = ' .. value) -- step through each sorted value`  
`  end`  
` end`  
`end`  

------------------------------------------------------------------------

### <a name="dataType_Altitude"></a>Altitude

Altitude is the height or depth of a unit. The altitude is displayed in meters when accessing the data. It can be set using either meters or feet by adding M or FT after it. The default is M if just a number is used.  
The short keyword 'alt' can be used in a Lua table parameter that allows 'altitude'.

##### Example

` {altitude = '100 FT'}`  
`--or`  
`{altitude = '100 M'}`  
`--or`  
`{altitude = '100'} --same as 100 M, since default is measured in metres `

------------------------------------------------------------------------

### <a name="dataType_Arc"></a>Arc

Arcs for sensor and mounts.

##### Arc Codes

![](.\images\datatypes_1_arc_codes.jpg)

------------------------------------------------------------------------

<a name="dataType_Armor"></a>

### Armor rating

The level of armor on device

**Code = Description**

- 1001 = None
- 1005 = Armor_Handgun
- 1010 = Armor_Rifle
- 1015 = Armor_HMG
- 1020 = RHA_20mm
- 1025 = RHA_25mm
- 1030 = RHA_30mm
- 1035 = RHA_35mm
- 2001 = Light
- 2002 = Medium
- 2003 = Heavy
- 2004 = Special

------------------------------------------------------------------------

### <a name="dataType_AutonomyLevels"></a>Autonomy Levels

Drone Autonomy Levels

**Code = Description**

- 6000 - Fully Autonomous
- 5000 - Battlespace Cognizant
- 4000 - Multi-Vehicle Coordination
- 3000 - Fault/Event Adaptive
- 2000 - Changeable Mission
- 1500 - Self - Recovering

  

------------------------------------------------------------------------

### <a name="dataType_Awareness"></a>Awareness

Awareness

**Code = Description**

- -1 = Blind
- 0 = Normal
- 1 = AutoSideID
- 2 = AutoSideAndUnitID
- 3 = Omniscient

  

------------------------------------------------------------------------

<a name="dataType_CargoObjectType"></a>

### CargoObjectType

Type of cargo object

**Code = Description**

- 0 = None
- 1 = Mount
- 2 = Vehicle
- 3 = Facility
- 4 = CargoContainer
- 5 = CargoContainerContent

------------------------------------------------------------------------

<a name="dataType_CargoStorageType"></a>

### CargoStorageType

Type of cargo storage

**Code = Description**

- 0 = StoredInternal
- 1 = StoredExternal
- 2 = TowedExternal

------------------------------------------------------------------------

<a name="dataType_CargoType"></a>

### CargoType

Type of cargo

**Code = Description**

- 0 = NoCargo
- 1000 = Personnel
- 2000 = SmallCargo
- 3000 = MediumCargo
- 4000 = LargeCargo
- 5000 = VLargeCargo

------------------------------------------------------------------------

<a name="dataType_ContactIdStatus"></a>

### ContactIdStatus

The level of Identification of the contact

The higher the level, the more accurate the information about the contact is.

**Code = Description**

- 0 = Unknown
- 1 = KnownDomain
- 2 = KnownType
- 3 = KnownClass
- 4 = PreciseID

------------------------------------------------------------------------

<a name="dataType_ContactType"></a>

### ContactType

The unit type related to the contact

**Code = Description**

- 00 = Air
- 01 = Missile
- 02 = Surface
- 03 = Submarine
- 05 = Aimpoint
- 06 = Orbital
- 07 = Facility_Fixed
- 08 = Facility_Mobile
- 09 = Torpedo
- 10 = Mine
- 11 = Explosion
- 13 = Decoy_Air
- 14 = Decoy_Surface
- 15 = Decoy_Land
- 16 = Decoy_Sub
- 17 = Sonobuoy
- 18 = Installation
- 19 = AirBase
- 20 = NavalBase
- 21 = MobileGroup
- 22 = ActivationPoint

------------------------------------------------------------------------

### <a name="dataType_DateTime"></a>DateTime

DateTime is displayed and changed as per LOCALE e.g. US would be 'MM/DD/YYYY HH:MM:SS AM/PM' eg '8/13/2002 12:14 PM'

------------------------------------------------------------------------

### <a name="dataType_ROE"></a>Doctrine/ROE

<a name="dataType_ROE#BTAT"></a>

Engaging ambiguous targets

**Code = Description**

- 0 = Ignore
- 1 = Optimistic
- 2 = Pessimistic

  
<a name="dataType_ROE#UNREP"></a>

Underway Replenishment

**Code = Description**

- 0 = Always_ExceptTankersRefuellingTankers
- 1 = Never
- 2 = Always_IncludingTankersRefuellingTankers

  

UNREP Allies

**Code = Description**

- 0 = Yes
- 1 = Yes_ReceiveOnly
- 2 = Yes_DeliverOnly
- 3 = No

  
<a name="dataType_ROE#FuelLevel"></a>

Fuel levels

**Code = Description**

- 00 = Bingo
- 01 = Joker10Percent
- 02 = Joker20Percent
- 03 = Joker25Percent
- 04 = Joker30Percent
- 05 = Joker40Percent
- 06 = Joker50Percent
- 07 = Joker60Percent
- 08 = Joker70Percent
- 09 = Joker75Percent
- 10 = Joker80Percent
- 11 = Joker90Percent

  
<a name="dataType_ROE#RTB_Behaviour"></a>

RTB behaviour when unit reaches RTB (fuel or weapons)

**Code = Description**

- 0 = No
- 1 = YesLastUnit
- 2 = YesFirstUnit
- 3 = YesLeaveGroup

  
<a name="dataType_ROE#WCS"></a>

Weapon Control Codes (WCS)

**Code = Description**

- 0 = Free
- 1 = Tight
- 2 = Hold

  
<a name="dataType_ROE#BatteryRecharge"></a>

Battery Recharge level

**Code = Description**

- 00 = Recharge_Empty
- 10 = Recharge_10_Percent
- 20 = Recharge_20_Percent
- 30 = Recharge_30_Percent
- 40 = Recharge_40_Percent
- 50 = Recharge_50_Percent
- 60 = Recharge_60_Percent
- 70 = Recharge_70_Percent
- 80 = Recharge_80_Percent
- 90 = Recharge_90_Percent

  

------------------------------------------------------------------------

<a name="dataType_Fuel"></a>

### Fuel

The various types of fuel(s), and their state, carried by the unit. Use [ScenEdit_SetUnit()](Function_ScenEdit_SetUnit.md) to set the fuel rather than through the wrapper [unit.fuel](Wrappers.md#wrapper_Unit).  
Using ScenEdit_SetUnit({...,fuel={{'GasFuel',1500},{2001,8000}}..}) is easier and less prone to error; you can use the fuel name or the fuel number code.

Unit fuel exists as Lua table with the 'type of fuel' as the index. There may be more than one type returned as in AO class ships.  
Each element of the fuel table has the items:

- current number The current fuel level of the type
- max number How much can be stored for the type
- name string Name of the fuel type (which will relect the fuel type index)
- type number Type of fuel

**Note:** The type is normally 4 digits. Use `.fuels` to get any breakdown of multiple tanks if present.

Fuel Types

**Code = Description**

- 1001 = NoFuel
- 2001 = AviationFuel
- 3001 = DieselFuel
- 3002 = OilFuel
- 3003 = GasFuel
- 4001 = Battery
- 4002 = AirIndepedent
- 5001 = RocketFuel
- 5002 = TorpedoFuel
- 5003 = WeaponCoast

  

##### Example

` local u = ScenEdit_GetUnit(...)`  
`local fuel = u.fuel`  
`fuel[3001].current = 400`  
`u.fuel = fuel `

------------------------------------------------------------------------

### <a name="dataType_GUID"></a>GUID

Each object in Command is uniquely identified by a GUID.

A GUID is an acronyom that stands for Globally Unique Identifier. It is a 32 character reference id that is highly unlikely to repeat when generated.

An example of the GUID is '3b28032f-446d-43a1-bc49-4f88f5fb1cc1'.  
The GUID of an object will not change once it is created.  
As such once created, the GUID can't be changed and thus will always be treated as READ ONLY. When adding some objects, the designer can assign a custom GUID, and once assigned it will be treated as if generated by the system.

The GUID is often used to identify objects to run functions and is not prone to errors if the unit name is changed.

------------------------------------------------------------------------

### <a name="dataType_KeyStore"></a>KeyStore

The simulation allows for user data to be stored within the save file. This is done by associating `keys` with `values`. `Key` and `value` pairs added to the persistent store are retained when the game is saved and resumed. `Keys` with `values` are both represented as non-`nil` strings .

**Note:** The KeyStore datatype only accepts strings as parameters. Numbers can only be stored using a KeyStore if the number is first converted to a string --e.g. by using the Lua native function `tostring()`.

Conversely, a number stored in a KeyStore as a string can be converted back to a number using the the Lua native function `tonumber()`.

------------------------------------------------------------------------

### <a name="dataType_LandCover"></a>LandCover

An integer indicating the type of land cover set for a custom environment zone.

**Code = Description**

- 0 = Water
- 1 = Evergreen needleleaf forest
- 2 = Evergreen broadleaf forest
- 3 = Deciduous needleleaf forest
- 4 = Deciduous broadleaf forest
- 5 = Mixed Forest
- 6 = Closed Shrublands
- 7 = Open Shrublands
- 8 = Woody savannas
- 9 = Savannas
- 10 = Grasslands
- 11 = Permanent Wetlands
- 12 = Croplands
- 13 = Urban and built up
- 14 = Croplands and natural vegetation mosaic
- 15 = Snow and ice
- 16 = Barren or sparsely vegetated
- 201 = Urban close inner city
- 202 = Urban spaced high rise
- 203 = Urban attached houses
- 204 = Urban close industrial
- 205 = Urban spaced apartments
- 206 = Urban detached houses
- 207 = Urban spaced industrial
- 208 = Urban shanty town
- 254 = Unclassified
- 255 = User underyling data (Custom Environmnet Zone does not override land cover.)

  

------------------------------------------------------------------------

### <a name="dataType_Latitude"></a>Latitude

Latitude is degrees N or S of the equator as 'S 60.20.10' or as +/- as -60.336. The data in the tables is held as a signed number.  
The short keyword 'lat' can be used in a Lua table parameter that allows 'latitude'.

##### Example

` {latitude = 'S 60.20.10'}`  
`--or`  
`{latitude = -60.336} `

------------------------------------------------------------------------

### <a name="dataType_LoadoutRole"></a>LoadoutRole

A string and number that correlates to the role of a loadout in the database.

**Code = Description**

- 1001 = None
- 2001 = Intercept_BVR
- 2002 = Intercept_WVR
- 2003 = AirSuperiority_BVR
- 2004 = AirSuperiority_WVR
- 2005 = PointDefence_BVR
- 2006 = PointDefence_WVR
- 2007 = GunsOnly
- 2101 = AntiSatellite_Intercept
- 2102 = AirborneLaser
- 3001 = LandNaval_Strike
- 3002 = LandNaval_Standoff
- 3003 = LandNaval_SEAD_ARM
- 3004 = LandNaval_SEAD_TALD
- 3005 = LandNaval_DEAD
- 3101 = LandOnly_Strike
- 3102 = LandOnly_Standoff
- 3103 = LandOnly_SEAD_ARM
- 3104 = LandOnly_SEAD_TALD
- 3105 = LandOnly_DEAD
- 3201 = NavalOnly_Strike
- 3202 = NavalOnly_Standoff
- 3203 = NavalOnly_SEAD_ARM
- 3204 = NavalOnly_SEAD_TALD
- 3205 = NavalOnly_DEAD
- 3401 = BAI_CAS
- 3501 = Buddy_Illumination
- 4001 = OECM
- 4002 = AEW
- 4003 = CommandPost
- 4004 = ChaffLaying
- 4101 = SearchAndRescue
- 4102 = CombatSearchAndRescue
- 4201 = MineSweeping
- 4202 = MineRecon
- 4301 = NavalMineLaying
- 6001 = ASW_Patrol
- 6002 = ASW_Attack
- 7001 = Forward_Observer
- 7002 = Area_Surveillance
- 7003 = Armed_Recon
- 7004 = Unarmed_Recon
- 7005 = Maritime_Surveillance
- 7101 = Paratroopers
- 7102 = Troop_Transport
- 7201 = Cargo
- 8001 = AirRefueling
- 8101 = Training
- 8102 = TargetTow
- 8103 = TargetDrone
- 9001 = Ferry
- 9002 = Unavailable
- 9003 = Reserve
- 9004 = ArmedFerry

  

------------------------------------------------------------------------

### <a name="dataType_LoadoutTimeOfDay"></a>LoadoutTimeOfDay

A string and number that correlates to the time of day specified for a loadout in the database.

**Code = Description**

- 1001 = None
- 2001 = DayNight
- 2002 = NightOnly
- 2003 = DayOnly

  

**Note:** As of v1142.2 loadout time of day restrictions are not enforced for aircraft launch, however **they do affect quick-turnaround**.

------------------------------------------------------------------------

### <a name="dataType_LoadoutWeather"></a>LoadoutWeather

A string and number that correlates to the time of day specified for a loadout in the database.

**Code = Description**

- 1001 = None
- 2001 = AllWeather
- 2002 = LimitedAllWeather
- 2003 = ClearWeather

  

**Note:** As of v1142.2 loadout weather restrictions are not enforced, however the individual weapons in a loadout are affected by weather. For example: There are no restrictions on launching an aircraft with a loadout carrying laser-guided bombs, however they will not be able to use those weapons if the target is obscured by cloud, fog or heavy precipitation.

------------------------------------------------------------------------

### <a name="dataType_Longitude"></a>Longitude

Longitude is degrees E or W of Greenwich line as 'W 60.20.10' or as +/- as -60.336. The data in the tables is held as a signed number.  
The short keyword 'lon' can be used in a Lua table parameter that allows 'longitude'.

##### Example

` {longitude = 'W 60.20.10'}`  
`--or`  
`{longitude = -60.336} `

------------------------------------------------------------------------

<a name="dataType_MissionType"></a>

### Type of mission

Mission Type

- Strike
  - **Mission Subtype**
  - AIR \[, AAW, Air_Intercept \]
  - LAND \[, SUR_LAND, Land_Strike \]
  - SEA \[, NAVAL, SUR_SEA, Maritime_Strike \]
  - SUB \[, ASW, Sub_Strike \]
- Patrol
  - **Mission Subtype**
  - ASW \[, SUB \]
  - NAVAL \[, SUR_SEA, ASuW_Naval \]
  - AAW \[, AIR \]
  - LAND \[, SUR_LAND, ASuW_Land \]
  - MIXED \[, SUR_MIXED, ASuW_Mixed \]
  - SEAD
  - SEA \[, SeaControl \]
- Support
- Ferry
- Mining
- Mineclearing
- Cargo

------------------------------------------------------------------------

<a name="dataType_Preset"></a>

### Presets

Throttle Codes

**Code = Description**

- 0 = FullStop
- 1 = Loiter
- 2 = Cruise
- 3 = Full
- 4 = Flank
- 5 = None

Depth Codes

**Code = Description**

- 0 = None
- 1 = Periscope
- 2 = Shallow
- 3 = OverLayer
- 4 = UnderLayer
- 5 = MaxDepth
- 6 = Surface

Altitude Codes

**Code = Description**

- 0 = None
- 1 = MinAltitude
- 2 = Low1000
- 3 = Low2000
- 4 = Medium12000
- 5 = High25000
- 6 = High36000
- 7 = MaxAltitude

------------------------------------------------------------------------

### <a name="dataType_Proficiency"></a>Proficiency

Proficiency

**Code = Description**

- 0 = Novice
- 1 = Cadet
- 2 = Regular
- 3 = Veteran
- 4 = Ace

  

------------------------------------------------------------------------

### <a name="dataType_RealismSetting"></a>Scenario Realism Settings

Realism Settings

- DetailedGunFireControl = Detailed gun fire-contorl
- UnlimitedBaseMagazines = Unlimited magazines at air/naval bases
- AircraftDamage = Aircraft Damage
- RealisticSubComms = Realistic Submarine Communications
- LandTypeEffects = Effects of Terrain Type
- LandTypeEffects_Advanced = Effects of Terrain Type - ADVANCED
- CommsDisruption = Communications Disruption
- WeatherAffectsShipSpeed = Weather affects ship speed
- AllowLandingPlannerInstantLoading = Allow instant load for the landing planner (Pro Only)
- ACS_NAW_Limitations = Weather and day/night affect aircraft sorties

  

------------------------------------------------------------------------

<a name="dataType_Sensor"></a>

### Sensor type and role

Sensor Type

**Code = Description**

- 1001 = None
- 2001 = Radar
- 2002 = SemiActive
- 2003 = Visual
- 2004 = Infrared
- 2005 = TVM
- 3001 = ESM
- 3002 = ECM
- 3003 = EMP_Projector
- 3004 = PCLS
- 4001 = LaserDesignator
- 4002 = LaserSpotTracker
- 4003 = LaserRangefinder
- 5001 = HullSonar_PassiveOnly
- 5002 = HullSonar_ActivePassive
- 5003 = HullSonar_ActiveOnly
- 5011 = TowedArray_PassiveOnly
- 5012 = TowedArray_ActivePassive
- 5013 = TowedArray_ActiveOnly
- 5021 = VDS_PassiveOnly
- 5022 = VDS_ActivePassive
- 5023 = VDS_ActiveOnly
- 5031 = DippingSonar_PassiveOnly
- 5032 = DippingSonar_ActivePassive
- 5033 = DippingSonar_ActiveOnly
- 5041 = BottomFixedSonar_PassiveOnly
- 5101 = MAD
- 5901 = PingIntercept
- 6001 = MineSweep_MechanicalCableCutter
- 6002 = MineSweep_MagneticInfluence
- 6003 = MineSweep_AcousticInfluence
- 6004 = MineSweep_MultiInfluence
- 6011 = MineSweep_TwoShipMagneticInfluence
- 6021 = MineNeutralization_MooredMineCableCutter
- 6022 = MineNeutralization_ExplosiveChargeMineDisposal
- 6031 = MineNeutralization_DiverExplosiveCharge
- 8001 = NonDetectingEmitter
- 9001 = SensorGroup

Sensor Role

**Code = Description**

- 1001 = None
- 2001 = AirSearch_2D_LR
- 2002 = AirSeach_3D_LR
- 2003 = AirSeach_2D_MR
- 2004 = AirSeach_3D_MR
- 2005 = AirSeach_2D_SR
- 2006 = AirSeach_3D_SR
- 2011 = AirSurfaceSearch_2D_LR
- 2012 = AirSurfaceSearch_3D_LR
- 2013 = AirSurfaceSearch_2D_MR
- 2014 = AirSurfaceSearch_3D_MR
- 2015 = AirSurfaceSearch_2D_SR
- 2016 = AirSurfaceSearch_3D_SR
- 2017 = HeightFinder_LR
- 2018 = HeightFinder_MR
- 2019 = HeightFinder_SR
- 2021 = SurfaceSearch_LR
- 2022 = SurfaceSearch_MR
- 2023 = SurfaceSearch_SR
- 2027 = SurfaceSearch_OTH
- 2028 = SurfaceSearch_Navigation
- 2031 = NavigationOnly
- 2032 = GroundMappingOnly
- 2033 = TerrainAvoidanceFollowingOnly
- 2034 = WeatherOnly
- 2035 = WeatherNavigationOnly
- 2101 = TargetIndicator_SurfToAir_2D
- 2102 = TargetIndicator_SurfToAir_3D
- 2103 = TargetIndicator_SurfToAirSurfToSurf_2D
- 2104 = TargetIndicator_SurfToAirSurfToSurf_3D
- 2105 = TargetIndicator_SurfToSurf
- 2109 = CounterBattery
- 2111 = FCR_AirToAir_LR
- 2112 = FCR_AirToAir_MR
- 2113 = FCR_AirToAir_SR
- 2121 = FCR_AirToAir_AirToSurf_LR
- 2122 = FCR_AirToAir_AirToSurf_MR
- 2123 = FCR_AirToAir_AirToSurf_SR
- 2124 = FCR_AirToSurf_LR
- 2125 = FCR_AirToSurf_MR
- 2126 = FCR_AirToSurf_SR
- 2131 = FCR_SurfToAir_LR
- 2132 = FCR_SurfToAir_MR
- 2133 = FCR_SurfToAir_SR
- 2141 = FCR_SurfToAir_SurfToSurf_LR
- 2142 = FCR_SurfToAir_SurfToSurf_MR
- 2143 = FCR_SurfToAir_SurfToSurf_SR
- 2151 = FCR_SurfToSurf
- 2152 = FCR_SurfToSurf_OTH
- 2161 = FCR_SurfToSurf_Torpedo
- 2191 = FCR_GunOnly
- 2201 = Illuminator_SAM_LR
- 2202 = Illuminator_SAM_MR
- 2203 = Illuminator_SAM_SR
- 2211 = ActiveMissileSeeker
- 2301 = RangeOnly
- 2311 = Land_ATC
- 2312 = Shipboard_ATC
- 2401 = BMEWS
- 2402 = Radar_BallisticMissileBattleManagement
- 2403 = Radar_BallisticMissileTracker
- 2404 = Radar_BallisticMissileEngagement
- 2791 = LLTV_MineRecon
- 2891 = IR_MAWS
- 3001 = ESM_RWR
- 3002 = ESM_LWR
- 3011 = ESM_ELINT
- 3012 = ESM_ELINT_OTHT
- 3021 = ESM_COMINT
- 3031 = ESM_SIGINT
- 3032 = ESM_SIGINT_OTHT
- 3041 = ESM_MASINT
- 3101 = ESM_HFDF
- 3102 = ESM_HFDF_OTHT
- 3201 = ESM_ELS
- 3211 = ESM_PassiveMissileSeeker
- 4001 = ECM_OECM
- 4011 = ECM_DECM
- 4021 = ECM_OECM_DECM
- 4031 = ECM_Repeater
- 4041 = IRCM
- 4091 = ECM_COMINT_Jammer
- 4901 = ECM_AcousticJammer
- 4902 = ECM_AcousticRepeater
- 5001 = HullSonarPassiveOnlySearch
- 5002 = HullSonarPassiveOnlySearchTrack
- 5011 = HullSonarPassiveOnlyRangingFlankArraySearchTrack
- 5021 = HullSonarPassiveOnlyTorpedoWarning
- 5031 = HullSonarActivePassiveSearch
- 5032 = HullSonarActivePassiveSearchTrack
- 5033 = HullSonarActivePassiveSearchAttack
- 5034 = HullSonarActivePassiveSearchMortarFireControl
- 5041 = HullSonarActivePassiveAttack
- 5061 = HullSonarActiveOnlySearch
- 5062 = HullSonarActiveOnlySearchTrack
- 5063 = HullSonarActiveOnlySearchAttack
- 5064 = HullSonarActiveOnlySearchMortarFireControl
- 5071 = HullSonarActiveOnlyAttack
- 5072 = HullSonarActiveOnlyMortarFireControl
- 5081 = HullSonarActiveOnlyBottomProfiler
- 5082 = HullSonarActiveOnlyShortRangeSidescanMapping
- 5083 = HullSonarActiveOnlyShortRangeSidescanMappingHighDefinitionLPI
- 5091 = HullSonarActiveOnlyMineAvoidance
- 5092 = HullSonarActiveOnlyMineObstacleAvoidance
- 5093 = HullSonarActiveOnlyShallowWaterMineObstacleAvoidance
- 5094 = HullSonarActiveOnlyShallowWaterHighDefinitionMineObstacleAvoidance
- 5095 = HullSonarActiveOnlyUnderIceNavigationandMineObstacleAvoidance
- 5096 = HullSonarActiveOnlyAntiCollisionNavigation
- 5097 = HullSonarActiveOnlyMineReconnaissance
- 5098 = HullSonarActiveOnlyMineHunting
- 5099 = HullSonarActiveOnlyMineHuntingASWMortarFireControl
- 5101 = TASSPassiveOnlyTowedArraySonarSystem
- 5102 = TASSPassiveOnlyFatLineTowedArraySonarSystem
- 5103 = TASSPassiveOnlyThinLineTowedArraySonarSystem
- 5104 = TASSPassiveOnlyAreaSurveillanceTowedArraySonarSystem
- 5111 = TASSPassiveTorpedoWarningTowedArraySonarSystem
- 5131 = TASSActivePassiveTowedArraySonarSystem
- 5132 = TASSActivePassiveAreaSurveillanceTowedArraySonarSystem
- 5161 = TASSActiveOnlyTowedArraySonarSystem
- 5191 = SURTASSPassiveOnlySurveillanceTowedArraySonarSystem
- 5192 = SURTASSActivePassiveSurveillanceTowedArraySonarSystem
- 5193 = SURTASSActiveOnlySurveillanceTowedArraySonarSystem
- 5201 = VDSPassiveOnlyVariableDepthSonar
- 5231 = VDSActivePassiveVariableDepthSonar
- 5261 = VDSActiveOnlyVariableDepthSonar
- 5271 = VDSActiveOnlyMineReconnaissanceVariableDepthSonar
- 5272 = VDSActiveOnlyMineHuntingVariableDepthSonar
- 5273 = VDSActiveOnlySidescanMineHuntingVariableDepthSonar
- 5274 = VDSPropelledActiveOnlyMineHuntingVariableDepthSonar
- 5301 = DippingSonarPassiveOnlySearchTrack
- 5331 = DippingSonarActivePassiveSearchTrack
- 5332 = DippingSonarActivePassiveShallowWaterSearchTrack
- 5361 = DippingSonarActiveOnlySearchTrack
- 5391 = HelicopterTowedActiveOnlyMineReconnaissanceSonar
- 5401 = SOSUSPassiveSoundSurveillanceSystems
- 5402 = MooredSonobuoyPassiveSearch
- 5501 = SonobuoyPassiveOnlyNonDirectional
- 5502 = SonobuoyPassiveOnlyDirectional
- 5507 = SonobuoyPassiveOnlyDirectionalFrequencyAnalysisandRecording_DIFAR
- 5508 = SonobuoyPassiveOnlyDirectionalLowFrequencyAnalysisandRanging_LOFAR
- 5509 = SonobuoyPassiveOnlyDirectionalVerticalLineArrayDIFAR_VLAD
- 5511 = SonobuoyActivePassiveRangeOnlyOmniDirectional
- 5512 = SonobuoyActivePassiveRangeDirectional
- 5521 = SonobuoyActiveOnlyRangeOnlyNonDirectional
- 5522 = SonobuoyActiveOnlyRangeOnlyNonDirectionalContinousPing
- 5523 = SonobuoyActiveOnlyRangeOnlyNonDirectionalCommandActivatedSonobuoySystem_CASS
- 5527 = SonobuoyActiveOnlyRangeDirectional
- 5528 = SonobuoyActiveOnlyRangeDirectionalCommandActivatedSonobuoySystem_DICASS
- 5529 = SonobuoyActiveOnlyRangeDirectionalExtendedEchoRanging_EER
- 5701 = TorpedoSeekerPassiveOnly
- 5702 = TorpedoSeekerPassiveOnlyShallowWater
- 5711 = TorpedoSeekerActivePassive
- 5712 = TorpedoSeekerActivePassiveShallowWater
- 5713 = TorpedoSeekerActivePassiveWakeHomer_WH
- 5714 = TorpedoSeekerActivePassiveShallowWaterWakeHomer_WH
- 5721 = TorpedoSeekerActiveOnly
- 5722 = TorpedoSeekerActiveOnlyShallowWater
- 5791 = TorpedoSeekerWakeHomer
- 5801 = MAD
- 5901 = AcousticIntercept
- 5902 = AcousticInterceptPassiveRanging
- 5903 = AcousticInterceptSurveillance
- 5911 = AcousticInterceptTorpedoWarning

  

------------------------------------------------------------------------

<a name="dataType_Size"></a>

### Size

Size various size attributes (eg flightsize in mission).

When setting the value, either the number or the description (in quotes) can be used.

Size Codes

*Flight size:*  
**Code = Description**

- 0 = None\*
- 1 = SingleAircraft
- 2 = TwoAircraft
- 3 = ThreeAircraft
- 4 = FourAircraft
- 6 = SixAircraft

*Flight quantity:*  
**Code = Description**

- 0 = None
- 1 = Flight_x1
- 2 = Flight_x2
- 3 = Flight_x3
- 4 = Flight_x4
- 6 = Flight_x6
- 8 = Flight_x8
- 12 = Flight_x12
- All = All

*Group size:*  
**Code = Description**

- 0 = None\*
- 1 = SingleVessel
- 2 = TwoVessel
- 3 = ThreeVessel
- 4 = FourVessel
- 6 = SixVessel

\*This can also be set by using a value of 'all'.

  

------------------------------------------------------------------------

<a name="dataType_Stance"></a>

### Stance

Stance/Posture: how one side sees another.

When setting the value, either the number or the description (in quotes) can be used.  
In some cases, the single letter code must be used; this is indicated by "Stance(letter)"

Stance Codes

**Code = Description**

- 0 = Neutral (N)
- 1 = Friendly (F)
- 2 = Unfriendly (U)
- 3 = Hostile (H)
- 4 = Unknown (X)

  

------------------------------------------------------------------------

<a name="dataType_TargetingMode"></a>

### TargetingMode

How is contact targeted.

Mode Codes

**Code = Description**

- 0 = AutoTargeted
- 1 = ManualWeaponAlloc

  

------------------------------------------------------------------------

<a name="dataType_TargetTypeWRA"></a>

### TargetTypeWRA

Target type for Weapon Release Authority.

Target Type Codes

**Code = Description**

- 1001 = None
- 1002 = Decoy
- 1999 = Air_Contact_Unknown_Type
- 2000 = Aircraft_Unspecified
- 2001 = Aircraft_5th_Generation
- 2002 = Aircraft_4th_Generation
- 2003 = Aircraft_3rd_Generation
- 2004 = Aircraft_Less_Capable
- 2011 = Aircraft_High_Perf_Bombers
- 2012 = Aircraft_Medium_Perf_Bombers
- 2013 = Aircraft_Low_Perf_Bombers
- 2021 = Aircraft_High_Perf_Recon_EW
- 2022 = Aircraft_Medium_Perf_Recon_EW
- 2023 = Aircraft_Low_Perf_Recon_EW
- 2031 = Aircraft_AEW
- 2032 = Aircraft_Class1UAS
- 2033 = Aircraft_Tanker
- 2034 = Aircraft_Class2UAS
- 2100 = Helicopter_Unspecified
- 2200 = Guided_Weapon_Unspecified
- 2201 = Guided_Weapon_Supersonic_Sea_Skimming
- 2202 = Guided_Weapon_Subsonic_Sea_Skimming
- 2203 = Guided_Weapon_Supersonic
- 2204 = Guided_Weapon_Subsonic
- 2211 = Guided_Weapon_Ballistic
- 2300 = Satellite_Unspecified
- 2400 = C_RAM
- 2999 = Surface_Contact_Unknown_Type
- 3000 = Ship_Unspecified
- 3001 = Ship_Carrier_0_25000_tons
- 3002 = Ship_Carrier_25001_45000_tons
- 3003 = Ship_Carrier_45001_95000_tons
- 3004 = Ship_Carrier_95000_tons
- 3101 = Ship_Surface_Combatant_0_500_tons
- 3102 = Ship_Surface_Combatant_501_1500_tons
- 3103 = Ship_Surface_Combatant_1501_5000_tons
- 3104 = Ship_Surface_Combatant_5001_10000_tons
- 3105 = Ship_Surface_Combatant_10001_25000_tons
- 3106 = Ship_Surface_Combatant_25001_45000_tons
- 3107 = Ship_Surface_Combatant_45001_95000_tons
- 3108 = Ship_Surface_Combatant_95000_tons
- 3201 = Ship_Amphibious_0_500_tons
- 3202 = Ship_Amphibious_501_1500_tons
- 3203 = Ship_Amphibious_1501_5000_tons
- 3204 = Ship_Amphibious_5001_10000_tons
- 3205 = Ship_Amphibious_10001_25000_tons
- 3206 = Ship_Amphibious_25001_45000_tons
- 3207 = Ship_Amphibious_45001_95000_tons
- 3208 = Ship_Amphibious_95000_tons
- 3301 = Ship_Auxiliary_0_500_tons
- 3302 = Ship_Auxiliary_501_1500_tons
- 3303 = Ship_Auxiliary_1501_5000_tons
- 3304 = Ship_Auxiliary_5001_10000_tons
- 3305 = Ship_Auxiliary_10001_25000_tons
- 3306 = Ship_Auxiliary_25001_45000_tons
- 3307 = Ship_Auxiliary_45001_95000_tons
- 3308 = Ship_Auxiliary_95000_tons
- 3401 = Ship_Merchant_Civilian_0_500_tons
- 3402 = Ship_Merchant_Civilian_501_1500_tons
- 3403 = Ship_Merchant_Civilian_1501_5000_tons
- 3404 = Ship_Merchant_Civilian_5001_10000_tons
- 3405 = Ship_Merchant_Civilian_10001_25000_tons
- 3406 = Ship_Merchant_Civilian_25001_45000_tons
- 3407 = Ship_Merchant_Civilian_45001_95000_tons
- 3408 = Ship_Merchant_Civilian_95000_tons
- 3501 = Submarine_Surfaced
- 3999 = Subsurface_Contact_Unknown_Type
- 4000 = Submarine_Unspecified
- 4999 = Land_Contact_Unknown_Type
- 5000 = Land_Structure_Soft_Unspecified
- 5001 = Land_Structure_Soft_Building_Surface
- 5002 = Land_Structure_Soft_Building_Reveted
- 5005 = Land_Structure_Soft_Structure_Open
- 5006 = Land_Structure_Soft_Structure_Reveted
- 5011 = Land_Structure_Soft_Aerostat_Moring
- 5100 = Land_Structure_Hardened_Unspecified
- 5101 = Land_Structure_Hardened_Building_Surface
- 5102 = Land_Structure_Hardened_Building_Reveted
- 5103 = Land_Structure_Hardened_Building_Bunker
- 5104 = Land_Structure_Hardened_Building_Underground
- 5105 = Land_Structure_Hardened_Structure_Open
- 5106 = Land_Structure_Hardened_Structure_Reveted
- 5200 = Runway_Facility_Unspecified
- 5201 = Runway
- 5202 = Runway_Grade_Taxiway
- 5203 = Runway_Access_Point
- 5300 = Emitter_Unspecified
- 5310 = Emitter_Radar
- 5320 = Emitter_Jammer
- 5400 = Mobile_Target_Soft_Unspecified
- 5401 = Mobile_Target_Soft_Mobile_Vehicle
- 5402 = Mobile_Target_Soft_Mobile_Personnel
- 5500 = Mobile_Target_Hardened_Unspecified
- 5501 = Mobile_Target_Hardened_Mobile_Vehicle
- 5601 = Underwater_Structure
- 5801 = Air_Base_Single_Unit_Airfield

  

------------------------------------------------------------------------

<a name="dataType_TimeStamp"></a>

### TimeStamp

TimeStamp is a representation of time defined as the number of seconds that have elapsed since 00:00:00 Coordinated Universal Time (UTC), Thursday, 1 January 1970

------------------------------------------------------------------------

<a name="dataType_TrueFalse"></a>

### True/False

True/Yes = 1  
False/No = 0

------------------------------------------------------------------------

### <a name="dataType_Unit__Types"></a>Unit type

The base unit types available in Command.

Unit Type Codes

**Code = Description**

- 1 = Aircraft
- 2 = Ship
- 3 = Submarine
- 4 = Facility
- 5 = Aimpoint
- 6 = Weapon
- 7 = Satellite
- 8 = Ground unit

  

------------------------------------------------------------------------

<a name="dataType_Unit_Aircraft"></a>

### UnitAircraft

The category and sub-type for aircraft.

Aircraft Category Codes

**Code = Description**

- 1001 = None
- 2001 = Fixed Wing
- 2002 = Fixed Wing, Carrier Capable
- 2003 = Helicopter
- 2004 = Tiltrotor
- 2006 = Airship
- 2007 = Seaplane
- 2008 = Amphibian

Aircraft SubType Codes

**Code = Description**

- 1001 = None
- 2001 = Fighter
- 2002 = Multirole (Fighter/Attack)
- 2101 = Anti-Satellite Interceptor (ASAT)
- 2102 = Airborne Laser Platform
- 3001 = Attack
- 3002 = Wild Weasel
- 3101 = Bomber
- 3401 = Battlefield Air Interdiction (BAI/CAS)
- 4001 = Electronic Warfare
- 4002 = Airborne Early Warning (AEW)
- 4003 = Airborne Command Post (ACP)
- 4101 = Search And Rescue (SAR)
- 4201 = Mine Sweeper (MCM)
- 6001 = Anti-Submarine Warfare (ASW)
- 6002 = Maritime Patrol Aircraft (MPA)
- 7001 = Forward Observer
- 7002 = Area Surveillance
- 7003 = Recon
- 7004 = Electronic Intelligence (ELINT)
- 7005 = Signals Intelligence (SIGINT)
- 7101 = Transport
- 7201 = Cargo
- 7301 = Commercial
- 7302 = Civilian
- 7401 = Utility
- 7402 = Naval Utility
- 8001 = Tanker (Air Refueling)
- 8101 = Trainer
- 8102 = Target Towing
- 8103 = Target Drone
- 8201 = Unmanned Aerial Vehicle (UAV)
- 8202 = Unmanned Combat Aerial Vehicle (UCAV)
- 8901 = Airship
- 8902 = Aerostat

  

------------------------------------------------------------------------

<a name="dataType_Unit_Facility"></a>

### UnitFacility

The category and sub-type for the various facility types

Fixed Facility Category Codes

**Code = Description**

- 1001 = None
- 2001 = Runway
- 2002 = Runway-Grade Taxiway
- 2003 = Runway Access Point
- 3001 = Building (Surface)
- 3002 = Building (Reveted)
- 3003 = Building (Bunker)
- 3004 = Building (Underground)
- 3005 = Structure (Open)
- 3006 = Structure (Reveted)
- 4001 = Underwater
- 5001 = Mobile Vehicle(s)
- 5002 = Mobile Personnel
- 6001 = Aerostat Mooring
- 9001 = Air Base

Ground/mobile Facility Category Codes

**Code = Description**

- 0 = None
- 1000 = Infantry
- 2000 = Armor
- 3000 = Artillery Gun
- 4000 = Artillery SSM
- 5000 = AAA
- 6000 = SAM
- 7000 = Engineer
- 8000 = Supply
- 9000 = Surveillance
- 10000 = Recon
- 11000 = MechInfantry

  

------------------------------------------------------------------------

<a name="dataType_Unit_Satellite"></a>

### UnitSatellite

The category and sub-type for Satellite.

Satellite Category Codes

**Code = Description**

- 1001 = None
- 2001 = Geo-Stationary
- 2002 = Something Else
- 2003 = Unmanned Test Vehicle

Satellite SubType Codes

**Code = Description**

- 1001 = None
- 2001 = IMGSAT
- 2002 = RORSAT
- 2003 = EORSAT
- 2004 = SIGINT
- 2005 = ELINT
- 2006 = NOSS
- 2007 = MASINT
- 2008 = Reusable Test Vehicle

  

------------------------------------------------------------------------

<a name="dataType_Unit_Ship"></a>

### UnitShip

The category and sub-type for Ship.

Ship Category Codes

**Code = Description**

- 1001 = None
- 2001 = Carrier (Aviation Ship)
- 2002 = Surface Combatant
- 2003 = Amphibious
- 2004 = Auxiliary
- 2005 = Merchant
- 2006 = Civilian
- 2007 = Surface Combatant (Aviation Capable)
- 2008 = Mobile Offshore Base (Aviation Capable)

Ship SubType Codes

**Code = Description**

- 1001 = None
- 2001 = CV - Aircraft Carrier
- 2002 = CVA - Attack Carrier
- 2003 = CVB - Large Aircraft Carrier
- 2004 = CVE - Escort Aircraft Carrier
- 2005 = CVGH - Guided Missile Helicopter Carrier
- 2006 = CVH - Helicopter Carrier
- 2007 = CVL - Light Aircraft Carrier
- 2008 = CVN - Nuclear Powered Aircraft Carrier
- 2009 = CVS - Seaplane Carrier
- 2010 = CVS - Anti-Submarine Aircraft Carrier
- 2011 = AVT - Training Carrier
- 3001 = B - Battleship
- 3002 = BB - Battleship
- 3003 = BBC - Command Battleship
- 3004 = BBG - Guided Missile Battleship
- 3005 = BBH - Helicopter Battleship
- 3006 = BCGN - Nuclear Powered Guided Missile Battle Cruiser
- 3007 = BM - Monitor
- 3101 = C - Cruiser
- 3102 = CA - Heavy Cruiser
- 3103 = CAG - Heavy Guided Missile Cruiser
- 3104 = CB - Large Cruiser
- 3105 = CBG - Large Guided Missile Cruiser
- 3106 = CG - Guided Missile Cruiser
- 3107 = CGH - Guided Missile Helicopter Cruiser
- 3108 = CGN - Nuclear Powered Guided Missile Cruiser
- 3109 = CL - Light Cruiser
- 3110 = CLAA - Light Anti-Aircraft Cruiser
- 3111 = CLC - Light Command Cruiser
- 3112 = CLG - Light Guided Missile Cruiser
- 3113 = CLH - Light Helicopter Cruiser
- 3114 = CS - Scout Cruiser
- 3201 = D - Destroyer
- 3202 = DD - Destroyer
- 3203 = DDG - Guided Missile Destroyer
- 3204 = DDH - Helicopter Destroyer
- 3205 = DDK - ASW Submarine Killer Destroyer
- 3206 = DDR - Radar Picket Destroyer
- 3207 = DE - Destroyer Escort
- 3208 = DEG - Guided Missile Destroyer Escort
- 3209 = DER - Radar Picket Destroyer Escort
- 3210 = DL - Destroyer
- 3211 = DLG - Guided Missile Destroyer
- 3212 = DM - Destroyer Minelayer (converted destroyer)
- 3301 = F - Frigate
- 3302 = FF - Frigate
- 3303 = FFG - Guided Missile Frigate
- 3304 = FFL - Corvette
- 3305 = PF - Patrol Frigate
- 3306 = LCS - Littoral Combat Ship
- 3307 = OPV - Offshore Patrol Vessel
- 3308 = USV - Unmanned Surface Vessel
- 3401 = PB - Patrol Boat
- 3402 = PC - Coastal Patrol Boat
- 3403 = PC - Submarine Chaser
- 3404 = PCE - Submarine Chaser Escort
- 3405 = PCF - Fast Patrol Craft
- 3406 = PCFG - Fast Guided Missile Patrol Craft
- 3407 = PG - Patrol Gunboat
- 3408 = PG - Corvette
- 3409 = PGM - Missile Gunboat
- 3410 = PH - Hydrofoil Gunboat
- 3411 = PHM - Missile Hydrofoil
- 3412 = PHT - Hydrofoil Torpedo Boat
- 3413 = PT - Patrol Torpedo Boat
- 3414 = PTS - Patrol Torpedo Boat Small
- 3415 = MTB - Motor Torpedo Boat
- 3416 = WHEC - Coast Guard High Endurance Cutter
- 3417 = WMEC - Coast Guard Medium Endurance Cutter
- 3418 = WPB - Coast Guard Patrol Boat
- 3419 = WPG - Coast Guard Patrol Gunboat
- 3420 = MCDV - Maritime Coastal Defense Vessel
- 4000 = AGF - Fleet Flagship
- 4001 = AGC - Amphibious Fleet Flagship
- 4002 = LCAC - Air Cushion Landing Craft
- 4003 = LCC - Amphibious Command Vessel
- 4004 = LCM - Mechanized Landing Craft
- 4005 = LCP - Personnel Landing Craft
- 4006 = LCT - Tank Landing Craft
- 4007 = LCU - Utility Landing Craft
- 4008 = LCVP - Vehicle and Personnel Landing Craft
- 4009 = LFR - Inshore Fire Support Vessel
- 4010 = LHA - Amphibious Assault Ship, General Purpose
- 4011 = LHD - Amphibious Assault Ship, Multi-purpose
- 4012 = LKA - Amphibious Cargo Vessel
- 4013 = LPD - Amphibious Transport Dock Vessel
- 4014 = LPH - Amphibious Assault Helicopter Carrier
- 4015 = LSD - Dock Landing Ship
- 4016 = LSH - Unknown! British Designation!
- 4017 = LSL - Landing Ships Logistic
- 4018 = LSM - Medium Landing Ship
- 4019 = LSM(R) - Medium Landing Ship, Rocket
- 4020 = LST - Tank Landing Ship
- 4021 = LSU - Utility Landing Ship
- 4022 = LSV - Vehicle Landing Ship
- 4023 = LCI - Landing Craft, Infantry
- 4024 = LSDV - Saboteur Infiltration Craft
- 4025 = LCPA - Personnel Landing Craft, Air-Cushioned
- 4026 = EPF - Expeditionary Fast Transport
- 4027 = ESD - Expeditionary Transfer Dock
- 4028 = ESB - Expeditionary Mobile Base
- 5001 = A - Auxiliary
- 5002 = AD - Destroyer Tender
- 5003 = AE - Ammunition Ship
- 5004 = AF - Refrigerated Stores Ship
- 5005 = AFS - Combat Stores Ship
- 5006 = AG - Generic Auxiliary
- 5007 = AGB - Heavy Icebreaker
- 5008 = AGF - Fleet Flagship
- 5009 = AGI - Intelligence Gathering Ship
- 5010 = AGMR - Communications Major Relay Ship
- 5011 = AGOR - Oceanographic Research Ship
- 5012 = AGOS - Ocean Surveillance Ship
- 5013 = AGR - Radar Picket Ship (converted cargo ship)
- 5014 = AGS - Surveying Ship
- 5015 = AGTR - Technical Research Ship
- 5016 = AH - Hospital Ship
- 5017 = AK - Cargo Ship
- 5018 = AKA - Attack Cargo Ship
- 5019 = AKE - Dry Cargo Ship
- 5020 = AKR - Roll-on/Roll-off Cargo Ship
- 5021 = AKS - General Stores Ship
- 5022 = AO - Fleet Oiler
- 5023 = AOE - Fast Combat Support Ship
- 5024 = AOL - Small Oiler
- 5025 = AOR - Replenishment Oiler
- 5026 = AOT - Transport Oiler
- 5027 = APA - Attack Personnel Transport Ship
- 5028 = APD - Troop Transport (High Speed)
- 5029 = AR - Repair Ship
- 5030 = AS - Submarine Tender
- 5031 = ATC - Armored Troop Carrier (Tango Boat)
- 5032 = ATA - Auxiliary Ocean Tug
- 5033 = ATS - Salvage Tug
- 5034 = AV - Seaplane Tender
- 5035 = AX - Training Vessel
- 5036 = ASR - Submarine Rescue Ship
- 5037 = AP - Personnel Transport Ship
- 5038 = DSV - Diving Support Vessel / Deep Submergence Vehicle
- 5039 = AGM - Missile Range instrumentation Ship
- 5040 = AD - Destroyer Tender
- 5101 = T-AGOS - MSC Ocean Surveillance Ship
- 5102 = T-AH - MSC Hospital Ship
- 5103 = T-AK - Cargo Ship
- 5104 = T-AKE - MSC Dry Cargo Ship
- 5105 = T-AKR - MSC Roll-on/Roll-off Cargo Ship
- 5106 = T-AO - MSC Fleet Oiler
- 5107 = T-AO - MSC Transport Oiler
- 5108 = T-MLP - MSC Mobile Landing Platforms
- 6001 = MCD - Mine Countermeasures Drone
- 6002 = MCM - Mine Countermeasures Ship
- 6003 = MCS - Mine Countermeasures Support Ship
- 6004 = MHC - Coastal Minehunter
- 6005 = ML - Minelayer
- 6006 = MSC - Coastal Minesweeper
- 6007 = MSF - Steel Hull Fleet Minesweeper
- 6008 = MSI - Inshore Minesweeper
- 6010 = MSO - Ocean Minesweeper
- 6011 = MST - Minesweeper Tender
- 6012 = MHI - Mine Hunter Inshore
- 6013 = MM - Controlled Minefield Tender
- 7001 = YAG - Miscellaneous Service Craft
- 7002 = YRT - Torpedo Retriever
- 7003 = YRM - Missile Retriever
- 9001 = Civilian
- 9002 = Merchant
- 9003 = Platform
- 9004 = NGS Buoy
- 9005 = Bottom Fixed Array Sonar
- 9006 = Moored Sonobuoy
- 9007 = Special (Land Unit/Satellite)
- 9008 = Small Watercraft
- 9011 = Mobile Offshore Base (MOB)

  

------------------------------------------------------------------------

<a name="dataType_Unit_Submarine"></a>

### UnitSubmarine

The category and sub-type for Submarine.

Submarine Category Codes

**Code = Description**

- 1001 = None
- 2001 = Submarine
- 2002 = Biologics
- 2003 = False Target

Submarine SubType Codes

**Code = Description**

- 1001 = None
- 2001 = AGSS - Auxilary/Experimental Submarine
- 2002 = APSS - Auxiliary Cargo Submarine
- 2003 = SS - Attack/Fleet Submarine
- 2004 = SSB - Ballistic Missile Submarine
- 2005 = SSBN - Nuclear Powered Ballistic Missile Submarine
- 2006 = SSG - Guided Missile Attack Submarine
- 2007 = SSGN - Nuclear Powered Guided Missile Attack Submarine
- 2008 = SSK - Hunter-Killer Submarine
- 2009 = SSM - Midget Submarine
- 2010 = SSN - Nuclear Powered Attack Submarine
- 2011 = SSP - Transport Submarine
- 2012 = SSR - Radar Picket Submarine
- 2013 = SSRN - Nuclear Powered Radar Picket Submarine
- 3001 = SDV - Swimmer Delivery Vehicle
- 4001 = ROV - Remotely Operated Vehicle
- 4002 = UUV - Unmanned Underwater Vehicle
- 4003 = Unmanned Underwater Glider
- 9001 = Biologics
- 9002 = False Target

  
, , , , , and \<

------------------------------------------------------------------------

### <a name="dataType_UIWindows"></a>UI Windows

Realism Settings

- orbat = Order of Battle
- missioneditor = Mission Editor
- speedalt = Throttle & Altitude
- exclusionzoneswindow = Exclusion Zone Window/li\>
- nonavzoneswindow = No-navigation Zone Window
- consolewindow2 = Lua Console

  

------------------------------------------------------------------------

<a name="dataType_Waypoint"></a>

### Waypoint

The type of waypoints (not all codes are used)

Waypoint type

**Code = Description**

- 00 = ManualPlottedCourseWaypoint
- 01 = PatrolStation
- 02 = TerminalPoint
- 03 = LocalizationRun
- 04 = PathfindingPoint
- 05 = Assemble
- 06 = TurningPoint
- 07 = InitialPoint
- 10 = Target
- 11 = LandingMarshal
- 12 = StrikeIngress
- 13 = StrikeEgress
- 14 = Refuel
- 15 = TakeOff
- 17 = WeaponLaunch
- 18 = Land
- 19 = WeaponTarget
- 20 = StationStart_Racetrack
- 21 = StationStart_FigureEight
- 22 = StationStart_Area
- 23 = StationStart_RaceTrackRandom
- 24 = StationEnd
- 25 = PickupPoint
- 26 = HoldStart
- 27 = HoldEnd
- 28 = Launch
- 29 = Activation
- 30 = Termination

  

------------------------------------------------------------------------

<a name="dataType_WeaponDoctrine"></a>

### WeaponDoctrine

Weapon Doctrine Codes

**Code = Description**

- 0000 = LoadoutSetting (use setting from database)
- 2001 = Winchester (Vanilla Winchester - Out of weapons)
- 2002 = Winchester_ToO (Same as above, but engage nearby bogies with guns after we're out of missiles. Applies to air-to-air missile loadouts only. For guns-only air-to-air loadouts and all air-to-ground loadouts the behaviour is the same as above. PREFERRED OPTION!
- 3001 = ShotgunBVR ( Disengage after firing all Beyond Visual Range (BVR, air-to-air) or Stand-Off (SO, air-to-ground) weapons. This is a risky option as your fighter aircraft may only have one medium-range air-to-air missile (AAM) left, and attempt to engage 'fresh' flights of bogies. Use with caution.)
- 3002 = ShotgunBVR_WVR ( Same as above, but if easy targets or threats are nearby then shoot at them with remaining Within Visual Range (WVR, air-to-air) or SR (Short-Range, air-to-ground) weapons before disengaging.)
- 3003 = ShotgunBVR_WVR_Guns ( Same as above, but also engage bogies with guns. Applies to air-to-air (A/A) loadouts only. For air-to-ground (A/G) loadouts the behaviour is the same as above.)
- 4001 = Shotgun25 ( Disengage after 1/4 of mission-specific weapons have been expended.)
- 4002 = Shotgun25_ToO ( Same as above, but if easy targets or threats are nearby then shoot at those too. Also engage bogies with guns. Applies to air-to-air (A/A) loadouts only.)
- 4011 = Shotgun50 ( Disengage after half of mission-specific weapons have been expended.)
- 4012 = Shotgun50_ToO ( Same as above, but if easy targets or threats are nearby then shoot at those too. Also engage bogies with guns. Applies to air-to-air (A/A) loadouts only.)
- 4021 = Shotgun75 ( Disengage after 3/4 of mission-specific weapons have been expended.)
- 4022 = Shotgun75_ToO ( Same as above, but if easy targets or threats are nearby then shoot at those too. Also engage bogies with guns. Applies to air-to-air (A/A) loadouts only.)
- 5001 = ShotgunOneEngagementBVR ( Make one engagement with BVR or SO weapons. Continue fighting for as long as there are targets within easy reach and then disengage. This is a safe option as it ensures aircraft do not 'hang around' after they have expended their most potent weapons, and becoming easy targets when engaged by 'fresh' enemy units.)
- 5002 = ShotgunOneEngagementBVR_Opportunity_WVR ( Same as above, but if easy targets or threats are nearby, shoot at them with remaining WVR or Short-Range weapons before disengaging. A target is considered 'easy' when within 120% of the remaining WVR or Strike weapon's maximum range. In other words, the fighter won't spend much energy chasing down a target after the Shotgun weapon state has been reached, and will leave the target area as quickly as possible. PREFERRED OPTION!)
- 5003 = ShotgunOneEngagementBVR_Opportunity_WVR_Guns ( Same as above, but also engage bogies with guns. Applies to air-to-air (A/A) loadouts only. For air-to-ground (A/G) loadouts the behaviour is the same as above.)
- 5005 = ShotgunOneEngagementBVR_And_WVR ( Make one engagement with BVR and WVR, or SO and Strike Weapons. Do not disengage when out of BVR or SO weapons, but continue the engagement with WVR weapons.)
- 5006 = ShotgunOneEngagementBVR_And_WVR_Opportunity_Guns
- 5011 = ShotgunOneEngagementWVR ( Make one engagement with WVR or SR weapons. Continue fighting for as long as there are targets within easy reach and then disengage.)
- 5012 = ShotgunOneEngagementWVR_Guns ( Same as above but also engage bogies with guns. Applies to air-to-air (A/A) loadouts only. For air-to-ground (A/G) loadouts, the behaviour is the same as above. PREFERRED OPTION!)
- 5021 = ShotgunOneEngagementGun ( Make one engagement with guns. Continue fighting for as long as there are targets nearby and then disengage.)

  

------------------------------------------------------------------------

<a name="dataType_WeaponType"></a>

### WeaponType

Weapon Type Codes

**Code = Description**

- 1001 = None
- 2001 = GuidedWeapon
- 2002 = Rocket
- 2003 = IronBomb
- 2004 = Gun
- 2005 = Decoy_Expendable
- 2006 = Decoy_Towed
- 2007 = Decoy_Vehicle
- 2008 = TrainingRound
- 2009 = Dispenser
- 2010 = ContactBomb_Suicide
- 2011 = ContactBomb_Sabotage
- 2012 = GuidedProjectile
- 2014 = UAV_Expendable
- 3001 = SensorPod
- 3002 = DropTank
- 3003 = BuddyStore
- 3004 = FerryTank
- 4001 = Torpedo
- 4002 = DepthCharge
- 4003 = Sonobuoy
- 4004 = BottomMine
- 4005 = MooredMine
- 4006 = FloatingMine
- 4007 = MovingMine
- 4008 = RisingMine
- 4009 = DriftingMine
- 4011 = DummyMine
- 4101 = HeliTowedPackage
- 5000 = BallisticMissile
- 5001 = RV
- 5002 = PalletWeapon
- 6001 = Laser
- 6002 = Microwave
- 6003 = LaserDazzler
- 8001 = HGV
- 8003 = HypersonicCruiseMissile
- 9001 = Cargo
- 9002 = Troops
- 9003 = Paratroops

  
<a name="footer"></a>

Copyright © WarfareSims 2020
