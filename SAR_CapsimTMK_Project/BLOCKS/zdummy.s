<BLOCK>
<LICENSE>
/*  Capsim (r) Text Mode Kernel (TMK) Star Library (Blocks)
    Copyright (C) 1989-2017  Silicon DSP  Corporation 

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
*/
</LICENSE>
<BLOCK_NAME>

zdummy 

</BLOCK_NAME> 

<COMMENTS>
<![CDATA[ 

/* zdummy.s */
/**********************************************************************
                          zdummy()
***********************************************************************
This star multiplies the incoming data stream by the parameter
coefficient, and outputs the resulting data values.
Auto fanout is supported.
<NAME>
gain
</NAME>
<DESC_SHORT>
This star multiplies the incoming data stream by the parameter coefficient, and outputs the resulting data values.
</DESC_SHORT>
<DESCRIPTION>
This star multiplies the incoming data stream by the parameter
coefficient, and outputs the resulting data values.
Auto fanout is supported.
</DESCRIPTION>
<PROGRAMMERS>
</PROGRAMMERS>
*/

]]>
</COMMENTS> 

   

<STATES>
	<STATE>
		<TYPE>int</TYPE>
		<NAME>obufs</NAME>
	</STATE>
</STATES>
 
<DECLARATIONS> 

	int i;
	int samples;
	float val;

</DECLARATIONS> 

     

<PARAMETERS>
<PARAM>
	<DEF>Gain factor</DEF>
	<TYPE>float</TYPE>
	<NAME>factor</NAME>
	<VALUE>1.0</VALUE>
</PARAM>
</PARAMETERS>

    

<INPUT_BUFFERS>
	<BUFFER>
		<TYPE>float</TYPE>
		<NAME>x</NAME>
	</BUFFER>
</INPUT_BUFFERS>
 
<INIT_CODE>
<![CDATA[ 

	if((obufs = NO_OUTPUT_BUFFERS()) <= 0) {
		fprintf(stderr,"gain: no output buffers\n"); 
		return(2);
	}

]]>
</INIT_CODE> 


<MAIN_CODE>
<![CDATA[ 


for(samples = MIN_AVAIL(); samples >0; --samples) {
	IT_IN(0);
	val = factor * x(0);
	for(i=0; i<obufs; i++) {
		if(IT_OUT(i)) {
			KrnOverflow("gain",i);
			return(99);
		}
		OUTF(i,0) = val;
	}
}
return(0);


]]>
</MAIN_CODE> 

<WRAPUP_CODE>
<![CDATA[ 


]]>
</WRAPUP_CODE> 



</BLOCK> 

