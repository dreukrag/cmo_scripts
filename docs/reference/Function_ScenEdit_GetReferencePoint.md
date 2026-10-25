### <a name="ScenEdit_GetReferencePoint"></a>ScenEdit_GetReferencePoint ( table)

This function will return details for a specific reference point.  
The RP will be checked against normal side RPs and then against the non-navigation and exclusion zone RPs for a match.

#### Parameters

- table {}
  - side = string Side name/guid
  - name = or guid = string The name/guid of the reference point

#### Returns

[ReferencePoint](Wrappers.md#wrapper_ReferencePoint) Reference point wrapper

##### Example

`local points = ScenEdit_GetReferencePoint( { side="United States", name="rp-100"} )`
