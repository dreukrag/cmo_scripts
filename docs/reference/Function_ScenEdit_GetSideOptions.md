### <a name="ScenEdit_GetSideOptions"></a>ScenEdit_GetSideOptions (options)

This function retrieves the side attributes ( guid, awareness, proficiency)

#### Parameters

- table {}
  - side = string Side name/guid

#### Returns

table {}

- side string Side name
- guid string Side guid
- awareness string Side awareness
- proficiency string Side proficiency

##### Example

` local a = ScenEdit_GetSideOptions( { side='SideA' } )`  
`print(a)`  
`if a.awareness == 'Normal' then print('awareness is normal') end`  
`if a.proficiency == 'Regular' then print('proficiency is regular') end`  
  
`Output`  

{ awareness = 'Normal', side = 'SideA', guid = '387dfb31-e553-412a-8258-9b959aa00aed', proficiency = 'Regular' }  
awareness is normal  
proficiency is regular
