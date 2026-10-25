## <a name="FunctioName"></a>ScenEdit_SetExportOutputRate ( type, rate )

**[PRO ONLY]**

The function's purpose is to control the frequency of events being exported.  
The Export type is limited to 'UnitPositions' at present.  

### Parameters

- type 'UnitPositions' The only value being used currently
- rate valueValues are:  
  "CONTINUOUS"  
  "1SECOND"  
  "2SECONDS", "2SECOND"  
  "5SECONDS", "5SECOND"  
  "15SECONDS", "15SECOND"  
  "30SECONDS", "30SECOND"  
  "1MINUTE"  
  "5MINUTES", "5MINUTE"  
  "15MINUTES", "15MINUTE"  
  "30MINUTES", "30MINUTE"  
  "1HOUR"  
  "6HOURS", "6HOUR"  
  "12HOURS", "12HOUR"  
  "24HOURS", "24HOUR"  
  "MATCHSIMSPEED"  

### Returns

- True/False True if successful

#### Example

` local ok = ScenEdit_SetExportOutputRate('UnitPositions', '30Seconds') `
