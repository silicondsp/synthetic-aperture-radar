
# topology file:  sar_create_image.t

#--------------------------------------------------- 
# Title:  
# Author:  
# Date:  
# Description:  
#--------------------------------------------------- 

inform title 
inform author 
inform date 
inform descrip 

arg -1 (none)

param float 1275    fc   "Carrier Frequency, MHz"
param float 0.5621    Kr   "Pulse Chirp Rate, MHz/microsecond"
param float 33.8    tau   "Pulse Duration Microseconds"
param float 19    Br   "Pulse Bandwidth, MHz"
param float 11.38    fIF   "Center Frequency (IF) MHz"
param float 1645    prf   "Pulse Repition Rate, Hz"
param float 45.03    fs   "Sampling Rate, MHz"
param float 1150    fDc   "Doppler Frequency, Hz"
param float 501.27    Kaz   "Doppler Rate of Change , Hz"
param float 7    v   "Platform Velocity, Km/s"
param float 2    total   "Integration Time, s"
param float 0    tazs   "Azimuth Sample Time"
param float 1    tc   "tc seconds"
param float 840    rpRef   "Reference Point Range rp, kM"
param float 840    rp   "Point Range rp, kM"
param int 1000    tpi   "Point Azimuth tp in index units"
block img_sar_create0 img_sar_create




param file SAR_Image_Point_Target.tif    
param file ther.map    
block imgwrtiff0 imgwrtiff

param int 256       
block imgnormalize0 imgnormalize


connect img_sar_create0 0  imgnormalize0 0 
connect imgnormalize0 0 imgwrtiff0 0


