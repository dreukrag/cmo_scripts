## <a name="ScenEdit_AddUnit"></a>ScenEdit_AddUnit (table)

This function adds a new unit to a side based on the supplied table.  
As the function [ScenEdit_SetUnit()](Function_ScenEdit_SetUnit.md) is called at the end of this function, any options not listed below will be passed into the next function.  
There should be no need to call [ScenEdit_SetUnit()](Function_ScenEdit_SetUnit.md) seperately.

### Parameters

- table {} The unit details to add.  
  Note that some settings will depend on the type of unit specified, eg aircraft generally need loadouts and altitude whereas neither is needed by a ship.
  - type = [UnitType](DataTypes.md#dataType_Unit__Types) The description of the type of unit to add ( eg Ship, Sub, ...)
  - unitname = string The name of the unit
  - side = string The side name/GUID to add the unit to
  - dbid = number The database id of the unit
  - base = string Unit base name/GUID where the unit will be 'hosted' (applies to types AIR, SHIP, SUB)
  - latitude = [Latitude](DataTypes.md#dataType_Latitude) Not required if a `base` is defined as unit adopts that location
  - longitude = [Longitude](DataTypes.md#dataType_Longitude) Not required if a `base` is defined as adopts that location
  - altitude = [Altitude](DataTypes.md#dataType_Altitude) The Unit altitude (applies to AIR). If a `base` is defined, it will adopt it's altitude
  - loadoutid = number Aircraft database loadout id (applies to type AIR)
  - orbit = number Orbit index (applies to type SATELLITE)
  - guid = string Optional custom GUID to override the auto generated one

#### Returns

[Unit](Wrappers.md#wrapper_Unit) A wrapper defining the added unit. This will be nil if the function failed to add the unit.

#### Example

` Show an example of how to use the function. Explain it or add multiple examples to expand it ScenEdit_AddUnit({type ='Air', unitname ='F-15C Eagle', loadoutid =16934, dbid =3500, side ='NATO', Lat="5.123",Lon="-12.51",alt=5000})ScenEdit_AddUnit( {type ='Ship', unitname ='GOE II Det C', dbid =3127, side ='USN', latitude="5.123",longitude="-12.51",proficiency='Veteran'} )ScenEdit_AddUnit({type ='Air', unitname ='F-15C Eagle', loadoutid =16934, dbid =3500, side ='NATO', Lat="5.123",Lon="-12.51",alt=5000})ScenEdit_AddUnit( {type ='Ship', unitname ='GOE II Det C', dbid =3127, side ='USN', latitude="5.123",longitude="-12.51",proficiency='Veteran'} )`
