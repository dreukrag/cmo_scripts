## <a name="FunctioName"></a>ScenEdit_DuplicateEmconConfigToUnit ( PresetAlertID, SourceAUNameOrID, TargetAUNameOrID )

The function's purpose is to copy a unit's Alert configuration to another unit.

### Parameters

- SourceAUNameOrID string The name or GUID of the unit to copy Alert configuration from. As no Side is supplied, the unit name would need to be unique across the scenario.
- TargetAUNameOrID string The name or GUID of the unit to copy Alert configuration to. As no Side is supplied, the unit name would need to be unique across the scenario.
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

` ScenEdit_DuplicateEmconConfigToUnit('green', 'USS Ulysess', 'USS Troy') `
