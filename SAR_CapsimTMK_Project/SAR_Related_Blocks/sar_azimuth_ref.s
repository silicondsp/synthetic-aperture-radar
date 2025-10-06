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
<BLOCK_NAME>sar_azimuth_ref</BLOCK_NAME> 

<COMMENTS>
<![CDATA[ 

/************************************************************************
 *
 * Azimuth Reference Generation
 * SAR Image Formation
 * 
 *									
 *	
  ************************************************************************/

]]>
</COMMENTS> 


 <NAME>
sar_azimuth_ref
</NAME>

<DESCRIPTION>
Generates azimuth reference for SAR image processing
</DESCRIPTION>

<PROGRAMMERS>
Sasan Ardalan 1990
</PROGRAMMERS>								


<DESC_SHORT>
Generates azimuth reference for SAR image processing
</DESC_SHORT>


<INCLUDES>
<![CDATA[ 

#include <math.h>
#include <cap_fft.h>

]]>
</INCLUDES> 

<DEFINES> 

#define  PI  3.1415926535898
#define C 299792458.00


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
		<NAME>maxRangeIndex</NAME>
	</STATE>
	<STATE>
		<TYPE>int</TYPE>
		<NAME>maxAzimuthIndex</NAME>
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
		<TYPE>cap_fft_cpx*</TYPE>
		<NAME>ref_P</NAME>
	</STATE>
	<STATE>
		<TYPE>cap_fft_cpx*</TYPE>
		<NAME>azimuth_P</NAME>
	</STATE>
	<STATE>
		<TYPE>cap_fft_cpx*</TYPE>
		<NAME>refFFT_P</NAME>
	</STATE>
	<STATE>
		<TYPE>cap_fft_cpx*</TYPE>
		<NAME>azimuthFFT_P</NAME>
	</STATE>
	<STATE>
		<TYPE>int</TYPE>
		<NAME>rangeFFTLength</NAME>
	</STATE>
	<STATE>
		<TYPE>int</TYPE>
		<NAME>azimuthFFTLength</NAME>
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
	int order,pts;
	cap_fft_cpx x,y;
	float fmax,fmin;

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
	<NAME>rp</NAME>
	<VALUE>840.0</VALUE>
</PARAM>
<PARAM>
	<DEF>Reference Point Azimuth tp in index units</DEF>
	<TYPE>int</TYPE>
	<NAME>tpi</NAME>
	<VALUE>1000</VALUE>
</PARAM>
<PARAM>
	<DEF>T center (0.5 halfway)</DEF>
	<TYPE>float</TYPE>
	<NAME>frac</NAME>
	<VALUE>0.5</VALUE>
</PARAM>
</PARAMETERS>

<INIT_CODE>
<![CDATA[ 

	if( (obufs = NO_OUTPUT_BUFFERS()) < 1 ) {
		fprintf(stderr,"sar_azimuth_ref: no output buffers\n");
		CsInfo("sar_azimuth_ref: no output buffers");
		return(2);
	}
    dt=(1.0/fs)*0.000001;
	t0=2.0*rp*1000.0/C;
    maxRangeIndex=(int)tau*0.000001/dt;
	dtaz=(1.0/prf);
    tp=tpi*(1.0/prf);
    done=0;
    t=0;
    k=0;
    lamda=C/(fc*1000000.0);
    maxAzimuthIndex=(int)(total*prf);
	/*
	 * round maxAzimuthIndex to next power of 2
	 * Note we are dealing with Azimuth
	 * Also maxAzimuthIndex is already a power of 2 (should be)
	 */
	order = (int) (log((float)maxAzimuthIndex)/log(2.0)+0.5);
	pts = 1 << order;
	if (pts < maxAzimuthIndex ) {
        	pts = pts*2;
        	order += 1;
	}
    azimuthFFTLength=pts;
    for(j=0; j<obufs; j++) 
		     SET_CELL_SIZE_OUT(j,sizeof(float));

]]>
</INIT_CODE> 


<MAIN_CODE>
<![CDATA[ 



if(done) return(0);

fprintf(stderr,"sar_azimuth_ref:  maxAzimuthIndex=%d azimuthFFTLength=%d\n",maxAzimuthIndex,azimuthFFTLength); 

	

	  ref_P=(cap_fft_cpx *)calloc(azimuthFFTLength,sizeof(cap_fft_cpx));
	  azimuth_P=(cap_fft_cpx *)calloc(azimuthFFTLength,sizeof(cap_fft_cpx));
	  refFFT_P=(cap_fft_cpx *)calloc(azimuthFFTLength,sizeof(cap_fft_cpx));
	  azimuthFFT_P=(cap_fft_cpx *)calloc(azimuthFFTLength,sizeof(cap_fft_cpx));

	  if(ref_P == NULL || azimuth_P== NULL || azimuthFFT_P== NULL || refFFT_P== NULL) {
		  fprintf(stderr,"sar_azimuth_ref: could not allocate space \n");
		  CsInfo("sar_azimuth_ref: could not allocate space");
		  return(7);
	  }


 	  /*
	   * generate azimuth reference  impulse response
	   */
      for(j=0; j<maxAzimuthIndex; j++) {
        

          taz=dtaz*j-(float)maxAzimuthIndex*frac*dtaz;
          a=0.5*Kaz*taz*taz;
		  
		  b=fDc*taz;
		  c=2*PI*(b+a);

		  ref_P[j].r=cos(c);
		  ref_P[j].i=sin(c);

       }
       for(j=maxAzimuthIndex; j<azimuthFFTLength; j++) {
        
		   ref_P[j].r=0.0;
		   ref_P[j].i=0.0;

       }

	   for(i=0; i<azimuthFFTLength; i++) {
			      if(IT_OUT(0)){
	
				     KrnOverflow("img_sar_create",0);
				     return(99);
			      }
			      OUTF(0,0) = ref_P[i].r;
				  if(obufs ==2) {
                     if(IT_OUT(1)){
	
				        KrnOverflow("img_sar_create",1);
				        return(99);
			         }
			         OUTF(1,0) = ref_P[i].i;


				  }
			  
       }
	   done=1;


return(0);


]]>
</MAIN_CODE> 

<WRAPUP_CODE>
<![CDATA[ 

if(azimuth_P) free(azimuth_P);
if(azimuthFFT_P) free(azimuthFFT_P);
if(refFFT_P) free(refFFT_P);
if(ref_P) free(ref_P);

]]>
</WRAPUP_CODE> 



</BLOCK> 

