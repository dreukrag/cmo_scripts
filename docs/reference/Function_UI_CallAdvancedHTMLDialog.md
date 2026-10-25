### <a name="UI_CallAdvancedHTMLDialog"></a>UI_CallAdvancedHTMLDialog ( title, form, interactions )

The function allows you to show a HTML form, from which variables will be returned to the Lua script.

#### Parameters

- title string The title that shows on the top of the dialog box
- form string A HTML form from which data can be entered, The current input supported modes are text, select, and radio.
- interactions { } of string One of more Button names

#### Returns

Table {} of Form_name = value The variable name from the form and its value. The button pressed is returned in the table under \['pressed'\].

##### Example

` local msg = [[`  

Example

# Logistics Table

Introduce the quantity you need for each missile type

| Missile | Qty |
|---|---|
| AIM-120A: | 16x<br>24x<br>32x |
| HARM-88C |  |
| GBU-10 | <a name="16"></a><br>16x<br><a name="24"></a><br>24x<br><a name="32"></a><br>32x |

\]\]  
local button = UI_CallAdvancedHTMLDialog("Logistics", msg, {"Submit","Cancel"})  
for k,v in pairs(button) do  
print(k .. ' = ' .. v)  
end  
if button\['pressed'\] == 'Cancel' then  
print("Cancel logic")  
else  
print("Process logic")  
end  
  

HARM = ''  
pressed = Cancel  
AIM-120D = 16  
Cancel logic
