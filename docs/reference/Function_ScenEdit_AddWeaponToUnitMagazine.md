### <a name="ScenEdit_AddWeaponToUnitMagazine"></a>ScenEdit_AddWeaponToUnitMagazine (table)

This function adds weapons to a unit magazine.  
Unlike [ScenEdit_AddReloadsToUnit()](#ScenEdit_AddReloadsToUnit) this is adjusting the unit's magazine rather than the local mount. For example, adding more AIM-120 missiles to the carrier magazine for loadout refreshing.  
You can specify a particular \`magazine\` by the GUID, or omit it and the function will try to apply the request to any \`available\` magazines with the \`weapon\`.  

#### Parameters

- table {}
  - side = string The side name/GUID of the unit
  - unitname = string The name of unit
  - guid = string The GUID of the unit
  - wpn_dbid = number The weapon database ID to be updated \*\*MANDATORY\*\*
  - mag_guid = string The magazine GUID on the unit to be updated
  - maxcap = number Use this as an override for the magazine's current maximum capacity for the weapon
  - new = True/False If true, allows the weapon to be treated as a new item in the magazine if it doesn't exist
  - number = number Number to be added or removed
  - remove = True/False If true, this will debuct the number of weapons from the unit/mount
  - fillout = True/False If true, this will fill out the weapon record to its maximum. The parameters 'number' and 'new' don't apply in this case.

#### Returns

number Number of items added to the magazine

##### Example

`ScenEdit_AddWeaponToUnitMagazine( { unitname='Ammo', wpn_dbid=773, number=5, maxcap=10 } )`
