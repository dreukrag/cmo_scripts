### <a name="ScenEdit_TransferCargo"></a> ScenEdit_TransferCargo (fromUnit, toUnit, cargoList)

This function Transfers a cargo list from a 'parent' to a 'child' unit

#### Parameters

- fromUnit string The unit name/guid with the cargo
- toUnit string The unit name/guid get the cargo
- cargoList { } of multiple cargo to affect
  - string Cargo GUID - treated as one unit to act on
  - { } of number Cargo database id (DBID) and is treated as one unit to act on
  - { } of
    - number Number to act on
    - number Cargo DBID to affect

    Note the order of 'number to affect' and 'DBID'

#### Returns

True/False Successful or not

##### Example

` ScenEdit_TransferCargo( '2cd64757-1b66-4609-ad56-df41bee652e5','Perth RAN', { {5,752}, {700 } } )`
