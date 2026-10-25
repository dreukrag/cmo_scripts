## <a name="FunctioName"></a>ScenEdit_ImportScenarioFromXML ( table )

**[PRO ONLY]**

The function's purpose is to import a XML string or the XML content of a file, as if loading a scenario.  
Lua I/O methods are enabled for reading the file.  

### Parameters

- table { }
  - XML = string The raw XML string to load as a scenario
  - filename = string The name of the file containing the raw XML to load as a scenario. Note that the writable Command path is prepended to the file name.  

  These two parameters are mutally exclusive, either load a file or a XML string.  

### Returns

- True/False True if successful

#### Example

` local a = ScenEdit_ImportScenarioFromXML ( {XML = 'a big XML string' } ) `
