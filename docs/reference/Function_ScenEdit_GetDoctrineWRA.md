### <a name="ScenEdit_GetDoctrineWRA"></a>ScenEdit_GetDoctrineWRA ( table )

This function retrieves the WRA doctrine based on the target type and weapon.

There are various levels that affect the doctrine used; mainly SIDE, MISSION, GROUP, UNIT.  
Units will inherit from a higher level if there is no specific setting at the currect level.  
Passing a unit name/guid will indicate a UNIT/GROUP doctrine, while passing a mission name/guid will indicate a MISSION doctrine and just a side name/guid a SIDE doctrine.

One parameter of `side`, `mission`, `unitname` or `guid` is mandatory. One parameter for `contact_id` or `target_type` is mandatory

If no `weapon_id` is supplied but just the `target_type`, then a WRA table (WRA\_#) is returned for each weapon that can engage that target_type

#### Parameters

- table {}
  - side = string The side name/guid
  - mission = string The mission name/guid
  - unitname = string The unit name/guid
  - guid = string The unit name/guid
  - weapon_id = string The weapon database id
  - contact_id = string A contact guid (infers the target_type)
  - target_type = [TargetType](DataTypes.md#dataType_TargetTypeWRA) The target type
  - full_wra = True/False Show the full WRA setting rather than just if there is a match

#### Returns

Table {} A Table of WRA doctrine values similar to the wrapper [DoctrineWRA](Wrappers.md#wrapper_DoctrineWRA), or `nil` if none.  
An empty table {} may be returned if there are no matching entries especially if doning a full WRA.

##### Example

`ScenEdit_GetDoctrineWRA( { guid ='a1a52edf-3541-4b55-bea4-58d4e1ab11dc', contact_id='Boeing 747-8F #610', weapon_id=1575 } )ScenEdit_GetDoctrineWRA( { side='sidea', target_type='Surface_Contact_Unknown_Type', weapon_id=1575 } )`
