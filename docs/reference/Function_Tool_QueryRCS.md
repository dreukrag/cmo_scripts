### <a name="Tool_QueryRCS"></a> Tool_QueryRCS ( table)

This function calculates and returns a numerical value representing the signature strength of a specified targetunitname from the perspective of a designated sensorunitname. The type of signature being queried is determined by the SIGNATURETYPE parameter. A higher returned value signifies a more easily detectable target in the specified signature spectrum

#### Parameters

- table { }

- - sensorunitname stringThe guid/name of the unit that is sensing the target.
  - targetunitname stringThe name of the unit whose signature is being measured.
  - SIGNATURETYPE = SIGNATURETYPE HullSonar_PassiveOnly_VLF, HullSonar_PassiveOnly_LF HullSonar_PassiveOnly_MF HullSonar_PassiveOnly_HF ActiveSonar Visual_Detect Visual_ID IR_Detect IR_ID Radar_A_D Radar_E_M  
    A string specifying the type of signature to be queried.  

#### Returns

number Returns a numerical value representing the calculated signature strength  

#### SIGNATURETYPE Values

- HullSonar_PassiveOnly_VLF
- HullSonar_PassiveOnly_LF
- HullSonar_PassiveOnly_MF
- HullSonar_PassiveOnly_HF
- ActiveSonar
- Visual_Detect
- Visual_ID
- IR_Detect
- IR_ID
- Radar_A_D
- Radar_E_M

##### Example

` local RCS = Tool_QueryRCS({sensorunitname="WT2BOY-0HNG7PDJTMU9E", targetunitname="WT2BOY-0HNG7PDJTMU5P", SIGNATURETYPE="Radar_E_M"})`  
`print(RCS)`  

22.5134506225586
