### <a name="VP_GetUnit"></a> VP_GetUnit ( table )

This function returns information about an active unit or a contact's actual unit.

#### Parameters

- table { }
  - unitname = string The name of unit or contact
  - guid = string The GUID of the unit or contact

#### Returns

[Unit](Wrappers.md#wrapper_Unit) The wrapper of the unit. If a 'contact' was passed, then this is the 'actual' unit.

##### Example

` local unit = VP_GetUnit( { guid = 'f4f9e0af-15c2-4582-8e80-b827c2ec2f56' } )`
