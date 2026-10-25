### <a name="ScenEdit_SetUnitDamage"></a> ScenEdit_SetUnitDamage ( table )

This function Sets the unit damage for components

#### Parameters

- table { }
  - side = string The side name/GUID of the unit
  - unitname = string The name of unit
  - guid = string The GUID of the unit
  - fires = Fire_level? Fire level
  - flood = Flood_level? Flooding level
  - dp = number Damage points left
  - components = { } of multiple
    - value 'rudder', 'cargo', 'cic', 'pressurehull' Standard component to damage
    - string Damage level ('none', 'destroyed', or damage_severity_setting)

    or
    - string Specific component GUID to damage
    - string Damage level ('none', 'destroyed', or damage_severity_setting)

    or
    - 'type' Fixed value to indicate a random component damage
    - type = 'sensor', etc Random component type to damage
    - string Damage level ('none', 'destroyed', or damage_severity_setting)

#### Returns

[Component](Tables.md#table_Component) The unit's components object

##### Example

` ScenEdit_SetUnitDamage({ side='SideA', unitname='TheShip', fires=1, components={ {'rudder','Medium'}, {'type',type='sensor',1} } })`
