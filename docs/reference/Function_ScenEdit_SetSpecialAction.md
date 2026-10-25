### <a name="ScenEdit_SetSpecialAction"></a>ScenEdit_SetSpecialAction (options)

Sets the properties of an existing special action.

#### Parameters

- options {} of
  - ActionNameOrID = string Special Action Event name/guid
  - side = string Side for Special Action
  - description = string Event description
  - newname = string New name for event if renaming the event. Not suggested as it can cause issues if scripts are using event names to perform tasks on.
  - isActive = True/False Event active
  - IsRepeatable = True/False Event can repeat
  - ScriptText = Lua script Lua script to run
  - mode = string "remove" Mode to perform - only used for deleting the SA. Absent means it updates

#### Returns

booleanTrue or NIL if error

##### Example

`ScenEdit_SetSpecialAction( {...} )`
