### <a name="ScenEdit_DeleteMinefield"></a>ScenEdit_DeleteMinefield (side, area)

This function will delete all the mines owned by the side in the minefield as defined by 'area'.  
The Reference Points are checked against the side's normal RPs, and then against the side's non-navigation/exclusion zone RPs.  
Note that the 'area' supports two methods of supplying the RPs; one with just a list of name/guids (the preferred simplier way),  
and the more complicated way with each one being another table.  
The second method would be useful if passing a returned 'area' table from some other function call.  
Both peform the same operation.

#### Parameters

- side string Side name/guid
- area = {} of multiple The area defining minefield to remove
  - name = or guid = string The name/guid of the reference point
  - string The name/guid of the reference point

#### Returns

number Number of mines removed

##### Example

`local a = ScenEdit_DeleteMinefield( { side='Blue', area={ 'rp-1', 'rp-2', 'rp-3', 'rp-4' } } )`
