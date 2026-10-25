## <a name="FunctioName"></a>ScenEdit_ClearUnitEmconConfigs( AUNameOrID )

The function's purpose is to clear any Intermittent Emission configuration for the unit.

### Parameters

- AUNameOrID string The name or GUID of the unit. As no Side is supplied, the unit name would need to be unique across the scenario.

### Returns

- True/False True if successful

#### Example

` ScenEdit_ClearUnitEmconConfigs ( 'USS Ulysess' ) `
