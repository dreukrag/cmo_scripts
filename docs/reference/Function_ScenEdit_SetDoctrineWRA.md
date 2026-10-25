### <a name="ScenEdit_SetDoctrineWRA"></a>ScenEdit_SetDoctrineWRA (table, doctrine)

This function sets the WRA doctrine of the designated object against a specific weapon and target type.

The values below can be used in the doctrine settings:  
'inherit' = reverts to the parent level setting  
'system' = reverts to the database level setting (does not apply to 'firing_range')  
'max' = use the appropriate maximum setting  
'none' = not to be used

For the firing range doctrine, there are a few specicial values  
'25ofmax' = use 25% of the maximum range  
'50ofmax' = use 50% of the maximum range  
'75ofmax' = use 75% of the maximum range  

#### Parameters

- table {}
  - side = string The side name/GUID of the unit
  - unitname = string The name of unit
  - guid = string The GUID of the unit
  - mission = string The mission guid/name
  - escort = True/False If a mission, apply changes to Escort WRA of Strike mission
  - weapon_id = string The database id of the desired weapon
  - contact_id = string The contact GUID to determine target type (mutually exclusive with target_type)
  - target_type = string The target type (mutually exclusive with contact_id)
- doctrine {} of
  - string Number of Weapons per salvo ('Max','None' or a number)
  - string Number of Shooters per salvo ('Max','None' or a number)
  - string Firing range ('Max','None' or a number)
  - string Self-defence range ('Max','None' or a number)

  The order IS IMPORTANT as no keys used.

#### Returns

[DoctrineWRA](Wrappers.md#wrapper_DoctrineWRA) Returns the WRA doctrine of the selected object

##### Example

`ScenEdit_SetDoctrineWRA({guid ='a1a52edf-3541-4b55-bea4-58d4e1ab11dc', target_type='Surface_Contact_Unknown_Type', weapon_dbid=1575}, {'inherit','inherit','system','inherit'})ScenEdit_SetDoctrineWRA({guid ='a1a52edf-3541-4b55-bea4-58d4e1ab11dc', target_type='Surface_Contact_Unknown_Type', weapon_dbid=1575}, {'max','inherit',90,'inherit'})`
