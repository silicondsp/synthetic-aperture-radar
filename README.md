# synthetic-aperture-radar
Modeling and Simulation of Synthetic Aperture Radar (SAR) in Capsim
Block Diagram Modelling and Simulation Tool. 
Papers on SAR Image Formation (LaTex)


<h1 align="center">Synthetic Aperture Radar</h1>
<p style="margin-left:1em;"><a href="#capsim_instructions" >Instructions</a> for Running Capsim&reg; SAR Block Diagram Simulation.
  
<table width="964" border="1">
  <tbody>
    <tr>
      <th width="48" scope="col"><div align="center">Item</div></th>
      <th width="409" scope="col">Description</th>
      <th width="144" scope="col">Author</th>
      <th width="112" scope="col">Date</th>
      <th width="217" scope="col"><div align="center">Download</div></th>
    </tr>
    <tr>
      <td><div align="center">1</div></td>
      <td>Synthetic Aperture Radar Point Target Response</td>
      <td>Sasan Ardalan</td>
      <td>1987-2006</td>
      <td><div align="center"><a href="SAR_Technical_Papers/SyntheticApertureRadarPointTarget.pdf"><img src="pdf.gif" width="22" height="21" alt="PDF Download"/></a></div></td>
    </tr>
    <tr>
      <td><div align="center">2</div></td>
      <td>Synthetic Aperture Radar Simplified</td>
      <td>Sasan Ardalan</td>
      <td>1987-2006</td>
      <td><div align="center"><a href="SAR_Technical_Papers/SyntheticApertureRadarSimplified.pdf"><img src="pdf.gif" width="22" height="21" alt="PDF Download"/></a></div></td>
    </tr>
 <tr>
      <td><div align="center">3</div></td>
      <td>Key Paper <strong></strong>Image formation from spaceborne synthetic aperture</strong></td>
      <td>McDonough R.N., et. al.</td>
      <td>1985 APL Technical Digest Vol. 6, No. 4 pp 300-312. </td>
      <td><a href="Papers/APL_SAR_SeaSat_Paper.pdf" > <img src="pdf.gif" width="22" height="21" alt=""/></a></td>
    </tr>  
  </tbody>
</table>
<p style="margin-left:1em;">SEASAT SAR Image Los Angeles (JPL)
<p>
  <img src="Seasat_picture_of_Los_Angeles.jpg"> 
<p>
  <div id="capsim">
 <img src="SAR_Block_Diagram_Capsim.png">     
<div style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><table width="100%" border="1" cellpadding="2" cellspacing="2" style="background-color: #ffffff;">
<tr valign="top">
<td width="45" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;"><b>Item</b></span></p>
</td>
<td width="199" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;"><b>Block Name</b></span></p>
</td>
<td width="365" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;"><b>Description</b></span></p>
</td>
<td style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;"><b>Source Code<b></span></p>
</td>
<td style="border-width : 0px;"><br />
</td>
</tr>
<tr valign="top">
<td width="45" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">1</span></p>
</td>
<td width="199" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">img_sar_create</span></p>
</td>
<td width="365" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">Create SAR image from parameters</span></p>
</td>
<td style="border-width : 0px;">CAPSIM_PATH/BLOCKS/img_sar_create.s<br />
</td>
<td style="border-width : 0px;"><br />
</td>
</tr>
<tr valign="top">
<td width="45" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">2</span></p>
</td>
<td width="199" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">img_sar_range_compress</span></p>
</td>
<td width="365" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">Compress SAR image in range</span></p>
</td>
<td style="border-width : 0px;">CAPSIM_PATH/BLOCKS/img_sar_range_compress.s<br />
</td>
<td style="border-width : 0px;"><br />
</td>
</tr>
<tr valign="top">
<td width="45" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">3</span></p>
</td>
<td width="199" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">img_sar_azimuth_compress</span></p>
</td>
<td width="365" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">Azimuth compression SAR Image Formation</span></p>
</td>
<td style="border-width : 0px;">CAPSIM_PATH/BLOCKS/img_sar_azimuth_compress.s<br />
</td>
<td style="border-width : 0px;"><br />
</td>
</tr>
<tr valign="top">
<td width="45" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">4</span></p>
</td>
<td width="199" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">imgshrink</span></p>
</td>
<td width="365" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">This block inputs an image and decimates it.</span></p>
</td>
<td style="border-width : 0px;">CAPSIM_PATH/BLOCKS/imgshrink.s<br />
</td>
<td style="border-width : 0px;"><br />
</td>
</tr>
<tr valign="top">
<td width="45" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">5</span></p>
</td>
<td width="199" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">imgnormalize</span></p>
</td>
<td width="365" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">Input an image and normalize to range 0-255 and output</span></p>
</td>
<td style="border-width : 0px;">CAPSIM_PATH/BLOCKS/imgnormalize.s<br />
</td>
<td style="border-width : 0px;"><br />
</td>
</tr>
<tr valign="top">
<td width="45" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">6</span></p>
</td>
<td width="199" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">imgwrtiff</span></p>
</td>
<td width="365" style="border-width : 0px;"><p style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><span style=" font-size: 10pt; font-family: 'Arial', 'Helvetica', sans-serif; font-style: normal; font-weight: normal; color: #000000; background-color: transparent; text-decoration: none;">Writes an input image to a TIFF file as 8 bit samples. Also store the current colormap </span></p>
</td>
<td style="border-width : 0px;">CAPSIM_PATH/BLOCKS/imgwrtiff.s<br />
</td>
<td style="border-width : 0px;"><br />
</td>
</tr>
</table>
</div>
<p>
<div id="capsim_instructions">
<h1>    Instructions for Running Capsim&reg; SAR Block Diagram Simulation.</h1>
  <p style="margin-left:1em;">Obtain the Capsim&reg; Text Mode Kernel (CapsimTMK) for Linux  from:
<p style="margin-left:1em;"><a href="https://github.com/silicondsp/capsim-tmk">GitHub Capsim Text Mode  Repository </a>
<p style="margin-left:1em;">CapsimTMK is  distributed with all the blocks that are needed for modeling and simulating Synthetic Aperture Radar.
<p style="margin-left:1em;"> This Repository contains the Topologies for SAR. 

<p style="margin-left:1em;">Note: Follow the Getting Started Guidelines in the CapsimTMK Repository.
<p style="margin-left:1em;">Once CapsimTMK is installed just run 'make' in this directory (in the SAR repository):  SAR_CapsimTMK_Project
<p style="margin-left:1em;">Then change to the directory 'Topologies' and run:
<p style="margin-left:1em;"><strong></strong>../capsim sar_image_formation_5.t </strong>
<p style="margin-left:1em;">The new image files created will be listed in the console.
<p style="margin-left:1em;">For the Capsim Block Diagram and List of Blocks click <a href="#capsim">here</a>.
  
 <img src="image_sar_create.png" width="742" height="1645" >   
 <p style="margin-left:1em;"> Raw SAR SEASAT Image for Point Target created by Capsim&reg; SAR Block <strong>img_sar_create.s</strong> 
   <br><br>
 <img src="sar_image_formation.png">   
 <p style="margin-left:1em;">Capsim&reg; SAR Image Formation  Point Target (SEASAT) 
