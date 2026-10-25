### <a name="ScenEdit_GetFormation"></a>ScenEdit_GetFormation (table)

This function gets the properties of a groups formation.

#### Parameters

- table {}
  - side = string The side name of the unit
  - name = string The name of unit
  - guid = string The GUID of the unit

#### Returns

[Unit wrapper](Wrappers.md#wrapper_Unit) if the unit exists, or `nil` otherwise  
  

**Note:** When run interactively (i.e. in the console) ScenEdit_GetUnit() will raise an exception if the selected unit is not found. This can be prevented using [Tool_EmulateNoConsole()](#Tool_EmulateNoConsole()).

##### Example 1

` local formation = ScenEdit_GetFormation({side='Blue', name='Group 16'}) print(formation) `

{  
spacing_unit = 1,  
lead = 'TTZL89-0HNB8KFCH7IQ1',  
name = 'Column',  
spacing = 1,  
1 = {  
longitude = -125.982767420485,  
sprint = 'False',  
bearing = 180,  
distance = 1,  
guid = 'TTZL89-0HNB8KFCH7JFM',  
type = 'Rotating', latitude = 36.7916933243477  
},  
2 = {  
longitude = -125.982767420485,  
sprint = 'False',  
bearing = 180,  
distance = 2,  
guid = 'TTZL89-0HNB8KFCH7K61',  
type = 'Rotating', latitude = 36.7750457370943  
},  
3 = {  
longitude = -125.982767420485,  
sprint = 'False',  
bearing = 180,  
distance = 3,  
guid = 'TTZL89-0HNB8KFCH7KS4',  
type = 'Rotating', latitude = 36.7583981481733  
}
