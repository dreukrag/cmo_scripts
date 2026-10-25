### <a name="ScenEdit_UseAttachmentOnSide"></a> ScenEdit_UseAttachmentOnSide (attachment, sidename)

This function uses an attachment on a side (used for .inst files as attachments).

#### Parameters

- attachment string Name of the attachment (as shown in the properties section when created/added)  
  or more accurately the GUID of the attachment (as found in AttachmentRepo folders)
- sidename string The name of the side to import the attachment into

#### Returns

True/False True if successful, or ` nil` otherwise

##### Example

` local b = ScenEdit_UseAttachmentOnSide('8269b881-20ce-4f2e-baa0-6823e46d55a4', 'sidea' )`
