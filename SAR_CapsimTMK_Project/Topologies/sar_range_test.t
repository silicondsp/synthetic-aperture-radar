
# topology file:  sar_range_test.t

#--------------------------------------------------- 
# Title:  
# Author:  
# Date:  
# Description:  
#--------------------------------------------------- 

inform title 
inform author 
inform date 
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
param float 2    total   "Integration Time, s"
param float 0    tazs   "Azimuth Sample Time"
param float 1    tc   "tc seconds"
param float 840    rp   "Point Range rp, kM"
param int 1000    tpi   "Point Azimuth tp in index units"
block sar_chirp0 sar_chirp

param int 128    npts   "Number of points in each plot (dynamic window size)"
param int 0    skip   "Points to skip before first plot"
param file Chirp    title   "Chirp"
param file Samples    x_axis   "X Axis label"
param file Y    y_axis   "Y-Axis label"
param int 1    plotStyleParam   "Plot Style: 1=Line,2=Points,5=Bar Chart"
param int 1    control   "Control: 1=On, 0=Off"
param int 0    mode   "0=Static,1=Dynamic"
param int 1    samplingRate   "Sampling Rate"
block plot0 plottxt

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
block sar_range_compress0 sar_range_compress

param int 128    npts   "Number of points in each plot (dynamic window size)"
param int 0    skip   "Points to skip before first plot"
param file Range_Compressed    title   "Range_Compressed"
param file Samples    x_axis   "X Axis label"
param file Y    y_axis   "Y-Axis label"
param int 1    plotStyleParam   "Plot Style: 1=Line,2=Points,5=Bar Chart"
param int 1    control   "Control: 1=On, 0=Off"
param int 0    mode   "0=Static,1=Dynamic"
param int 1    samplingRate   "Sampling Rate"
block xplot1 plottxt

connect sar_chirp0 0 plot0 0  	
connect plot0 0 sar_range_compress0 0  	{plot0:NULL:NULL,sar_range_compress0:x:float}
connect sar_range_compress0 0 xplot1 0  	

