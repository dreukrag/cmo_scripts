## <a name="FunctioName"></a>VP_SetTimeCompression ( number )

The function changes the current time compression ( the 'x#' on the UI).

### Parameters

- number value 0 = One Second  
  1 = Two Seconds  
  2 = Five Seconds  
  3 = Fifteen Seconds  
  4 = Coarse One Sec Slice  
  5 = Coarse Five Sec Slice

### Returns

- None

#### Example

` VP_SetTimeCompression( 2 ) -- change to 5 seconds `
