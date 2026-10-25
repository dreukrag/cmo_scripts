### <a name="ScenEdit_SetTime"></a> ScenEdit_SetTime ( table )

This function Sets the current scenario date/time, but allows the scenario start data to be updated as well.  
Note the default format ('MM.DD.YYYY') for the public release, differs from the default mode ('DD.MM.YYYY') in the professional release.  
If a scenario wants to be used between both releases, the new DATEFORMAT parameter should used to define the date passed.

#### Parameters

- table { } of
  - dateformat = string Formats are: 'DDMMYYYY' or 'MMDDYYYY' or 'YYYYMMDD' Note that they need to be **uppercase**.  
    The default format for Public versions is 'MMDDYYYY', while the Professional versions use 'DDMMYYYY' if this parameter is not supplied.
  - date = string Scenario current date as per the date format  
    'DD.MM.YYYY' or 'MM.DD.YYYY' or 'YYYY.MM.DD' The delimiter '.' can also be a ':'  
  - time = string Scenario current time as 'HH:MM:SS' or 'HH.MM.SS'
  - StartDate = string Scenario start date as 'DD:MM:YYYY' or 'DD.MM.YYYY'.
  - StartTime = string Sceanrio start time as 'HH:MM:SS' or 'HH.MM.SS'
  - Duration = string Length of scenario as 'days:hours:minutes'

#### Returns

number Scenario current time in seconds

##### Example

Depending on release, the date would be 2 December or 12 February for pro and public respectively. ` ScenEdit_SetTime({Date= "2.12.2007", Time= "22.46.23"})` This example explicitly says the date is 2 December regardless of the build. ` ScenEdit_SetTime({DateFormat= "DDMMYYYY", Date= "2.12.2007", Time= "22.46.23"})`
