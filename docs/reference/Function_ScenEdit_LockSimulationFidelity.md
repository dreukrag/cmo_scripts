## <a name="FunctioName"></a>ScenEdit_LockSimulationFidelity( IsLocked )

**[PRO ONLY]**

The function's purpose to un/lock the 'fidelity' of the simulation. This affects the ability to change the time compression/fidelity of the simulation.  
This would be useful during replays of a particular scenario to ensure results not influenced by internal timing changes.

### Parameters

- IsLocked True/False Lock in or free up the ability to change the simulation's 'fidelity'

### Returns

- None

#### Example

` ScenEdit_LockSimulationFidelity( true ) `
