## <a name="FunctioName"></a>Command_SaveScen( saveFile )

This function creates an instant save file.  
This could be triggered to be run at specific times after certain events as a checkpoint for recovery or an AAR,  

### Parameters

- saveFile string The **full path** to the location to create the save file.

### Returns

- None

#### Example

` Command_SaveScen("C:/temp/mysave.save") `
