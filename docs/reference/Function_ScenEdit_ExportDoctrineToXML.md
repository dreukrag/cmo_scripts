## <a name="FunctioName"></a>ScenEdit_ExportDoctrineToXML ( table )

**[PRO ONLY]**

This function's purpose is to export the Doctrine and WRA to a file for modifying or later import.  
This can then be used as a template for later importing.  
The Doctrine can be exported at Side, Unit or Mission level, dependent on the parameters passed.  
Normally only the non-inherited values between the Side Doctrie and the requested level are captured.  
To get all doctrine settings, you would need to export the Side Doctrine, and then the Unit or Mission doctrine to get any non-inherited values.  
This functionality is mirrored by the Template button on the Doctrine UI.

### Parameters

- table { }
  - side = string The side name/GUID
  - unitname = or guid = string The name or GUID of unit if doing UNIT level doctrine
  - mission = string The mission name or GUID if doing MISSION level doctrine
  - filename = string The name of the file to hold the doctrine XML. Note that the default path of the writable Command path\Defaults is prepended to, and '.xml' appended to the file name.  

### Returns

- XML The doctrine as a XML string that was saved to the file.

#### Example

` ScenEdit_ExportDoctrineToXML ( { side = 'USA', filename = 'mySideDoctrine' } ) `
