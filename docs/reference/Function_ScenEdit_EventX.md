### <a name="ScenEdit_EventX"></a>ScenEdit_EventX ()

This function shows the current event that has been triggered.

Note that EventX() can also be used as a shortcut for ScenEdit_EventX()

#### Parameters

#### Returns

[Event](Wrappers.md#wrapper_Event) The triggering event as a wrapper, else a `nil` is returned.

Within a condition or action script of some event, include 'local myVar = ScenEdit_EventX()' to be able to interpret the triggering event.  
Say you want to see the actions that this triggered event performs, in case you want to stop it from running again.  
You would look at the table 'myVar.actions'.  
If you wanted to turn off the event, then add 'myVar.isActive = false' to your script.

##### Example

`local a = ScenEdit_EventX()`

Changing the probability of the current event  

` ... inside the Event Action script...`  
`local a = ScenEdit_EventX()`  
`if a.probability > 50 then`  
`a.probability = probability - 10 -- decrease chance this event will happen again`  
`end`  
`... ` <a name="footer"></a>

Copyright © WarfareSims 2020
