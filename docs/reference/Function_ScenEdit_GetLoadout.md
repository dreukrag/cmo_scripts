### <a name="ScenEdit_GetLoadout"></a>ScenEdit_GetLoadout ( loadoutinfo )

This function retrieves the loadout details of an aircraft. For the aircraft current loadout, use a `loadoutid` =0 or omit it to get the current loadout status (e.g. number of weapons left)

UnitX can be used as the `unitname>` if in a triggered event

#### Parameters

- table {}
  - unitname = string The name/GUID of the unit
  - LoadoutID = number The loadout database id; 0 = use the current loadout

#### Returns

[Loadout](Wrappers.md#wrapper_Loadout)Loadout wrapper

##### Example

` local u = ScenEdit_GetLoadout( { unitname='Test flight' } )`  
`if u.weapons[1].wpn_current == 0 then`  
`print( "Out of " .. u.weapons[1].wpn_name)`  
`end `
