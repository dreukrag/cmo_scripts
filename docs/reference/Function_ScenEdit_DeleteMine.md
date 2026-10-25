### <a name="ScenEdit_DeleteMine"></a>ScenEdit_DeleteMine (side, guid)

This function deletes a specific mine from a side's minefield

#### Parameters

- side string Side name/guid
- guid string Mine guid

#### Returns

True/FalseTrue if successful

##### Example

`local a = ScenEdit_DeleteMine( { side='Blue', guid='cccccccc'} )`
