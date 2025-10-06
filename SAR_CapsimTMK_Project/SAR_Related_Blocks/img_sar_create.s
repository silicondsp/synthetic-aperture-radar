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

img_sar_create 

</BLOCK_NAME> 

<COMMENTS>
<![CDATA[ 

/************************************************************************
 * For technical papers and updates visit http://www.ccdsp.org										
 *	
 ************************************************************************/ 
 ]]>
</COMMENTS> 

<NAME>
img_sar_create
</NAME>
<DESCRIPTION>
Create SAR image from parameters.
</DESCRIPTION>
<PROGRAMMERS>
Sasan Ardalan 1990
</PROGRAMMERS>
 



<DESC_SHORT>
Create SAR image from parameters.
</DESC_SHORT>


<INCLUDES>
<![CDATA[ 

#include <math.h>

]]>
</INCLUDES> 

<DEFINES> 

#define  PI  3.1415926535898
#define C 300000000.0

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
		<NAME>dtaz</NAME>
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
		<NAME>maxAzimuthIndex</NAME>
	</STATE>
	<STATE>
		<TYPE>int</TYPE>
		<NAME>maxRangeIndex</NAME>
	</STATE>
	<STATE>
		<TYPE>int</TYPE>
		<NAME>k</NAME>
	</STATE>
	<STATE>
		<TYPE>float</TYPE>
		<NAME>lamda</NAME>
	</STATE>
	<STATE>
		<TYPE>float</TYPE>
		<NAME>t0</NAME>
	</STATE>
	<STATE>
		<TYPE>int</TYPE>
		<NAME>obufs</NAME>
	</STATE>
	<STATE>
		<TYPE>float**</TYPE>
		<NAME>mat_PP</NAME>
	</STATE>
</STATES>
 
<DECLARATIONS> 

	int no_samples;
	int i,j;
	float taz;
	float range;
	float arg;
	float a,b,c;
	float rx;
	image_t		img;

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
	<VALUE>45.03</VALUE>
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
	<DEF>Reference Point Range rp, kM</DEF>
	<TYPE>float</TYPE>
	<NAME>rpRef</NAME>
	<VALUE>840.0</VALUE>
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

<INIT_CODE>
<![CDATA[ 

	if( (obufs = NO_OUTPUT_BUFFERS()) < 1 ) {
		fprintf(stderr,"img_sar_create: no output buffers\n");
		CsInfo("img_sar_create: no output buffers");
		return(2);
	}
    dt=1.0/(fs*1000000.0);
    maxRangeIndex=(int)tau*0.000001/dt;
	dtaz=(1.0/prf);
    tp=tpi*(1.0/prf);
    done=0;
    maxAzimuthIndex=(int)(total*prf);
    t=0;
    k=0;
    lamda=C/(fc*1000000.0);
	t0=2.0*rpRef*1000.0/C;
 	fprintf(stderr,"img_sar_create: width=%d height=%d\n",maxRangeIndex,maxAzimuthIndex); 
	mat_PP = (float**)calloc(maxAzimuthIndex,sizeof(float*));
	if(mat_PP == NULL) {
		fprintf(stderr,"img_sar_create: could not allocate space \n");
		CsInfo("img_sar_create: could not allocate space");
		return(5);
	}
    for(i=0; i<maxAzimuthIndex; i++) {
          mat_PP[i]=(float*)calloc(maxRangeIndex,sizeof(float));
	  if(mat_PP[i] == NULL) {
		fprintf(stderr,"img_sar_create: could not allocate space \n");
		CsInfo("img_sar_create: could not allocate space");
		return(6);
	  }
	}
    for(j=0; j<obufs; j++) 
		     SET_CELL_SIZE_OUT(j,sizeof(image_t));

]]>
</INIT_CODE> 


<MAIN_CODE>
<![CDATA[ 


if(done)return(0);

for(i=0; i<maxAzimuthIndex; i++) {
     taz=i*dtaz;
     for(j=0; j<maxRangeIndex; j++) {
        t=dt*j+t0;
        
        
 //       taz=(1.0/prf)*i;
 //       taz=tazs;
        range=rp+(v*v*0.5/rp)*(tc+tp-taz)*(tc+tp-taz);
		a=t-2.0*(range*1000.0/C);
		b=a*a;
		b=PI*Kr*b*1.0e12;
		c=2*PI*(fIF*t*1000000.0-(2.0*range*1000.0/lamda));
		rx=cos(c+b);
		mat_PP[i][j]=rx;


//		fprintf(stderr,"%d %f\n",k,range); 


   }
}
for(j=0; j<obufs; j++) {
			  if(IT_OUT(j)){
	
				  KrnOverflow("img_sar_create",j);
				  return(99);
			   }
			   img.image_PP = mat_PP;
			   img.width = maxRangeIndex;
			   img.height = maxAzimuthIndex;
			   OUTIMAGE(j,0) = img;
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

