### <a name="ScenEdit_GetReferencePoints"></a>ScenEdit_GetReferencePoints ( table)

This function will return the details for a range of reference point.  
The RP will be checked against normal side RPs and then against the non-navigation and exclusion zone RPs for a match.

#### Parameters

- table {}
  - side = string Side name/guid
  - name = or guid = string The name/guid of the reference point (for a single point)
  - area = {} of multiple For multiple RPs
    - name = or guid = string The name/guid of the reference point
    - string The name/guid of the reference point

#### Returns

table {} of multiple [ReferencePoint](Wrappers.md#wrapper_ReferencePoint) Reference point wrappers

##### Example

`local points = ScenEdit_GetReferencePoints( { side="United States", area={ "rp-100", "rp-101", "rp-102", "rp-103", "rp-104"} } )`
