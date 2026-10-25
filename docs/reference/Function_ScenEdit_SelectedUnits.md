### <a name="ScenEdit_SelectedUnits"></a>ScenEdit_SelectedUnits ()

This function returns a list (of name and guid) of the units (actual or contact) currently selected

#### Parameters

- None

#### Returns

table {} of

- units {} of multiple
  - guid string
  - name string
- contacts {} of multiple
  - guid string
  - name string

A Table of ids for selected 'units'and 'contacts'.

##### Example

` local selected = ScenEdit_SelectedUnits( )`  
`print(selected.units) -- list of selected units `
