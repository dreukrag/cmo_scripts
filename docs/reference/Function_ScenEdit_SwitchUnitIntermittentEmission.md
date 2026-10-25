## <a name="FunctioName"></a>ScenEdit_SwitchUnitIntermittentEmission( AUNameOrID,PresetAlertID,Switch )

The function's purpose is to turn off/on the Intermittent Emission for the specified Alert Level

### Parameters

- AUNameOrID string The name or GUID of the unit. As no Side is supplied, the unit name would need to be unique across the scenario.
- PresetAlertID value "GREEN"  
  "BLUE"  
  "YELLOW"  
  "ORANGE"  
  "RED"  
  "CUSTOM"  
  "ALL" The Alert level
- Switch number Use 0 to turn off the Emission interval, 1 to turn on the Emission interval (USEEMISSIONINTERVAL)

### Returns

- True/False True if successful

#### Example

` ScenEdit_SwitchUnitIntermittentEmission ( 'USS Ulysess', 'Green', 1 ) -- turn on interval for Alert level Green for the unit `
