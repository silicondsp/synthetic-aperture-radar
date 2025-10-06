
# topology file:  sar_image_formation_2.t

#--------------------------------------------------- 
# Title:  SAR Image Formation 
# Author: Sasan Ardalan 
# Date: 2008 
# Description:  
#--------------------------------------------------- 

inform title SAR Image Formation 
inform author Sasan Ardalan 
inform date 2008 
inform descrip  

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
param float 0.5    total   "Integration Time, s"
param float 0    tazs   "Azimuth Sample Time"
param float 0    tc   "tc seconds"
param float 840    rpRef   "Reference Point Range rp, kM"
param float 842   rp   "Point Range rp, kM"
param int 300   tpi   "Point Azimuth tp in index units"
block img_sar_create0 img_sar_create

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
param float 840    rp   "Reference Point Range rp, kM"
param int 1000    tpi   "Reference Point Azimuth tp in index units"
param int 0    control   "Output Control 0:real compressed, 1: complex compressed"
block img_sar_range_compress0 img_sar_range_compress

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
param float 840    rp   "Reference Point Range rp, kM"
param int 1000    tpi   "Reference Point Azimuth tp in index units"
param int 1    control   "Output Control 0:real compressed, 1: complex compressed"
param float -1.9    frac   "T center (0.5 halfway)"
block img_sar_azimuth_compress0 img_sar_azimuth_compress

param int 1    widthFactor   "width shrink factor"
param int 1    heightFactor   "height shrink Factor"
block imgshrink0 imgshrink


param file sar_image_formation.tif    
param file ther.map    
block imgwrtiff0 imgwrtiff



param file sar_image_formation.img       
block imgprasc0 imgprasc

param int 256       
block imgnormalize0 imgnormalize


connect img_sar_create0 0 img_sar_range_compress0 0  	{img_sar_create0:NULL:NULL,img_sar_range_compress0:x:image_t}
connect img_sar_range_compress0 0 img_sar_azimuth_compress0 0  	{img_sar_range_compress0:NULL:NULL,img_sar_azimuth_compress0:x:image_t}
connect img_sar_azimuth_compress0 0 imgshrink0 0  	{img_sar_azimuth_compress0:NULL:NULL,imgshrink0:x:image_t}
connect imgshrink0 0 imgnormalize0 0
connect imgnormalize0 0 imgwrtiff0 0
connect imgwrtiff0 0 imgprasc0 0

