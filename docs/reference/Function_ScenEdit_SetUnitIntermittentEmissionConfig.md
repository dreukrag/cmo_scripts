## <a name="FunctioName"></a>ScenEdit_SetUnitIntermittentEmissionConfig ( AUNameOrID,PresetAlertID,ConfigurationTable )

The function's purpose is to configure the specified Alert Level for Intermittent Emissions.  
There are several Alert levels availbale under the Intermittent Emissions view, and each one can have a different configuration.

### Parameters

- AUNameOrID string The name or GUID of the unit. As no Side is supplied, the unit name would need to be unique across the scenario.
- PresetAlertID value "GREEN"  
  "BLUE"  
  "YELLOW"  
  "ORANGE"  
  "RED"  
  "CUSTOM"  
  "ALL" The Alert level
- ConfigurationTable { }
  - UseEmissionInterval = number Use 0 to turn off or 1 to turn on the Intermittent Emission
  - EmissionDuration = number Emission duration in seconds
  - EmissionInterval = number Emission interval in seconds
  - EmissionIntervalVariation = number Emission variation in seconds
  - SleepModeDelay = number Time to sleep in seconds
  - FollowWRAforWakeBehavior = number Use 0 to turn off or 1 to turn on to follow WRA behavior (UI ???)
  - WakeWhenDetectingThreat = number Use 0 to turn off or 1 to turn on wake up on detecting threat
  - WakeID_UNKNOWN = number Use 0 to turn off or 1 to turn on wake if unknown on detection
  - WwkeID_PRECISEID = number Use 0 to turn off or 1 to turn on if precice ID
  - WakeID_KNWONTYPE = number Use 0 to turn off or 1 to turn on if known type
  - WakeIDKNOWNDOMAIN = number Use 0 to turn off or 1 to turn on if known domain
  - WakeIDKNOWNCLASS = number Use 0 to turn off or 1 to turn on if known class
  - WakeStance_FRIENDLY = number Use 0 to turn off or 1 to turn on if friendly
  - WakeStance_HOSTILE = number Use 0 to turn off or 1 to turn on if hostile
  - WakeStance_NEUTRAL = number Use 0 to turn off or 1 to turn on if neutral
  - WakeStance_UNFRIENDLY = number Use 0 to turn off or 1 to turn on if unfriendly
  - WakeStance_UNKNOWN = number Use 0 to turn off or 1 to turn on if unknown stance

### Returns

- True/False True if successful

#### Example

` ScenEdit_SetUnitIntermittentEmissionConfig ( 'USS Ulysess', 'Green', { UseEmissionInterval=1, EmissionDuration=60, EmissionInterval=120 } ) `
