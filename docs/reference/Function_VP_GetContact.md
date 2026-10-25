### <a name="VP_GetContact"></a> VP_GetContact ( table )

This function returns details about a contact unit

#### Parameters

- table { }
  - guid = string The GUID of the contact

#### Returns

[Contact](Wrappers.md#wrapper_Contact) Contact object

##### Example

` local side = VP_GetSide( { name ="NATO" } )`  
`local contacts = side.contacts --List Of contacts`  
`local con_guid = contacts[12].objectid -- GUID of a specific contact`  
`local a_contact = VP_GetContact( { guid = con_guid } ) -- details of contact as distinct to unit details`
