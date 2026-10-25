## <a name="FunctioName"></a>ScenEdit_ExportScenarioToXML ( )

**[PRO ONLY]**

The function's purpose is to export the scenario as a raw XML string for saving or exporting.  
This could be used later to import the scenario into Command.  
Care should be taken if making any changes to the XML.

### Parameters

- table { }
  - filename = string The name of the filepath to write the XML.  

### Returns

- XML The raw XML string that can be saved or exported.

#### Example

` local a = ScenEdit_ExportScenarioToXML ( ) ScenEdit_ExportScenarioToXML ({filename='C:\\tmp\\scenario.xml'}) `
