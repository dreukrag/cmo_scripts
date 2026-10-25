### <a name="ScenEdit_AddCustomLoss"></a>ScenEdit_AddCustomLoss ( SideNameOrId, table )

This function adds entries to the loss list so they can be reported.  
This allows adding non-play items (such as casualties) to the Loss & Expenditure view to enhance the experience.  
It will also show up in the wrapper for Side losses.  
  
Updating the entries replaces what was there before hand, so to remove an entry, just use a number of 0.

#### Parameters

- SideNameOrId string The side name/guid to be affected
- table of multiple {}
  - string The reported name of the loss item
  - number The new number to apply to it

#### Returns

- True/False True if successful

##### Example

` local s = VP_GetSide( {side='sidea'} ) -- get the side object`  
`print(s.losses) -- show the current losses`  

{ \[1\] = { dbid = 0, name = 'Casualties', type = 'Custom', count = '5000' }, \[2\] = { dbid = 0, name = 'removethis', type = 'Custom', count = '1' }  
}  

ScenEdit_AddCustomLoss( 'sidea', { {'removethis',0},{'Casualties', 10000} } ) -- update losses  
print(s.losses)  

{ \[1\] = { dbid = 0, name = 'Casualties', type = 'Custom', count = '10000' } }
