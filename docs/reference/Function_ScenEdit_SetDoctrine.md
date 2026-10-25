### <a name="ScenEdit_SetDoctrine"></a>ScenEdit_SetDoctrine (table, doctrine)

This function Sets the doctrine of the designated object

It modifies the doctrine of that object at the Side,Unit/Group or Mission level

The doctrine level to be affected is determined by the parameters passed:

1.  side only -\> side level
2.  guid, unitname -\> unit/group level
3.  mission -\> mission level

In order to reset a doctrine back to 'inherit', pass a empty 'doctrine' to the function.

#### Parameters

- table {}
  - side = string The side name/GUID of the unit
  - unitname = string The name of unit
  - guid = string The GUID of the unit
  - mission = string The mission guid/name
  - escort = True/False If a mission, apply changes to Escort of Strike mission
- doctrine {} Refer to the Doctrine object [Doctrine](Wrappers.md#wrapper_Doctrine) for the possible values  
  Only the items to be updated need to be added as 'doctrine_item = value'.  
  The value of 'inherit' will reset that doctrine_item to inherit from its parent doctrine, otherwise the value is validated against its acceptable values.

#### Returns

[Doctrine](Wrappers.md#wrapper_Doctrine)Returns the updated doctrine object

##### Example

`ScenEdit_SetDoctrine({side="Soviet Union"}, {kinematic_range_for_torpedoes ="AutomaticAndManualFire",use_nuclear_weapons="yes" })ScenEdit_SetDoctrine({side="Soviet Union", mission="ASW PATROL"}, {kinematic_range_for_torpedoes ="AutomaticAndManualFire",use_nuclear_weapons="yes" })ScenEdit_SetDoctrine({side="Soviet Union", unitname="Bear #2"}, {use_nuclear_weapons="yes" })`
