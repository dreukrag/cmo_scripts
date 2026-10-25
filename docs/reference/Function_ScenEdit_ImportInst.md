### <a name="ScenEdit_ImportInst"></a>ScenEdit_ImportInst (side,filename)

This function imports unit(s) in XML format from an INST file in the folder 'ImportExport'.

#### Parameters

- side string The side to import the inst file as
- filename string The filename of the inst file. Use the relative path from the ImportExport folder

#### Returns

number Number of units imported

##### Example

This will base a unit 'f4f9e0af-15c2-4582-8e80-b827c2ec2f56' at the base 'San Diego'. ` local a = ScenEdit_ImportInst( "BLUE","Spain/Air Base Albacete.inst" ) `
