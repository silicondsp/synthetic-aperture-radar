
# topology file:  sar_azimuth_ref_gen.t

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
param float 840    rp   "Reference Point Range rp, kM"
param int 1000    tpi   "Reference Point Azimuth tp in index units"
param float 0.5    frac   "T center (0.5 halfway)"
block sar_azimuth_ref0 sar_azimuth_ref

param int 128    npts   "Number of points in each plot (dynamic window size)"
param int 0    skip   "Points to skip before first plot"
param file Azimuth_Ref_0   title   "Plot title"
param file Samples    x_axis   "X Axis label"
param file Y    y_axis   "Y-Axis label"
param int 1    plotStyleParam   "Plot Style: 1=Line,2=Points,5=Bar Chart"
param int 1    control   "Control: 1=On, 0=Off"
param int 0    mode   "0=Static,1=Dynamic"
param int 1    samplingRate   "Sampling Rate"
block xplot0 plottxt

param int 128    npts   "Number of points in each plot (dynamic window size)"
param int 0    skip   "Points to skip before first plot"
param file Azimuth_Ref_1    title   "Plot title"
param file Samples    x_axis   "X Axis label"
param file Y    y_axis   "Y-Axis label"
param int 1    plotStyleParam   "Plot Style: 1=Line,2=Points,5=Bar Chart"
param int 1    control   "Control: 1=On, 0=Off"
param int 0    mode   "0=Static,1=Dynamic"
param int 1    samplingRate   "Sampling Rate"
block xplot1 plottxt

connect sar_azimuth_ref0 0 xplot0 0  	
connect sar_azimuth_ref0 1 xplot1 0  	

