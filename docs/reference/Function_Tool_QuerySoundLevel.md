### <a name="Tool_QuerySoundLevel"></a> Tool_QuerySoundLevel ( table)

Returns the sound SL of naval units

#### Parameters

- table { }

- - targetunitname stringThe guid/name of the unit that is sensing the target.
  - targetside string(Optional) name of unit side
  - aspect = Aspect 'FRONT','SIDE','REAR','ALL'  
    (Optional) aspect to measure; REAR is default  
  - frequency = Freq 'VLF','LF','MF','HF'  
    (Optional) sound band of interest; LF is default  

#### Returns

number Returns a numerical value representing the SL in the given band if ASPECT is not ALL

OR

{'front', 'side', 'rear' } Returns a Lua table of SL values if ASPECT is ALL  

##### Example

` print(Tool_QuerySoundLevel({targetunitname="DDG 113 John Finn [Arleigh Burke Flight IIA Restart]", frequency='vlf', aspect='all'})) `

{ front = 67.5999984741211, side = 68.1999969482422, rear = 68.8000030517578 }

print(Tool_QuerySoundLevel({targetunitname="DDG 113 John Finn \[Arleigh Burke Flight IIA Restart\]", frequency='vlf'})) ' as is

68.8000030517578

print(Tool_QuerySoundLevel({targetunitname="DDG 113 John Finn \[Arleigh Burke Flight IIA Restart\]", frequency='vlf', aspect='side'}))

68.1999969482422
