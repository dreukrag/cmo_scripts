### <a name="ScenEdit_ExportInst"></a>ScenEdit_ExportInst (side, unitList, fileData)

This function export unit(s) in XML format to an INST file in folder 'ImportExport'.

If the unit to be exported is a group, then the units in the group are automatically included.  
If there are differences between the unit and the 'vanilla' unit in the database, a 'delta' is created as part of the export.

#### Parameters

- side string The name/GUID of the side owning the exported units
- unitList {} of multiple The units to be included in the export
  - string The name/GUID of the units to be exported
- fileData {} The export file details.
  - filename = string The Filename is mandatory
  - name = string The name to be displayed on the in-game list
  - comment = string

#### Returns

number The number of units exported to the file, else 0

##### Example

` ScenEdit_ExportInst('Russia', {'c1a0e312-9ccc-43d1-9e6c-01899c8433d9'}, {filename='ssbn_patrol.inst',name='SSBN on Patrol',comment='Russian SSBN on patrol in Barents'}) `
