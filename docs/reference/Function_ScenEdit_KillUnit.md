### <a name="ScenEdit_KillUnit"></a>ScenEdit_KillUnit (table)

This function kills an unit....and triggers any events.

#### Parameters

- table {}
  - side = string The side name/GUID of the unit
  - unitname = string The name of unit
  - guid = string The GUID of the unit

#### Returns

True True if successful, or `nil` otherwise

##### Example

` local a = ScenEdit_KillUnit( { side='SideA', unitname='ship'} ) `
