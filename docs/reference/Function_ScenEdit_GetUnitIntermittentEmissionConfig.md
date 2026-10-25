## <a name="FunctioName"></a>ScenEdit_GetUnitIntermittentEmissionConfig ( AUNameOrID,PresetAlertID )

The function's purpose is to recall the configuation of the unit at the specified Alert.

### Parameters

- AUNameOrID string The name or GUID of the unit. As no Side is supplied, the unit name would need to be unique across the scenario.
- PresetAlertID value "GREEN"  
  "BLUE"  
  "YELLOW"  
  "ORANGE"  
  "RED"  
  "CUSTOM"  
  "ALL" The Alert level

### Returns

- ConfigurationTable { }
  - UseEmissionInterval True/False
  - EmissionDuration number Emission duration in seconds
  - EmissionInterval number Emission interval in seconds
  - EmissionIntervalVariation number Emission variation in seconds
  - SleepModeDelay number Time to sleep in seconds
  - FollowWRAforWakeBehavior True/False
  - WakeWhenDetectingThreat True/False
  - WakeID_UNKNOWN True/False
  - WwkeID_PRECISEID True/False
  - WakeID_KNWONTYPE True/False
  - WakeIDKNOWNDOMAIN True/False
  - WakeIDKNOWNCLASS True/False
  - WakeStance_FRIENDLY True/False
  - WakeStance_HOSTILE True/False
  - WakeStance_NEUTRAL True/False
  - WakeStance_UNFRIENDLY True/False
  - WakeStance_UNKNOWN True/False

#### Example

` local conf = {};`  
`conf = ScenEdit_GetUnitIntermittentEmissionConfig ( 'USS Ulysess', 'Green') `
