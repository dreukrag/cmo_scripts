### <a name="ScenEdit_RunScript"></a>ScenEdit_RunScript (script \[,customPath\] )

This function runs a script from a file. The file `script`must be inside the \[Command base directory\]/Lua directory, or else the game will not be able to load it.  
You can make the file point to files within a sub-directory of this, as in 'library/cklib.lua'The file to find will be of the form \[Command base directory\]/Lua/\[`script`\].  
A file can also be loaded indirectly from an attachment [ScenEdit_UseAttachment](#ScenEdit_UseAttachment)  

There is an optional parameter to use the full path of 'script' that overrides the above, but putting files outside of the Command folder would make installing a scenario extremely difficult - the user would need to do manual file copying, etc.  
This option is more for the Professional user where they make have dedicated scripts on their servers.

#### Parameters

- script string The file containing the script to run.
- customPath True/False Use the full path from 'script' name. Optional. Defaults to False.

#### Returns

True/False True if successful. If result is nil, then the method failed.  

##### Example

`ScenEdit_RunScript( 'mylibrary.lua' )`
