### <a name="ScenEdit_SetSidePosture"></a>ScenEdit_SetSidePosture (sideA, sideB, posture)

This function Sets side A's posture towards side B to the specified posture.This is the same as [Stance](DataTypes.md#dataType_Stance),but only the first character of the name is

#### Parameters

- sideA string Side A's name or GUID
- sideB string Side B's name or GUID
- posture value 'F' = Friendly  
  'H' = Hostile  
  'N' = Neutral  
  'U' = Unfriendly  
  The posture of side A towards side B

#### Returns

booleanTrue/False for Successful/Failure

##### Example

`ScenEdit_SetSidePosture("LuaSideA","LuaSideB","H")`
