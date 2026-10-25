## <a name="FunctioName"></a>ScenEdit_SetSideEmconAlertness ( SideNameOrID, PresetAlertID )

The function's purpose is to set the Alert level for the side. This is used to determine which Alert level a unit will use with Intermittent Emissions.

### Parameters

SideNameOrID string The name or GUID of the side.

PresetAlertID value "GREEN"  
"BLUE"  
"YELLOW"  
"ORANGE"  
"RED"  
"CUSTOM"  
"ALL" The Alert level

### Returns

- True/False True if successful

#### Example

` ScenEdit_SetSideEmconAlertness(“Canada”,”red”) `
