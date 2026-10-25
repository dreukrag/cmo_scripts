## <a name="FunctioName"></a>ScenEdit_DuplicateEmconConfigToSide ( PresetAlertID, SourceSideNameOrID, TargetSideNameOrID )

The function's purpose is to duplicate an Alert setting from one side to another side.

### Parameters

- SourceSideNameOrID string The name or GUID of the side to copy Alert configuration from.
- TargetSideNameOrID string The name or GUID of the side to copy Alert configuration to.
- PresetAlertID value "GREEN"  
  "BLUE"  
  "YELLOW"  
  "ORANGE"  
  "RED"  
  "CUSTOM"  
  "ALL" The Alert level

### Returns

- True/False True if successful

#### Example

` ScenEdit_DuplicateEmconConfigToUnit('green', 'canada', 'USA') `
