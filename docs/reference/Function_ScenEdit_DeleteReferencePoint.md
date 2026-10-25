### <a name="ScenEdit_DeleteReferencePoint"></a>ScenEdit_DeleteReferencePoint (table)

This function will delete a reference point.  
It will check the side's normal RPs, and then the Non_Nav and Exclusion Zones for a match.  
Note that there is no check to see if the RP is actively being used before removing.

#### Parameters

- table {}
  - side = string The side name/guid
  - name = or guid = string The reference point name/guid to delete.

#### Returns

True/FalseTrue if successful

##### Example

`ScenEdit_DeleteReferencePoint( { side="United States", name='RP-1' } )`
