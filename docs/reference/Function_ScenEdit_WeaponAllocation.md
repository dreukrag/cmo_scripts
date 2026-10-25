### <a name="ScenEdit_WeaponAllocation"></a>ScenEdit_WeaponAllocation (attackerID, contactId, attackingSideID)

This function returns the type and number of weapons allocated by a unit or side

#### Parameters

- attackerID string The attacking unit guid
- contactId string The contact guid being attacked
- attackingSideID string The attacking side guid

#### Returns

table {} of weapons allocated to the contact. Can be from a single shooter or all units attacking from a side

- shooter string Shooter GUID
- qtyAssigned number Quantity of weapons allocated
- weapon string Weapon DBID
- weaponName string Weapon name
- target string Target GUID
- qtyFired number Quantity of weapons fired

##### Example 1

Returns all allocated weapons from a single shooter ` local weaponsAllocation = ScenEdit_WeaponAllocation( 'TTZL89-0HNB700MD8D73', 'TTZL89-0HNB700MD8A4G' )`  
`print(weaponsAllocation)`  
  
`Output`  

{ \[1\] = { shooter = 'TTZL89-0HNB700MD8D73', qtyAssigned = 1, weapon = 779, weaponName = 'MGM-140B ATACMS Blk IA \[275 x M74 Dual Purpose\]', target = 'TTZL89-0HNB700MD8A4G', qtyFired = 1 } }

##### Example 2

Returns all allocated weapons from the side attacking the contact ` local weaponsAllocation = ScenEdit_WeaponAllocation( nil, 'TTZL89-0HNB700MD8A4G', 'TTZL89-0HNB700MD8A45' )`  
`print(weaponsAllocation)`  
  
`Output`  

{  
\[1\] = { shooter = 'TTZL89-0HNB700MD8D73', qtyAssigned = 1, weapon = 779, weaponName = 'MGM-140B ATACMS Blk IA \[275 x M74 Dual Purpose\]', target = 'TTZL89-0HNB700MD8A4G', qtyFired = 1 },  
\[2\] = { shooter = 'TTZL89-0HNB700MD8AE5', qtyAssigned = 2, weapon = 11, weaponName = 'AGM-158B JASSM-ER', target = 'TTZL89-0HNB700MD8A4G', qtyFired = 2 }  
}
