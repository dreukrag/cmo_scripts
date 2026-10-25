### <a name="VP_ExportUnits"></a> VP_ExportUnits (table, filename)

This function exports the current scenario unit details to a file for examination.  
The data could be used to create/copy to an import INST file for later including in a scenario. The export can be optionally filtered similar to the Event Target trigger.

#### Parameters

- table { }
  - targetSide = string The side name/GUID
  - targetType = { } of multiple string List of unit types like { 'aircraft','submarine' }
  - targetSubtype = { } of multiple number
  - specifcUnitClass = { } of multiple number
  - specificUnit = { } of multiple string Unit GUIDs
- filename string Export file name

#### Returns

True/False Success or failure

##### Example

` local ok = VP_ExportUnits( { tagetside ="NATO", targettype = {'aircraft','submarine'} }, core_units ) `
