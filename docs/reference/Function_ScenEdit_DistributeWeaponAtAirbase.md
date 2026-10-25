## <a name="FunctioName"></a>ScenEdit_DistributeWeaponAtAirbase ( table )

The function's purpose is to distribute a number of weapons across the magazine(s) in a group (typically an airbase)

### Parameters

- table {}
  - side = string The side name/GUID of the unit
  - unitname = string The name of unit
  - guid = string The GUID of the unit
  - wpn_dbid = number The weapon database ID
  - number = number Number to be added

### Returns

- None

#### Example

` ScenEdit_DistributeWeaponAtAirbase ( { side='NATO', unitname='Hamburg AF', wpn_dbid=773, number=50} ) `
