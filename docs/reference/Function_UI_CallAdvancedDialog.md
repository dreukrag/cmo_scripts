### <a name="UI_CallAdvancedDialog"></a>UI_CallAdvancedDialog ( title, description, interactions )

The function allows you to create a dynamic dialog box from Lua script.

#### Parameters

- title string The title that shows on the top of the dialog box
- description string The message to include in the dialog box
- interactions { } of string One of more Button names

#### Returns

string The Button pressed

##### Example

` local button = UI_CallAdvancedDialog("My title", "My description", {"Potato","Orange","Apple","Banana","Tomato","Any other option"})`  
`if button == 'Potato' then`  
`print('You pressed ' .. button )`  
`else`  
`print('You did not press Potato but ' .. button )`  
`end`
