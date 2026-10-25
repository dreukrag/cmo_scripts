### <a name="ScenEdit_SetEMCON"></a>ScenEdit_SetEMCON (type, name, emcon)

This function Sets the EMCON Doctrine of the selected object. Select the object by specifying the type and the object's name. NOTE: To force a unit to immediately adopt the new EMCON Doctrine, use the Unit wrapper to set 'obeyEMCON' to true.

Type is the type of object to set the EMCON on. It can be one of 4 values:

- Side - Set an entire side's EMCON (e.g. United States using active radar)
- Mission - Set the EMCON for a mission (e.g. Minesweepers active sonar)
- Group - Set the EMCON for an entire group (e.g Package \#20 active radar)
- Unit - Set the EMCON for a single group (e.g. Hornet \#14 passive radar)

emcon is a compound structure.The string follows the following grammar,with each clause separated by a semicolon (;)

- `Inherit` indicates that the output EMCON should be at least the parent's EMCON. Inherit must come first.
- A transmitter "set" statement. Each is of the form `type=status`, where type can be any one of `Radar`, `Sonar`, and `OECM`, and status can be any one of `Passive` or `Active`.

#### Parameters

- type string The type of the thing to set the EMCON on.
- name string The name or GUID of the object to select.
- emcon string The new EMCON for the object.

#### Returns

?????

##### Example

`ScenEdit_SetEMCON('Side','NATO','Radar=Active;Sonar=Passive')ScenEdit_SetEMCON('Mission','ASW Patrol #1','Inherit;Sonar=Active')ScenEdit_SetEMCON('Unit','Camel 2','OECM=Active')`
