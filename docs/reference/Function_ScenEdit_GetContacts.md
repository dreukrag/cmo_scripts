### <a name="ScenEdit_GetContacts"></a>ScenEdit_GetContacts (side)

This function is similar to [ScenEdit_GetContact()](#ScenEdit_GetContact) but it returns a table of contacts on the side

#### Parameters

- side string The side name/guid.

#### Returns

Table {} of [Contact](Wrappers.md#wrapper_Contact) A Table of contact wrappers for the side or `nil` if no side found.

##### Example

`local con = ScenEdit_GetContacts('south korea')`
