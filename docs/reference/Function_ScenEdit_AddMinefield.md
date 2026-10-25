### <a name="ScenEdit_AddMinefield"></a>ScenEdit_AddMinefield( table )

This function will attempt to lay a minefield for a Side consisting of the mine type, a number to lay, an arming delay and the area of the field to sow them in.  
Mines are laid within their depth settings, and there are proximity considerations. This is why the full number might not be laid in one execution of the command.  

Normal RPs are checked first, and then the No-nav/Exclusion zone RPs for the area to lay the mines in.

If NO mines are being laid, check that the water depth is within the parameters of the mine being laid.  

#### Parameters

- table {}
  - area = {} of multiple The area to lay the mines in
    - string The reference point guid/name
  - dbid = number The database id of the mine to use
  - delay = number The arming delay in seconds
  - number = number The number of mines to attempt to lay
  - side = string The Side name/guid that owns the mines

#### Returns

number number of mines actually laid

##### Example

` local a = ScenEdit_AddMinefield( { side='Sidea', dbid=634, number=100, delay=60000, area={'rp-3136','rp-3137','rp-3138','rp-3139'} } )`  
`print('Number laid ' .. a)`  
  

Number laid 51
