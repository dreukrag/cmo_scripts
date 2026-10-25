### <a name="ScenEdit_GetDoctrine"></a>ScenEdit_GetDoctrine ( table )

This function looks up the doctrine of the object selected, and throws an exception if the unit does not exist.

There are various levels that affect the doctrine used; mainly SIDE, MISSION, GROUP, UNIT.  
Units will inherit from a higher level if there is no specific setting at the currect level.  
Passing a unit name/guid will indicate a UNIT/GROUP doctrine, while passing a mission name/guid will indicate a MISSION doctrine and just a side name/guid a SIDE doctrine.

One parameter of `side`, `mission`, `unitname` or `guid` is mandatory.

Only the non-inherited values are returned unless the option ACTUAL is used.

#### Parameters

- table {}
  - side = string The side name/guid
  - unitname = string The unit name/guid
  - guid = string The unit name/guid
  - mission = string The mission name/guid GUID
  - escort = True/False If a strike mission, use the Escort mission doctrine
  - escort = True/False If a strike mission, use the Escort mission doctrine
  - actual = True/False Show the actual doctrine setting rather than just that it is 'inherit'
  - player_editable = True/False Make the settings available to player to change

#### Returns

Table {} A Table of doctrine values similar to the wrapper [Doctrine](Wrappers.md#wrapper_Doctrine) or `nil` if an error.

##### Example

`ScenEdit_GetDoctrine( { side="Soviet Union" } ).use_nuclear_weaponsScenEdit_GetDoctrine( { side="Soviet Union", mission="Strike out", actual = true } ).use_nuclear_weapons`
