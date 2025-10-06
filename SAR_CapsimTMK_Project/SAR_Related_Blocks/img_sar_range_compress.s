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
<BLOCK_NAME>img_sar_range_compress</BLOCK_NAME> 

<COMMENTS>
<![CDATA[ 

/************************************************************************

For technical papers and updates visit http://www.ccdsp.org
 ************************************************************************/
]]>
</COMMENTS> 


<NAME>
img_sar_range_compress
</NAME>

<DESCRIPTION>
Compress SAR image in range
</DESCRIPTION>

<PROGRAMMERS>
Sasan Ardalan 1990
</PROGRAMMERS> 




<DESC_SHORT>
Compress SAR image in range
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
	<STATE>
		<TYPE>float**</TYPE>
		<NAME>matCompressed_PP</NAME>
	</STATE>
	<STATE>
		<TYPE>cap_fft_cpx*</TYPE>
		<NAME>ref_P</NAME>
	</STATE>
	<STATE>
		<TYPE>cap_fft_cpx*</TYPE>
		<NAME>range_P</NAME>
	</STATE>
	<STATE>
		<TYPE>cap_fft_cpx*</TYPE>
		<NAME>refFFT_P</NAME>
	</STATE>
	<STATE>
		<TYPE>cap_fft_cpx*</TYPE>
		<NAME>rangeFFT_P</NAME>
	</STATE>
	<STATE>
		<TYPE>cap_fft_cfg</TYPE>
		<NAME>cfg</NAME>
	</STATE>
	<STATE>
		<TYPE>cap_fft_cfg</TYPE>
		<NAME>cfgi</NAME>
	</STATE>
	<STATE>
		<TYPE>int</TYPE>
		<NAME>rangeFFTLength</NAME>
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
	int width,height;
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
	<DEF>Output Control 0:real compressed, 1: complex compressed</DEF>
	<TYPE>int</TYPE>
	<NAME>control</NAME>
	<VALUE>0</VALUE>
</PARAM>
</PARAMETERS>

    

<INPUT_BUFFERS>
	<BUFFER>
		<TYPE>image_t</TYPE>
		<NAME>x</NAME>
	</BUFFER>
</INPUT_BUFFERS>
 
