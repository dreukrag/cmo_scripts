### <a name="ScenEdit_ClearKeyValue"></a>ScenEdit_ClearKeyValue (key, forCampaign)

This function removes a key (and its value) from the persistent keystore.  
To clear the full keystore, use "" as the 'key'.

#### Parameters

- key string The key to clear or empty for all
- forCampaign True/False Use key store for passing data to next scenario in a campaign. \[Experimental\] \[Optional, default = false\]

#### Returns

True/FalseTrue if Successful

##### Example

`ScenEdit_ClearKeyValue("A")`

------------------------------------------------------------------------

### <a name="ScenEdit_CurrentLocalTime"></a>ScenEdit_CurrentLocalTime ()

Ths function returns the scenario local time.

#### Parameters

- None

#### Returns

stringThe local time as HH:MM:SS.

##### Example

`local myTime = ScenEdit_CurrentLocalTime()`
