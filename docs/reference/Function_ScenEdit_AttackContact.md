### <a name="ScenEdit_AttackContact"></a>ScenEdit_AttackContact (attackerID, contactId, options)

This function causes an attack on a contact as an auto-target or manual target, with weapon allocation.

For a BOL attack, use "BOL" as the contactId.

**Note:** The function will use the **weapon** from the aircraft loadout if applicable when no **mount** is supplied.  
If no 'mount' is supplied, the first available one with the 'weapon' will be used.

#### Parameters

- attackerID string The attacking unit name/guid
- contactId string The contact being attacked as a name/guid (GUID is better as the name can change as its classification changes)
- options {}
  - mode = TargetingMode0 = AutoTargeted, 1 = ManualWeaponAlloc, 2 = ManualTargeted The attack behaviour. 'ManualWeaponAlloc' requires supplying the weapon information to fire with.
  - mount = number The mount dbid to fire from \[Applies to manual weapon launch \]
  - weapon = number The weapon dbid on the mount to fire \[Applies to manual weapon launch \]
  - qty = number The number of weapons to fire in this salvo \[Applies to manual weapon launch \]
  - latitude = [latitude](DataTypes.md#dataType_Latitude) The latitude of the aimpoint
  - longitude = [longitude](DataTypes.md#dataType_Longitude) The longitude of the aimpoint
  - course = {} of multiple The course of the weapon(s) launched to the aimpoint/contact, otherwise direct to aimpoint. There is no check that the weapon can still hit the target after applying the 'course'.
    - latitude = [latitude](DataTypes.md#dataType_Latitude) The latitude of the waypoint
    - longitude = [longitude](DataTypes.md#dataType_Longitude) The longitude of the waypoint

#### Returns

True/False True if attack successfully assigned

##### Example

`ScenEdit_AttackContact( 'Phantom #1', 'SKUNK #12', { mode='1', mount=438, weapon=1413, qty=10 } )`
