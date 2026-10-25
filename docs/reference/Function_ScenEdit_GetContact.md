### <a name="ScenEdit_GetContact"></a>ScenEdit_GetContact (table)

This function retrieves a contact details

This function is mostly similar to[ScenEdit_GetUnit](#ScenEdit_GetUnit) except that it references contacts rather than units on a side.  
Using a contact name can cause confusion in what contact details would be returned as the name can change over time.  
Use [ScenEdit_GetContacts()](#ScenEdit_GetContacts) to get the side's contacts and use the GUID of the desired contact from there.

#### Parameters

- table {} The contact must be defined by a side (that knows the contact) and contact GUID/name for that side.
  - side = string The side to find the the contact on; the contact owner
  - unitname = string The name of the contact
  - guid = string The GUID of the contact

#### Returns

[Contact](Wrappers.md#wrapper_Contact) A contact wrapper if found or `nil` otherwise.

##### Example

`ScenEdit_GetContact( { side="United States", guid="c4114322-900c-428d-a3e3-0af701e81a7a" } )`
