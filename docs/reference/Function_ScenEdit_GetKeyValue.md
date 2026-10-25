### <a name="ScenEdit_GetKeyValue"></a>ScenEdit_GetKeyValue (key, forCampaign)

This function retrieves a value put into the persistent key store by [ScenEdit_SetKeyValue](#ScenEdit_SetKeyValue).The key name used must be identical.

#### Parameters

- key string The key to fetch the value for
- forCampaign True/False Read from the key store being passed to the next scenario in campaign. Optional, default = false

#### Returns

string The value associated with the key. "" if none exists.

##### Example

` ScenEdit_SetKeyValue( "A", "2" )`  
`local u = ScenEdit_GetKeyValue( "A") `

The variable 'u' contains "2"
