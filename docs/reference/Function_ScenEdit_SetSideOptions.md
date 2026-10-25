### <a name="ScenEdit_SetSideOptions"></a>ScenEdit_SetSideOptions (table)

This function updates the side options

#### Parameters

- table {}
  - side = string The side guid/name
  - awareness = [Awareness](DataTypes.md#dataType_Awareness) The side awareness
  - AutoTrackCivillians = True/False The side sbility to track civilians
  - collectiveResponsibility = True/False The side collective resposibility
  - computerControlledOnly = True/False The side is controlled by AI
  - proficiency = [Proficiency](DataTypes.md#dataType_Proficiency) The side proficiency
  - switchto = True/False \[optional\] Switch the current side to the 'side' parameter.

#### Returns

table {}

- side string Side name
- guid string Side guid
- awareness string Side awareness
- proficiency string Side proficiency

##### Example

Set the side to 'blind' awareness and 'normal' proficiency. Note the use of the description or code number. ` local a = ScenEdit_SetSideOptions({side='sidea', awareness = 'blind', PROFICIENCY= 2})`  
`print(a)`  
`if a.awareness == 'Normal' then print('awareness is normal') end`  
`if a.proficiency == 'Regular' then print('proficiency is regular') end`  
  
`Output`  

{ awareness = 'Blind', side = 'SideA', guid = '387dfb31-e553-412a-8258-9b959aa00aed', proficiency = 'Regular' }  
proficiency is regular
