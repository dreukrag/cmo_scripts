## <a name="FunctioName"></a>ScenEdit_ImportDoctrineFromXML ( table )

**[PRO ONLY]**

The function's purpose is to override the current Doctrine/WRA by importing it from a file.  
The Doctrine can be imported at Side, Unit or Mission level, dependent on the parameters passed.  
This functionality is mirrored by the Template button on the Doctrine UI.

### Parameters

- table { }
  - side = string The side name/GUID
  - unitname = or guid = string The name or guid of unit if doing UNIT level doctrine
  - mission = string The mission name or GUID if doing MISSION level doctrine
  - filename = string The name of the file to load doctrine XML from. Note that the default path of the writable Command path\Defaults is prepended to, and '.xml' appended to the file name  

### Returns

- XML The original doctrine as a XML string

#### Example

` ScenEdit_ImportDoctrineFromXML ( { side = 'USA', filename = 'mySideDoctrine' } ) `
