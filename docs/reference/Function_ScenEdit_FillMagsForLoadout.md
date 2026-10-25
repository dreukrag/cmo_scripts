### <a name="ScenEdit_FillMagsForLoadout"></a>ScenEdit_FillMagsForLoadout (table, loadoutid, quantity)

This function adds to a unit's magazine(s) the aircraft stores in the loadout.

#### Parameters

- table {}
  - side = string The side name/guid of the unit
  - unitname = string The unit name/guid with the magazine
  - guid = string The unit name/guid with the magazine
- loadoutid number The database id of the loadout
- quantity number The number of 'packs' in the loadout to add

#### Returns

Table {} of string A table of success/failure messages from adding the stores

##### Example

`ScenEdit_FillMagsForLoadout({unit='RAF Lakenheath', loadoutid=45162, quantity=12})`
