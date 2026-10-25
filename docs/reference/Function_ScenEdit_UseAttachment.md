### <a name="ScenEdit_UseAttachment"></a> ScenEdit_UseAttachment (attachment)

This function import an attachment into the scenario.

#### Parameters

- attachment string Name of the attachment (as shown in the properties section when created/added)  
  or more accurately the GUID of the attachment (as found in AttachmentRepo folders)

#### Returns

True/False True if successful, or ` nil` otherwise

##### Example

` local b = ScenEdit_UseAttachment('8269b881-20ce-4f2e-baa0-6823e46d55a4' )`
