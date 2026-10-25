### <a name="Tool_EmulateNoConsole"></a> Tool_EmulateNoConsole ( mode )

This function allows other functions to behave as if there is no console attached by executing in the Lua console.  
This is useful examining how functions behave when running within Command as in Events by running the script in the console first.  
Some functions will 'die' if running in interactive mode.

#### Parameters

- mode True/False 'True' (which is the default mode if no parameter supplied) turns on the emulation mode, 'False' will turn it off.

#### Returns

True/False Current interactive mode

##### Example

` local d = Tool_EmulateNoConsole( )`
