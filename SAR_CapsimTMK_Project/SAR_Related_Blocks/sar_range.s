<BLOCK>
<LICENSE>
/*  Capsim (r) Text Mode Kernel (TMK) Star Library (Blocks)
    Copyright (C) 1989-2017  Silicon DSP Corporation

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

    http://www.silicondsp.com
    Silicon DSP  Corporation
    Las Vegas, Nevada
*/
</LICENSE>
<BLOCK_NAME>

sar_range 

</BLOCK_NAME> 

<COMMENTS>
<![CDATA[ 

/************************************************************************
 *									
 *
  ************************************************************************/

]]>
</COMMENTS> 



 <NAME>
sar_range
</NAME>

<DESCRIPTION>
Generate SAR range reference
</DESCRIPTION>

<PROGRAMMERS>
Sasan Ardalan
</PROGRAMMERS>



<DESC_SHORT>
Generate SAR range reference
</DESC_SHORT>


<INCLUDES>
<![CDATA[ 

#include <math.h>

]]>
</INCLUDES> 

<DEFINES> 

#define  PI  3.1415926535898

</DEFINES> 

        

<STATES>
	<STATE>
		<TYPE>float</TYPE>
		<NAME>phase</NAME>
		<VALUE>0.</VALUE>
	</STATE>
	<STATE>
		<TYPE>float</TYPE>
		<NAME>t</NAME>
		<VALUE>0.</VALUE>
	</STATE>
	<STATE>
		<TYPE>float</TYPE>
		<NAME>dt</NAME>
	</STATE>
	<STATE>
		<TYPE>float</TYPE>
		<NAME>tp</NAME>
	</STATE>
	<STATE>
		<TYPE>int</TYPE>
		<NAME>done</NAME>
		<VALUE>0</VALUE>
	</STATE>
	<STATE>
		<TYPE>int</TYPE>
		<NAME>maxIndex</NAME>
	</STATE>
</STATES>
 
<DECLARATIONS> 

	int no_samples;
	int i,j,k;
	float taz;
	float range;

</DECLARATIONS> 

                                 

<PARAMETERS>
<PARAM>
	<DEF>Carrier Frequency, MHz</DEF>
	<TYPE>float</TYPE>
	<NAME>fc</NAME>
	<VALUE>1275</VALUE>
</PARAM>
<PARAM>
	<DEF>Pulse Chirp Rate, MHz/microsecond</DEF>
	<TYPE>float</TYPE>
	<NAME>Kr</NAME>
	<VALUE>0.5621</VALUE>
</PARAM>
<PARAM>
	<DEF>Pulse Duration Microseconds</DEF>
	<TYPE>float</TYPE>
	<NAME>tau</NAME>
	<VALUE>33.8</VALUE>
</PARAM>
<PARAM>
	<DEF>Pulse Bandwidth, MHz</DEF>
	<TYPE>float</TYPE>
	<NAME>Br</NAME>
	<VALUE>19.0</VALUE>
</PARAM>
<PARAM>
	<DEF>Center Frequency (IF) MHz</DEF>
	<TYPE>float</TYPE>
	<NAME>fIF</NAME>
	<VALUE>11.38</VALUE>
</PARAM>
<PARAM>
	<DEF>Pulse Repition Rate, Hz</DEF>
	<TYPE>float</TYPE>
	<NAME>prf</NAME>
	<VALUE>1645.0</VALUE>
</PARAM>
<PARAM>
	<DEF>Sampling Rate, MHz</DEF>
	<TYPE>float</TYPE>
	<NAME>fs</NAME>
	<VALUE>45.03 MHz</VALUE>
</PARAM>
<PARAM>
	<DEF>Doppler Frequency, Hz</DEF>
	<TYPE>float</TYPE>
	<NAME>fDc</NAME>
	<VALUE>1150.0</VALUE>
</PARAM>
<PARAM>
	<DEF>Doppler Rate of Change , Hz</DEF>
	<TYPE>float</TYPE>
	<NAME>Kaz</NAME>
	<VALUE>501.27</VALUE>
</PARAM>
<PARAM>
	<DEF>Platform Velocity, Km/s</DEF>
	<TYPE>float</TYPE>
	<NAME>v</NAME>
	<VALUE>7.0</VALUE>
</PARAM>
<PARAM>
	<DEF>Integration Time, s</DEF>
	<TYPE>float</TYPE>
	<NAME>total</NAME>
	<VALUE>2.0</VALUE>
</PARAM>
<PARAM>
	<DEF>Azimuth Sample Time</DEF>
	<TYPE>float</TYPE>
	<NAME>tazs</NAME>
	<VALUE>0.0</VALUE>
</PARAM>
<PARAM>
	<DEF>tc seconds</DEF>
	<TYPE>float</TYPE>
	<NAME>tc</NAME>
	<VALUE>1.0</VALUE>
</PARAM>
<PARAM>
	<DEF>Point Range rp, kM</DEF>
	<TYPE>float</TYPE>
	<NAME>rp</NAME>
	<VALUE>840.0</VALUE>
</PARAM>
<PARAM>
	<DEF>Point Azimuth tp in index units</DEF>
	<TYPE>int</TYPE>
	<NAME>tpi</NAME>
	<VALUE>1000</VALUE>
</PARAM>
</PARAMETERS>

    

<OUTPUT_BUFFERS>
	<BUFFER>
		<TYPE>float</TYPE>
		<NAME>outSample</NAME>
	</BUFFER>
</OUTPUT_BUFFERS>
 
<INIT_CODE>
<![CDATA[ 

dt=(1.0/fs);
tp=tpi*(1.0/prf);
done=0;
maxIndex=(int)total*prf;

]]>
</INIT_CODE> 


<MAIN_CODE>
<![CDATA[ 

if(done)return(0);
for(i=0; i<maxIndex; i++) {
        
        taz=(1.0/prf)*i;
        range=rp+(v*v*0.5/rp)*(tc+tp-taz)*(tc+tp-taz);
//		fprintf(stderr,"%d %f\n",i,range); 

		if(IT_OUT(0) ) {
			KrnOverflow("sar_chirp",0);
			return(99);
		}
		outSample(0)=range;
}
done=1;

return(0);


]]>
</MAIN_CODE> 

<WRAPUP_CODE>
<![CDATA[ 


]]>
</WRAPUP_CODE> 



</BLOCK> 

