## <a name="FunctioName"></a>Exporter_SetSetting(Category, Setting, Value)

The function updates some of the settings used by the 'exporting' functions within Command.  
ThIs is mainly used by the Professional versions, with the 'Tacview' category being available in the Public version.  

The settings are stored in the configuration file 'Config\EventExport.ini'.  
These settings should not be changed unless you have some knowledge of what they do.  

Note that the parameters are **case sensitive** for accuracy in setting them.  

### Parameters

- Category string The type of the 'exporter'
- Setting string The parameter that can be changed
- Value string The value of the parameter

### Returns

- None

#### Example

` Exporter_SetSetting('Tacview Settings', 'UseCustomUnitExportFrequency', 'False') `
