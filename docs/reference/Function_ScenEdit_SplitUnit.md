## <a name="FunctioName"></a>Function ScenEdit_SplitUnit ( table )

Split a unit in to units with each component mount

### Parameters

- List the parameters as in the Syntax line

### Returns

- Table of unit wrappers

#### Example

` local a = ScenEdit_SplitUnit({name='Mech Inf', guid='ff0ef686-bf03-4228-af7c-a726f8c178cf'})`  
`print(a)`  

{ \[1\] = Command_Core.Facility, \[2\] = Command_Core.Facility, \[3\] = Command_Core.Facility }
