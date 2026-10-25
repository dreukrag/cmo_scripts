## <a name="FunctioName"></a>ScenEdit_GetDBFileHash(table)

**[PRO ONLY]**

The function purpose is to calculate the hash on the database full file name.  
This is used for determining the database being used and registering it for customised databases.

### Parameters

- table { }
  - filename = string The full path and name of the database file

### Returns

- hash_value The hash string used to represent the database.

#### Example

` local a = ScenEdit_GetDBFileHash( { filename = 'D:/Matrix Games/Command Modern Operations/DB/CWDB_439.db3'} )`  
`print(a)`  

a1e5a97c029a670dd73fdfdf930f2d1c17d4d63e
