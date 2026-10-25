## <a name="FunctioName"></a>VP_RunToTimeAndHalt ( table )

**[PRO ONLY]**

The function's purpose is to run the simulation to a specific date/time and then stop.  
The time is in UTC.

### Parameters

- date = string The desired date in DD:MM:YYYY format. The format can be overriden by using 'dateformat' to select a different format.
- time = string The desired time-span in HH:MM:SS format
- dateformat = value "DDMMYYYY"  
  "MMDDYYYY"  
  "YYYYMMDD"

### Returns

- result A result message else if an error

#### Example

` local message = VP_RunToTimeAndHalt({Date="2.12.2007", Time="22.46.23"}) `
