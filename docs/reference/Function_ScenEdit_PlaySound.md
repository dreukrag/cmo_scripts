### <a name="ScenEdit_PlaySound"></a>ScenEdit_PlaySound (string)

This function plays a local sound file from the Sounds\Effects folder.

#### Parameters

- string string The name of the file

#### Returns

True/False True if successful

##### Example

` local fileName = 'Static'.. math.random(1,8) .. '.mp3'`  
`ScenEdit_PlaySound(fileName) `
