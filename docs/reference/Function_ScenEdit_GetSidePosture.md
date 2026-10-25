### <a name="ScenEdit_GetSidePosture"></a>ScenEdit_GetSidePosture ( sideA, sideB)

This function shows the posture of sideA towards sideB.

#### Parameters

- sideA string The first side name/guid
- sideB string The second side name/guid

#### Returns

string The posture as 'N','F','H',or 'A'. If posture is unknown, then '' is returned.

##### Example

`local u = ScenEdit_GetSidePosture( 'NATO', 'Russia' } )`
