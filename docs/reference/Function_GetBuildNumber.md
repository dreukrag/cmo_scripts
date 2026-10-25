## <a name="GetBuildNumber"></a>GetBuildNumber ()

This function returns the build number of the current game executable.  
This is useful if you know that a certain function is not available or has changed from a certain build so the Lua scripts can be made flexible to handle the change.  

For example, if the parameters to a certain function changed from a certain build number, then the script could check the executable build number, and call the function with the old parameters if the executable is before that build, and use new one parameters if after that build.  

#### Parameters

- None

#### Returns

- string The build number

##### Example

` print(GetBuildNumber())`  
`>>> 1134.3 `
