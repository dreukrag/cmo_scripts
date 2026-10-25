### <a name="ScenEdit_HostUnitToParent"></a>ScenEdit_HostUnitToParent (table)

This function hosts (bases) a unit on another unit.  

- If 'SelectedHostNameOrID' is used, then the unit will be moved from any location, including flying, to the location of the 'host' unit.
- If 'SelectedBaseNameOrID' is used, then the unit's base will be set to this location only.

The parameters 'SelectedHostNameOrID' and 'SelectedBaseNameOrID' are usually mutally exclusive, and only one would normally be used at a time. They do the same 'basing' but one is immeditate the other not.  
You can use both if you want to home port a unit but have it return to a different base.

#### Parameters

- table {}
  - HostedUnitNameOrID = string The name or GUID of the unit to update.  
    The alternate parameter HostedUnitNameOrID can be used instead.
  - SelectedHostNameOrID = string The name or GUID of the host to move the unit into.  
    The alternate parameter HostBaseNameOrID can be used instead.
  - SelectedBaseNameOrID = string The name or GUID of the host to be the unit's assigned base.  
    The alternate parameter AssignedBaseNameOrID can be used instead.

  "UnitX" can be used as a value in the above parameters when in an event script.

#### Returns

True/False True if successful.  
OR if supplying both base parameters in same method. \[0\] = host base T/F, \[1\] = assigned base T/F True if successful.

##### Example

This will base a unit 'f4f9e0af-15c2-4582-8e80-b827c2ec2f56' at the base 'San Diego'. ` local a = ScenEdit_HostUnitToParent( {HostedUnitNameOrID='f4f9e0af-15c2-4582-8e80-b827c2ec2f56', SelectedBaseNameOrID = 'San Diego' } ) ` This will host a unit 'f4f9e0af-15c2-4582-8e80-b827c2ec2f56' at the base 'San Diego' immefiately. ` local a = ScenEdit_HostUnitToParent( {HostedUnitNameOrID='f4f9e0af-15c2-4582-8e80-b827c2ec2f56', SelectedHostNameOrID = 'San Diego' } ) ` Using the new alias names ` local unit_ship1 = ScenEdit_GetUnit({side = "Side A", name = "Ship 1"})`  
  
`local base_portA = ScenEdit_GetUnit({side = "Side A", name = "Port A"})`  
`local base_portB = ScenEdit_GetUnit({side = "Side A", name = "Port B"})`  
  
`local rebase_Ship1 = ScenEdit_HostUnitToParent({UnitName = unit_ship1.guid, AssignedBaseNameOrID = base_portA.guid})`  
`if type(rebase_Ship1) == 'boolean' then`  
`print(tostring(rebase_Ship1))`  
`else`  
`print(tostring(rebase_Ship1[0]) .. ' ' .. tostring(rebase_Ship1[1]))`  
`end`
