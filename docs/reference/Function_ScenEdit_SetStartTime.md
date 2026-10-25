### <a name="ScenEdit_SetStartTime"></a>ScenEdit_SetStartTime ( table )

This function Sets the scenario start date/time.  
The default format of the date is MMDDYYYY. It can be changed by using the 'dateformat' parameter.

#### Parameters

- table {} of

  
| date = | string | Scenario start date as 'MM:DD:YYYY' or 'MM.DD.YYYY'. |
|---|---|---|
| time = | string | Scenario start time as 'HH:MM:SS' or 'HH.MM.SS' |
| duration = | string | Length of scenario as 'days:hours:minutes' |
| dateformat = | value<br>"DDMMYYYY"<br>"MMDDYYYY"<br>"YYYYMMDD" | Overriding format of the date |

#### Returns

number Scenario start time in seconds

##### Example

` ScenEdit_SetStartTime({Date="2.12.2007", Time="22.46.23", Duration="60.5:0:0"})`
