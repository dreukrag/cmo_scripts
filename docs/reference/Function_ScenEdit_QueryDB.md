### <a name="ScenEdit_QueryDB"></a>ScenEdit_QueryDB (objectType, DBID)

This function queries the database. Use the wrapper_object_variable.fields to see what can be returned  
The objects currently supported are 'weapon', 'mount' and 'sensor'.

#### Parameters

- objectType string The type of item to query
- DBID number The databse id of item to query

#### Returns

objectObject wrapper

##### Example

` local w = ScenEdit_QueryDB( 'weapon', 1398 )`  
`print( w.OODA) --The OODA loop observe/orient/decide/act `
