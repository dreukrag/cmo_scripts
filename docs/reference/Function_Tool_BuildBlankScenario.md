## <a name="Tool_BuildBlankScenario"></a>Tool_BuildBlankScenario ( useDBname )

The function purpose is to create a blank scenario based on the current DB or by supplying the DB file name a different DB.

### Parameters

- useDBname string (Optional) file name from the DB folder

### Returns

True/False True if successful. If result is nil, then the method failed.  

#### Example

Use s specific DB

` print(Tool_BuildBlankScenario('DB3K_503.db3'))`  

'Yes'

Use whatever is the current DB setting as shown in DB list under Editor

` print(Tool_BuildBlankScenario()) `
