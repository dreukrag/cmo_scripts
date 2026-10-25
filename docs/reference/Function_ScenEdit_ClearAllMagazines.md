### <a name="ScenEdit_ClearAllMagazines"></a> ScenEdit_ClearAllMagazines ( table )

This function removes all weapons from the selected units magazines.

#### Parameters

- table { }
  - side = string The side name of the unit
  - name = string The name of unit
  - guid = string The GUID of the unit

#### Returns

True/False True if unit is valid

##### Example

` ScenEdit_ClearAllMagazines({side="United States", name="USS Test"}) `
