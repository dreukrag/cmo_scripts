### <a name="ScenEdit_SetKeyValue"></a>ScenEdit_SetKeyValue (key, value, forCampaign)

This function Sets the value for a key in the persistent key store.

This function allows you to add values,associated with keys,to a persistent store [KeyStore](DataTypes.md#dataType_KeyStore)that is retained when the game is saved and resumed.Keys and values are both represented as non-`nil`strings.The value is retrieved by [ScenEdit_GetKeyValue](#ScenEdit_GetKeyValue).

#### Parameters

- key string The key to associate with
- value string The value to associate
- forCampaign boolean Pass the store to next scenario in campaign. Optional, default = false

##### Example

` ScenEdit_SetKeyValue("A","B") ScenEdit_GetKeyValue("A")-- returns "B" `
