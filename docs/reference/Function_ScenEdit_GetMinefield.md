### <a name="ScenEdit_GetMinefield"></a>ScenEdit_GetMinefield( table )

This function retrieves the mines in a minefield

The Reference Points are checked against the side's normal RPs, and then against the side's non-navigation/exclusion zone RPs.  
Note that the 'area' supports two methods of supplying the RPs; one with just a list of name/guids (the preferred simplier way),  
and the more complicated way with each one being another table.  
The second method would be useful if passing a returned 'area' table from some other function call.  
Both peform the same operation.

#### Parameters

- table {}
  - side = string Side name/guid
  - area = {} of multiple The area defining the minefield
    - name = or guid = string The name/guid of the reference point
    - string The name/guid of the reference point

#### Returns

table {} of multiple Mines in the area

- guid string Mine guid
- type number Mine database id
- delay number Time to fuze
- latitude [latitude](DataTypes.md#dataType_Latitude) The latitude of the mine
- longitude [longitude](DataTypes.md#dataType_Longitude) The longitude of the mine
- depth number Depth of mine

##### Example

`local a = ScenEdit_GetMinefield({side='Blue', area={'rp-1','rp-2','rp-3','rp-4'} } )`