<INIT_CODE>
<![CDATA[ 

	if( (obufs = NO_OUTPUT_BUFFERS()) < 1 ) {
		fprintf(stderr,"img_sar_range_compress: no output buffers\n");
		CsInfo("img_sar_create: no output buffers");
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

      /*
         * round width to next power of 2
         */
        order = (int) (log((float)maxRangeIndex)/log(2.0)+0.5);
        pts = 1 << order;
        if (pts < maxRangeIndex ) {
                pts = pts*2;
                order += 1;
        }
        rangeFFTLength=pts;

 	fprintf(stderr,"img_sar_range_compress: maxRangeIndex=%d rangeFFTLength=%d \n",maxRangeIndex, rangeFFTLength); 




        cfg=cap_fft_alloc(rangeFFTLength,0,NULL,NULL);
        cfgi=cap_fft_alloc(rangeFFTLength,1,NULL,NULL);
    for(j=0; j<obufs; j++) 
		     SET_CELL_SIZE_OUT(j,sizeof(image_t));

]]>
</INIT_CODE> 


<MAIN_CODE>
<![CDATA[ 


for (no_samples = MIN_AVAIL(); no_samples > 0; --no_samples) {
	IT_IN(0);
	img=x(0);
	height=img.height;
	width=img.width;
	/*
	 * round width to next power of 2
	 */
	order = (int) (log((float)width)/log(2.0)+0.5);
	pts = 1 << order;
	if (pts < width ) {
        	pts = pts*2;
        	order += 1;
	}
        if(rangeFFTLength < pts) {
           fprintf(stderr,"Problem with dimensions. Overriding \n");
           pts=rangeFFTLength;
        } else {
	     rangeFFTLength=pts;
        }
	fprintf(stderr,"img_sar_range_compress: width=%d height=%d FFTWidth=%d\n",width,height,rangeFFTLength); 

	ref_P=(cap_fft_cpx *)calloc(rangeFFTLength,sizeof(cap_fft_cpx));
	range_P=(cap_fft_cpx *)calloc(rangeFFTLength,sizeof(cap_fft_cpx));
	refFFT_P=(cap_fft_cpx *)calloc(rangeFFTLength,sizeof(cap_fft_cpx));
	rangeFFT_P=(cap_fft_cpx *)calloc(rangeFFTLength,sizeof(cap_fft_cpx));

	if(ref_P == NULL || range_P== NULL || rangeFFT_P== NULL || refFFT_P== NULL) {
		fprintf(stderr,"img_sar_range_compress: could not allocate space \n");
		CsInfo("img_sar_range_compress: could not allocate space");
		return(7);
	}

	mat_PP = (float**)calloc(height,sizeof(float*));
	if(mat_PP == NULL) {
		fprintf(stderr,"img_sar_range_compress: could not allocate space \n");
		CsInfo("img_sar_range_compress: could not allocate space");
		return(5);
	}
    for(i=0; i<height; i++) {
          mat_PP[i]=(float*)calloc(rangeFFTLength,sizeof(float));
	  if(mat_PP[i] == NULL) {
		fprintf(stderr,"img_sar_range_compress: could not allocate space \n");
		CsInfo("img_sar_range_compress: could not allocate space");
		return(6);
	  }
	}

	/*
	 * generate reference
	 */
//    for(j=0; j<maxRangeIndex; j++) {
    for(j=0; j<width; j++) {
        
#if 000
		c=(fIF*t);
		b=(0.5*Kr*t*t);
		rx=cos(2*PI*(c+b));

#endif
//        range=rp+(v*v*0.5/rp)*(tc+tp-taz)*(tc+tp-tazs);
#if 000
        t=dt*j+t0;
        range=rp;
		a=t-2.0*(range*1000.0/C);
		b=a*a;
		b=PI*Kr*b*1.0e12;
		c=2*PI*(fIF*t*1000000.0-(2.0*range*1000.0/lamda));
		rx=cos(c+b);
#endif
        t=dt*j;
		c=(fIF*t*1000000.0);
		b=(0.5*Kr*t*t*1e12);
		rx=cos(2*PI*(c+b));



		ref_P[j].r=rx;
		ref_P[j].i=0.0;

    }
	/*
	 * Compute FFT of Reference
	 */
  
        cap_fft(cfg,ref_P, refFFT_P);
	/*
	 * conjugate the reference
	 */
	for(i=0; i<rangeFFTLength; i++)
	      refFFT_P[i].i = - refFFT_P[i].i;

	fmin=1e22;
	fmax= -1e22;


    /*
	 * go through each row of the input matrix
	 */
	for(i=0; i<height; i++) {
               fprintf(stderr,"Processing Range for:%d\n",i);
        /*
		 * Copy range row into FFT buffer
		 */
		for(j=0; j<width; j++) {
		   range_P[j].r=img.image_PP[i][j];
           range_P[j].i=0.0;
		}
		for(j=width; j<rangeFFTLength; j++) {
		   range_P[j].r=0.0;
           range_P[j].i=0.0;
		}
#if 1111
		/*
		 * compute FFT
		 */
       cap_fft(cfg,range_P, rangeFFT_P);
#if 1111
       /*
	    * Multiply Range and Reference
		*/
       for(j=0; j<rangeFFTLength; j++) {
	     x=rangeFFT_P[j];
		 rangeFFT_P[j].r = x.r*refFFT_P[j].r-x.i*refFFT_P[j].i;
         rangeFFT_P[j].i = x.r*refFFT_P[j].i+x.i*refFFT_P[j].r;


	   }
#endif
	   /*
	    * Compute Inverse FFT or Matched Filter Response
		*/
 
//	   fprintf(stderr,"img_sar_range_compress: rangeFFTLength=%d \n",rangeFFTLength); 

	   if(control) {
	      /*
		   * use half length to generate complex compressed range rows
	       */

              cfgi=cap_fft_alloc(rangeFFTLength/2,1,NULL,NULL);
	      cap_fft(cfgi,rangeFFT_P, range_P);


	   }
	   else { 
              cfgi=cap_fft_alloc(rangeFFTLength,1,NULL,NULL);
	      cap_fft(cfgi,rangeFFT_P, range_P);
           }

#endif
#if 000
for( j=0; j<rangeFFTLength; j++) {
range_P[j].re=ref_P[j].re;
range_P[j].im=ref_P[j].im;
}
#endif
       if(control == 0 ) {

	     /*
	      * Copy into output matrix and prescale to 0--255
		  */
         for(j=0; j<rangeFFTLength; j++) {
		    a=-range_P[j].r;
			if(fmax < a) fmax=a;
			if(fmin >a ) fmin=a;
	        mat_PP[i][j]=a;
	     }	
      }	else {
	     /*
		  * store real and imaginary in consecutive locations in matrix row
		  */
	  
         for(j=0; j<rangeFFTLength/2; j++) {
		    
	        mat_PP[i][2*j]=-range_P[j].r;
			mat_PP[i][2*j+1]=range_P[j].i;	

		    a= -range_P[j].r;
			if(fmax < a) fmax=a;
			if(fmin >a ) fmin=a;

		 }  
	  
	  }	   
	}
	fprintf(stderr,"img_sar_range_compress: fmin=%f fmax=%f \n",fmin,fmax); 

    for(j=0; j<obufs; j++) {
			  if(IT_OUT(j)){
	
				  KrnOverflow("img_sar_range_compress",j);
				  return(99);
			   }
			   img.image_PP = mat_PP;
			   img.width = rangeFFTLength;
			   img.height = height;
			   OUTIMAGE(j,0) = img;
    }
}

return(0);


]]>
</MAIN_CODE> 

<WRAPUP_CODE>
<![CDATA[ 

if(range_P) free(range_P);
if(rangeFFT_P) free(rangeFFT_P);
if(refFFT_P) free(refFFT_P);
if(ref_P) free(ref_P);

]]>
</WRAPUP_CODE> 



</BLOCK> 

