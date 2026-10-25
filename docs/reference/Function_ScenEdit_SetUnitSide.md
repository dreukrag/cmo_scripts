### <a name="ScenEdit_SetUnitSide"></a> ScenEdit_SetUnitSide ( table )

This function Changes the side of a unit.  
Passing a group will change the attached units too

#### Parameters

- table { }
  - side = string The side name/GUID of the unit
  - unitname = string The name of unit
  - guid = string The GUID of the unit
  - newSide = string The name/guid to change the 'unit' to

##### Example

` ScenEdit_SetUnitSide({side='Old Side', name='Eagle #1', newside='New Side'})`
