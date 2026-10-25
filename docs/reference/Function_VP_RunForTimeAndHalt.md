## <a name="FunctioName"></a>VP_RunForTimeAndHalt ( table )

**[PRO ONLY]**

The function's purpose is to run the simulation for a time duration (HH.MM.SS) and then stop.

### Parameters

- time = string The desired time-span in HH:MM:SS format

### Returns

- result A result message else if an error

#### Example

` local message = VP_RunForTimeAndHalt ( {Time="47.13.28"} ) `
