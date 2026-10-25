### <a name="ScenEdit_UnloadCargo"></a> ScenEdit_UnloadCargo (fromUnit) ScenEdit_UnloadCargo(fromUnit, cargoList)

This function Unloads all cargo from a unit. This is equivalent to the 'Unload cargo' unit order.

The 'cargoList' parameter to this function has been deprecated but has been maintained for backward compatibility.

#### Parameters

- fromUnit string The unit name/guid with cargo
- cargoList { } of multiple cargo to affect
  - string Cargo GUID - treated as one unit to act on
  - { } of number Cargo database id (DBID) and is treated as one unit to act on
  - { } of
    - number Number to act on
    - number Cargo DBID to affect

    Note the order of 'number to affect' and 'DBID'

#### Returns

True/False Success/Fail or ` nil` otherwise

##### Example

` ScenEdit_UnloadCargo( '2cd64757-1b66-4609-ad56-df41bee652e5' ) ScenEdit_UnloadCargo( '2cd64757-1b66-4609-ad56-df41bee652e5', { {5,752}, {700 } } )`
