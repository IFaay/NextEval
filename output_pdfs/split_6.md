Defines a rate of volumetric heat addition in a conduction element.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>QVOL</td><td>SID</td><td>QVOL</td><td>CNTRLND</td><td>EID1</td><td>EID2</td><td>EID3</td><td>EID4</td><td>EID5</td><td></td></tr><tr><td></td><td>EID6</td><td>etc.</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>QVOL 5</td><td>10.0</td><td>101</td><td>10</td><td>12</td><td>11</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Load set identification. (Integer > 0)</td></tr><tr><td>QVOL</td><td>Power input per unit volume produced by a heat conduction element. (Real)</td></tr><tr><td>CNTRLND</td><td>Control point used for controlling heat generation. (Integer ≥ O; Default = 0)</td></tr><tr><td>EIDi</td><td>A list of heat conduction elements. (Integer > O or “THRU" or “BY")</td></tr></table></body></html>  

## Remarks:  

1. EIDi has material properties (MAT4) that include HGEN, the element material property for heat generation, which may be temperature dependent. This association is made through the element EID. If HGEN is temperature dependent, it is based on the average element temperature.  

2.QVOL provides either the constant volumetric heat generation rate or the load multiplier. QVOL is positive for heat generation. For steady-state analysis, the total power into an element is  

If CNTRLND $=0$ , then $P_{i n}=\mathrm{volume}\cdot\mathrm{HGEN}\cdot\mathrm{QVOL}$ ▪ ·If CNTRLND > 0, then Pin = volume · HGEN ·QVOL · uCNTRLND · where $u_{\mathrm{CNTRLND}}$ is the temperature multiplier  

3. For use in steady-state analysis, the load set is selected in the Case Control Section $(\mathrm{LOAD}=\mathrm{SID})$  

4. In transient analysis SID is referenced by a TLOADi Bulk Data entry. A function of time $F[t-\tau]$ defined on the TLOADi entry multiplies the general load where $\boldsymbol{\tau}$ specifies time delay. The load set identifier on the TLOADi entry must be selected in Case Control $(\mathrm{DLOAD}=\mathrm{SID})$ for use in transient analysis. If multiple types of transient loads exist, they must be combined by the DLOAD Bulk Data entry.  

5. For“THRU" or“BY", all intermediate referenced heat conduction elements must exist.  

6. The CNTRLND multiplier cannot be used with any higher-order elements.  

7. For RC network solver in thermal analysis, CNTRLND can only be used as the ID in CONTROLT as thermostats controller.  

8. QVOL is not supported for CQUADX and CTRIAX axisymmetric elements. It is supported for the CTRIAX6 element.  

Specifies an CHBDYi element face for application of radiation boundary conditions.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RADBC</td><td>NODAMB</td><td>FAMB</td><td>CNTRLND</td><td>EID1</td><td>EID2</td><td>EID3</td><td>EID4</td><td>EID5</td><td></td></tr><tr><td></td><td>EID6</td><td>EID7</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RADBC</td><td>5</td><td>1.0</td><td>101</td><td>10</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>NODAMB</td><td>Ambient point for radiation exchange. (Integer > 0)</td></tr><tr><td>FAMB</td><td>Radiation view factor between the face and the ambient point. (Real ≥ 0.0)</td></tr><tr><td>CNTRLND</td><td>Control point for radiation boundary condition. (Integer ≥ O; Default = 0)</td></tr><tr><td>EIDi</td><td>CHBDYi element identification number. (Integer > 0） Key words "THRU" and "BY" can be used to assist the listing with ascending order of EIDi</td></tr></table></body></html>  

## Remarks:  

1. The basic exchange relationship is:  

if CNTRLND $=0$ , then $q=\upsigma\cdot\mathrm{FAMB}\cdot\upvarepsilon_{e}\cdot(T_{e}^{4}-T_{a m b}^{4})$ if CNTRLND $>0$ ,then $q=\upsigma\cdot\mathrm{FAMB}\cdot u_{\mathrm{CNTRLND}}\cdot\upvarepsilon_{e}\cdot(T_{e}^{4}-T_{a m b}^{4})$  

2. NODAMB is treated as a black body with its own ambient temperature for radiation exchange between the surface element and space. No surface element that is a member of a radiation enclosure cavity may also have a radiation boundary condition applied to it.  

3. Two PARAM entries are required when stipulating radiation heat transfer:  

ABS defines the absolute temperature scale; this value is added internally to any specified temperature given in the problem. Upon solution completion, this value is subtracted internally from the solution vector.   
SIGMA $\scriptstyle{\big(}\sigma{\big)}$ is the Stefan-Boltzmann constant.  

4. RADBC allows for surface radiation to space in the absence of any cavity behavior. The emissivity is supplied from a RADM entry. 5. When using “THRU" or“BY", all intermediate referenced CHBDYi surface elements must exist.  

Specifies Planck's second radiation constant and the wavelength breakpoints used for radiation exchange problems.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RADBND</td><td>NUMBER</td><td>PLANCK2</td><td>LAMBDA1</td><td>LAMBDA2</td><td>LAMBDA3</td><td>LAMBDA4</td><td>LAMBDA5</td><td>LAMBDA6</td><td></td></tr><tr><td></td><td>LAMBDA7</td><td>etc.</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RADBND</td><td>6</td><td>14388.0</td><td>1.0</td><td>2.0</td><td>4.0</td><td>8.0</td><td>12.0</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>NUMBER</td><td>Number of radiation wave bands. See Remarks. (Integer > 1)</td></tr><tr><td>PLANCK2</td><td>Planck's second radiation constant. See Remarks. (Real > 0.0)</td></tr><tr><td>LAMBDAi</td><td>Highest wavelength of the i-th wave band. See Remarks. (Real ≥ 0.0)</td></tr></table></body></html>  

## Remarks:  

1. Only one RADBND entry may be specified in the Bulk Data Section and must always be used in conjunction with the RADM entry.   
2. PLANCK2 has the units of wavelength times temperature. The same units oflength must be used for LAMBDAi as for PLANCK2. The units of temperature must be the same as those used for the radiating surfaces. For example: $25898.\upmu\mathrm{m}\ \mathrm{~}^{\circ}\mathrm{R}$ or $14388.\upmu\mathrm{m}^{\circ}\mathrm{K}$ ，   
3.The first wavelength band extends from O to LAMBDAl and the last band extends from LAMBDAn to infinity, where $\mathfrak{n}=\mathrm{NUMBER}-1$ ．   
4.Discontinuous segments in the emisivity versus wavelength piecewise linear curve must be treated as a wavelength band of zero width.   
5. LAMBDAi must be specified in ascending order, and all LAMBDAi fields where i is greater than or equal to NUMBER must be blank.   
6. If Modules are present then this entry may only be specified in the main Bulk Data section.  

Defines the radiative properties of advanced materials such as coatings and multilayer insulation,commonly used in the aerospace market.  

Format: (COAT)   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>RADC</td><td>RADMID</td><td>Emis</td><td>Absorptivity</td><td>IR Spec</td><td>UV Spec</td><td></td><td></td><td></td></tr><tr><td></td><td>“COAT”</td><td> IR Traspa</td><td>IR Transluc</td><td>UV Transpa</td><td>UV Transluc</td><td>IR Refrac Ind</td><td>UV Refrac Ind</td><td></td></tr></table></body></html>  

## Example:  

Format: (MLI)   


<html><body><table><tr><td>RADC</td><td>101</td><td>1.</td><td>1.</td><td>0.</td><td></td><td></td><td></td></tr><tr><td></td><td>COAT</td><td>0.</td><td>0.</td><td>0.</td><td>0.</td><td>1.</td><td>1.</td></tr></table></body></html>  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RADC</td><td>RADMID</td><td>Emis</td><td>Absorptivity</td><td>IR Spec</td><td>UV Spec</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“MLI”</td><td>Estar</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RADC</td><td>102</td><td>1.</td><td>1.</td><td>0.</td><td></td><td></td><td></td></tr><tr><td></td><td>MLI</td><td>0.02</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>RADMID</td><td>Radiation material identification number (Integer > O; Required)</td></tr><tr><td>COAT</td><td>Identification that a coating type material has been started (Character)</td></tr><tr><td>Emis</td><td>Emissivity (Real ≥ 0.0; Default 1.0)</td></tr><tr><td>Absorptivity</td><td>Absorptivity (Real ≥ 0.0; Default 1.0)</td></tr><tr><td>IR Spec</td><td>IR Specularity (0.0 ≤ Real ≤ 1.0; Default 0.0)</td></tr><tr><td>UV Spec</td><td>UV Specularity (0.0 ≤ Real ≤ 1.0; Default 0.0)</td></tr><tr><td>IR Transpa</td><td>IR Transparency (0.0 ≤ Real ≤ 1.0; Default 0.0)</td></tr><tr><td>IR Transluc</td><td>IR Translucency (0.0 ≤ Real ≤ 1.0; Default 0.0)</td></tr><tr><td>UV Transpa</td><td>UV Transparency (0.0 ≤ Real ≤ 1.0; Default 0.0)</td></tr><tr><td>UV Transluc</td><td>UV Translucency (0.0 ≤ Real ≤ 1.0; Default 0.0)</td></tr><tr><td>IR Refrac Ind</td><td>IR Refraction Index (Real ≥ 1.0; Default 1.0)</td></tr><tr><td>UV Refrac Ind</td><td>UV Refraction Index (Real ≥ 1.0; Default 1.0)</td></tr><tr><td>MLI</td><td>Identification that an MLI type material has been started (Character)</td></tr><tr><td>Estar</td><td> MLI E-star parameter (Real; Default 0.0)</td></tr></table></body></html>  

## Remarks:  

1. This entry is for RC Network solver only.   
2.Estar is defined as the effective emissivity from the wallto MLI outer surface. The general value is around 0.0l to 0.03, the typical value is 0.02.   
3. Emis is usually for the IR waveband, and Absorptivity is for the UV waveband.  

Identifies the characteristics of each radiant enclosure.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RADCAV</td><td>ICAVITY</td><td>ELEAMB</td><td>SHADOW</td><td>SCALE</td><td>PRTPCH</td><td>NFECI</td><td>RMAX</td><td>NCOMP</td><td></td></tr><tr><td></td><td>SET11</td><td>SET12</td><td>SET21</td><td>SET22</td><td>SET31</td><td>SET32</td><td>etc.</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RADCAV</td><td>1</td><td>1</td><td></td><td></td><td></td><td>.99</td><td></td><td></td></tr><tr><td></td><td>3</td><td>5</td><td>4</td><td>5</td><td>7</td><td>5</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ICAVITY</td><td>Unique cavity identification number associated with enclosure radiation. (Integer > 0)</td></tr><tr><td>ELEAMB</td><td>CHBDYi surface element identification number for radiation if the view factors add up to less than 1.0. (Unique Integer > O among all CHBDYi elements or blank.)</td></tr><tr><td>SHADOW</td><td>Flag to control third body shading calculation during view factor calculation for each identified cavity. (Character = “YES” or“NO"; Default = “YES")</td></tr><tr><td>SCALE</td><td>View factor that the enclosure sum will be set to if a view factor is greater than 1.0. (0.0 ≤ Real≤ 1.0; Default = 0.0)</td></tr><tr><td>PRTPCH</td><td>Facilitates the blocking of view factor printing and punching onto RADLST and RADMTX entries. (Integer = 0,1, 2, 3, 4, or 5; Default = blank):</td></tr></table></body></html>  

<html><body><table><tr><td colspan="3">Hemi-Cube & VIEW3D</td></tr><tr><td>Value</td><td>Printout in .f06 file</td><td>Printout in .pch file</td></tr><tr><td>Blank</td><td>No</td><td>Yes</td></tr><tr><td>0</td><td>Full Print</td><td>Yes</td></tr><tr><td>１</td><td>No</td><td>Yes</td></tr><tr><td>2</td><td>Full Print</td><td>No</td></tr><tr><td>３</td><td>No</td><td>No</td></tr><tr><td>4</td><td>Summary Print</td><td>Yes</td></tr><tr><td>５</td><td>Summary Print</td><td>No</td></tr></table></body></html>  

<html><body><table><tr><td>NFECI</td><td>Controls whether finite difference or contour integration methods are to be used in the calculation of view factors in the absence of a VIEW3D Bulk Data entry. (Character =“FD” or “CONT"; See Remark 4. for default.)</td></tr><tr><td>RMAX</td><td>Subelement area factor. See Remark 5. (Real ≥ 0.0; Default = 0.1)</td></tr><tr><td>NCOMP</td><td>Total number of computational element for one-half ring. See Remark 8. (Default = 32)</td></tr><tr><td>SETij</td><td>Set identification pairs for the calculation of global view factors. Up to 30 pairs may be specified (i = 1 to 2 and j = 1 to 30). (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. For the surfaces of an incomplete enclosure (view factors add up to less than 1.0), a complete enclosure may be achieved $\mathrm{(SUM=1.0)}$ by specifying an ambient element, ELEAMB. When multiple cavities are defined, each cavity must have a unique ambient element ifambient elements are desired. No elements can be shared between cavities.   
2. Third-body shadowing is ignored in the cavity if $\mathrm{SHADOW}=\mathrm{^{\mathrm{c}}N O^{\mathrm{3}}}$ . In particular, if it is known a priori that there is no third-body shadowing, $\mathrm{SHADOW}=\mathrm{NO}$ overrides KSHD and KBSHD fields on the VIEW Bulk Data entry as well as reduces the calculation time immensely.   
3. The view factors for a complete enclosure may add up to slightly more than 1.0 due to calculation inaccuracies. SCALE can be used to adjust all the view factors proportionately to acquire a summation equal to the value specified for SCALE. If SCALE is left blank or set to 0.0, no scaling is performed.   
4.Ifthe VIEW3D Bulk Data entry is not specified, the view factors are calculated using finite difference and contour integration methods. If $\mathrm{{NFECI}=^{\ast}F D^{\ast}}$ , then all view factors are calculated using the finite difference technique. $\mathrm{\DeltaNFECI{}=\mathrm{\Omega^{\mathrm{*}}C O N T^{\mathrm{*}}}}$ invokes contour integration for all view factor calculations. If NFECI is blank, the program selects a method to use between any two particular elements based on RMAX.   
5. The comparison value for RMAX is equal to $A_{s}/d_{r s}^{2}$ where $A_{s}$ is the area of a subelement and $d_{r s}$ is the distance between two subelements r and s for which view factors are being computed. When NFECI is blank, the program selects the contour integral method only if $A_{s}/d_{r s}^{2}>\mathrm{RMAX}$ .   
6. When a number of elements are grouped together and considered as a conglomerate surface, view factors can be calculated between these groups. These are referred to asglobal view factors. The SET1 Bulk Data entry is used to define the conglomerate. When using this feature, negative EIDs are not allowed.   
7. If a RADLST and RADMTX entry exists for this cavity ID, new view factors are not computed and the existing RADLST and RADMTX are used in the thermal analysis.   
8.The VIEW3D Bulk Data entry must be specified for the calculation of axisymmetric view factors. The process relies on the internal construction of a semi-circle of computational elements. NCOMP specifies the number of such elements desired.   
9. For SOL 600, fields 4-8 of the primary entry and allcontinuation lines are ignored.  

10.For SOL 600 field 9 of the primary entry (NCOMP) is used to indicate if the cavity is open or closed according to the following designation:  

0 Cavity is closed   
1 Cavity is closed an view factors are scaled such that they sum to exactly 1.0   
2 Cavity is open  

11. For RC network solver in thermal analysis, RADCAV is only used to specify radiation space node, the ELEAMB must be a POINT type CHBDYP element. The SHADOW, SCALE, PRTPCH, NFECI, RMAX, NCOMP,SET11, SET12, SET21, SET22, SET31 and SET32 are ignored.  

Specifies acollction of boundary elements to be used as a single face in the radiation calculation.This wil decrease computation time at the smallcost of accuracy.Computational savings and accuracy are dependent on the coarseness of the collection versus the constituents. View factors of the collection are redistributed across the elements for calculation of the radiative energy transfer.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>RADCOL</td><td>RADCOLID</td><td>IVIEWF</td><td>IVIEWB</td><td>RADMIDF</td><td>RADMIDB</td><td>SET3ID</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RADCOL</td><td>101</td><td>5</td><td>6</td><td>2</td><td>3</td><td>7</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>RADCOLID</td><td>Radiation Collection identification number. (Integer > 0; Required)</td></tr><tr><td>IVIEWF</td><td>A VIEW entry identification number for the front face. (Integer ≥ 0; Default 0)</td></tr><tr><td>IVIEWB</td><td>A VIEW entry identification number for the back face. (Integer ≥ O; Default 0)</td></tr><tr><td>RADMIDF</td><td>RADM identification number for the front face. (Integer ≥ O; Default 0)</td></tr><tr><td>RADMIDB</td><td>RADM identification number for the back face. (Integer ≥ 0; Default 0)</td></tr><tr><td>SET3 idn</td><td>ID of the element collection to be considered a super element. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. This entry is for RC Network solver only.   
2.IVIEWF/IVIEWB will default to O ifleft blank.This would indicate that the corresponding front and/or back do not participate in the radiation.   
3. If an IVIEWF is specified, there must also be a RADMIDF for surface material properties. If a IVIEWB is specified, there must also be a RADMIDB for surface material properties.  

Specifies table references for RADC properties that are functionally dependent.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RADCT</td><td>RADMID</td><td>Emis f(T)</td><td>Abs f(T)</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RADCT</td><td>11</td><td>101</td><td>102</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>RADMID</td><td> Radiation material identification number (Integer > O; Required)</td></tr><tr><td>Emis f(T)</td><td>Emissivity TABLEMj table ID (Integer ≥ 0; Default.0)</td></tr><tr><td>Absorptivity f(T)</td><td>Absorptivity TABLEDj table ID (Integer ≥ 0; Default 0)</td></tr></table></body></html>  

## Remarks:  

1. This entry is for RC Network solver only.   
2. RADCT always comes with the RADC entry. They have the same RADMID so that they can be referenced together.   
3. Currently, RC Network solver does not support this entry for enclosure radiation.  

Identifies the individual CHBDYi surface elements that comprise the entire radiation enclosure.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RADLST</td><td>ICAVITY</td><td>MTXTYP</td><td>EID1</td><td>EID2</td><td>EID3</td><td>EID4</td><td>EID5</td><td>EID6</td><td></td></tr><tr><td></td><td>EID7</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RADLST</td><td>2</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td>ICAVITY MTXTYP</td><td colspan="2">Unique cavity identification number that links a radiation exchange matrix with its listing of enclosure radiation faces. (Integer > 0)</td></tr><tr><td rowspan="6"></td><td colspan="2">Type of radiation exchange matrix used for this cavity. (Integer ≤ 4 and ≠ O; Default = 1 for an enclosure without an ambient element. Default = 4 for an enclosure with an ambient element as specified on the RADCAV entry.)</td></tr><tr><td>1</td><td>Symmetric view factor matrix [F] and nonconservative radiation matrix [R].</td></tr><tr><td>2</td><td>Symmetric exchange factor matrix [3] and conservative radiation matrix [R].</td></tr><tr><td>3</td><td>Unsymmetric exchange factor matrix [3] and conservative radiation matrix</td></tr><tr><td>4</td><td>[R].</td></tr><tr><td>-n</td><td>Symmetric view factor matrix [F] and conservative radiation matrix [R]. The first n CHBDYi elements may lose energy to space but the remainder may not. Symmetric exchange factor matrix [F] and nonconservative radiation</td></tr><tr><td>EIDi</td><td colspan="2">matrix [R]. Identification numbers for the CHBDYi elements in this radiation cavity. (Integer ≠ 0 or “THRU")</td></tr></table></body></html>  

## Remarks:  

1. A radiation EIDi list isolates those CHBDYi surface element faces that are to communicate in a radiation enclosure. View-factor calculation and RADMTX formation for an enclosure is performed only for (or among) those faces identified within the same RADCAV.   
2. A radiation exchange matrix (RADMTX) can only reference one radiative face list (RADLST). The companion RADCAV, RADLST, and RADMTX must share a unique ICAVITY.   
3. For each EIDi, the appropriate CHBDYi element is located, and the proper RADM entry ID field found.   
4.If the radiation exchange matrix or any radiation boundary conditions are available from an external source, the RADMTX must be user generated.   
5. Multiple RADLST entries may be specified.   
6. If any RADLST entry is changed or added on restart then a complete re-analysis may be performed. Therefore, RADLST entry changes or additions are not recommended on restart.   
7. RC network solver does not support RADLST for thermal analysis.  

Defines the radiation properties of a boundary element for heat transfer analysis.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RADM</td><td>RADMID</td><td>ABSORP</td><td>EMIS1</td><td>EMIS2</td><td>EMIS3</td><td>EMIS4</td><td>EMIS5</td><td>EMIS6</td><td></td></tr><tr><td></td><td>EMIS7</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RADM</td><td>11</td><td>.45</td><td>.33</td><td>.29</td><td>.20</td><td>.17</td><td>.13</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>RADMID</td><td>Material identification number. (Integer > 0)</td></tr><tr><td>ABSORP</td><td>Surface absorptivity or the temperature function curve multiplier if ABSORP is variable. See Remark 2. (0.0 ≤Real≤ 1.0)</td></tr><tr><td>EMISi</td><td>Surface emissivity at wavelength LAMBDAi or the temperature function curve multiplier if EMISi is variable (See the RADBND entry.) (0.O ≤ Real ≤ 1.0)</td></tr></table></body></html>  

## Remarks:  

1. The RADM entry is directly referenced only by one of the CHBDYE, CHBDYG,or CHBDYP type surface element entries.   
2. For radiation enclosure problems, ABSORP is set equal to emissivity. For QVECT loads, absorptivity is specified by ABSORP.  

3. If there is more than one EMISi, then:  

· There must be a RADBND entry.   
$\cdot\cdot$ The number of EMISi may not exceed the number of LAMBDAi on the RADBND entry.   
The emissivity values are given for a wavelength specified by the corresponding LAMBDAi on the RADBND entry. Within each discrete wavelength band, the emissivity is assumed to be constant.   
· At any specific wavelength and surface temperature, the absorptivity is exactly equal to the emissivity.  

4. To perform any radiation heat transfer exchange, the user must furnish PARAM entries for:  

$\cdot\cdot$ TABS to define the absolute temperature scale.   
· SIGMA (o) to define the Stefan-Boltzmann constant in appropriate units.  

5. RC network solver only supports RADMID, ABSORP and EMIS1 for thermal analysis,other fields are ignored.  

Specifies table references for temperature dependent RADM entry radiation boundary properties.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RADMT</td><td>RADMID</td><td>T(A)</td><td>T(ε 1)</td><td>T(ε 2)</td><td>T(ε 3)</td><td>T(ε4)</td><td>T(ε5)</td><td>T(ε6)</td><td></td></tr><tr><td></td><td>T(ε 7)</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RADMT</td><td>11</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>RADMID</td><td> Material identification number. (Integer > 0)</td></tr><tr><td>T(A)</td><td>TABLEMj identifier for surface absorptivity. (Integer ≥ O or blank)</td></tr><tr><td>T(&)</td><td> TABLEMj identifiers for surface emissivity. (Integer ≥ O or blank)</td></tr></table></body></html>  

## Remarks:  

1. The basic quantities on the RADM entry of the same RADMID are always multiplied by the corresponding tabular function.   
2． Tables $\mathrm{T}(\mathrm{A})$ and $\mathrm{T}(\mathfrak{s}_{i})$ have an upper bound that is lessthan or equal to one and a lower bound that is greater than or equal to zero.   
3. The TABLEMj enforces the element temperature as the independent variable. Blank or zero fields means there is no temperature dependence of the referenced property on the RADM entry.   
4. RC network solver only supports RADMID, T(A) and $\mathrm{T}(\mathfrak{c}_{1})$ for thermal analysis, other fields are ignored.  

Provides the $F_{j i}=A_{j}f_{j i}$ exchange factors for all the faces of a radiation enclosure specified in the corresponding RADLST entry.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RADMTX</td><td>ICAVITY</td><td>INDEX</td><td>Fi,j</td><td>Fi+1,j </td><td>Fi+2,j</td><td>Fi+3,j</td><td>Fi+4,j</td><td>Fi+5,j</td><td></td></tr><tr><td></td><td>Fi+6,j</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RADMTX</td><td>2</td><td>1</td><td>0.0</td><td>0.1</td><td>0.2</td><td>0.2</td><td>0.3</td><td>0.2</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ICAVITY</td><td>Unique cavity identification number that links a radiation exchange matrix with its listing of enclosure radiation surface elements. (Integer > 0)</td></tr><tr><td>INDEX</td><td>Column number in the matrix. (Integer > 0)</td></tr><tr><td>Fkj</td><td>If symmetric, the matrix values start on the diagonal (i = j) and continue down the column (k = i+ 1, i+ 2, etc.). If unsymmetric, the values start in row (i = 1). i refers to EIDi on the RADLST entry. (Real ≥ 0)</td></tr></table></body></html>  

## Remarks:  

1. If the matrix is symmetric, only the lower triangle is input, and $\mathbf{i}=\mathbf{j}=\mathrm{INDEX}$ . If the matrix is unsymmetric, $\dot{\mathbf{i}}=1$ ,and $\mathrm{j}=\mathrm{INDEX}$   
2. Only one ICAVITY may be referenced for those faces that are to be included in a unique radiation matrix.   
3. Coefficients are listed by column with the number of columns equal to the number of entries in the RADLST.   
4. Allfaces involved in any radiation enclosure must be defined with an CHBDYi element.   
5. Ifany RADMTX entry is changed oradded on restart then a complete re-analysis may be performed. Therefore, RADMTX entry changes or additions are not recommended on restart.   
6. Set NASTRAN SYSTEM $\left(87\right)=3$ is a new option in MSC Nastran 2005 that prevents radiation energy from being lost to space.   
7. RC network solver does not support RADMTX for thermal analysis.  

Specifies which radiation cavities are to be included for radiation enclosure analysis.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RADSET</td><td>ICAVITY1</td><td>ICAVITY2</td><td>ICAVITY3</td><td>ICAVITY4</td><td>ICAVITY5</td><td>ICAVITY6</td><td>ICAVITY7</td><td>ICAVITY8</td><td></td></tr><tr><td></td><td>ICAVITY9</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RADSET</td><td>1</td><td>2</td><td>3</td><td>4</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ICAVITYi</td><td>Unique identification number for a cavity to be considered for enclosure radiation analysis. (Integer > 0)</td></tr></table></body></html>  

## Remark:  

1.For multiple radiation cavities, RADSET specifies which cavities are to be included in the analysis.  

Defines load set power spectral density factors for use in random analysis having the frequency dependent form  

$$
S_{j k}(F)=(X+i Y)G(F)
$$  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>RANDPS</td><td>SID</td><td></td><td>K</td><td>X</td><td>Y</td><td>TID</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RANDPS</td><td>5</td><td>3</td><td>7</td><td>2.0</td><td>2.5</td><td>4</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Random analysis set identification number. See Remarks 1.and 9. (Integer > 0)</td></tr><tr><td>J</td><td>Subcase identification number of the excited load set. See Remarks 6. through 9. (Integer > 0)</td></tr><tr><td>K</td><td>Subcase identification number of the applied load set. See Remarks 6. through 9. (Integer ≥0; K≥ J)</td></tr><tr><td>X,Y</td><td>Components of the complex number. See Remarks 2. and 7. (Real)</td></tr><tr><td>TID</td><td>Identification number of a TABRNDi entry that defines G(F). See Remarks 3. and (Integer > O or Blank)</td></tr></table></body></html>  

## Remarks:  

1. Set identification numbers must be selected with the Case Control command $(\mathrm{RANDOM}=\mathrm{SID})$ or through use of FTGLOAD when doing random vibration fatigue analysis.   
2. For auto spectral density, $\boldsymbol{\mathrm J}=\boldsymbol{\mathrm K}$ , X must be greater than zero and Y must be equal to zero.   
3.For $\mathrm{TID}=\mathrm{Blank}$ ， $G(F)=1.0$ ·   
4.RANDPS may only reference subcases included within a single loop (a change in direct matrix input is not allowed).   
5. See the MSC Nastran Dynamic Analysis User's Guide for a discussion of random analysis.   
6.In the case of cyclic symmetry Solution Sequence 1l8,J and K must refer to the coded subcase IDs.   
7. In superelement analysis, J and K must refer to the superelement subcases. For example, if superelement 10 has SUBCASEs 1 and 2 and superelement 20 has SUBCASEs 3 and 4, then a separate RANDPS entry is required for each superelement, even though X, Y, and TID may be identical.   
8. For uncoupled PSDF $\mathrm{~(no~J<K~}$ entries) only one $\boldsymbol{\mathrm J}=\boldsymbol{\mathrm K}$ entry is allowed for unique value of J. Fo1 coupled PSDF (some $\boldsymbol{\mathrm{J}}<\boldsymbol{\mathrm{K}}$ entries) any number of entries are allowed.   
9.Jand K must reference valid subcase IDs. In superelement analysis, J and K must reference valid subcase IDs that pertain to the applicable superelement. If this requirement is not met, the program issues an appropriate user warning message and ignores the associated RANDOM $\dot{.}=\mathbf{\nabla}$ SID command.   
10. If Modules are present then this entry may only be specified in the main Bulk Data section.  

Defines time lag constants for use in random analysis autocorrelation function calculation.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RANDT1</td><td>SID</td><td>N</td><td>T0</td><td>TMAX</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RANDT1</td><td>5</td><td>10</td><td>3.2</td><td>9.6</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Random analysis set identification number. (Integer > 0)</td></tr><tr><td>N</td><td>Number of time lag intervals. (Integer > 0)</td></tr><tr><td>T0</td><td>Starting time lag. (Real ≥ 0.0)</td></tr><tr><td>TMAX</td><td>Maximum time lag. (Real > T0)</td></tr></table></body></html>  

## Remarks:  

1. Time lag sets must be selected with the Case Control command RANDOM = SID.   
2. At least one RANDPS entry must be present with the same set identification number.   
3. The time lags defined on this entry are given by   
$T_{i}=T0+\frac{\mathrm{TMAX}-T0}{N}(i-1),i\ =\ 1,\mathbf{N}+2$   
4. See the MSC Nastran Dynamic Analysis User's Guide for a discussion of random analysis.   
5. If Modules are present then this entry may only be specified in the main Bulk Data section.  

Defines a rigid bar with six degrees-of-freedom at each end.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RBAR</td><td>EID</td><td>GA</td><td>GB</td><td>CNA</td><td>CNB</td><td>CMA</td><td>CMB</td><td>ALPHA</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RBAR</td><td>5</td><td>1</td><td>2</td><td>123456</td><td></td><td></td><td></td><td>6.5-6</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. (0 < Integer < 100,000,000)</td></tr><tr><td>GA, GB</td><td>Grid point identification number of connection points. (Integer > 0)</td></tr><tr><td>CNA, CNB</td><td>Component numbers of independent degrees-of-freedom in the global coordinate system for the element at grid points GA and GB. See Remark 3. (Integers 1 through 6 with no embedded blanks, or zero or blank.)</td></tr><tr><td>CMA,CMB</td><td>Component numbers of dependent degrees-of-freedom in the global coordinate system assigned by the element at grid points GA and GB. See Remarks 4. and 5. (Integers 1 through 6 with no embedded blanks, or zero or blank.)</td></tr><tr><td>ALPHA</td><td>Thermal expansion coefficient. See Remark 11. (Real or blank)</td></tr></table></body></html>  

## Remarks:  

1. Two methods are available to process rigid elements: equation elimination or Lagrange multipliers. The Case Control command, RIGID, selects the method.   
2.For the Lagrange method, Nastran willcreate the Lagrange multiplier degrees-of-freedom internally in addition to the 12 displacement degrees-of-freedom given by grid points GA and GB.The number of Lagrange multiplier degrees-of-freedom is equal to the number of dependent degrees-of-freedom.   
3. For the linear method, the total number of components in CNA and CNB must equal six; for example, $\mathrm{CNA}=1236$ 。 $\mathrm{CNB}=34\$ . Furthermore, they must jointly be capable of representing any general rigid body motion of the element.For the Lagrange method, the total number of components must also be six.However, only $\mathrm{CNA}=123456$ or $\mathrm{CNB}=123456$ is allowed. Ifboth CNA and CNB are blank, then $\mathrm{CNA}=123456.$ For this method, RBARl gives the simpler input format.   
4. If both CMA and CMB are zero or blank, all of the degrees-of-freedom not in CNA and CNB will be made dependent. For the linear method, the dependent degrees-of-freedom willbe made members of the m-set.For the Lagrange method, they may or may not be member of the m-set, depending on the method selected in the RIGID Case Control command. However, the rules regarding the m-set described below apply to both methods.   
5. The m-set coordinates specified on this entry may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.   
6. Element identification numbers should be unique with respect to allother element identification numbers.   
7. RBAR, among other eligible rigid element types, can be selected via MPC and SET3.   
8.Forces of multipoint constraint may be recovered in allsolution sequences, except SOL 129, with the MPCFORCE Case Control command.   
9. Rigid elements are ignored in heat transfer problems. If used in a multi-physics coupled problem using SUBSTEP, they participate in the mechanical substep but are ignored in the heat transfer substep through automatic deactivation. For more information on deactivation, see the DEACTEL keyword under the NLMOPTS Bulk Data entry and the associated Remark 9 for that entry.   
10.See Rigid Elements and Multipoint Constraints (R-type, MPC)(p.155)in the MSC Nastran Reference Guide for a discussion of rigid elements.   
11.For the Lagrange method, the thermal expansion effct willbe computed for the rigid bar element if user supplies the thermal expansion coefficient ALPHA, and the thermal load is requested by the TEMPERATURE(INITIAL) and TEMPERATURE(LOAD) Case Control commands. The temperature of the element is taken as the average temperature of the two connected grid points GA and GB. There is no current entry fora TREF,so if TEMP(INIT) is not specified in Case Control, a reference temperature of 0.0 is used for the RBAR.   
12.When there islarge rotation, CMA and CMB must have all“456" ifany rotational degrees offreedom is used.  

Alternative format for RBAR.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7 8</td><td>9 10</td></tr><tr><td>RBAR1</td><td>EID</td><td>GA</td><td>GB</td><td>CB</td><td>ALPHA</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RBAR1</td><td>5</td><td>1</td><td>2</td><td>123</td><td>6.5-6</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. (0 < Integer < 100,000,000)</td></tr><tr><td>GA, GB</td><td>Grid point identification numbers. (Integer > 0)</td></tr><tr><td>CB</td><td>Component numbers in the global coordinate system at GB, which are constrained to move as the rigid bar. See Remark 4. (Integers 1 through 6 with no embedded blanks or blank.)</td></tr><tr><td>ALPHA</td><td>Thermal expansion coefficient. See Remark 8. (Real or blank)</td></tr></table></body></html>  

## Remarks:  

1. Two methods are available to process rigid elements: equation elimination or Lagrange multipliers. The Case Control command, RIGID, selects the method.   
2.For the Lagrange method, Nastran willcreate internally the Lagrange multiplier degrees-of-freedom in addition to the 12 displacement degrees-of-freedom given by grid points GA and GB.The number of Lagrange multiplier degrees-of-freedom is equal to the number of dependent degrees-of-freedom given by CB.   
3. RBARl is a preferred input format to define the Lagrange method for a rigid bar   
4.When $\mathrm{CB}={}^{\mathrm{\infty}}123456{}^{\mathrm{\infty}}$ or blank, the grid point GB is constrained to move with GA as a rigid bar. For default $\mathrm{CB}={}^{\cdots}123456^{\prime\prime}$ . Any number of degrees-of-freedom at grid point GB can be released not to move with the rigid body.   
5.For the Lagrange method, the theory is formulated such that a consistent rigid body motion for grid points GA and GB willbe computed even if these two points have different global coordinate systems   
6.For the Lagrange method, the thermal expansion effect willbe computed for the rigid bar element if user supplies the thermal expansion coeffcient ALPHA, and the thermal load is requested by the TEMPERATURE(INITIAL) and TEMPERATURE(LOAD) Case Control commands. The temperature of the element is taken as the average temperature of the two connected grid points GA and GB. There is no current entry fora TREF, so ifTEMP(INIT) is not specified in Case Control, a reference temperature of 0.0 is used for the RBAR1.   
7. Element identification numbers should be unique with respect to allother element identification numbers.   
8.Rigid elements are ignored in heat transfer problems.If used in a multi-physics coupled problem using SUBSTEP,they participate in the mechanical substep but are ignored in the heat transfer subsstep through automatic deactivation. For more information on deactivation, see the DEACTEL keyword under the NLMOPTS Bulk Data entry and the associated Remark 9 for that entry.   
9.Forces of multipoint constraint may be recovered in allsolution sequences, except SOL 129, with the MPCFORCE Case Control command.  

Defines a rigid connection between a point on an axisymmetric harmonic element (CQUADX or CTRIAX) and a point on the axis of symmetry of that element.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7 8</td><td>9</td><td>10</td></tr><tr><td>RBAX3D</td><td>EID</td><td>G3D</td><td>GAX</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RBAX3D</td><td>100</td><td>10</td><td>20</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. (O < Integer < 100,000,000). See Remark 1..</td></tr><tr><td>G3D</td><td>Identification number of a grid point on the axis of symmetry (Integer > 100,000,000). See Remarks 2. and 4. through 7.</td></tr><tr><td>GAX</td><td>Identification number of a grid point referenced on an axisymmetric harmonic element (CQUADX or CTRIAX). (0 < Integer < 100,000,000). See Remarks 3. through 7..</td></tr></table></body></html>  

## Remarks:  

1. The EID should be unique with respect to all other elements.   
2. The G3D point may not be referenced on an axisymmetric harmonic element. If it is, the program terminates the execution with an appropriate user fatal message.   
3. The GAX point must be referenced on an axisymmetric harmonic element. Ifit is not, the program terminates the execution with an appropriate user fatal message. Further, the axisymmetric harmonic element (or elements) that reference GAX must have harmonic index 1 specified on the associated PAXSYMH entry. If this condition is not satisfied, the program terminates the execution with an appropriate user fatal message.   
4. The G3D point must be on the axis of symmetry. The GAX point need not be on the axis of symmetry.   
5. The G3D and GAX points must both have the same axial coordinate along the axis of symmetry.   
6.The G3D point is regarded as the independent point and the GAX point is regarded as the dependent point. The dependent degrees of freedom of GAX willbe selected from the axisymmetric harmonic degrees of freedom.  

7.If the GAX point is on the axis of symmetry, the connection is made only to the G3D displacement components perpendicular to the axis. However, if the GAX point is not on the axis of symmetry, then connection is made not only to the G3D displacement components perpendicular to the axis, but also to the slopes. The tolerance to determine if the GAX point is on the axis of symmetry is 1.0E6.  

Defines a rigid body connected to an arbitrary number of grid points.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3 4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>RBE1</td><td>EID</td><td>GN1 CN1</td><td>GN2</td><td>CN2</td><td>GN3</td><td>CN3</td><td></td></tr><tr><td></td><td>GN4</td><td>CN4</td><td>GN5</td><td>CN5</td><td>GN6</td><td>CN6</td><td></td></tr><tr><td></td><td>“UM"” GM1</td><td>CM1</td><td>GM2</td><td>CM2</td><td>GM3</td><td>CM3</td><td></td></tr><tr><td></td><td>GM4</td><td>CM4</td><td>-etc.-</td><td>ALPHA</td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RBE1</td><td>59</td><td>59</td><td>123456</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>UM</td><td>61</td><td>246</td><td>6.5-6</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. (O < Integer < 100,000,000)</td></tr><tr><td>GNi</td><td>Grid points at which independent degrees-of-freedom for the element are assigned. (Integer > 0)</td></tr><tr><td>CNi</td><td>Independent degrees-of-freedom in the global coordinate system for the rigid element at grid point(s) GNi. See Remark 1. (Integers 1 through 6 with no embedded blanks.)</td></tr><tr><td>“UM"</td><td> Indicates the start of the dependent degrees-of-freedom. (Character)</td></tr><tr><td>GMj</td><td>Grid points at which dependent degrees-of-freedom are assigned. (Integer > 0)</td></tr><tr><td>CMj </td><td>Dependent degrees-of-freedom in the global coordinate system at grid point(s) GMj. (Integers 1 through 6 with no embedded blanks.)</td></tr><tr><td>ALPHA</td><td>Thermal expansion coefficient. See Remark 13. (Real or blank)</td></tr></table></body></html>  

## Remarks:  

1. Two methods are available to process rigid elements: equation elimination or Lagrange multipliers. The Case Control command, RIGID, selects the method.   
2.For the Lagrange method, Nastran willcreate internally the Lagrange multiplier degrees-of-freedom in addition to the displacement degree-of-freedom given by connected grid points.The number of Lagrange multiplier degrees-of-freedom is equal to the number of dependent degrees-of-freedom given by CMj.   
3.For the linear method, the total number of components in CN1 to CN6 must equal six; for example, $\mathrm{CN}1=123$ ， $\mathrm{CN}2=3$ ， $\mathrm{CN}3=2$ ， $\mathrm{CN}4=3$ . Furthermore, they must jointly be capable of representing any general rigid body motion of the element.The first continuation entry is not required if there are fewer than four GN points. For the Lagrange method, the total number of components must also be six. In addition, CN1 must be 123456, and CN2 through CN6 must be blank.   
4.For thelinear method, the dependent degrees-of-freedom willbe made members ofthe m-set. For the Lagrange method, they may or may not be member of the m-set, depending on the method selected on the RIGID Case Control command. However, the rules regarding to m-set described below apply to both types of methods.   
5. Dependent degrees-of-freedom assigned by one rigid element may not also be assigned dependent by another rigid element or by a multipoint constraint.   
6. A degree-of-freedom cannot be both independent and dependent for the same element. However, both independent and dependent components can exist at the same grid point.   
7. Element identification numbers should be unique with respect to all other element identification numbers.   
8. RBEl, among other eligible rigid element types, can be selected via MPC and SET3.   
9.Forces of multipoint constraint may be recovered in allsolution sequences, except SOL 129,with the MPCFORCE Case Control command.   
10. Rigid elements are ignored in heat transfer problems. If used in a multi-physics coupled problem using SUBSTEP, they participate in the mechanical substep but are ignored in the heat transfer substep through automatic deactivation. For more information on deactivation, see the DEACTEL keyword under the NLMOPTS Bulk Data entry and the associated Remark 9 for that entry.   
11.See Rigid Elements and Multipoint Constraints (R-type,MPC)(p.155)in the MSC Nastran Reference Guide for a discussion of rigid elements.   
12. The m-set coordinates specified on this entry may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.   
13.For the Lagrange method,the thermal expansion effect willbe computed,if user supplies the thermal expansion coefficient ALPHA, and the thermalload is requested by the TEMPERATURE(INITIAL) and TEMPERATURE(LOAD) Case Control commands.The temperature of the element is taken as follows: the temperature of the bar connecting the grid point GN1 and any dependent grid point are taken as the average temperature of the two connected grid points. There is no current entry fora TREF, so if TEMP(INIT) is not specified in Case Control, a reference  

temperature of 0.O is used for the RBE1.  

Defines a rigid body with independent degrees-of-freedom that are specified at a single grid point and with dependent degrees-of-freedom that are specified at an arbitrary number of grid points.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RBE2</td><td>EID</td><td>GN</td><td>CM</td><td>GM1</td><td>GM2</td><td>GM3</td><td>GM4</td><td>GM5</td><td></td></tr><tr><td></td><td>GM6</td><td>GM7</td><td>GM8</td><td>-etc.-</td><td>ALPHA</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RBE2</td><td>9</td><td>8</td><td>12</td><td>10</td><td>12</td><td>14</td><td>15</td><td>16</td><td></td></tr><tr><td></td><td>20</td><td>6.5-6</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. (O < Integer < 100,000,000)</td></tr><tr><td>GN</td><td>Identification number of grid point to which all six independent degrees-of-freedom for the element are assigned. (Integer > 0)</td></tr><tr><td>CM</td><td>Component numbers of the dependent degrees-of-freedom in the global coordinate system at grid points GMi. (Integers 1 through 6 with no embedded blanks.) See Remark 12.</td></tr><tr><td>GMi</td><td>Grid point identification numbers at which dependent degrees-of-freedom are assigned. (Integer > 0)</td></tr><tr><td>ALPHA</td><td>Thermal expansion coeffcient. See Remark 11. (Real or blank)</td></tr></table></body></html>  

## Remarks:  

1. Two methods are available to process rigid elements: equation elimination or Lagrange multipliers. The Case Control command, RIGID, selects the method.   
2.For the Lagrange method, Nastran willcreate internally the Lagrange multiplier degrees-of-freedom in addition to the displacement degrees-of-freedom given by connected grid points.The number of Lagrange multiplier degrees-of-freedom is equal to the number of dependent degrees-of-freedom which is obtained by CM multiplied with the number of dependent grid points.   
3.For the linear method, the dependent degrees-of-freedom indicated by CM will be made members of the m-set at all grid points.For the Lagrange method, they may or may not be members of the m-set, depending on the method selected on the RIGID Case Control command. However, the rules regarding the m-set described below apply to both types of methods.   
4. Dependent degrees-of-freedom assigned by one rigid element may not also be assigned dependent by another rigid element or by a multipoint constraint.   
5. Element identification numbers should be unique with respect to all other element identification numbers.   
6. RBE2, among other eligible rigid element types, can be selected via MPC and SET3. 7.Forces of multipoint constraint may be recovered in all solution sequences, exceptSOL 129, with the MPCFORCE Case Control command.   
8.Rigid elements are ignored in heat transfer problems. If used in a multi-physics coupled problem using SUBSTEP, they participate in the mechanical substep but are ignored in the heat transfer substep through automatic deactivation. For more information on deactivation, seethe DEACTEL keyword under the NLMOPTS Bulk Data entry and the associated Remark 9 for that entry.   
9. See Rigid Elements and Multipoint Constraints (R-type,MPC)(p.155)in the MSC Nastran Reference Guide for a discussion of rigid elements.   
10. The m-set coordinates specified on this entry may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.   
11.For the Lagrange method, the thermal expansion effect willbe computed,if user supplies the thermal expansion coefficient ALPHA, and the thermalload is requested by the TEMPERATURE(INITIAL) and TEMPERATURE(LOAD) Case Control commands.The temperature of the element is taken as follows: the temperature of the bar connecting the grid point GN and any dependent grid point are taken as the average temperature of the two connected grid points. There is no current entry fora TREF,so if TEMP(INIT) is not specified in Case Control, a reference temperature of 0.O is used for the RBE2.   
12.It can be any combination in 1,2,3,but must have all"456" ifany rotation dof is used when there is large rotation.  

Defines an RBE2 connecting the two closest grids to GS  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RBE2GS</td><td>EID</td><td>GS</td><td>TYPE</td><td></td><td></td><td>R</td><td>CM</td><td>ALPHA</td><td></td></tr><tr><td></td><td>XS</td><td>YS</td><td>ZS</td><td>GNi</td><td>GMj</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RBE2GS 3</td><td>17</td><td></td><td></td><td></td><td>1.3</td><td></td><td>6.5-6</td><td></td></tr><tr><td></td><td></td><td></td><td>endl</td><td>56</td><td>99</td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Formats and Examples:  

<html><body><table><tr><td>RBE2GS</td><td>EID</td><td>GS</td><td>TYPE</td><td></td><td></td><td>R</td><td>CM</td><td>ALPHA</td><td></td></tr><tr><td></td><td>XS</td><td>YS</td><td>ZS</td><td>GNi</td><td>THRU</td><td>GNj</td><td>endl</td><td></td><td></td></tr><tr><td></td><td>GMk</td><td>THRU</td><td>GMl</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>RBE2GS</td><td>15 35</td><td></td><td></td><td>-.66</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td>88</td><td>THRU 107</td><td>endl</td><td>15</td><td></td></tr><tr><td></td><td>76</td><td>88</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>RBE2GS</td><td>25</td><td></td><td></td><td></td><td></td><td>.66</td><td></td><td></td></tr><tr><td></td><td>5.173</td><td>0.0</td><td>19.3185</td><td>88</td><td>99</td><td>108</td><td>endl</td><td></td></tr><tr><td></td><td>15</td><td>THRU</td><td>88</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>RBE2GS</td><td>35</td><td>28</td><td></td><td>56</td><td>THRU</td><td>-.66 102</td><td>endl 19</td><td></td></tr><tr><td></td><td>21</td><td>THRU</td><td>200</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>RBE2GS</td><td>45</td><td>16</td><td></td><td></td><td></td><td>-.66</td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td>56</td><td>THRU</td><td>102 1129</td><td></td><td></td></tr><tr><td></td><td>1146</td><td>THRU</td><td>1200</td><td>endl</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. (O < Integer < 100,000,000)</td></tr><tr><td>GS</td><td>Search POINT or GRID point. (Integer > O or blank)</td></tr><tr><td>TYPE</td><td>Connectivity: (Character)</td></tr><tr><td></td><td>blank Search the complete model. (Default)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td rowspan="3"></td><td>NMFLIP</td><td>The independent and dependent DOF's are interchanged.</td></tr><tr><td>IIRBE2</td><td>The grids chosen will be the independent GN's of the two closest existing RBE2 elements.</td></tr><tr><td>NMIRBE2</td><td>Same as‘IIRBE2' except the independent and dependent grids are interchanged.</td></tr><tr><td>R</td><td colspan="2">Radius. (Real > 0, or< 0)</td></tr><tr><td>CM</td><td colspan="2">Component number of dependent degrees-of-freedom for grid GM. (Integers 1 through 6 with no embedded blanks. Blank defaults to 123456)</td></tr><tr><td>ALPHA</td><td colspan="2">Thermal expansion coefficient. (Real or blank)</td></tr><tr><td>XS,YS, ZS</td><td colspan="2"> Location of search point if GS is blank. Used only if GS=0 or blank. (Real or blank)</td></tr><tr><td>GNi</td><td colspan="2">List of grids to be excluded from candidate grids for GN. If a GNi list is given it must end with an endl. (Integer > O or blank or “THRU")</td></tr><tr><td>GMj</td><td colspan="2">List of grids to be excluded from candidate grids for GM. If no GNi list is given and a GMj list is present, then GNi must have an endl entry. (Integer > O or blank or “THRU")</td></tr></table></body></html>  

1. Element ID numbers must be unique with respect to all other element ID numbers.   
. This entry will internally define a RBE2 element with the same ID of the RBE2GS entry. The grid assigned to GN will always be the independent grid. GM will be the dependent grid. If GS is a POINT' entry (or GS is blank and XYZ is specified), the first two grids that fallwithin the search radius $|R|$ about GS (or XYZ) willbe chosen as GN and GM. The closest to the search location will be the independent grid GN the next closest willbe the dependent grid GM. Any grids contained in a GNi list will be excluded from the GN search and any grids contained in a GMj list will be excluded from the GM search.After GN and GM have been determined (with or without use of the exclusion lists for GNi and GMj (and if $\mathrm{TYPE}=\mathrm{^{\circ}N M F L I P}^{\mathrm{,}}$ , then GN and GM will be reversed. If GS is‘GRID' entry, and is part of the physical model, i.e., it has physical structural elements attached to it, it will become GN the independent grid for the RBE2 to be generated. If it is in the GNi exclusion list, the next closest grid will be chosen. the closest grid within the search radius about $|R|$ GN will be chosen as GM, the dependent grid. Any grids contained in a GNi list will be excluded from the GN search and any grids contained in a GMj list will be excluded from the GM search.After GN and GM have been determined (with our without use of the exclusion lists for GNi and GMj) and if $\mathrm{TYPE}=\mathrm{^{\circ}N M F L I P}^{\mathrm{,}}$ , then GN and GM will be reversed. If GS is a‘GRID' entry, and is determined not to be part of the physical model,the first two grids that fall within the search radius $|R|$ about GS (or XYZ) will be chosen as GN and GM. The closest to the search location willbe the independent grid, GN, the next closest will be the dependent grid, GM. Any grids contained in a GNi list willbe excluded from the GN search and any grids contained in a GMj list will be excluded from the GM search. After GN and GM have been determined (with or without use of the exclusion lists for GNi and GMj) and if TYPE $\bullet^{\bullet}$ NMFLIP', then GN and GM will be reversed. The GS grid will remain on the GEOMl table for post-processing viewing purposes, but will not be part of the Nastran solution g-set. If TYPE $\v{M}_{\v{r}}=$ IRBE2', the two grids chosen for the  

RBE2 will be the independent GN's of existing RBE2 elements whose independent grids lie within the search radius. If TYPE $\bullet^{\bullet}$ NMIIRB2', then GN and GM will be reversed. If no existing RBE2 elements have independent grids within the search radius or if only one existing RBE2 has an independent grid within the search radius, then a fatal message will be issued. POINT and GRID entries must be unique with respect to all other POINT and GRID entries. If TYPE $\therefore$ IIKB，It 1S recommended that PARAM,AUTOMSET,YES be used in the analysis run.  

3. If $R<0$ , the two located grids GN and GM willbe made coincident to the GS (or XYZ) location.   
4.If CM is 123456 and GM is touching only solid elements, CM will be internally changed to 123.For solid elements, the grids GN and GM should always be coincident.   
5. When Module GP4 is run,checks are made to insure that the selected grids, GN and GM, do not violate existing constraint sets.If a violation occurs a fatal message will be issued for the offending grids. These grids can be excluded from further search inclusion by specifying them on the GNi or GMj list. PARAM,AUTOMSET,YES will often prevent any violation.   
6.If $\mathrm{GS}{=}0$ or blank and XS, YX, ZS is not specified or if both GS and XS, YS, ZS are specified a fatal error will occur.   
7.The end of agrid exclusion lists is indicated by the existenceof"endl“in thefield following the last entry in the list. In the“thru" option, not all grids in the range need exist.   
8.For superelement or part superelement connection the independent grid assigned to GN will be exterior to the superelement. The dependent grid GM willbe an interior grid to the superelement. If the resulting RBE2 element, connects two different superelements, the element will be assigned to the superelement with thelower ID and the grid attached to the superelement with the higher ID will be moved to the superelement with the lower ID.   
9.If the RBE2GS is listed on a SEELT entry, it willbe placed as the SEELT directs. If say grid G1 lies in another superelement and G2 lies in the SEELT superelement, G1 willbe moved to the SEELT defined superelement.   
10.“THRU"should not be the first nonblank field ofa continuation line.Blank fields are allowed in the exclusion lists for readability.   
11. Use PARAM,SEP1XOVR,16 to print the grids found by each RBE2GS entry.   
12. RBE2GS is not supported in the presence of part (BEGIN SUPER) superelements. For the Lagrange method, the thermal expansion effect willbe computed for the rigid bar element if user supplies the thermal expansion coeffcient ALPHA, and the thermal load is requested by the TEMPERATURE(INITIAL) and TEMPERATURE(LOAD) Case Control commands. The temperature of the element is taken as folows: the temperature of the bar connecting the grid point GN1 and any dependent grid point are taken as the average temperature of the two connected grid points. There is no current entry fora TREF, so ifTEMP(INIT) is not specified in Case Control, a reference  

temperature of 0.0 is used for the RBE2GS.  

Defines the motion at a reference grid point as the weighted average of the motions at a set of other grid points.  

# Format:  

Example:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RBE3</td><td>EID</td><td></td><td>REFGRID</td><td>REFC</td><td>WT1</td><td>C1</td><td>G1,1</td><td>G1,2</td><td></td></tr><tr><td></td><td>G1,3</td><td>WT2</td><td>C2</td><td>G2,1</td><td>G2,2</td><td>-etc.-</td><td>WT3</td><td>C3</td><td></td></tr><tr><td></td><td>G3,1</td><td>G3,2</td><td>-etc.-</td><td>WT4</td><td>C4</td><td>G4,1</td><td>G4,2</td><td>-etc.-</td><td></td></tr><tr><td></td><td>“UM”</td><td>GM1</td><td>CM1</td><td>GM2</td><td>CM2</td><td>GM3</td><td>CM3</td><td></td><td></td></tr><tr><td></td><td></td><td>GM4</td><td>CM4</td><td>GM5</td><td>CM5</td><td>-etc.-</td><td></td><td></td><td></td></tr><tr><td></td><td>“ALPHA”</td><td>ALPHA</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>RBE3</td><td>14</td><td>100</td><td>1234</td><td>1.0 123</td><td>1</td><td>3</td><td></td></tr><tr><td></td><td>5 4.7</td><td>1</td><td>2</td><td>4 6</td><td>5.2</td><td>2</td><td></td></tr><tr><td></td><td>7 8</td><td>9</td><td>5.1</td><td>1 15</td><td>16</td><td></td><td></td></tr><tr><td></td><td>UM 100</td><td>14</td><td>５</td><td>3 7</td><td>2</td><td></td><td></td></tr><tr><td></td><td>ALPHA 6.5-6</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. Unique with respect to all elements. (0 < Integer < 100,000,000)</td></tr><tr><td>REFGRID</td><td>Reference grid point identification number. (Integer > 0)</td></tr><tr><td>REFC</td><td>Component numbers at the reference grid point. (Any ofthe integers 1 through 6 with no embedded blanks.)</td></tr><tr><td>WTi</td><td>Weighting factor for components of motion on the following entry at grid points Gi,j. (Real)</td></tr><tr><td>Ci</td><td>Component numbers with weighting factor WTi at grid points Gi,j. (Any of the integers 1 through 6 with no embedded blanks.)</td></tr><tr><td>Gi,j </td><td>Grid points with components Ci that have weighting factor WTi in the averaging equations. (Integer > 0)</td></tr><tr><td>“UM”</td><td>Indicates the start of the degrees-of-freedom belonging to the dependent degrees-of- freedom. The default action is to assign only the components in REFC to the dependent degrees-of-freedom. (Character)</td></tr><tr><td>GMi</td><td>Identification numbers of grid points with degrees-of-freedom in the m-set. (Integer > 0)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>CMi</td><td>Component numbers of GMi to be assigned to the m-set. (Any of the Integers 1 through 6 with no embedded blanks.)</td></tr><tr><td>“ALPHA”</td><td>Indicates that the next number is the coefficient of thermal expansion. (Character)</td></tr><tr><td>ALPHA</td><td>Thermal expansion coefficient. See Remark 14. (Real or blank)</td></tr></table></body></html>  

## Remarks:  

1. Two methods are available to process rigid elements: equation elimination or Lagrange multipliers. The Case Control command, RIGID, selects the method.   
2. For the Lagrange method, the REFC must be $^{\mathfrak{s}}123^{\mathfrak{s}}$ 。 $^{\mathfrak{a}}456^{\mathfrak{p}}$ ，or“123456". No other combination is allowed.   
3.For the Lagrange method, Nastran willcreate internally the Lagrange multiplier degrees-of-freedom in addition to the displacement degrees-of-freedom given by connected grid points. The number of Lagrange multiplier degrees-of-freedom is equal to the number of degrees-of-freedom given by REFC.   
4.For the linear method, the dependent degrees-of-freedom indicated by REFC willbe made members of the m-set.For Lagrange rigid element, they may or may not be members of the m-set, depending on the method selected on the RIGID Case Control command. However,the rules regarding the mset described below apply to both types of methods.   
5.We recommend that for most applications only the translation components 123 be used for Ci. An exception is the case where the Gi,j are colinear. A rotation component may then be added to one grid point to stabilize its associated rigid body mode for the element.   
6. Blank spaces may be left at the end ofa Gi,j sequence.   
7.For the Lagrange method, the default for“UM" must be used. For thelinear method, the default for “UM"should be used except in cases where the user wishes to include some or all REFC components in displacement sets exclusive from the m-set. If the default is not used for“UM": The total number of components in the m-set (i.e., the total number of dependent degrees-offreedom defined by the element) must be equal to the number of components in REFC (four components in the example). The components specified after “UM" must be a subset of the components specified under REFC and (Gi,j, Ci). The m-rows by m-columns partition $[\mathrm{Rm},\mathrm{m}]$ of the global stiffness containing the dependent degrees-of-freedom of multipoint constraints and rigid elements must be nonsingular. PARAM,CHECKOUT in SOLs 101 through 200 may be used to check for this condition. For some complex constraints, forming a well-conditioned $[\mathrm{Rm},\mathrm{m}]$ is difficult for a user to perform manually and PARAM,AUTOMSET,YES will automatically determine a well-conditioned partition by employing a rectangular decomposition of the $[\mathrm{Rm},\mathrm{g}]$ matrix. Dependent degrees-of-freedom assigned by one rigid element may not also be assigned dependent by another rigid element or by a multipoint constraint. RBE3, among other eligible rigid element types, can be selected via MPC and SET3.   
10.Forces of multipoint constraint may be recovered in all solution sequences, except SOL 129, with the MPCFORCE Case Control command.   
11. Rigid elements are ignored in heat transfer problems. If used in a multi-physics coupled problem using SUBSTEP, they participate in the mechanical substep but are ignored in the heat transfer subsstep through automatic deactivation. For more information on deactivation, seethe DEACTEL keyword under the NLMOPTS Bulk Data entry and the associated Remark 9 for that entry.   
12. The m-set coordinates specified on this entry may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.   
13. The formulation for the RBE3 element was changed in Version 70.7. This change allowed the element to give consistent answers that are not dependent upon the units of the model. Only models that connected rotation degrees-of-freedom for Ci were affected. Note that these models are ignoring the recommendation in Remark 5.The formulation prior to Version 70.7 may be obtained by setting $\mathrm{SYSTEM}(310){=}1$ ，   
14.For the Lagrange method, the thermal expansion effect willbe computed, if usersupplies the thermal expansion coefficient ALPHA, and the thermalload is requested by the TEMPERATURE(INITIAL) and TEMPERATURE(LOAD) Case Control commands. The temperature of the element is taken as follows: the temperature of the bar connecting the reference grid point REFGRID and any other grid point Gij are taken as the average temperature of the two connected grid points. There is no current entry fora TREF,so if TEMP(INIT) is not specified in Case Control, a referenc temperature of 0.0 is used for the RBE3.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RBE3U</td><td>EID</td><td>IOPT</td><td>GREF</td><td>G1</td><td>G2</td><td>G3</td><td>G4</td><td>G5</td><td></td></tr><tr><td></td><td>G6</td><td>G7</td><td>G8</td><td>G9</td><td>etc.</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RBE3U</td><td>EID</td><td>IOPT</td><td>GREF</td><td>G1</td><td>THRU</td><td>G3</td><td>BY</td><td>G4</td><td></td></tr><tr><td></td><td>G5</td><td>THRU</td><td>G6</td><td>BY</td><td>G7</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>G8</td><td>THRU</td><td>G9</td><td>BY</td><td>G10</td><td>etc.</td><td></td><td></td><td></td></tr></table></body></html>  

## Examples:  

<html><body><table><tr><td>RBE3U</td><td>250</td><td>１</td><td>1000</td><td>100</td><td>THRU</td><td>120</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Identification number, unique among all elements. (Integer; no Default; Required)</td></tr><tr><td rowspan="3">IOPT</td><td>Option of how to distribute the load. (Integer; Default = 1)</td></tr><tr><td>1 Equal loads values will be applied to all grid points on the surface.</td></tr><tr><td>2 Loads will be distributed according to how close each grid point on the surface is to GREF.</td></tr><tr><td>Gi</td><td>List of grids to which forces at GREF will be distributed. (Integer; Default = 123)</td></tr></table></body></html>  

## Remarks:  

1. The sum of the loads on all grid points is the same as the applied to GREF in each of the CREF directions. If IOPT $\mathbf{\bar{\rho}}_{=1}$ the force on each grid point will be the total loads divided by the number of applicable grid points. If IOPT $^{\cdot}_{=2}$ the load ofeach grid point will be weighted according to its distance from GREF, however the sum of all loads will be the same as that applied to GREF. The load is removed from GREF after distribution.   
2.RBE3U is only used to distributed applied loads. No actual rigid elements are included in the analysis. If rigid elements are desired, use RBE2 or RBE3.   
3. Only FORCE and MOMENT willbe distributed using this entry. All other types of forces such as FORCE1, MOMENT1, TEMP,etc. applied to GREF will not be distributed.  

# Defines a Joint Between Two Rigid Bodies  

Defines a joint between two rigid bodies. Used in SOL 700 only.  

## Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RBJOINT</td><td>ID</td><td>TYPE</td><td>N1</td><td>N2</td><td>N3</td><td>N4</td><td>N5</td><td>N6</td><td></td></tr><tr><td></td><td></td><td>RPS</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Examples:  

### Example 1 - Cylindrical Joint  

<html><body><table><tr><td>RBJOINT</td><td>1</td><td>CYLIND</td><td>101</td><td>201</td><td>103</td><td>204</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID TYPE</td><td>RBJOIN identification number. (Integer > 0; Required)</td></tr><tr><td rowspan="4"></td><td>Type of RBJOIN. (Character; Required) Types available are (node numbers in the images correspond to N1, N2, etc.):</td></tr><tr><td>TYPE=SPHER(spherical), The relative motion of the rigid bodies are constrained so that nodes which are initially coincident remain coincident. In the below figure the</td></tr><tr><td>socket's node is not interior to the socket-SOL700 does not require that a rigid body's nodes be interior to the body.</td></tr><tr><td></td></tr><tr><td></td><td>1,2</td></tr></table></body></html>  

Spherical joint  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr></table></body></html>  

TYPE $\v{x}_{1}=$ REVOLUTE, Both nodal pairs (1,2) and (3,4) are constrained to remain coincident. Consequently, the relative motion of these rigid bodies is restricted to rotations about the line segment formed by the two pairs of coincident nodes. This segment is labeled the "centerline".  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/548bdf59b4ad6f7e52296ae692394276bae6629042b3b79d8b4117e09c989963.jpg)  

Revolute joint  

TYPE $\v{x}_{1}=$ CYLIND (cylindrical), This joint is derived from the rotational joint by relaxing the constraints along the centerline. This joint admits relative rotation and translation along the centerline.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/c1f682ef4a9d8341521151741055116adf7fd1c8a45a82a03123b1d4c9dc57d8.jpg)  

Cylindrical joint  

TYPE $\v{x}_{1}=$ PLANAR, This joint is derived from the rotational joint by relaxing the constraints normal to the centerline. Relatively displacements along the direction of the centerline are excluded.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/4307a0d97794104574528f229aaa98cad3620004169026bd457ef32f069f5499.jpg)  

Planar joint  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td></td><td>TYPE=UNIVERS (universal joint), In contrast with the preceding joints, nodal pairs (1,2) and (3,4) are not initially coincident. Rather, the segments formed by (1,3) and (2,4) must be orthogonal; and they serve as axes about which the two bodies may undergo relative rotation. The universal joint excludes all other relative motion and the</td></tr></table></body></html>  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/25502223b35b67afa11e90e9e4671a468db684aba8874970c53fed857356350c.jpg)  

Universal joint  

TYPE $\v=$ TRANSL (translational), This is a cylindrical joint with a third pair of offcenterline nodes which restrict rotation. Aside from translation along the centerline the two rigid bodies are stuck together.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/fd16c11373d72fc93a1b0b883be675126fc6b48669534d156eb7eedfd122504b.jpg)  

Translational joint  

N1 GRID id of Node 1, in rigid body A. Define for all joint types N2 GRID id of Node 2, in rigid body B. Define for alljoint types N3 GRID id of Node 3, in rigid body A. Define for all joint types except SPHER. N4 GRID id of Node 4, in rigid body B. Define for alljoint types except SPHER. N5 GRID id of Node 5, in rigid body A. Define only for joint types TRANSL. N6 GRID id of Node 6, in rigid body B. Define only for joint types TRANSL. RPS Relative penalty stiffness (Default $=1.0\dot{}$ ）  

Definesa rigid connection between the different parts of Lagrangian meshes (tied surfaces). Used in SOL 700 only.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RCONN</td><td>CID</td><td>STYPE</td><td>MTYPE</td><td>SID</td><td>MID</td><td>OPTION</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>CLSGAP</td><td>GAPDIS</td><td>GAPDISV</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RCONN</td><td>7</td><td>GRID</td><td>SURF</td><td>3</td><td>7</td><td>NORMAL</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Field</td><td>Content</td></tr><tr><td>CID</td><td>Unique rigid-connection number (Integer; Required)</td></tr><tr><td rowspan="2">STYPE</td><td>Type of entity used to define the slave surface (Character; Default = SURF)</td></tr><tr><td>SURF The faces of the elements are used for the slave surface. SID refers to BSURF ID. See Remark 1.</td></tr><tr><td>GRID</td><td>Grid points will be tied to the master surface. SID then refers to a SET or BCGRID ID containing the list of grid points to be used. See Remarks 2. and 3.</td></tr><tr><td rowspan="2">MTYPE</td><td>Type of entity used to define the master surface (Character; Default = SURF)</td></tr><tr><td>SURF The faces of the elements are used for the master surface. MID</td></tr><tr><td>SID</td><td>refers to BSURF ID. Slave BSURF ID or SET1 ID containing the list of grid points (Integer; Required)</td></tr><tr><td>MID</td><td>Master BSURF ID (Integer; Required)</td></tr><tr><td>OPTION</td><td>Only used if discrete grid points are tied to a surface (STYPE is equal to GRID). (Character; Default = NORMAL)</td></tr><tr><td rowspan="4">CLSGAP</td><td>NORMAL The grid points are tied to the master surface. See Remark 2.</td></tr><tr><td>SHELL The grid points are attached to the edge of shell or beam elements</td></tr><tr><td>which are tied to the shell surface. See Remark 3. Switch to automatically close any gaps that are present between the master-slave</td></tr><tr><td>surface (Character; Default = NO)</td></tr><tr><td>YES</td><td>Gaps are automatically closed</td></tr><tr><td>NO</td><td>Gaps are not closed. See Remark 2.</td></tr></table></body></html>  

<html><body><table><tr><td>Field</td><td>Content </td></tr><tr><td>GAPDIS</td><td>Defines the tolerance used in the search for a master face. If the distance between a slave point and a master face fals within this tolerance, the master face is accepted. If not, the search for a correct master face continues (Character; Default = DISTANCE)</td></tr><tr><td></td><td>DISTANCE The tolerance has the length as specified at GAPDISV</td></tr><tr><td>GAPDISV</td><td>The value of the gap tolerance or a factor to calculate this tolerance depending on the value of GAPDIS (Real; Default = 1.0E20)</td></tr></table></body></html>  

## Remarks  

1. The RCONN entry can be used to define three types of connection:  

a. Two Surfaces Tied Together. b. Define slave and master segments representing thetwo surfaces to be tied together. There should not be a gap between the two sets of segments. The two surfaces are tied together during the analysis. c. Grid Points Tied to a Surface. d. If STYPE is set to GRID and OPTION is set to NORMAL,the slave entities comprise discrete grid points that are tied to the master surface during the analysis. The grid points must lie on the surface. e. Shell Edge Tied to a Shell Surface. f.If STYPE is set to GRID and OPTION is set to SHELL, the edges of shellor beams elements can be tied to the faces of other shells. The grid points atached to the edge of the shells/beams must be selected as the slave grid points.The shell surface to which they are tied must be selected as the master surface. The two sets will then be tied together throughout the analysis. Alldegrees of freedom will be coupled.   
2. The CLSGAP entry enables you to define two different meshes that are not coincident over the master/slave interface.If the option is set to YES, the slave surface becomes coincident (according to projections) with the master surface. The search method of the contact algorithm is used to find the closest master face. The tolerance defined with the GAPDIS/GAPDISV fields is similar to the monitoring distance defined on the CONTACT entry with the MONDIS/ MONDISV fields. . The use of the gap closing CLSGAP can cause an element to collapse.This may happen if the GAPDISV tolerance is set to a value greater than the length of the side of an element. .When a solid and a shell mesh are tied together,the rotational degrees of freedom of the shell grid points are not coupled.   
6. When OPTION $\mathbf{\bar{\Psi}}=\mathbf{\Psi}$ SHELL and CLSGAP $\mathbf{\bar{\rho}}=\mathbf{\rho}$ NO, the time step scale factor will be set to 0.4. This can be overwritten by: PARAM\*, STEPFCTRCONN, xxx  

Defines a set of parameters for nonlinear resistance-capacitance based analysis.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RCPARM</td><td>ID</td><td>SOLVER</td><td>DRLXCA</td><td>ARLXCA</td><td>BALENG</td><td>NLOOP</td><td>DAMPD</td><td>GRVCON</td><td></td></tr><tr><td></td><td>TIMEND</td><td>OUTPUT</td><td>CSGFAC</td><td>DTIMEI</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RCPARM</td><td>1</td><td>SNDUFR</td><td>1.0-2</td><td>1.0-2</td><td>1.0-4</td><td>2000</td><td>0.7</td><td>9.81</td><td></td></tr><tr><td></td><td>1800.</td><td>60.</td><td>1.2</td><td>0.0</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td>ID Solver</td><td colspan="2">Identification number. See Remark 2. (Integer > O; Required)</td></tr><tr><td rowspan="6"></td><td colspan="2">Equivalent Sinda Solution name. See Remarks 3. and 7. (String; Required) Possible values:</td></tr><tr><td colspan="2">RCNS “SNSOR",“STDSTL"</td></tr><tr><td colspan="2">RCNT</td></tr><tr><td colspan="2">“SNFRDL”,“FWDBKL”,“SNADE”,“SNDUFR”,“ATSDUF”, “ATSFBK",“SNTSM",“SNTSM3",“SNTSM1",“SNTSM4",</td></tr><tr><td colspan="2">“SNSOR1",“SNSORA",“SNSOR1A",“SNHOSD",“SNSOSS'</td></tr><tr><td colspan="2" rowspan="2">Maintained for legacy, but not shown in GUI</td></tr><tr><td colspan="2">“SNHOSS",“SCROUT",“SNDSNR",“TRSPMA”</td></tr><tr><td colspan="2">DRLXCA Diffusion node convergence criterion (Real ≥ 0.0; Default 1.Oe-3 degrees) (SimX:</td></tr><tr><td colspan="2">Default 1.0e-4 for transient) ARLXCA Arithmetic node convergence criterion (Real ≥ 0.0; Default 1.0e-3 degrees) (SimX:</td></tr><tr><td>BALENG</td><td colspan="2">Default 1.0e-4 for transient) Allowable system energy imbalance (Real ≥ 0.0; Default 0.0 energy/time)</td></tr><tr><td>NLOOP</td><td colspan="2">Number of iterations allowable (Integer ≥ 0; Default 5000 loop) (SimX: Default 50 fo transient)</td></tr><tr><td>DAMPD</td><td colspan="2"> Damping constant (Real ≥ 0.0; Default 0.0 non dimensional)</td></tr><tr><td>GRVCON</td><td colspan="2">Gravitation constant (Real ≥ 0.0; Default 9.81 length/time^2)</td></tr><tr><td>TIMEND</td><td colspan="2">Problem end time (Real; Default 3600.0 time)</td></tr><tr><td>OUTPUT</td><td colspan="2">Output interval (Real ≥ 0.0; Default 60.0 time)</td></tr><tr><td>CSGFAC</td><td colspan="2">Time step control factor (Real ≥ 0.0; Default 1.0 non dimensional)</td></tr><tr><td>DTIMEI</td><td colspan="2">Time step (Real ≥ 0.0; Default 0.0 time)</td></tr></table></body></html>  

## Remarks:  

1. This entry is for RC Network solver only.   
2.ID can be referenced by the case control command.Different cases may reference different RCPARM entries. It is possible to have multiple RCPARM entries inside one BDF file.   
3. RCNS stands for RC Network Steady-state (static), RCNT stands for RC Network Transient   
4.The default values are for Nastran only.The modeler (Patran or SimXpert) willhave their default values. Some are related with the model units. The default values will not be all 0.0.   
5. Default solvers and result checking SNSOR and SNDUFR are the default steady and transient solvers.Theyare goodfor most ofthecases. Users are encouraged tocheck the results by the following methods. Obtain nearly identical results with a different solver Obtain nearly identical results with tighter convergence Obtain nearly identical results with a smaller time step (transient) Obtain nearly identical results with more rays or different random seeds (external radiation solvers)  

6. About non-default solvers:  

For non-spacecraft, non-radiation problems: Solid type model - SNSOR, SNTSM1   
For spacecraft/radiation models: SNSOR (with user-specified DAMPD if necessary) FWDBKL if thermo-stats are present ATSDUF, SNTSM1 for most other cases  

7. About the time step  

a. The default computed time step (DTIMEU) $\mathbf{\Sigma}=\mathbf{\Sigma}$ CSGMIN\* CSGFAC. CSGMIN can be checked in the .sot file. If CSGFAC is not specified, it is internaly set to 1.0. The DTIMEU in the .sot file has been truncated by the OUTPUT point.   
b.In a normal sized model, CSGMIN usually is small enough for the time step which will assure a convergent transient run.   
c. CSGFAC is used to adjust the time step. It is recommended to determine the best CSGFAC to the model while maintaining acceptable temperature errors.   
d. If OUTPUT $<$ CSGFAC\*CSGMIN or OUTPUT $<$ DTIMEI, then OUTPUT becomes the time step. All the OUTPUT points are automatically required to be calculated.   
e. DTIMEI is the forced time step which will ignore any other factors. Sometimes it may lead to inaccurate answer if it is too large. DTIMEI does not afect the automatic time step solvers.   
f.If the model size is very small, CSGMIN may be too big for the time step. A small CSGFAC or DTIMEI should be used to adjust the time step.   
g. CSGFAC\*CSGMIN or DTIMEI should be small enough to“catch" any details in time fields, temperature fields or orbital flux arrays.  

8. For more details about these parameters, please reference MSC SINDA User's Guide and Library Reference.  

Defines a pair of response quantities for computing the cross-power spectral density and cross-correlation functions in random analysis.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RCROSS</td><td>SID</td><td>RTYPE1</td><td>ID1</td><td>COMP1</td><td>RTYPE2</td><td>ID2</td><td>COMP2</td><td>CURID</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RCROSS</td><td>10</td><td>DISP</td><td>100</td><td>3</td><td>STRESS</td><td>200</td><td>10</td><td>2</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Case Control RCROSS identification number for cross-power spectral density function and cross-correlation function. (Integer > 0)</td></tr><tr><td>RTYPEi</td><td>Type of response quantity. At lease one field must be selected. See Remark 2. (Character or blank)</td></tr><tr><td>IDi</td><td>Element, grid or scalar point identification number. (Integer > 0)</td></tr><tr><td>COMPi</td><td>Component code (item) identification number. See Remark 3. (Integer > 0)</td></tr><tr><td>CURID</td><td>Curve identification number. See Remark 4. (Integer ≥ 0 or blank)</td></tr></table></body></html>  

## Remarks:  

1. This entry is required for computing the cross-power spectral density function and cross-correlation function. SID must be selected with the Case Control command $(\mathrm{RCROSS}=\mathrm{SID})$ . Fields RTYPE1, ID1, and COMPl represent the first response quantity, and fields RTYPE2, ID2, and COMP2 the second in the correlation.  

2. The keywords for field RTYPEi are listed as follows:  

<html><body><table><tr><td>Keyword</td><td>Meaning</td></tr><tr><td>DISP</td><td>Displacement Vector</td></tr><tr><td>VELO</td><td>Velocity Vector</td></tr><tr><td>ACCEL</td><td>Acceleration Vector</td></tr><tr><td>OLOAD</td><td>Applied Load Vector</td></tr><tr><td>SPCF</td><td>Single-point Constraint Force Vector</td></tr></table></body></html>  

<html><body><table><tr><td>Keyword</td><td>Meaning</td></tr><tr><td>MPCF</td><td>Multi-point Constraint Force Vector</td></tr><tr><td>STRESS</td><td>Element Stress</td></tr><tr><td>STRAIN</td><td>Element Strain</td></tr><tr><td>FORCE</td><td>Element Force</td></tr></table></body></html>  

If anyone of RTYPEl or RTYPE2 is blank, then the default is the one same as the other field.  

3.For elements,the item code COMPi represents a component of the element stress, strain, and force and is described in Tables Element Stress-Strain Item Codes,1048 and ElementForce Item Codes Part1,1085. For an item having both a real and imaginary part, the code of the real part must be selected. This is required for computing both the cross-power spectral density function and cross-correlation function.  

For grid point, the item code is one of 1, 2, 3, 4, 5, and 6, which represent the mnemonics T1, T2.   
T3, R1, R2, and R3, respectively. For scalar point, always use 1.  

4.Field CURID is optional. It is for the user's convenience to identify the output by usinga single index  

Defines degres-of-freedom for superelement exterior grid points that are not connected to the superelement.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RELEASE</td><td>SEID</td><td>C</td><td>G1</td><td>G2</td><td>G3</td><td>G4</td><td>G5</td><td>G6</td><td></td></tr><tr><td></td><td>G7</td><td>G8</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RELEASE 15</td><td>456</td><td>3</td><td>7</td><td>11</td><td>2</td><td>156</td><td>9</td><td></td></tr><tr><td>152</td><td>162</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Formats and Examples:  

<html><body><table><tr><td>RELEASE</td><td>SEID</td><td>C</td><td>G1</td><td>“THRU”</td><td>G2</td><td></td><td></td><td></td><td></td></tr><tr><td>RELEASE</td><td>6</td><td>2</td><td>15</td><td>THRU</td><td>127</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

(ALL must be in FIELD 4 and no continuation is allowed)  

<html><body><table><tr><td>RELEASE</td><td>SEID</td><td>C</td><td>“ALL”</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>RELEASE</td><td>127</td><td>156</td><td>ALL</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. (Integer > 0)</td></tr><tr><td>C</td><td>Component number. (Any unique combination of the Integers 1 through 6 with no embedded blanks.)</td></tr><tr><td>Gi</td><td>Grid point identification numbers. (Integer > O; “THRU", or“ALL"; For THRU option, G1 < G2.)</td></tr></table></body></html>  

## Remarks:  

1. A grid point referenced on this entry must be an exterior grid point of the superelement referenced on the entry.   
2.In the first alternate format, all grid points in the sequence Gl through G2 are not required to be exterior grid points. Such grid points will collectively produce a warning message but will otherwise be ignored.   
3.If the“ALL"option is used, all exterior grid points are released for the referenced degrees-of-freedom   
4. The RELEASE entry is applicable to only the superelement solution sequences (SOLs 10l through 200). It may not reference the residual structure $\mathrm{\SEID}=0,$ ）   
5. This entry is not supported for partitioned superelements.  

Defines a rigid elipsoid whose properties and motion are defined by either ATB. Used in SOL700 only.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RELEX</td><td>NAME</td><td>PROG</td><td></td><td></td><td></td><td></td><td>etc</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RELEX</td><td>HEAD</td><td>ATB</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Field</td><td>Content</td></tr><tr><td rowspan="2">NAME</td><td>This name is used within the input file to define the interactions between the external ellipsoid and grid points and rigid bodies. This name is also used in the output requests.</td></tr><tr><td>When coupled to ATB, the name must correspond to the name of the ATB segment. (Character; required)</td></tr><tr><td rowspan="2">PROG</td><td>Name of the external program. (Character; required)</td></tr><tr><td>ATB SOL700 runs coupled with ATB</td></tr></table></body></html>  

Specifies writing or reading of restart data for Nonlinear Analysis when Marc is executed from SOL 600. If this Bulk Data entry is found in the job stream, the typeof"restartspecified by KIND and KTYPE will be performed. Only one RESTART entry is allowed.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RESTART</td><td>ID</td><td>KIND</td><td>NINC</td><td>NBEGIN</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>NAME</td><td></td><td>TSTEP</td><td>ENDTIME</td><td>NSTEPS</td><td>NDCYC</td><td>STEPMAX</td><td>PERCENT</td><td></td></tr></table></body></html>  

## Example(s):  

<html><body><table><tr><td>RESTART</td><td>101</td><td>1</td><td>1</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

The above example writes a restart file. The original run named is abcde.dat.  

<html><body><table><tr><td>RESTART</td><td>201</td><td>3</td><td>1</td><td>15</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>abcde</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

The above example restarts the original abcde.dat run.The name of the restart run must not be abcde.dat in this case.  

<html><body><table><tr><td>RESTART</td><td>151 my_first</td><td>2 _run</td><td></td><td>11</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

The above example reads the restart file and prints out results not printed in the original run.  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID KIND</td><td>Identification number of the restart entry -- Not presently used (Integer)</td></tr><tr><td>(2,1)</td><td>Type of restart (Integer > O; required field; no Default) 1 = Write a restart file 2 = Restart a previous analysis (Read an existing restart file) 3 = Restart a previous analysis and write new data on restart file.</td></tr><tr><td></td><td>11 = Only write restart file for the last converged increment of the run. 12 = Read a restart file written with KIND=11 13 = Read a restart file written with KIND=ll and write the last increment or time step of the present run on that file as well.</td></tr><tr><td>NBEGIN (2,3)</td><td>The “time" increment at which the restart run begins (used only if KIND=2 or 3). (Integer > 0. See Remarks 3.,4.)</td></tr><tr><td>NINC (2,2)</td><td>Number of increments between writing of restart data. (Integer > O; Default = 1)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>IPRINT (2,8)</td><td>Set this field to 1 if the restart data is to be printed (All data from increment INCBEG to LAST will be printed if IPRINT=1). Use this option if printing on a previous run was suppressed but now is desired. (Integer ≥ 0; Default = 0)</td></tr><tr><td>LAST (2,9)</td><td>The last time increment is printed if IPRINT=1,otherwise this field is ignored. (Integer > 0, Default = 0. See Remarks 3., 4.)</td></tr><tr><td>NAME</td><td>Name of input file for the original MSC Nastran run without extension. NAME is limited to 16 characters and may not contain imbedded blanks. If the small field format is used, NAME may span fields 2 and 3 of the continuation entry. If the large field is used, NAME should be coded in the 2nd field. NAME is required for a restart run, see Remarks 3., 7. If NAME exceeds 8 characters, the continuation line must be coded in small-field fixed format or in large field fixed or free-format.</td></tr><tr><td>TSTEP [2.1]</td><td>Time step size after restart -- For dynamic problems only. (Real ≥ 0.0 or blank; if the value is ≤ O.0 the original step size is used)</td></tr><tr><td>ENDTIME [2,2]</td><td>Ending time for this restart run (Real ≥ 0.0 or blank, if the value is ≤ 0.0 the original end time is used)</td></tr><tr><td>NSTEPS [2,3]</td><td>Total number of time steps for the restart run plus the original run.(Integer≥ 1; Default = 1)</td></tr><tr><td>NDCYC [2,6]</td><td>Desired number of recycles if AUTO INCREMENT options were specified on the original run. (Integer ≥ O; if the value is ≤ O the original is used)</td></tr><tr><td>STEPMAX [2,7]</td><td>Maximum step size if AUTO INCREMENT options were specified on the original run. (Real ≥ 0.0; if the value is ≤ O the original is used)</td></tr><tr><td>PERCENT [2,8]</td><td>Percentage of total load to be applied.(Real ≥ 0.0; if the value is ≤ O the original is used)</td></tr></table></body></html>  

## Remarks:  

1. RESTART is available only when Marc is executed from within MSC Nastran Implicit Nonlinear (SOL 600).   
2.There should only be one RESTART entry in the bulk data.If more than one exists,the first one will be used.   
3.(i,j) Indicate the field in Marc's RESTART model definition options.[i,j] Indicate the field in Marc's REAUTO model definition options.   
4.The jid.marc.tl6 and jid.marc.t08 files must be saved from the first run when arestart run is executed. Both original and restart runs must be located in the same directory. File extensions are .tO8 and t16.   
5.A restart run may not have the same input file name (jid) as that of the original run.In other words, if the input file for the original run is named abcd.dat, the input file for a restart run may not be named abcd.dat.   
6.For static analyses, normally each load case has a total time of 1.0.The first case goes from O.0 to 1.0, the second from 1.0 to 2.0,etc.Ifthe first run has two static load cases and terminates at 1.6, it is in the middle of the second load case. The original run should be examined to determine which increment (before 1.6) to begin the restart run.   
7.In the second example above, the original run was named my_first_run.dat (or first_run.bdf, etc). This is a smallfield example. There are 8 characters in the 2nd field ofthe continuation line and 4 characters in the third field.The name can start anywhere within the two fields. There must not be any blank spaces in the name.If the name exceeds 8 characters, the continuation line must be coded in small-field fixed format or in large-feld fixed or freeformat. NAME is limited to a maximum of   
16 characters.   
8. Both original and restart run names (jid's) should use only lower case letters except on computer systems that are not case sensitive.“NAME"(continue line,fields 2-3)willbe converted automatically to lower case.   
9. The restart run must use the same values of Marc's DIST LOAD parameter as the original run or it may fail. Be sure to use parameters MARCDIS2, MARCDIS3 and MARCDIS4 to set these values to be exactly the same as the original run (examine jid.marc.dat from the original run to determine these values before submitting the new run).   
10. The RSF options creates a complete database which is necessary for restarts. When ${\mathrm{RSF}}{=}0$ is specified, the same file is overwritten after each interval. When ${\mathrm{RSF}}{=}1$ is specified, a new restart file is created after each interval, thus a“family" of files is created numbered sequentially jid.dytr.d3dumpl0, jid.dytr.d3dump02, etc. These files can take significant disk space but are important if a model might need to be modified prior to the end time.   
11. It is not necessary to enter continuation lines if not needed for the particular job to be run.   
12. Restarts are not available for models with bolt loading using entries MBOLT, MBOLTUS or BOLT.  

Defines a static loading condition due to an angular velocity and/or acceleration.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RFORCE</td><td>SID</td><td>G</td><td>CID</td><td>A</td><td>R1</td><td>R2</td><td>R3</td><td>METHOD</td><td></td></tr><tr><td></td><td>RACC</td><td>MB</td><td>IDRF</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RFORCE</td><td>2</td><td>５</td><td></td><td>-6.4</td><td>0.0</td><td>0.0</td><td>1.0</td><td>2</td><td></td></tr><tr><td></td><td>1.0</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>SID</td><td>Load set identification number. (Integer > 0)</td></tr><tr><td>G</td><td>Grid point identification number through which the rotation vector acts. (Integer ≥ 0)</td></tr><tr><td>CID</td><td>Coordinate system defining the components of the rotation vector. See Remark 16. (Integer ≥ 0; Default = 0)</td></tr><tr><td>A</td><td> Scale factor of the angular velocity in revolutions per unit time. (Real)</td></tr><tr><td>R1,R2,R3</td><td>Rectangular components of rotation vector R . The vector defined will pass through point G. (Real; R1²+ R2² + R3² > 0.0 unless A and RACC are both zero)</td></tr><tr><td>METHOD</td><td>Method used to compute centrifugal forces due to angular velocity, see Remark 20.. For angular acceleration, see Remark 13. (Integer = 1 or 2; Default = 1)</td></tr><tr><td>RACC</td><td>Scale factor of the angular acceleration in revolutions per unit time squared. (Real; Default = 0.0)</td></tr><tr><td>MB</td><td>Indicates whether the CID coordinate system is defined in the main Bulk Data Section (MB = -1) or the partitioned superelement Bulk Data Section (MB = 0). Coordinate systems referenced in the main Bulk Data Section are considered stationary with respect to the assembly basic coordinate system. See Remark 15. (Integer; Default = 0)</td></tr><tr><td>only)</td><td>IDRF(SOL600 ID indicating to which portion of the structure this particular RFORCE entry applies. It is possible to have multiple RFORCE entries in the same subcase for SOL 600 to represent different portions of the structure with different rotational accelerations. IDRF corresponds to a SET3 entry specifying the elements with this acceleration. A BRKSQL entry may also be specified with a matching IDRF entry. (Integer; Default = 0)</td></tr></table></body></html>  

## Remarks:  

1.The forces that are created with the RFORCE entry act on the structure as follows: theforces that are defined with the RFORCE entry for a constant angular velocity (A), act in the positive radial direction.These forces represent the inertia forces on the structure due to a constant angular velocity. The forces that are defined with the RFORCE entry for a constant angular acceleration (RACC), act in the same direction as the angular acceleration. These forces would be opposite to the inertia forces on the structure due to a constant angular acceleration. In Figure 9-151, the force vector at grid point Gi is given by  

$$
\{\vec{F}\}_{i}=[m]_{i}[\vec{\upomega}\times\vec{(\upomega}\times\vec{(r_{i}-r_{a})})+\vec{\upalpha}\times\vec{(r_{i}-r_{a})}]
$$  

where:  

$$
\begin{array}{c c l}{{\mathrm{angular~velocity}}}&{{=}}&{{\stackrel{\rightarrow}{\infty}=2\pi A\cdot\stackrel{\rightarrow}{R}\mathrm{(radians/unit~time)}}}\\ {{\mathrm{angular~acceleration}}}&{{=}}&{{\stackrel{\rightarrow}{\mathrm{\alpha}}=2\pi R A C C\cdot\stackrel{\rightarrow}{R}\mathrm{(radians/unit~time)}}}\\ {{\left[m\right]_{i}}}&{{=}}&{{3\times3\mathrm{translational~mass~matrix~at~grid~point~C}}}\end{array}
$$  

Note: The equation for $\vec{\boldsymbol{F}}_{i}$ will have additional terms if the mass is offset or $I_{23}^{i},I_{13}^{i}$ terms exist relative to the rotation axes and METHOD ${\bf\Pi}=1{\bf\Pi}$ is selected.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/ac36f07784564b1959883a5453b674c8c229fe82c537ab62411962913a987106.jpg)  
Figure 9-151 RFORCE Vector at Grid Point Gi  

2. In the static solution sequences, SID must be selected by the LOAD Case Control command.  

In the dynamic solution sequences, if there is a LOADSET Case Control command, then SID must be referenced in the LID field of a selected LSEQ entry. If there is no LOADSET Case Control command, then SID must be referenced in the EXCITEID field of an RLOADi or TLOADi entry.  

3. $\mathrm{G}=0$ signifies that the rotation vector acts through the origin of the basic coordinate system.  

4. $\mathrm{CID}=0$ (Default) signifies that the rotation vector is defined in the basic coordinate system.  

5. The load vector generated by this entry can be printed with an OLOAD command in the Case Control Section.  

6.METHOD ${\bf\mu}=1{\bf\sigma}$ yields correct results only when there is no coupling in the mass matrix. This occurs when the lumped massoption is used with or without the ZOFFS option (see the CQUAD4 entry for a description of ZOFFS). METHOD $=2$ yields correct results for lumped or consistent mass matrix only if the ZOFFS option is not used. The acceleration terms due to the mass offset (X1, X2, X3) on the CONM2 entry are not computed with $\mathrm{METHOD}=2$ . All the possible combinations of mass matrices and offset and the correct method to be used are shown below.  

<html><body><table><tr><td></td><td>No Offset</td><td>Offset</td></tr><tr><td>Lumped</td><td>METHOD = 1 or METHOD = 2</td><td>METHOD = 1</td></tr><tr><td>Coupled</td><td>METHOD= 2</td><td>Neither</td></tr></table></body></html>  

7. In cyclic symmetry analyses,the T3 axis of the basic coordinate system must be coincident with the axis of symmetry. In the DIH type of cyclic symmetry, the T1 axis also must be paralel to side 1 of segment 1R of the model.  

8. For superelement analysis, G should reference a residual structure point that is exterior to all superelements when loading Superelement O and a separate G must be interior to each superelement when loading an upstream superelement else centrifugal loads will not be generated for that superelement. However, in cyclic analysis, User Fatal Message 4347 will be issued.  

9. In a geometric nonlinear static analysis (SOL 106 and 400 when PARAM LDGISP is set to $+1$ ), this type ofloading is a follower force type ofloading.However, the orientation of coordinate system CID is not updated.  

10. In nonlinear static solutions when there is more than one increment (INC) specified on the NLPARM entry for a given subcase, the load vector resulting from the RFORCE input (and not the angular velocity vector) is scaled linearly. This means that loading by increments in the angular velocity can only be achieved by having subcases where the RFORCE loading is applied in a single increment.  

11. The continuation entry is optional.  

12. Forces due to angular acceleration (RACC) are computed with METHOD $=2$ even if METHOD ${\bf\mu}=1{\bf\sigma}$ is specified.  

13.Loads derived from this entry do not include effects due to mass specified for scalar points.  

14.The followerforce effects due toloads from this entry are included in the stiffness in alllinear solution sequences that calculate a differential stiffness. The solution sequences are SOLs 103, 105,107 to 112, 115 and 116 (see also the parameter FOLLowK (Ch. 6)). In addition, follower force effects are included in the force balance in the nonlinear solution sequences, SOLs 106,129,153,159 and 400, if geometric nonlinear effects are turned on with PARAM,LGDISP,1.The folower force stiffness is included in the nonlinear static solution sequences (SOLs 106, 153 and 400) and general nonlinear solution sequence (SOL 400) for both ANALYSIS $\dot{}=\mathbf{\nabla}$ NLSTAT and NLTRAN but not in the nonlinear transient dynamic solution sequences (SOLs 129 and 159).   
15.The coordinate systems in the main Bulk Data Section are defined relative to the assembly basic coordinate system which is fixed. This feature is useful when a superelement defined by a partitioned Bulk Data Section is rotated or mirrored and the gravity load is more conveniently defined in terms of coordinates which are fixed.   
16.If CID is not a rectangular coordinate system, RFORCE willtreat it as if it were and unexpected answers may result.   
17. Follower force stiffness (param,followk,yes) is supported for method 2 only.   
18.Multiple RFORCE entries with diferent SID's may be used in SOL 600 in the same subcase or SOL 400 in the same loadcase (STEP and/or SUBCASE). They should be combined using the LOAD entry similar to the way FORCE or PLOAD4 with different ID's are combined.   
19. Fields CID, METHOD, RACC, MB and IDRF will be ignored for SOL 700.   
20. For Axisymmetric Harmonic elements, (elements selected with PAXSYMH entry),METHOD $^{\dag=2}$ is required. A selection of METHOD $\scriptstyle1=1$ will automatically be overridden and be replaced by METHOD $^{\dag}{}=2$ for all elements of the model.   
21.When used with rotor dynamics, the angular velocity creates axial terms that are proportional to ${\mathfrak{o}}^{2}$ and moments that are proportional to $\boldsymbol{\omega}$ . In order to keep consistent spin rate, if the scaling is requested on the LOAD entry, the on the axial terms will be scaled by this scale factor, and the o on the moment terms will be scaled by the square root of this scale factor.See Remark 6.of the LOAD entry.   
22. If Modules are present then this entry may only be specified in the main Bulk Data section.  

Specifies synchronous or asynchronous analysis,reference rotor, and rotation speed of the reference rotor.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>８</td><td>９ 10</td></tr><tr><td>RGYRO</td><td>RID</td><td>SYNCFLG</td><td>REFROTR</td><td>SPDUNIT</td><td>SPDLOW</td><td>SPDHIGH</td><td>SPEED</td><td>ROTRSEID</td></tr><tr><td></td><td>WR3WRL</td><td>WR4WRL</td><td>WRHWRL</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>RGYRO</td><td>100</td><td>SYNC</td><td>1</td><td>RPM</td><td>1000.0</td><td>5000.0</td><td></td><td>10</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>RID</td><td>Identification number of RGYRO entry. Selected by Case Control command, RGYRO. (Required; no Default). See Remarks 1. and 2.</td></tr><tr><td>SYNCLFG</td><td>Specifies whether the analysis is synchronous or asynchronous analysis. Required input for frequency response and complex modes analyses. Not required for static</td></tr><tr><td>REFROTR</td><td>analyses. (Character: ‘SYNC','ASYNC', or blank). See Remarks 2. through 4. Specifies the reference rotor ID for the analysis. (Integer > 0; Required; no Default)</td></tr><tr><td>SPDUNIT</td><td>Specifies whether the entries SPDLOW, SPDHIGH, and SPEED are given in terms of RPM (revolutions/minute) or frequency (revolutions (cycles)/unit time). (Character: RPM' or ‘FREQ'; no Default). See Remark 2.</td></tr><tr><td>SPDLOW</td><td>Specifies the low speed for synchronous analysis. See Remark 2. (Real; Default = 0.0)</td></tr><tr><td>SPDHIGH</td><td>Specifies the high speed for synchronous analysis. See Remark 2. (Real; Default = 99999.0)</td></tr><tr><td>SPEED</td><td>Specifies reference rotor speed for asynchronous analysis. Also required for static analyses. See Remark 2. (Default = 0)</td></tr><tr><td>ROTRSEID</td><td>Identification number of the superelement in which the rotor specified in the REFROTR field is defined. (Integer >= 0, Default = 0).</td></tr><tr><td>WR3WRL</td><td>Specifies whirl frequency for calculation of rotor damping and circulation terms for rotor structural damping specified through GR field for asynchronous complex eigenvalue analysis. (Real, Default = 0.)</td></tr><tr><td>WR4WRL</td><td>Specifies whirl frequency for calculation of rotor damping and circulation terms for rotor structural damping specified through material entries for asynchronous complex eigenvalue analysis. (Real, Default = 0.)</td></tr><tr><td>WRHWRL</td><td>Specifies whirl frequency for calculation of rotor damping and circulation terms for rotor structural hybrid damping specified through ROTHYBD card for asynchronous complex eigenvalue analysis. (Real, Default = 0.)</td></tr></table></body></html>  

## Remarks:  

1. Multiple RGYRO entries with the same RID value are not allowed.  

2.The required information on the RGYRO entries varies for diffrent analyses. Values for the RID and SPDUNIT fields are always required. Values for SPDLOW, SPDHIGH and SPEED are analysis dependent as shown in the table below:  

<html><body><table><tr><td>Solution Sequence</td><td>Type of Analysis</td><td>PARAM, GYROAVG</td><td>Required Entry</td><td>COMMENT</td></tr><tr><td rowspan="4">Frequency Response</td><td>SYNC</td><td>0</td><td rowspan="4">None SPDLOW, SPDHIGH</td><td rowspan="4">a, b</td></tr><tr><td>SYNC</td><td>-1</td></tr><tr><td>ASYNC</td><td>0</td></tr><tr><td>ASYNC</td><td>SPEED SPEED b</td></tr><tr><td rowspan="2">Complex Modes</td><td>SYNC</td><td>-1 H</td><td rowspan="2">SPDLOW, SPDHIGH SPEED</td><td>a, b</td></tr><tr><td>ASYNC</td><td></td><td>b, Remark 4.</td></tr><tr><td>Static Analysis</td><td></td><td></td><td>SPEED</td><td>Remark 3.</td></tr></table></body></html>  

a. The relative rotor speeds will be treated as linearly dependent on the reference rotor speed $(\Omega=\mathrm{A}0+\mathrm{A}1\Omega_{\mathrm{reference}})$ . The scale factors A0 and Al will be determined by a least-mean-square fit of the relative rotor speeds input on the RSPINR entries between SPDLOW and SPDHIGH of the reference rotor. If SPDLOW or SPDHIGH are outside the range specified on the RSPINR entry, the values will be extrapolated from the RSPINR entry values.  

b. PARAM, WR3 and PARAM, WR4 are required for rotor damping.   
3. For static analysis, the SYNCFLG field must beleft blank or must have the ASYNC option specified in it. Otherwise, the program terminates the execution with an appropriate fatal mesage.   
4.When there isa Case Control request for Campbelldiagram, the selected RGYRO Bulk Data entry must have the ASYNC option specified in its SYNCFLG field. Otherwise, the program terminates the execution with an appropriate fatal message.   
5.In the presence ofGR field, the rotor damping matrix (BR) in complex eigenvalue analysis is given by: $\mathrm{BR}=\mathrm{KR}1.\mathrm{GR}1/\big|\Omega1(\Omega\mathrm{\Omega}_{-}\mathrm{ref})-\mathrm{WR}3\mathrm{WRL}\big|$ where, KR is the rotor stiffness matrix. GR is the structural damping parameters specified in the RSPINR entry $\Omega1(\Omega_{-}\mathrm{ref})$ is the specified rotor speed.   
6. If non-zero WR3WRL is specified in RGYRO, then PARAM,WR3 and WR3R (in RSPINR) cannot be specified. Appropriate FATAL message will be issued, in case these entries are specified.  

Defines a ring for conical shell problems.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5 6</td><td>7 8</td><td>9 10</td></tr><tr><td>RINGAX</td><td>ID</td><td></td><td>R Z</td><td></td><td>PS</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RINGAX</td><td>3</td><td></td><td>2.0</td><td>-10.0</td><td></td><td>162</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Ring identification number. See Remark 6. (Integer > 0)</td></tr><tr><td>R</td><td>Ring radius. (Real > 0.0)</td></tr><tr><td>Z</td><td>Ring axial location. (Real)</td></tr><tr><td>PS</td><td>Permanent single-point constraints. (Any unique combination of the Integers 1 through 6 with no embedded blanks.)</td></tr></table></body></html>  

## Remarks:  

1. RINGAX is allowed only if an AXIC entry is also present.   
2. The number of degrees-of-freedom defined is $(6-\mathrm{NPS})\cdot H$ where $H$ is the harmonic count and NPS is the number of digits in field 8. (See AXiC, 1245).   
3. RINGAX identification numbers must be unique with respect to allother POINTAX, RINGAX, and SECTAX identification numbers.   
4.For a discussion of the conical shell problem, see Conical ShellElement (RlNGAX) (p.145) in the MSC Nastran Reference Guide.   
5. Constraints may be necessary to avoid matrix singularities. The CONEAX element has no stiffness for rotation about the normal. In addition, there is no stiffnessfor rotation about V (see Figure 9-152) when transverse shear flexibility is not included.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/73cd60cd9d04dda917019b84c5671d0252ec0d0879ab4e1f07604b72ea6122aa.jpg)  
Figure 9-152 RINGAX Coordinate System  

6. In order to reference this entry on a SET Case Control command, the ID must be modified by $\mathrm{ID}(\mathrm{n})=\mathrm{ID}+1000000\cdot\mathrm{n}$ where n is the harmonic number plus one and ID(n) is the value specified on the SET entry.  

Defines a circle (fluid point) in an axisymmetric fluid model.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RINGFL</td><td>IDFA</td><td>XA1</td><td>XA2</td><td>XA3</td><td>IDFB</td><td>XB1</td><td>XB2</td><td>XB3</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RINGFL</td><td>3</td><td>1.0</td><td></td><td>30.0</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>IDFA, IDFB</td><td>Unique identification number of the fluid points. (0 < Integer < 500000)</td></tr><tr><td>XAi, XBi</td><td>Coordinates of the point defined in the coordinate system specified on the AXIF entry. (Real; XA1 and XB1 > 0.0)</td></tr></table></body></html>  

## Remarks:  

1. RINGFL is allowed only if an AXIF entry is also present.   
2. All fluid point identification numbers must be unique with respect to other scalar, structural, and fluid points.   
3. X1, X2, X3 are $(\boldsymbol{\mathbf{r}},\boldsymbol{\Phi},\boldsymbol{\mathbf{z}})$ for a cylindrical coordinate system and $(\boldsymbol{\uprho},\boldsymbol{\uptheta},\boldsymbol{\upphi})$ for a spherical coordinate system. O is in degrees. The value of $\phi$ must be blank or zero.   
4. One or two fluid points may be defined per entry.  

# RJOINT  

Rigid Joint  

Defines a rigid joint element connecting two coinciding grid points.  

## Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RJOINT</td><td>EID</td><td>GA</td><td>GB</td><td>CB</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RJOINT</td><td>5</td><td>1</td><td>2</td><td>12345</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. (Integer > 0)</td></tr><tr><td>GA,GB</td><td>Grid point identification numbers. (Integer > 0)</td></tr><tr><td>CB</td><td>Component numbers in the global coordinate system at GB. These degrees-of- freedom are constrained to move with the same degrees-of-freedom at GA. See Remarks 4. and 5. (Integers 1 through 6 with no embedded or blank.)</td></tr></table></body></html>  

## Remarks:  

1. Two methods are available to process rigid elements: equation elimination or Lagrange multipliers. The Case Control command, RIGID, selects the method.   
2.For the Lagrange method, Nastran willcreate internally the Lagrange multiplier degrees-of-freedom in addition to the 12 displacement degrees-of-freedom given by grid points GA and GB. The number of Lagrange multiplier degrees-of-freedom is equal to the number of dependent degrees-of-freedom given by CB.   
3. The length between grid points GA and GB must be zero.   
4.When $\mathrm{CB}={}^{\cdots}123456{}^{\cdots}$ or blank, the grid point GB is constrained to move with GA and the two grid points moves as a single point. For default $\mathrm{CB}={}^{\cdots}123456^{\circ}$ ，   
5. If any degree-of-freedom is released on CB, RJOINT becomes a mechanical joint element. For example, ${\mathrm{CB}}={}^{\mathrm{~c}}12345^{\mathrm{{,3}}}$ , then RJOINT becomes a hinge. $\mathrm{CB}={}^{\mathrm{\"}}1234{}^{\mathrm{\"}}$ , then RJOINT becomes a universal joint. And ${\mathrm{CB}}={}^{\mathfrak{a}}123^{\mathfrak{n}}$ , RJOINT becomes a spherical joint.   
6.For the Lagrange method, the theory for the RJOINT is formulated such that a consistent mechanical joint is created even if the user requests different global coordinate systems at grid points GA and GB.   
7. Thermal expansion effect is not applicable for the RJOINT element, since the distance between gric points GA and GB is zero.   
8. Element identification numbers should be unique with respect to all other element identification numbers.  

Defines a frequency-dependent dynamic load of the form  

$$
\{P(f)\}~=~\{A\}[C(f)+i D(f)]e^{i\{\theta-2\pi f\tau\}}
$$  

for use in frequency response problems.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RLOAD1</td><td>SID</td><td>EXCITEID</td><td>DELAYI/ DELAYR</td><td>DPHASEI/ DPHASER</td><td>TC/RC</td><td>TD/RD</td><td>TYPE</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RLOAD1</td><td>5</td><td>3</td><td>2.0</td><td>10</td><td>１</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Set identification number. See Remarks 1. and 3. (Integer > 0)</td></tr><tr><td>EXCITEID</td><td>Identification number of a static or thermal load set or a DAREA or FBALOAD (in FRF Based Assembly or FBA process) or SPCD entry set that defines {A}. See Remarks 4. and 5. (Integer > 0)</td></tr><tr><td>DELAYI</td><td>Identification number of DELAY or FBADLAY (in FRF Based Assembly or FBA process) Bulk Data entry that defines time delay t . See Remark 2. (Integer > 0 or blank)</td></tr><tr><td>DELAYR</td><td>Value of time delay t that will be used for all degrees-of-freedom that are excited by this dynamic load entry. See Remark 2. (Real or blank)</td></tr><tr><td>DPHASEI</td><td>Identification number DPHASE or FBAPHAS (in FRF Based Asseembly or FBA process) Bulk Data entry that defines phase angle 0 . (See Remark 2. (Integer > 0 or blank)</td></tr><tr><td>DPHASER</td><td>Value of phase angle 0 (in degrees) that willbe used for all degrees-of-freedom that are excited by this dynamic load entry. See Remark 2. (Real or blank)</td></tr><tr><td>TC</td><td>Set identification number of the TABLEDi entry that gives C(f). See Remark 2. (Integer > O or blank)</td></tr><tr><td>RC</td><td>Value of C to be used for all frequencies. See Remark 2.. (Real or blank)</td></tr><tr><td>TD</td><td>Set identification number of the TABLEDi entry that gives D(f). See Remark 2. (Integer > O or blank)</td></tr><tr><td>RD</td><td>Value of D to be used for all frequencies. See Remark 2.. (Real or blank)</td></tr><tr><td>TYPE</td><td>Defines the type of the dynamic excitation. See Remarks 4.and 5. (Integer, character or blank; Default = 0)</td></tr></table></body></html>  

## Remarks:  

1. Dynamic excitation sets must be selected with the Case Control command $\mathrm{DLOAD}=\mathrm{SID}$   
2. If any of DELAYI/DELAYR, DPHASEI/DPHASER, TC/RC, or TD/RD fields are blank or zero, the corresponding t, θ, C(f) or $D(f)$ will be zero. Either TC/RC or TD/RD may be blank or zero, but not both.   
3. SID need not be unique for all ACSRCE, RLOAD1, RLOAD2, TLOAD1 and TLOAD2 dynamic load entries. The $\mathrm{DLOAD}=\mathrm{SID}$ Case Control command will select all dynamic load entries with the set identification of SID.   
4.The type of the dynamic excitation is specified by TYPE (field 8) according to the folowing table:  

<html><body><table><tr><td>TYPE</td><td>TYPE of Dynamic Excitation</td></tr><tr><td>0, L, LO, LOA or LOAD</td><td>Applied load (force or moment) (Default)</td></tr><tr><td>1, D, DI, DIS or DISP</td><td>Enforced displacement using SPC/SPCD data</td></tr><tr><td>2,V, VE,VEL or VELO</td><td>Enforced velocity using SPC/SPCD data</td></tr><tr><td>3, A,AC, ACC or ACCE</td><td>Enforced acceleration SPC/SPCD data</td></tr></table></body></html>  

The enforced motion options (SPC/SPCD) defined by TYI $^{\circ}\mathrm{E}{=}1,\$ 2, 3 are currently used for SOLs 108,111,146,200, and 400.For other solution sequences such as SOL118 (Cyclic Frequency Response) the large mass method must still be used.  

5. TYPE (field 8) also determines the manner in which EXCITEID (field 3) is used by the program as described below:  

Excitation specified by TYPE is applied load  

There is no LOADSET request in Case Control EXCITEID may reference DAREA, FBALOAD (in FRF Based Assembly or FBA process), static and thermal load set entries.   
· There is a LOADSET request in Case Control The program may reference DAREA entries as wellas static and thermal load set entries specified by the LID and TID fields, respectively, in the selected LSEQ entry corresponding to EXCITEID.  

Excitation specified by TYPE is enforced motion  

There is no LOADSET request in Case Control EXCITEID will reference SPCD entries.   
· There is a LOADSET request in Case Control The program willreference SPCD entries specified by the LID field in the selected LSEQ entry corresponding to EXCITEID.  

6. If Modules are present then this entry may only be specified in the main Bulk Data section.  

Defines a frequency-dependent dynamic excitation of the form.  

$$
\{P(f)\}~=~\{A\}~\cdot~B(f)e^{i\{\phi(f)+\theta-2\pi f\tau\}}
$$  

for use in frequency response problems.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RLOAD2</td><td>SID</td><td>EXCITEID</td><td>DELAYI/ DELAYR</td><td>DPHASEI/ DPHASER</td><td>TB/RB</td><td>TP/RP</td><td>TYPE</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RLOAD2</td><td>5</td><td>3</td><td>15</td><td>5.0</td><td>7</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td> Set identification number. See Remarks 1. and 3. (Integer > 0)</td></tr><tr><td>EXCITEID</td><td>Identification number of a static or thermal load set or a DAREA or FBALOAD (in FRF Based Assembly or FBA process) or SPCD entry set that defines {A}. See Remarks 4. and 5. (Integer > 0)</td></tr><tr><td>DELAYI</td><td>Identification number of DELAY or FBADLAY (in FRF Based Assembly or FBA process) Bulk Data entry that defines time delay t . See Remark 2. (Integer > O or blank)</td></tr><tr><td>DELAYR</td><td>Value of time delay t that will be used for all degrees-of-freedom that are excited by this dynamic load entry. See Remark 2. (Real or blank)</td></tr><tr><td>DPHASEI</td><td>Identification number DPHASE or FBAPHAS (in FRF Based Assembly or FBA process) Bulk Data entry that defines phase angle 0 . (See Remark 2. (Integer > O or blank)</td></tr><tr><td>DPHASER</td><td>Value of phase angle θ (in degrees) that will be used for all degrees-of-freedom that are excited by this dynamic load entry. See Remark 2. (Real or blank)</td></tr><tr><td>TB</td><td> Set identification number of the TABLEDi entry that gives B(f). (Integer > 0)</td></tr><tr><td>RB</td><td>Value of B to be used for all frequencies. (Real, non-zero)</td></tr><tr><td>TP</td><td> Set identification number of the TABLEDi entry that gives Φ(/) in degrees. (Integer ≥ 0)</td></tr><tr><td>RP</td><td>Value of Φ to be used for all frequencies. See Remark 2. (Real or blank)</td></tr><tr><td>TYPE</td><td>Defines the type of the dynamic excitation. See Remarks 4. and 5. (Integer, character or blank; Defaults = 0)</td></tr></table></body></html>  

## Remarks:  

1. Dynamic excitation sets must be selected with the Case Control command $\mathrm{DLOAD}=\mathrm{SID}$ .  

2. If any of DELAYI/DELAYR, DPHASEI/DPHASER, or TP/RP fields are blank or zero, the corresponding $\tau,\ \theta$ ,or $\phi(f)$ will be zero.  

3. SID need not be unique for all ACSRCE, RLOAD1, RLOAD2, TLOAD1 and TLOAD2 dynamic load entries. The DLOAD $\mathbf{\Sigma}=\mathbf{\Sigma}$ SID Case Control command will select all dynamic load entries with the set identification of SID.  

4.The type of the dynamic excitation is specified by TYPE (field 8) according to the folowing table:  

<html><body><table><tr><td>TYPE</td><td>TYPE of Dynamic Excitation</td></tr><tr><td>0, L, LO, LOA or LOAD</td><td>Applied load (force or moment) (Default)</td></tr><tr><td>1, D,DI,DIS or DISP</td><td>Enforced displacement using SPC/SPCD data</td></tr><tr><td>2, V, VE,VEL or VELO</td><td>Enforced velocity using SPC/SPCD data</td></tr><tr><td>3, A,AC, ACC or ACCE</td><td>Enforced acceleration SPC/SPCD data</td></tr></table></body></html>  

The enforced motion options (SPC/SPCD) defined by TYPE $_{,=1}$ , 2,3 are currently used for SOLs 108,111,146, 200,and 400.For other solution sequences such as SOL118 (Cyclic Frequency Response) the large mass method must still be used.  

5. TYPE (field 8) also determines the manner in which EXCITEID (field 3) is used by the program as described below:  

Excitation specified by TYPE is applied load  

There is no LOADSET request in Case Control EXCITEID may reference DAREA, FBALOAD (in FRF Based Assembly or FBA process),static and thermal load set entries.   
There is a LOADSET request in Case Control The program may reference DAREA entries as well as static and thermal load set entries specified by the LID and TID fields, respectively, in the selected LSEQ entry corresponding to EXCITEID.  

Excitation specified by TYPE is enforced motion  

There is no LOADSET request in Case Control EXCITEID will reference SPCD entries.   
· There is a LOADSET request in Case Control The program willreference SPCD entries specified by the LID field in the selected LSEQ entry corresponding to EXCITEID.  

6. If Modules are present then this entry may only be specified in the main Bulk Data section.  

# Hybrid damping for rotors  

Specifies hybrid damping data for rotors.  

## Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>ROTHYBD</td><td>ROTORID1</td><td>HYBDAMP1</td><td>ROTORID2</td><td>HYBDAMP2</td><td>ROTORID3</td><td>HYBDAMP3</td><td>ROTORID4</td><td>HYBDAMP4</td><td></td></tr><tr><td></td><td>ROTORID5</td><td>HYBDAMP5</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Examples:  

<html><body><table><tr><td>ROTHYBD</td><td>1</td><td>15</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>ROTHYBD</td><td>10</td><td>100</td><td>20</td><td>200</td><td>30</td><td>300</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ROTORIDi</td><td>Identification number of rotor. (Integer > O). See Remarks 1 and 2.</td></tr><tr><td>HYBDAMPi</td><td>Identification number of a HYBDAMP entry defining hybrid modal damping data. (Integer > 0). See Remarks 1 and 2.</td></tr></table></body></html>  

## Remarks:  

1. ROTORIDi - HYBDAMPi pair values referencing non-existent rotors are ignored.   
2. If there is no HYBDAMP entry defined in the data for a HYBDAMPi specified for a valid ROTORIDi, the program terminates the execution with an appropriate fatal error.   
3. Hybrid damping can result in very densely populated damping matrix causing significant performance penalty.  

# Rotor Model Definition  

Specifies list of grids, elements or properties that comprise the rotor 3D model.  

## Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>ROTOR</td><td>ROTORID</td><td>FRAME</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>LTYPE</td><td>ID1</td><td>ID2</td><td>ID3</td><td>etc.</td><td></td><td></td><td></td></tr><tr><td></td><td>AXIS</td><td>GID1</td><td>GID2</td><td>etc.</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>ROTOR 10</td><td>ROT</td><td></td><td></td><td></td></tr><tr><td>ELEM</td><td>10 THRU</td><td>12</td><td></td><td></td></tr><tr><td>PROP AXIS</td><td>1 THRU 101 102</td><td>５</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ROTORID</td><td>Identification number of rotor. (Integer > 0).</td></tr><tr><td>FRAME</td><td>Analysis frame (Char, ROT or FIX, Required, Default: FIX)</td></tr><tr><td>LTYPE</td><td>ELEM or PROP or both, indicating whether the specified list references element IDs or property IDs. (Character; Required; No default)</td></tr><tr><td></td><td>Note that the order is important. In case both ELEM and PROP are specified, ELEM should be specified first.</td></tr><tr><td>Idi</td><td> IDs of elements or properties comprising the rotor. (Integer > O; Required; No default)</td></tr><tr><td>AXIS</td><td>Defines grid points which define the axis of rotation.</td></tr><tr><td>GIDi</td><td>IDs of grids comprising the axis of the rotor (Integer > O; Required; No default)</td></tr></table></body></html>  

## Remarks:  

1. Supported element types for analysis in rotating reference frame: 0D elements : CONM1, CONM2 1D elements $\because$ CBEAM,CBAR 2D elements $\because$ CQUAD4, CQUAD8, CTRIA3, CTRIA6 3D elements $\because$ CHEXA,CPENTA, CTETRA, CPYRAM   
2. Supported element types for analysis in fixed reference frame: 0D elements $\because$ CONM1,CONM2 1D elements $\because$ CBEAM,CBAR  

2D elements $\because$ CQUAD4, CQUAD8   
3D elements $\because$ CHEXA,CPENTA,CTETRA,CPYRAM  

3. Current limitation for analysis in fixed reference frame:  

a.If shell elements are defined perpendicular to the rotor axis fora 3D rotor defined using ROTOR entry, then gyroscopic matrix is not available for those elements.For example, a flat disk like CD spinning about the center. If the shell elements are replaced by SOLID elements, then correct gyroscopic effects can be obtained.   
b. Bar elements (default version) do not have polar moment of inertia.Thus, if CBAR elements are defined along the axis of rotation (for both ROTOR and ROTORG entries), then they do not provide any contribution to gyroscopic matrix. The CABR elements can be replaced by CBEAM elements in case gyroscopic terms are needed for those elements.  

4. THRU option is supported in ROTOR entry. Note that the order is important for LTYPE. In case both ELEM and PROP are specified, ELEM should be specified first.  

5. Analysis can be performed using coupled mass or diagonal mass for all the elements.  

6. ROTORAX, ROTORG and ROTORSE should not be used along with ROTOR in ROT frame. They can only be used with ROTOR in FIX frame. (since ROTORAX, ROTORG and ROTORSE assume fixed reference frame.)   
7. At least 2 grid points need to be defined on AXIS to complete ROTOR definition, these points may not be part of rotor.   
8.For unbalance loads the grid point, at which UNBALNC is defined, should be part of ROTOR AXIS list.   
9.In order to include CONM1/2 elements as part of a rotor, its element ID should be listed using ELEM in ROTOR definition.   
10. Stator portion of the model should only be defined in residual for external superelement runs in rotating system.   
11. Only permanent glue option is supported for contact analysis for rotating portion of the model.  

Specifies list of elements, properties or grid points that comprise an axisymmetric model rotor.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>ROTORAX</td><td>ROTORID</td><td>LTYPE</td><td>ID1</td><td>ID2</td><td>ID3</td><td>ID4</td><td>ID5</td><td>ID6</td><td></td></tr><tr><td></td><td>ID7</td><td>ID8</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

or  

<html><body><table><tr><td>ROTORAX</td><td>ROTORID</td><td>LTYPE</td><td>ID1</td><td>THRU</td><td>ID2</td><td>BY</td><td>INC</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>ROTORAX</td><td>100</td><td>ELEM</td><td>5</td><td>THRU</td><td>25</td><td></td><td></td><td></td><td></td></tr><tr><td>ROTORAX</td><td>10</td><td>PROP</td><td>10</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>ROTORAX</td><td>15</td><td>GRID</td><td>50</td><td>69</td><td>70</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ROTORID</td><td>Identification number of rotor. (Integer > O). See Remarks 1. and 2..</td></tr><tr><td>LTYPE</td><td>ELEM, PROP or GRID, indicating whether the specified list references element IDs, property IDs or grid point IDs, respectively. (Character; Required; No default). See Remarks 3. through 6..</td></tr><tr><td>IDi</td><td>IDs of elements, properties or grid points comprising the rotor. (Integer > O; Required; No default)</td></tr><tr><td>THRU</td><td>Implies a range of identification numbers. (Optional).</td></tr><tr><td>BY</td><td>Implies that an increment is being specified for the THRU option (Optional)</td></tr><tr><td>INC</td><td>ID increment. (Integer > 0; Optional)</td></tr></table></body></html>  

## Remarks:  

1. ROTORIDs of ROTORAX entries may not be the same as the ROTORIDs of ROTORG entries or ROTORSE entries.   
2. Multiple ROTORAX entries with the same ROTORID are supported.   
3. When the GRID option is used for the LTYPE field,a minimum of two grid points must be specified in thelist. If this condition is not satisfied, the program terminates the execution with an appropriate user fatal message.   
4. For every rotor defined by a ROTORAX entry, there should be at least one entry using the GRID option for the LTYPE field to define the axis of symmetry.   
5. Grid points specified on ROTORAX entries using the GRID option for the LTYPE field must be collnear. If this condition is not satisfied, the program terminates the execution with an appropriate user fatal message.   
6. Only grid points specified on ROTORAX entries using the GRID option for the LTYPE field may be referenced by RSPINR, RSPINT and UNBALNC entries.  

Specifies grids that compose the rotor line model  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>９</td><td>10</td></tr><tr><td>ROTORG</td><td>ROTORID</td><td>GRID1</td><td>GRID2</td><td>GRID3</td><td>GRID4</td><td>GRID5</td><td>GRID6</td><td>GRID7</td><td></td></tr><tr><td></td><td>GRID8</td><td>GRID9</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

or  

<html><body><table><tr><td>ROTORG</td><td>ROTORID</td><td>GRID1</td><td>THRU</td><td>GRID2</td><td>BY</td><td>INC</td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>ROTORG</td><td>100</td><td>101</td><td>1002</td><td>103</td><td>4001</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>ROTORG</td><td>200</td><td>1001</td><td>THRU</td><td>1100</td><td>BY</td><td>2</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ROTORID</td><td>Identification number of rotor. (Integer > 0; Required). See Remarks 1. and 2..</td></tr><tr><td>GRIDi</td><td>Grids comprising the rotor. (Integer > O; Required; no Default). See Remarks 3. through 7.</td></tr><tr><td>THRU</td><td>Specifies a range of identification numbers. (Optional)</td></tr><tr><td>BY</td><td>Specifies an increment for a THRU specification (Optional)</td></tr><tr><td>INC</td><td>Grid point number increment. (Integer)</td></tr></table></body></html>  

## Remarks:  

1. ROTORIDs of ROTORG entries may not be the same as the ROTORIDs of ROTORAX entries or ROTORSE entries.   
2. Multiple ROTORG entries with the same ROTORID are supported.   
3. Grid IDs must be unique. Duplicate grid IDs will produce a fatal error.   
4.All grids specified on ROTORG entries for a specific ROTORID must be collnear. Collinearity will be checked.   
5. If not using superelements, no element stiffness can be connected between any GRID listed on a ROTORG entry and any GRID notlisted on the ROTORG. In this case, any connections to GRIDs listed on a ROTORG must be done using MPC equations or R-elements.   
6.If superelements are used, no element stiffnessin the residual structure may connect between a GRID listed on a ROTORG and any GRID not listed on the ROTORG. In this case, any connections in the residual structure to GRIDs listed on a ROTORG must be done using MPC equations or Relements.   
7. All massfor any rotor defined using a ROTORG entry should be defined on the GRIDs listed on the ROTORG entry. Any mass which should belong to the rotor, but is placed on GRIDs not listed on the ROTORG entry, will be ignored when calculating the gyroscopic terms for the rotor. Only the mass shown in the ROTOR DYNAMICS MASS SUMMARY in the .f06 file is included in the calculation of the gyroscopic terms for the rotor.   
8. Bar elements (default version) do not have polar moment of inertia.Thus,if CBAR elements are defined along the axis of rotation (for both ROTOR and ROTORG entries),then they do not provide any contribution to gyroscopic matrix. The CABR elements can be replaced by CBEAM elements in case gyroscopic terms are needed for those elements.  

Specifies grids that compose the rotor line model.An alternate to the ROTORG entry when superelements are used.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>ROTORSE</td><td>ROTORID</td><td>SEID</td><td>SEOPT</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>ROTORSE</td><td>10</td><td>１</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ROTORID</td><td>Identification number of rotor line model. (Integer > O; Required). See Remark 1.</td></tr><tr><td>SEID</td><td>Superelement identification number of rotor superelement. (Integer > 0; Required)</td></tr><tr><td>SEOPT</td><td>Form of superelement for calculation of gyroscopic terms. (Integer = 1 or 2; Default = 1) See Remark 3.</td></tr></table></body></html>  

## Remarks:  

ROTORIDs of ROTORSE entries may not be the same as the ROTORIDs of ROTORAX entries or ROTORG entries. A ROTORSE entry can be used when the rotor is placed in a superelement. 3. The rotor line model may be the boundary of a 3D rotor superelement or the rotor line model may be a superelement itself. SEOPT is chosen to distinguish between these cases. The options are: 1- If the user has a 3D model of the rotor and places it in a superelement with ID SEID, the boundary (a-set)of this superelement must consist of no more and no less than the collnear rotor line model. This will be checked. Specify SEOPT as 1 to identify this configuration. When this option is used, the A-set matrices of the superelement are used to calculate the gyroscopic terms.This option should be used for external superelements. 2- If the user has a line model of the rotor and places it in a superelement with ID SEID, this superelement (g-set) may be partially or completely reduced in the SE reduction process. This superelement must consist of no more and no lessthan the rotor line model. Specify SEOPT as 2 to identify this configuration. When this option is used, the G-set matrices of the superelement are used to calculate the gyroscopic terms. Rotors specified using the ROTORSE entry can be connected directly to the support structure. In contrast, rotors specified using the ROTORG entry must employ rigid elements to keep the rotor disconnected from the support in the G-set of the residual structure. Static and component mode reduction of the rotor line model are supported when using ROTORSE entries.  

Defines a pin-ended element that is rigid in translation.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>RROD</td><td>EID</td><td>GA</td><td>GB</td><td>CMA</td><td>CMB</td><td>ALPHA</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RROD</td><td>14</td><td>1</td><td>2</td><td>2</td><td></td><td>6.5-6</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. (0 < Integer < 100,000,000)</td></tr><tr><td>GA,GB</td><td>Grid point identification numbers of connection points. (Integer > 0)</td></tr><tr><td>CMA,CMB</td><td>Component number of one and only one dependent translational degree-of-freedom in the global coordinate system assigned by the user to either GA or GB. (Integer 1, 2,or 3. Either CMA or CMB must contain the integer, and the other must be blank for the linear RROD. For Lagrange RROD, both CMA and CMB can be blank.) See Remark 3.</td></tr><tr><td>ALPHA</td><td> Thermal expansion coefficient. See Remark 11. (Real or blank)</td></tr></table></body></html>  

## Remarks:  

1. Two methods are available to process rigid elements: equation elimination or Lagrange multipliers. The Case Control command, RIGID, selects the method.   
2. For the Lagrange method, Nastran will create internally one Lagrange multiplier degree-of-freedon in addition to the displacement degrees-of-freedom given by connected grid points.   
3.For the Lagrange method,if both CMA and CMB are blanks, Nastran willcompute the best degree of-freedom for the dependent degree-of-freedom.   
4. The m-set coordinates specified on this entry may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.   
5. Element identification numbers should be unique with respect to allother element identification numbers.   
6. RROD, among other eligible rigid element types, can be selected via MPC and SET3.   
7. Forces of multipoint constraint may be recovered in all solution sequences,except SOL 129,with th MPCFORCE Case Control command.   
8.Rigid elements are ignored in heat transfer problems. If used in a multi-physics coupled problem using SUBSTEP, they participate in the mechanical substep but are ignored in the heat transfer subsstep through automatic deactivation. For more information on deactivation, see the DEACTEI keyword under the NLMOPTS Bulk Data entry and the associated Remark 9 for that entry.   
9. The degree-of-freedom selected to be dependent must have a nonzero component along the axis of the element. This implies that the element must have finite length.   
10.See Rigid Elements and Multipoint Constraints (R-type,MPC)(p.155) in the MSC Nastran Reference Guide for a discussion of rigid elements.   
11.For theLagrange method, the thermal expansion effect willbe computed, if usersupplies the thermal expansion coefficient, ALPHA, and the thermal load is requested by the TEMPERATURE(INITIAL) and TEMPERATURE(LOAD) Case Control commands. The temperature of the element is taken as the average temperature of the two connected grid points GA and GB.  

There is no current entry fora TREF, so if TEMP(INIT) is not specified in Case Control, a referenc temperature of 0.0 is used for the RROD.  

Specifies the relative spin rates between rotors for complex eigenvalue,frequency response, and static analysis and rotor damping parameters.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>９ 10</td></tr><tr><td>RSPINR</td><td>ROTORID</td><td>GRIDA</td><td>GRIDB</td><td>SPDUNT</td><td>SPTID</td><td>ROTRSEID</td><td></td><td></td></tr><tr><td></td><td>GR</td><td>ALPHAR1</td><td>ALPHAR2</td><td>WR3R</td><td>WR4R</td><td>WRHR</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RSPINR</td><td>100</td><td>1001</td><td>1002</td><td>RPM</td><td>100</td><td>5</td><td></td><td></td><td></td></tr><tr><td></td><td>0.02</td><td>1</td><td>3</td><td>1000.</td><td>1500.</td><td>1200.</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ROTORID</td><td>Identification number of rotor. (Integer > 0; Required). See Remark 1.</td></tr><tr><td>GRIDA/GRIDB</td><td>Positive rotor spin direction is defined from GRIDA to GRIDB. See Remark 4. (Integer > 0; Required)</td></tr><tr><td>SPDUNIT</td><td>Specifies whether the listing of relative spin rates is given in terms of RPM (revolutions/minute) or frequency (revolutions (cycles)/sec). (Character; ‘RPM' or ‘FREQ'; Required)</td></tr><tr><td>SPTID</td><td>Table for relative rotor spin rates. See Remark 5. (Real or Integer, if integer, must be > 0; Required)</td></tr><tr><td>GR</td><td> Rotor structural damping factor. See Remarks 6. and 8. (Real; Default = 0.0)</td></tr><tr><td>ALPHAR1</td><td>Scale factor applied to the rotor mass matrix for Rayleigh damping. See Remarks 7. and 8. (Real; Default = 0.0)</td></tr><tr><td>ALPHAR2</td><td>Scale factor applied to the rotor stiffness matrix for Rayleigh damping. See Remarks 7. and 8. (Real; Default = 0.0)</td></tr><tr><td>ROTRSEID</td><td>Identification number of the superelement in which the rotor specified in the ROTORID field is defined. (Integer >= 0, Default = 0). See Remark 1.</td></tr><tr><td>WR3R</td><td>Specifies “average" excitation frequency for calculation of rotor damping and circulation terms for rotor structural damping specified through GR field. (Real, Default = 0.)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>WR4R</td><td>Specifies “average” excitation frequency for calculation of rotor damping and circulation terms for rotor structural damping specified through material entries. (Real, Default = 0.)</td></tr><tr><td>WRHR</td><td>Specifies“average” excitation frequency for calculation of rotor damping and circulation terms for rotor structural hybrid damping specified through ROTHYBD card. (Real, Default = 0.)</td></tr></table></body></html>  

## Remarks:  

1. The ROTORID-ROTRSEID pair must be unique acrossall RSPINR entries, but the ROTORID and ROTRSEID fields individually need not be unique.   
2. Depending upon the type ofanalysis being performed, a RSPINR/RSPINT entry should be present for each rotor defined by a ROTORG or ROTORAX entry whose gyroscopic effects are to be included in the analysis.If missing for a rotor, then that rotor is assumed to be stationary and the analysis proceeds accordingly. The absence of a RSPINR/RSPINT entry for a rotor is noted in the .f06 file via an appropriate user information mesage.   
3. RSPINR/RSPINT entries are honored and processed only in residual or assembly jobs and are ignored in external superelement creation jobs. For rotor defined in external SE, the GRIDA and GRIDB specified in RSPINR must be part of the SEs ASET during creation run. This requirement is relaxed for rotors defined in PART SE.   
4. The rotor spin axis is determined from the ROTORG or ROTORAX entries. The positive rotation vector is from GRIDA to GRIDB. GRIDA and GRIDB must be specified on the ROTORG or ROTORAX entry. If ROTRSEID refers to a secondary external superelement, then GRIDA and GRIDB must be points associated with the ROTORID of the primary external superelement since the secondary external superelement derives all of its properties from the primary external superelement.   
5. If SPTID is a real number, the value is considered constant. If SPTID is an integer number,the value references a DDVAL entry that specifies the relative rotor spin rates. The number of spin rates for each rotor must be the same. Relative spin rates are determined by correlation of table entries. The ith entry for each rotor specifies the relative spin rates between rotors at RPMi/FREQi. Spin rates for the reference rotor must be in ascending or descending order.   
6. Rotor structural damping specified by the GR entry will be added as equivalent viscous damping or structural damping depending on the solution. That is, $[B_{r o t o r}]_{s t r u c t u r a l}=\biggl({\frac{G R}{W R3}}\biggr)[K_{r o t o r}]$ where WR3 is a user parameter,or $[K_{r o t o r}]~=~(1+i G R)[K_{r o t o r}]$  

depending on the solution sequence, SYNC/ASYNC and value of PARAM,GYROAVG.See Remark for all the damping and circulation terms added to the equation in the different cases.  

In case WR3R is specified in RSPINR, then WR3R is used for determining equivalent viscous damping for this particular rotor instead of WR3.  

7. Rayleigh damping for the rotor will be calculated as  

$$
[B_{r o t o r}]_{R a y l e i g h}~=~\alpha_{R1}(M_{r o t o r})+\alpha_{R2}[K_{r o t o r}]
$$  

8. The various rotor damping and circulation matrices applicable to frequency response and complex eigenvalue solutions are shown in the following table.  

<html><body><table><tr><td>Solution</td><td>Damping</td><td colspan="2">Circulation</td></tr><tr><td>Frequency Response - ASYNC option</td><td>i∞([BR]+α1R[MR] +α2R[KR]+[BHR]) + i(GR[KR] + [K4R] + [KHR])</td><td>2R(Ωrej)</td><td>[BR]+α1R[MR]+α2R[KR]+ [BHR] +()[]+([K4]([])</td></tr><tr><td>Frequency Response - PAYNM,GYROAVG,-1</td><td>([BR]+α1R[MR] +α2R[KR] + [BHR]) io R WR4 [K4R] [KHR]</td><td>ΩR(Ωref)</td><td>[BR]+α1R[MR]+α2R[KR]+[BHR] (R)[]+)(A] WRH [KHR]</td></tr><tr><td>SYNC option</td><td>+ i(GR[KR] + [K4R] + [KHR])</td><td>R(@) [KHR]</td><td>([BR]+α1R[MR]+α2R[KR]+ [BHR] ([]+([KR]</td></tr></table></body></html>  

<html><body><table><tr><td>Solution</td><td>Damping</td><td>Circulation</td></tr><tr><td>Frequency Response - SYNC option w/ PARAM,GYROAVG,-1</td><td>([BR]+α1R[MR] +α2R[KR] + [BHR] iw GR WR4 )[K4R] WRH [KHR]</td><td>[BR]+α1R[MR]+α2R[KR]+ [BHR] βR GR )[K)}+(R[KAS]+(WRH）)（KHR) [BR]+α1R[MR]+α2R[KR]+ [BHR] (R)[S]+(R)[KAS]+(WRH)[KHR]) +αR</td></tr><tr><td>Complex Modes - ASYNC option iw</td><td>([BR] +α1R[MR] +α2R[KR] +[BHR]) GR [K4R] WR3 WR4 WRH [KHR]</td><td>[BR]+α1R[MR]+α2R[KR]+ [BHR] 2R(Ωref) (WR3) TII WRH)[KHR]</td></tr><tr><td>Complex Modes - SYNC option iw</td><td>([BR] +α1R[MR] +α2R[KR] + [BHR]) R[KR] WR [K4R] WRH)[KHR]</td><td>([BR]+α1R[MR]+α2R[KR]+[BHR] βR R)()]+(W[KAS]+(RH)[KHR]) [BR]+α1R[MR]+α2R[KR]+ [BHR] GR)(R]+(WR)[KAR+(WRH)[KHR]) WR3 +αR</td></tr></table></body></html>  

where:  

[BR] $\mathbf{\Sigma}=\mathbf{\Sigma}$ the rotor viscous damping   
$[M_{R}]$ $\mathbf{\Sigma}=\mathbf{\Sigma}$ the rotor mass   
$[K_{R}]$ $\mathbf{\Psi}=\mathbf{\Psi}$ the rotor stiffness   
[K4R] $\mathbf{\Sigma}=\mathbf{\Sigma}$ the rotor material damping   
[BHR] $\mathbf{\Sigma}=\mathbf{\Sigma}$ the rotor viscious hybrid damping   
[KHR] $\mathbf{\Psi}=\mathbf{\Psi}$ the rotor structural hybrid damping   
[BR] $\mathbf{\Sigma}=\mathbf{\Sigma}$ the circulation due to rotor viscous damping   
$\boldsymbol{M}_{R}^{C}$ $\mathbf{\Psi}=\mathbf{\Psi}$ the circulation due to rotor ‘mass'   
$\boldsymbol{K}_{R}^{C}$ $\mathbf{\Sigma}=\mathbf{\Sigma}$ the circulation due to rotor structural ‘stiffness'   
[K4R] $\mathbf{\Sigma}=\mathbf{\Sigma}$ the circulation due to rotor material damping   
[BHR] $\mathbf{\Sigma}=\mathbf{\Sigma}$ the circulation due to rotor viscous hybrid damping   
[KHR] $\mathbf{\Psi}=\mathbf{\Psi}$ the circulation due to rotor structural hybrid damping   
αlR,α2R $\mathbf{\tau}=\mathbf{\tau}$ used to specify Rayleigh viscous damping $([B_{R}]_{R a y l e i g h}=\propto1_{R}[M_{R}]+\propto2_{R}[K_{R}])$   
a. Parameter and hybrid damping applied to the rotor does not apply to the support and vice versa.   
b. For hybrid damping of the rotors, only the rotor mass and stiffness are used for the modes calculation.   
c. All rotor damping terms are cumulative. Multiple damping options should be selected with caution.  

<html><body><table><tr><td>αR βR</td><td>scale factors oflinear fit of rotor speed to reference rotor speed. The linear fit is calculated between the SPDLOW and SPDHIGH speeds (values specified on RGYRO entry) of the reference rotor.</td></tr><tr><td>WR3,WR4，WRH=</td><td>User parameters specified by PARAM statement. If the parameter values are zero (Default), the corresponding damping and circulation terms are not added.</td></tr></table></body></html>  

Specifies rotor spin rates for transient analysis.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RSPINT</td><td>ROTORID</td><td>GRIDA</td><td>GRIDB</td><td>SPDUNT</td><td>SPTID</td><td>SPDOUT</td><td>ROTSEID</td><td></td><td></td></tr><tr><td></td><td>GR</td><td>ALPHAR1</td><td>ALPHAR2</td><td>WR3R</td><td>WR4R</td><td>WRHR</td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>９ 10</td></tr><tr><td>RSPINT</td><td>100</td><td>1001</td><td>1002</td><td>RPM</td><td>1001</td><td></td><td></td><td></td></tr><tr><td></td><td>0.01</td><td>0.01</td><td>0.002</td><td>1000.</td><td>1500.</td><td>1200.</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ROTORID</td><td>Identification number of rotor. (Integer > O; Required). See Remark 1.</td></tr><tr><td>GRIDA/GRIDB</td><td>Positive rotor spin direction is defined from GRIDA to GRIDB. See Remark 4. (Integer > 0; Required)</td></tr><tr><td>SPDUNIT</td><td>Specifies whether the spin rates are given in terms of RPM (revolutions/minute) or frequency (revolutions(cycles)/sec). (Character; ‘RPM' or “FREQ'; Required)</td></tr><tr><td>SPTID</td><td>Rotor spin rate. See Remark 5. (Integer > O; Required)</td></tr><tr><td>SPDOUT</td><td>EPOINT to output the rotor speed vs. time. Output will be in SPDUNITs (Integer > 0 or blank)</td></tr><tr><td>GR</td><td>Rotor structural damping factor. See Remark 6. and 8. (Real; Default = 0.0)</td></tr><tr><td>ALPHAR1</td><td>Scale factor applied to the rotor mass matrix for Rayleigh damping. See Remark 7. and 8. (Real; Default = 0.0)</td></tr><tr><td>ALPHAR2</td><td>Scale factor applied to the rotor stiffness matrix for Rayleigh damping. See Remark 7. and 8. (Real; Default = 0.0)</td></tr><tr><td>ROTRSEID</td><td>Identification number of the superelement in which the rotor specified in the ROTORID field is defined. (Integer >= 0, Default = 0). See Remark 1.</td></tr><tr><td>WR3R</td><td>Specifies “average" excitation frequency for calculation of rotor damping and circulation terms for rotor structural damping specified through GR field. (Real, Default = 0.)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>WR4R</td><td>Specifies “average" excitation frequency for calculation of rotor damping and circulation terms for rotor structural damping specified through material entries. (Real, Default = 0.)</td></tr><tr><td>WRHR</td><td>Specifies“average” excitation frequency for calculation of rotor damping and circulation terms for rotor structural hybrid damping specified through ROTHYBD card. (Real, Default = 0.)</td></tr></table></body></html>  

## Remarks:  

1. The ROTORID-ROTRSEID pair must be unique acrossall RSPINT entries,but the ROTORID and ROTRSEID fields individually need not be unique.  

2. Depending upon the type of analysis being performed, a RSPINR/RSPINT entry should be present for each rotor defined by a ROTORG or ROTORAX entry whose gyroscopic effects are to be included in the analysis.If missing for a rotor, then that rotor is assumed to be stationary and the analysis proceeds accordingly. The absence of a RSPINR/RSPINT entry for a rotor is noted in the .f06 file via an appropriate user information message.  

3. RSPINR/RSPINT entries are honored and processed only in residual or assembly jobs and are ignored in external superelement creation jobs. For rotor defined in external SE, the GRIDA and GRIDB specified in RSPINT must be part of the SEs ASET during creation. This requirement is relaxed for rotors defined in PART SE.  

4. The rotor spin axis is determined from the ROTORG or ROTORAX entries. The positive rotation vector is from GRIDA to GRIDB. GRIDA and GRIDB must be specified on the ROTORG or ROTORAX entry.  

If ROTRSEID refers to a secondary external superelement, then GRIDA and GRIDB must be points associated with the ROTORID of the primary external superelement since the secondary external superelement derives all of its properties from the primary external superelement.  

5. SPTID references a TABLED1 entry that specifies the rotor spin rate history.  

6.Rotor structural damping specified by the GR entry willbe added as equivalent viscous damping. The equivalent damping will be calculated using:  

$$
[B_{r o t o r}]_{s t r u c t u r a l}=\biggl({\frac{G R}{W R3}}\biggr)[K_{r o t o r}]
$$  

where WR3 is a user parameter.  

In case WR3R is specified in RSPINT, then WR3R is used for determining equivalent viscous damping for this particular rotor instead of WR3.  

7. Rayleigh damping for the rotor will be calculated as  

$$
[B_{r o t o r}]_{R a y l e i g h}~=~\alpha_{R1}(M_{r o t o r})+\alpha_{R2}[K_{r o t o r}]
$$  

8. The various rotor damping and circulation matrices used in transient analysis are shown in the following table.  

<html><body><table><tr><td>Damping</td><td>Circulation (added to stiffness)</td></tr><tr><td>[BR] +[BHR] +α1R[MR] +α2R[KR] GR [KR] WR3 WR4 K4R] [KHR]</td><td>([BR]+[BHR]+α1R[MR]+α2R[KR] GR (WR[KAR] WR3 R + WR</td></tr></table></body></html>  

where:  

$[B_{R}]$ $\mathbf{\Sigma}=\mathbf{\Sigma}$ the rotor viscous damping   
$[M_{R}]$ $\mathbf{\Psi}=\mathbf{\Psi}$ the rotor mass   
$[K_{R}]$ $\mathbf{\Sigma}=\mathbf{\Sigma}$ the rotor stiffness   
[K4R] $\mathbf{\Sigma}=\mathbf{\Sigma}$ the rotor material damping   
[BHR] $\mathbf{\Sigma}=\mathbf{\Sigma}$ the rotor viscious hybrid damping   
[KHR] $\mathbf{\Psi}=\mathbf{\Psi}$ the rotor structural hybrid damping   
[BR] $\mathbf{\Psi}=\mathbf{\Psi}$ the circulation due to rotor viscous damping   
$\boldsymbol{M}_{R}^{C}$ $\mathbf{\Psi}=\mathbf{\Psi}$ the circulation due to rotor mass'   
$\boldsymbol{K}_{R}^{C}$ $\mathbf{\Psi}=\mathbf{\Psi}$ the circulation due to rotor structural stiffness   
[K4R] $\mathbf{\Sigma}=\mathbf{\Sigma}$ the circulation due to rotor material damping   
[BHR] $\mathbf{\Sigma}=\mathbf{\Sigma}$ the circulation due to rotor viscous hybrid damping   
[KHR] $\mathbf{\Sigma}=\mathbf{\Sigma}$ the circulation due to rotor structural hybrid damping   
α1R,α2R $\mathbf{\Sigma}=\mathbf{\Sigma}$ used to specify Rayleigh viscous damping $([B_{R}]_{R a y l e i g h}=\propto1_{R}[M_{R}]+\propto2_{R}[K_{R}])$   
αR,βR $\mathbf{\Sigma}=$ scale factors of linear fit of rotor speed to reference rotor speed. The linear fit is calculated between the SPDLOW and SPDHIGH speeds (values specified on RGYRO entry) of the reference rotor.   
WR3,WR4，WRH $\mathbf{\Sigma}=\mathbf{\Sigma}$ User parameters specified by PARAM statement. If the parameter values are zero (Default), the corresponding damping and circulation terms are not added.  

a. Parameter and hybrid damping applied to the rotor does not apply to the support and vice versa. b. For hybrid damping of the rotors, only the rotor mass and stiffness are used for the modes calculation.  

c. All rotor damping terms are cumulative. Multiple damping options should be selected with caution.  

Defines multipoint constraints for the interpolation of displacements at grid points.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RSPLINE</td><td>EID</td><td>D/L</td><td>G1</td><td>G2</td><td>C2</td><td>G3</td><td>C3</td><td>G4</td><td></td></tr><tr><td></td><td>C4</td><td>G5</td><td>C5</td><td>G6</td><td>-etc.-</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RSPLINE</td><td>73 .05</td><td>27</td><td>28</td><td>123456</td><td>29</td><td>30</td></tr><tr><td></td><td>123 75</td><td>123</td><td>71</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. (0 < Integer < 100,000,000)</td></tr><tr><td>D/L</td><td>Ratio of the diameter of the elastic tube to the sum of the lengths of all segments. (Real > 0.0; Default = 0.1)</td></tr><tr><td>Gi</td><td>Grid point identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Components to be constrained. See Remark 2. (Blank or any combination of the Integers 1 through 6.)</td></tr></table></body></html>  

## Remarks:  

1. Displacements are interpolated from the equations ofan elastic beam passing through the grid points This is a linear method only element, and not controlled with the Case Control command RIGID.   
2. A blank field for Ci indicates that allsix degrees-of-freedom at Gi are independent. Since G1 must be independent, no field is provided for C1. Since the last grid point must also be independent, the last field must be a Gi, not a Ci. For the example shown G1, G3, and G6 are independent. G2 has six constrained degrees-of-freedom while G4 and G5 each have three.   
3. Dependent (i.e.,constrained) degrees-of-freedom assigned by one rigid element may not also be assigned dependent by another rigid element or by a multipoint constraint.   
4.Degrees-of-freedom declared to be independent by one rigid body element can be made dependent by another rigid body element or by a multipoint constraint.   
5. EIDs must be unique.   
6. RSPLINE, among other eligible rigid element types, can be selected via MPC and SET3.   
7.Forces of multipoint constraint may be recovered in all solution sequences, exceptSOL 129, with the MPCFORCE Case Control command. 8.Rigid elements are ignored in heat transfer problems. If used in a multi-physics coupled problem using SUBSTEP, they participate in the mechanical substep but are ignored in the heat transfer substep through automatic deactivation. For more information on deactivation, seethe DEACTEL keyword under the NLMOPTS Bulk Data entry and the associated Remark 9 for that entry. 9.See Rigid Elements and Multipoint Constraints (R-type,MPC)(p.155) in the MSC Nastran Reference Guide for a discussion of rigid elements.   
10. The m-set coordinates specified on this entry may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.   
11. The constraint coefficient matrix is affected by the order of the Gi Ci pairs on the RSPLINE entry. The order of the pairs should be specified in the same order that they appear along the line that joins the two regions.Ifthis order is not followed then the RSPLINE willhave folds in it that may yield some unexpected interpolation results.   
12.The independent degrees-of-freedom that are the rotation components most nearly parallel to the line joining the regions should not normally be constrained.   
13. The RSPLINE has a limit of 10O grid points.  

Defines multipoint constraints to model clamped connections of shell-to-solid elements.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RSSCON</td><td>RBID</td><td>TYPE</td><td>ES1</td><td>EA1</td><td>EB1</td><td>ES2</td><td>EA2</td><td>EB2</td><td></td></tr></table></body></html>  

## Examples:  

<html><body><table><tr><td>RSSCON</td><td>110</td><td>GRID</td><td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td></tr><tr><td>RSSCON</td><td>111</td><td>GRID</td><td>31</td><td>74</td><td>75</td><td></td><td></td><td></td></tr><tr><td>RSSCON</td><td></td><td>ELEM</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>115</td><td></td><td>311</td><td>741</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td>RBID</td><td colspan="2">Element identification number. (0 < Integer < 100,000,000)</td></tr><tr><td rowspan="3">TYPE</td><td colspan="2">Type of connectivity:</td></tr><tr><td colspan="2">ELEM Connection is described with element identification numbers.</td></tr><tr><td colspan="2">GRID Connection is described with grid point identification numbers.</td></tr><tr><td>ES1</td><td colspan="2">(Character:“GRID”or“ELEM"; Default =“ELEM") Shell element identification number if TYPE =“ELEM". Shell grid point identification number if TYPE = “GRID". See Figure 9-153. (Integer > 0)</td></tr><tr><td>EA1</td><td colspan="2">Solid element identification number if TYPE = “ELEM". Solid grid point identification number if TYPE = “GRID". (Integer > 0)</td></tr><tr><td>EB1</td><td colspan="2"> Solid grid-point identification number for TYPE = “GRID" only. (Integer > O or blank)</td></tr><tr><td>ES2</td><td colspan="2"> Shell grid-point identification number for TYPE = “GRID" only. (Integer > O or blank)</td></tr><tr><td>EA2</td><td colspan="2"> Solid grid-point identification number for TYPE = “GRID" only. (Integer > O or blank)</td></tr><tr><td>EB2</td><td colspan="2"> Solid grid-point identification number for TYPE = “GRID” only. (Integer > O or blank)</td></tr></table></body></html>  

## Remarks:  

1. RSSCON generates a multipoint constraint that models a clamped connection between a shelland a solid element. The shell degrees-of-freedom are put in the dependent set (m-set). The translational degrees-of-freedom of the shell edge are connected to the translational degrees-of-freedom of the upper and lower solid edge. The two rotational degrees-of-freedom of the shell are connected to the translational degrees-of-freedom of the lower and upper edges of the solid element face. Poisson's ratio effects are considered in the translational degrees-of-freedom.  

2.The shellgrid point must lie on the line connecting the two solid grid points. It can have an offset from this line, which can not be more than $5\%$ of the distance between the two solid grid points. The shell grid points thatare out of the tolerance will not be constrained, anda fatal message willbe issued. This tolerance is adjustable. Please see PARAM,TOLRSC and PARAM,SEPIXOVR.  

3. When using the T $\mathrm{\langlePE=^{\infty}E I}$ LEM"option  

The elements may be p-elements or h-elements. The solid elements are CHEXA, CPENTA, and CTETRA with and without midside nodes. The shellelements are CQUAD4, CTRIA3, CQUADR, CTRIAR, CQUAD8, or CTRIA6. If the solid element has mid-side nodes, then the shell element needs mid-side nodes on the common edge.   
·In case of p-elements,the p-value of the shellelement edge is adjusted to the higher of the p-value of the upper or lower solid p-element edge. If one of the elements is an h-element, then the p-value of the adjacent edge is lowered to 1. Both the shell and solid elements have to belong to the same superelement. This restriction can be bypassed using SEELT entry to reassign the downstream boundary element to an upstream superelement. When a straight shellp-element edge and a solid p-element are connected, the geometry of the shell edge is not changed to fit the solid face. When a curved shell p-element edge and a solid p-element are connected, the two solid edges and solid face are not changed to match the shell edge.   
It is not recommended to connect more than one shellelement to the same solid using the ELEM option. If attempted, conflicts in the multipoint constraint relations may lead to UFM 6692.  

4. When using TYPI $\mathrm{E}={}^{\ast}\mathbf{\epsilon}$ GRID”option  

·The GRID option does not verify that the grids used are valid shell and/or solid grids.   
· The hierarchical degrees-of-freedom of p-element edges are not constrained. The GRID option is therefore not recommended for p-elements.   
The grids in the GRID option can be in different superelements. The shell grid must be in the upstream superelement.  

5.It is recommended that the height of the solid element's face is approximately equal to the shell element's thicknessof the shell. The shell edge should then be placed in the middle of the solid face.  

6. The shell edge may coincide with the upper or lower edge of the solid face.  

7. RSSCON, among other eligible rigid element types, can be selected via MPC and SET3.   
8. Forces of multipoint constraints may be recovered with the MPCFORCE Case Control command.   
9.The RSSCON is ignored in heat-transfer problems.Ifused in a multi-physics coupled problem using SUBSTEP, they participate in the mechanical substep but are ignored in the heat transfer subsstep through automatic deactivation. For more information on deactivation, see the DEACTEL keyword under the NLMOPTS Bulk Data entry and the associated Remark 9 for that entry.   
10.The m-set coordinates (shelldegrees-of-freedom) may not be specified on other entries that define mutuallv exclusive sets. See Dearee-of-Freedom Sets. 1111 for a list of these entries.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/3415474b14fab1106cccb695672c3c1b6e6b5a013237ea36977287854d9adda3.jpg)  
Figure 9-153 Shell Elements Connected to the Faces of Solid Elements  

Defines a rigid triangular plate.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>RTRPLT</td><td>EID</td><td>GA</td><td>GB</td><td>GC</td><td>CNA</td><td>CNB</td><td>CNC</td><td></td></tr><tr><td></td><td>CMA</td><td>CMB</td><td>CMC</td><td>ALPHA</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RTRPLT</td><td>7</td><td>1</td><td>2</td><td>3</td><td>1236</td><td>3</td><td>3</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. (O < Integer < 100,000,000)</td></tr><tr><td>GA, GB, GC</td><td>Grid point identification number of connection points.</td></tr><tr><td>CNA,CNB,CNC</td><td>Independent degrees-of-freedom in the global coordinate system for the element at grid points GA, GB, and GC, indicated by any of the Integers 1 through 6 with no embedded blanks. See Remark 3. (Integer ≥ O or blank)</td></tr><tr><td>CMA,CMB,CMC</td><td>Component numbers of dependent degrees-of-freedom in the global coordinate system. (Any of the Integers 1 through 6 with no embedded blanks, or O or blank.)</td></tr><tr><td>ALPHA</td><td>Thermal expansion coefficient. See Remark 12. (Real or blank)</td></tr></table></body></html>  

## Remarks:  

1. Two methods are available to process rigid elements: equation elimination or Lagrange multipliers. The Case Control command, RIGID, selects the method.   
2.For the Lagrange method, Nastran willcreate internally the Lagrange multiplier degrees-of-freedom in addition to the 18 displacement degrees-of-freedom given by grid points GA, GB, and GC. The number of Lagrange multiplier degrees-of-freedom is equal to the number of dependent degrees-offreedom.   
3.For thelinear method, the total number of components in CNA, CNB,and CNC must equal six; for example, $\mathrm{CNA}=1236$ ， $\mathrm{CNB}=3$ ， $\mathrm{CNC}=3$ . Furthermore, they must jointly be capable of representing any general rigid body motion of the element. For the Lagrange method, the total number of components must also be six. However, only $\mathrm{CNA}{=}123456$ or $\mathrm{CNB}=123456$ or CNC $=123456$ is allowed. For this type of element, RTRPLT1 gives a simpler input format.   
4.For the linear method, the dependent degrees-of-freedom willbe made members of the m-set.For the Lagrange method, they may or may not be members of the m-set, depending on the method selected on the RIGID Case Control command.However, the rules regarding the m-set described below apply to both types of methods.   
5. Dependent degrees-of-freedom assigned by one rigid element may not also be assigned dependent by another rigid element or by a multipoint constraint.   
6. Element identification numbers should be unique with respect to allother element identification numbers.   
7. RTRPLT, among other eligible rigid element types, can be selected via MPC and SET3.   
8.Forces of multipoint constraint may be recovered in allsolution sequences, except SOL 129, with the MPCFORCE Case Control command.   
9. Rigid elements are ignored in heat transfer problems. If used in a multi-physics coupled problem using SUBSTEP, they participate in the mechanical substep but are ignored in the heat transfer subsstep through automatic deactivation. For more information on deactivation, see the DEACTEL keyword under the NLMOPTS Bulk Data entry and the associated Remark 9 for that entry.   
10.See Rigid Elements and Multipoint Constraints (R-type,MPC)(p.155) in the MSC Nastran Reference Guide for a discussion of rigid elements.   
11. The m-set coordinates specified on this entry may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.   
12.For theLagrange method, the thermal expansion effect willbecomputed,if user supplies the thermal expansion coeffcient, ALPHA, and the thermal load is requested by the TEMPERATURE(INITIAL) and TEMPERATURE(LOAD) Case Control commands. The temperature of the element is defined as the following.the bar GA-GB willhave the average temperature ofgrid points GA and GB. The bar GA-GC will have the average temperature of the grid points GA and GC. There is no current entry fora TREF, so if TEMP(INIT) is not specified in Case Control, a reference temperature of O.O is used for the RTRPLT.  

Alternative format to define a rigid triangular plate element connecting three grid points.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>RTRPLT1</td><td>EID</td><td>GA</td><td>GB</td><td>GC</td><td>CMB</td><td>CMC</td><td>ALPHA</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RTRPLT1</td><td>7</td><td>1</td><td>2</td><td>3</td><td>1236</td><td>3</td><td>6.0-6</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Element identification number. (0 < Integer < 100,000,000)</td></tr><tr><td>GA, GB, GC</td><td>Grid point identification number of connection points. (Integer > 0)</td></tr><tr><td>CMB, CMC</td><td>Component numbers at GB and GC in the global coordinate systems, which are constrained to move with the rigid body. See Remark 4. (Integers 1 through 6 with no embedded blanks or blank.)</td></tr><tr><td>ALPHA</td><td>Thermal expansion coefficient. See Remark 9. (Real or blank)</td></tr></table></body></html>  

## Remarks:  

1. Two methods are available to process rigid elements: equation elimination or Lagrange multipliers. The Case Control command, RIGID, selects the method.   
2.For the Lagrange method, Nastran willcreate internally the Lagrange multiplier degrees-of-freedom in addition to the 18 displacement degrees-of-freedom given by grid points GA, GB, and GC. The number of Lagrange multiplier degrees-of-freedom is equal to the number of dependent degrees-offreedom.   
3. RTRPLT1 is a preferred input format for the Lagrange method.   
4.When $\mathrm{CMB}=^{\ast}123456^{\circ}$ or blank, $\mathrm{CMC}={}^{\cdots}123456^{\circ}$ or blank, the grid points GB and BC are constrained to move with GA as a rigid triangular plate. For default, $\mathrm{CMB}=^{\ast}123456^{\ast}$ and $\mathrm{CMC}=$ $^{\ast}123456^{\prime\prime}$ . Any number of degrees-of-freedom at grid points GB and GC can be released not to move with the rigid body.   
5. The length of any two connected grid points must be greater than zero.   
6. For the Lagrange method, the theory is formulated such that a consistent rigid body motion for grid points GA, GB, and GC willbe computed even if these three points have different global coordinate systems.   
7. For the Lagrange method, the thermal expansion effect will be computed,if user supplies the thermal expansion coefficient, ALPHA, and the thermal load is requested by the TEMPERATURE(INITIAL) and TEMPERATURE(LOAD) Case Control commands. The bar GA-GB will have the average temperature of grid points GA and GB. The bar GA-GC will have the average temperature of the grid points GA and GC. There is no current entry fora TREF, so if TEMP(INIT) is not specified in Case Control, a reference temperature of 0.O is used for the RTRPLT1.   
8. Element identification numbers should be unique with respect to allother element identification numbers.   
9.Rigid elements are ignored in heat transfer problems.If used in a multi-physics coupled problem using SUBSTEP, they participate in the mechanical substep but are ignored in the heat transfer subsstep through automatic deactivation. For more information on deactivation,see the DEACTEL keyword under the NLMOPTS Bulk Data entry and the associated Remark 9 for that entry.  

Specifies thedegrees-of-freedomwhere unitloadsareto beapplied toobtain staticsolutionsforuse in residual vector computations.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RVDOF</td><td>ID1</td><td>C1</td><td>ID2</td><td>C2</td><td>ID3</td><td>C3</td><td>ID4</td><td>C4</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RVDOF</td><td>800</td><td>1</td><td>850</td><td>2</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>IDi</td><td>Grid or scalar identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component numbers. (Any one of the integers 1 through 6 for grid points and integer zero or blank for scalar points)</td></tr></table></body></html>  

## Remarks:  

1. In multiple superelement analysis, the IDi points may be interior to any superelement. The program automaticaly partitions the data for allocation to the appropriate superelements. Separate entries for separate superelements are not required as in the case of USETi,U6 and SEUSETi,U6 entries.   
2. The unit loads applied to the interior points of a superelement due to the RVDOF/RVDOFl entries are passed downstream allthe way down to the residual for the purpose of residual vector processing by all superelements in its downstream path, resulting in more accurate results. This is in contrast to the way residual vector processing is performed when USETi,U6 or SEUSETi,U6 entries are employed. In the latter case, unit loads on a superelement are not passed downstream for residual vector processing by the downstream superelements.  

Specifies thedegrees-of-freedom where unitloadsare to be applied toobtain static solutions for use in residual vector computations.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>RVDOF1</td><td>C</td><td>ID1</td><td>ID2</td><td>ID3</td><td>ID4</td><td>ID5</td><td>ID6</td><td>ID7</td><td></td></tr><tr><td></td><td>ID8</td><td>ID9</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>RVDOF1</td><td>3</td><td>100</td><td>210</td><td>450</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Format and Example:  

<html><body><table><tr><td>RVDOF1</td><td>C</td><td>ID1</td><td>“THRU”</td><td>ID2</td><td></td><td></td><td></td><td></td></tr><tr><td>RVDOF1</td><td>12</td><td>6</td><td>THRU</td><td>21</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>C</td><td>Component numbers. (Any unique combination of the Integers 1 through 6 with no embedded blanks for grid points. This number must be Integer O or blank for scalar points.)</td></tr><tr><td>IDi</td><td>Grid or scalar identification numbers. (Integer > O or “THRU"; for“THRU" option, ID1 < ID2)</td></tr></table></body></html>  

## Remarks:  

1. In multiple superelement analysis, the IDi points may be interior to any superelement. The program automatically partitions the data for allocation to the appropriate superelements. Separate entries for separate superelements are not required as in the case of USETi,U6 and SEUSETi,U6 entries.   
2. The unit loads applied to the interior points of a superelement due to the RVDOF/RVDOFl entries are passed downstream allthe way down to the residual for the purpose of residual vector processing by all superelements in its downstream path, resulting in more accurate results. This is in contrast to the way residual vector processing is performed when USETi,U6 or SEUSETi,U6 entries are employed. In the latter case, unit loads on a superelement are not passed downstream for residual vector processing by the downstream superelements.   
3.If the alternate format is used, points in the sequence ID1 through ID2 are not required to exist. Points that do not exist will collectively produce a warning message but will otherwise be ignored.   
4. When alternative format is used, single point IDs cannot be specified.  

Defines automatic analytical contact threshold angle for multiple subcases in SOL 600 only.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SANGLE</td><td>IDC</td><td>IDB</td><td>Angle</td><td>IDC</td><td>IDB</td><td>Angle</td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SANGLE</td><td>1</td><td>4</td><td>50.0</td><td>1</td><td>6</td><td></td><td></td><td></td></tr><tr><td></td><td>2</td><td>4</td><td>-1.0</td><td>2</td><td>6 55.0</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>IDC</td><td>Identification number of a SUBCASE Case Control command. (Integer; no Default) To enter a value corresponding to Marc's increment zero, set IDC=0.</td></tr><tr><td>IDB</td><td>Identification of a contact body (must be the same as a BCBODY ID) (Integer; no Default)</td></tr><tr><td>Angle</td><td>Threshold automatic analytical contact angle (SANGLE). (Real; Default = 60.0) A value of -1.0 turns off analytical.</td></tr></table></body></html>  

## Remarks:  

1. This entry should only be made if IDSPL $_{,=1}$ and if SANGLE is a non-zero integer value on one or more BCBODY entry.   
2. This entry is available in SOL 600 only.   
3. For the example, BCBODY with id $\scriptstyle-4$ has a threshold angle of 50.0 degrees in subcase 1 and analytical contact is turned off in subcase 2. For bcbody ${\bf\bar{\rho}}=6$ , the analytical contact is on for subcaes 1 and 2 and the threshold angle is 60.0 degrees (the default) and 55.0 degrees for subcases 1 and 2 respectively.   
4.Only those contact bodies whose SANGLE changes from subcase to subcase or is turned on/off need be described here. Those with constant SANGLE may be described on the BCBODY entry.  

Defines a list of grid points in a partitioned superelement for the automatic boundary search between a specified superelement or between all other superelements in the model.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEBNDRY</td><td>SEIDA</td><td>SEIDB</td><td>GIDA1</td><td>GIDA2</td><td>GIDA3</td><td>GIDA4</td><td>GIDA5</td><td>GIDA6</td><td></td></tr><tr><td></td><td>GIDA7</td><td>GIDA8</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example 1:  

<html><body><table><tr><td>SEBNDRY</td><td>400</td><td>4</td><td>10</td><td>20</td><td>30</td><td>40</td><td></td><td></td><td></td></tr></table></body></html>  

## Example 2:  

<html><body><table><tr><td>SEBNDRY</td><td>400</td><td>ALL</td><td>10</td><td>20</td><td>30</td><td>THRU</td><td>40</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEIDA</td><td>Partitioned superelement identification number. (Integer > 0)</td></tr><tr><td>SEIDB</td><td>Superelement identification. See Remark 2. (Integer > O or Character “ALL"; Default = “ALL")</td></tr><tr><td>GIDAi</td><td>Identification number of a boundary grid point in superelement SEIDA. (Integer > 0 or“THRU"; For “THRU" option, G1 < G2.)</td></tr></table></body></html>  

## Remarks:  

1. SEBNDRY may only be specified in the main Bulk Data Section and is not recognized after the BEGIN SUPER $_{\cdot=\mathrm{n}}$ ， 2. SEIDB may reference partitioned superelements or superelements in the main Bulk Data Section.  

Defines boundary degrees-of-freedom to be fixed (b-set) during generalized dynamic reduction or component mode synthesis calculations.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEBSET</td><td>SEID</td><td>ID1</td><td>C1</td><td>ID2</td><td>C2</td><td>ID3</td><td>C3</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEBSET</td><td>5</td><td>2</td><td>135</td><td>14</td><td>6</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component number. (Any unique combination of the Integers 1 through 6 with no embedded blanks for grid points; Integer zero or blank for scalar points)</td></tr><tr><td>IDi</td><td>Grid or scalar point identification numbers. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. If there are no SECSETior SEBSETi entries present, allboundary points are, by default, fixed during component mode analysis. If only SEBSETi are entries present, any boundary degrees-of-freedom not listed are placed in the free boundary set (c-set). If both SEBSETi and SECSETi entries are present, the c-set degrees-of-freedom are defined by the SECSETi entries and any remaining boundary points are placed in the b-set.   
2. Degrees-of-freedom listed on SEBSETi entries must be exterior degrees-of-freedom of the superelement and may not be specified on SECSETi entries.   
3.Degrees-of-freedom specified on this entry form members of the mutually exclusive b-set. They may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets,1111 for a list of these entries.   
4.If PARAM,AUTOSPC is YES, then singular b-set and c-set degrees-of-freedom willbe reassigned as follows: · If there are no o-set (omitted) degrees-of-freedom, then singular b-set and c-set degrees-offreedom are reassigned to the s-set. If there are o-set (omitted) degrees-of-freedom, then singular c-set degrees-of-freedom are reassigned to the b-set. Singular b-set degrees-of-freedom are not reassigned.  

Defines boundary degrees-of-freedom to be fixed (b-set) during generalized dynamic reduction or component mode calculations.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEBSET1</td><td>SEID</td><td>C</td><td>G1</td><td>G2</td><td>G3</td><td>G4</td><td>G5</td><td>G6</td><td></td></tr><tr><td></td><td>G7</td><td>G8</td><td>G9</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEBSET1 5</td><td>2</td><td>135</td><td>14</td><td>6</td><td>23</td><td>24</td><td>25</td></tr><tr><td></td><td>122</td><td>127</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Format and Example:  

<html><body><table><tr><td>SEBSET1</td><td>SEID</td><td>C</td><td>G1</td><td>“THRU"</td><td>G2</td><td></td><td></td><td></td><td></td></tr><tr><td>SEBSET1</td><td>5</td><td>3</td><td>6</td><td>THRU</td><td>32</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. (Integer > 0)</td></tr><tr><td>C</td><td>Component number. (Any unique combination of the Integers 1 through 6 with no embedded blanks for grid points, O or blank for scalar points.)</td></tr><tr><td>Gi</td><td>Grid or scalar point identification numbers. (Integer > O or “THRU"; for THRU option G1 < G2.)</td></tr></table></body></html>  

## Remarks:  

1. Ifthere are no SECSETior SEBSETi entries present, allboundary points are, by default,fixed during component mode analysis. If there are only SEBSETi entries present, any boundary degrees-offreedom not listed are placed in the free boundary set (c-set). If there are both SEBSETi and SECSETi entries present, the c-set degrees-of-freedom are defined by the SECSETi entries, and any remaining boundary points are placed in the b-set.   
2. Degrees-of-freedom listed on SEBSETi entries must be exterior degrees-of-freedom of the superelement and may not be specified on SECSETi entries.   
3. Degrees-of-freedom specified on this entry form members of the mutually exclusive b-set. They may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.  

4.If PARAM,AUTOSPC is YES, then singular b-set and c-set degrees-of-freedom willbe reassigned as follows:  

If there are no o-set (omitted) degrees-of-freedom, then singular b-set and c-set degrees-offreedom are reassigned to the s-set. · If there are o-set (omitted) degrees-of-freedom, then singular c-set degrees-of-freedom are reassigned to the b-set. Singular b-set degrees-of-freedom are not reassigned.  

Defines superelement boundary search options and a repeated, mirrored, or collector superelement.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>SEBULK</td><td>SEID</td><td>TYPE</td><td>RSEID</td><td>METHOD</td><td>TOL</td><td>LOC</td><td>UNITNO</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEBULK</td><td>14</td><td>REPEAT</td><td>4</td><td>AUTO</td><td>1.0E-3</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td>SEID TYPE</td><td colspan="2">Partitioned superelement identification number. (Integer > O). See Remark 11.</td></tr><tr><td rowspan="7"></td><td colspan="2"> Superelement type. (Character; no Default)</td></tr><tr><td colspan="2">PRIMARY</td></tr><tr><td colspan="2">Primary. See Remarks 2. and 5. COLLCTR</td></tr><tr><td colspan="2">Collector. See Remark 3. EXTERNAL</td></tr><tr><td colspan="2">External. See Remarks 4. and 5. EXTOP2</td></tr><tr><td colspan="2">External using an OUTPUT2 file created in an earlier run. See Remarks 4. and 5.</td></tr><tr><td colspan="2">EXTOP4 External using an OUTPUT4 file created in an earlier run. See Remarks 4. and 5. Identical. See Remark 6.</td></tr><tr><td colspan="2">REPEAT</td></tr><tr><td colspan="2">MIRROR Mirror. See Remark 6.</td></tr><tr><td colspan="2">RSEID Identification number of the reference superelement, used only if TYPE =“REPEAT" or“MIRROR". (Integer ≥ O; Default = 0). See Remark 6.</td></tr><tr><td>METHOD</td><td rowspan="2">Method to be used when searching for boundary grid points. (Character: “AUTO" or “MANUAL"; Default = “AUTO"). See Remarks 7. and 8.</td></tr><tr><td rowspan="2">TOL = 10E-5). See Remarks 10. and 11.</td></tr><tr><td colspan="2"> Location tolerance to be used when searching for boundary grid points. (Real; Default</td></tr><tr><td>LOC</td><td colspan="2">Coincident location check option for manual connection option. (Character: “YES" or “NO"; Default = “YES"). See Remark 10.</td></tr><tr><td>UNITNO</td><td colspan="2">FORTRAN unit number for the OUTPUT2 or OUTPUT4 file (applicable and meaningful only when TYPE = “EXTOP2” or“EXTOP4"). See Remarks 4. and 5.</td></tr></table></body></html>  

## Remarks:  

1. This specification must be specified in the MAIN Bulk Data and is meaningful only if part superelements (using BEGIN SUPER) or external superelements created by employing the EXTSEOUT Case Control command exist in the data.  

2.TYPE $\mathbf{\Sigma}=\mathbf{\Sigma}$ PRIMARY indicates that the superelement is a part superelement (using BEGIN SUPER)  

3.TYPE $\mathbf{\sigma}=\mathbf{\sigma}$ "COLLCTR" indicates a collector superelement which does not contain any grids or scalar points.  

4.TYPE $\mathbf{\Sigma}=\mathbf{\Sigma}$ "EXTERNAL","EXTOP2" or "EXTOP4" indicates an external superelement created by employing the EXTSEOUT Case Control command in an earlier job. See discussion under the description of the EXTSEOUT Case Control command. (For employing external superelements using the old three-step procedure, see discussion under the description of parameter EXTDROUT in Chapter 5.)  

5. A superelement whose TYPE is "PRIMARY, "EXTERNAL" or "EXTOP2" may itself be repositioned by the use of an SELOC or an SEMPLN entry or both.  

If it references an SELOC entry, then the primary superelement will be positioned at the location implied by the SELOC entry.  

If it references an SEMPLN entry, then a mirror image of the primary superelement willbe positioned using the plane defined by the SEMPLN entry.  

If it references both an SELOC entry and an SEMPLN entry, then a mirror image of the primary superelement willfirst be created using the plane defined by the SEMPLN entry and then it will be positioned at the location implied by the SELOC entry.  

6. TYPE $\mathbf{\Sigma}=\mathbf{\Sigma}$ "REPEAT" and TYPE $\mathbf{\Sigma}=\mathbf{\Sigma}$ "MIRROR" have many common features, but they also have some important differences. These are described below.  

The following comments apply to both TYPE $\v{S}_{\cdot}=\v{S}_{\cdot}$ "REPEAT" and TYP $\mathrm{E}=\mathrm{"MIR}$ ROR":  

a. An SEID whose TYPE is "REPEAT" or "MIRROR" is referred to as a secondary superelement. The RSEID specified in this case is regarded as the primary superelement.   
b. The primary superelement must be either a part superelement or an external superelement created by employing the EXTSEOUT Case Control command in an earlier job. It must be defined via its own SEBULK entry wherein TYPE must be either "PRIMARY, "EXTERNAL" or "EXTOP2".   
c.The primary superelement does not include superelements upstream of the primary superelement.   
d. The primary superelement may be re-positioned as indicated in Remark 5.   
e. If the primary superelement specified by RSEID is a part superelement, then the secondary superelement is a "G-set" copy of the primary superelement. In this case, the boundary, loads, constraints and reduction procedure of the secondary superelement can be different from those of its primary superelement.   
f.If the primary superelement specified by RSEID is an external superelement resulting from the use of the EXTSEOUT Case Control command in an earlier job, then the secondary superelement is an "A-set" copy of the primary superelement. In this case, the boundary, loads, constraints and reduction procedure of the secondary superelement are set and are the same as those of its primary superelement.  

The following comments apply only to TYPE $\c=$ "REPEAT":  

g. The secondary superelement in this case may reference an SELOC entry, an SEMPLN entry or both or none.  

If it references an SELOC entry, then an identical copy of its primary superelement will be positioned at the location implied by the SELOC entry.   
If it references an SEMPLN entry, then a mirror image copy of the primary superelement will be positioned using the plane defined by the SEMPLN entry.   
If it references both an SELOC entry and an SEMPLN entry, then a mirror image copy of the primary superelement will first be created using the plane defined by the SEMPLN entry and then it will be positioned at the location implied by the SELOC entry.   
If it references neither an SELOC entry nor an SEMPLN entry, then the secondary superelement will merely be a duplicate of the primary superelement positioned at the same location as the primary superelement. This usage is extremely uncommon. Hence the program cautions the user about this usage by issuing a user warning message.  

The following comments apply only to TYPE $\v{S}_{\v{r}}=$ "MIRROR":  

h. The secondary superelement in this case must reference an SEMPLN entry. (Otherwise, the program willterminate the execution with an appropriate user fatal messge.) In addition, the secondary superelement may also reference an SELOC entry. If the secondary superelement references only an SEMPLN entry, then a mirror image copy of the primary superelement will be positioned using the plane defined by the SEMPLN entry. If it references both an SELOC entry and an SEMPLN entry, then a mirror image copy of the primary superelement willfirst be created using the plane defined by the SEMPLN entry and then it will be positioned at the location implied by the SELOC entry. 7. METHOD $\mathbf{\Sigma}=\mathbf{\Sigma}$ “MANUAL” requires SECONCT entries. SEBNDRY and SEEXCLD,which reference SEID, will produce a fatal message. 8. SECONCT, SEBNDRY, and SEEXCLD entries can be used to augment the search procedure and/or override the global tolerance. 9. For combined automatic and manual boundary search, the METHOD $\mathbf{\Sigma}=\mathbf{\Sigma}$ "AUTO" should be specified and connections should be specified on a SECONCT entry. 10. TOL and LOC are the default values that can be modified between two superelements by providing the required tolerance on the SECONCT entry. 11．A SEID $_{=0}$ is valid for the residual part only if it is desired to set a TOL value for the residual.  

Explicitly defines grid and scalar point connection procedures for a partitioned superelement  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>SECONCT</td><td>SEIDA</td><td>SEIDB</td><td>TOL</td><td>LOC</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>GIDA1</td><td>GIDB1</td><td>GIDA2</td><td>GIDB2</td><td>GIDA3</td><td>GIDB3</td><td>-etc.-</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SECONCT</td><td>10</td><td>20</td><td>1.0E-4 YES</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>1001</td><td>4001</td><td></td><td>2222</td><td>4444</td><td></td><td></td></tr></table></body></html>  

## Alternate Format and Example  

<html><body><table><tr><td>SECONCT</td><td>SEIDA</td><td>SEIDB</td><td>TOL</td><td>LOC</td><td></td><td></td><td></td></tr><tr><td></td><td>GIDA1</td><td>THRU'</td><td>GIDA2</td><td>GIDB1</td><td>THRU' GIDB2</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>SECONCT</td><td>10 20</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>101</td><td>THRU'</td><td>110 201</td><td>“THRU'</td><td>210</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEIDA</td><td>Identification number of superelement for connection to SEIDB. (Integer ≥ 0)</td></tr><tr><td>SEIDB</td><td>Identification number of superelement for connection to SEIDA. (Integer ≥ 0)</td></tr><tr><td>TOL</td><td>Location tolerance to be used when searching for or checking boundary grid points. (Real; Default = 10E-5)</td></tr><tr><td>LOC</td><td>Coincident location check option for manual connection. (Character; “YES”or“NO”; Default = “YES")</td></tr><tr><td>GIDAi</td><td>Identification number of a grid or scalar point in superelement SEIDA, which will be connected to GIDBi.</td></tr><tr><td>GIDBi</td><td>Identification number of a grid or scalar point in superelement SEIDB, which will be connected to GIDAi.</td></tr></table></body></html>  

## Remarks:  

1. SECONCT can only be specified in the main Bulk Data Section and willcause a fatal error messag   
if it appears after the BEGIN SUPER $\mathbf{\tau}=\mathbf{n}$ command.   
2. TOL and LOC can be used to override the default values specified on the SEBULK entries.   
3. The continuation entry is optional.   
4. The (GIAi, GIBi) pair must both be grids or scalar points.  

5. All six degrees-of-freedom of grid points willbe defined as boundary degrees-of-freedom.   
6. This entry will only work if PART superelements (BEGIN SUPER) exist.   
7.Blank fields are allowed after the first GIDAl-GIDBl pair.Blank fields must also occur in pairs. This remark does not apply to the alternate format.   
8.For Alternate Format 1, the thru ranges must be closed sets. That is, all IDs listed between 10l and 110 in the example must exist in the model.  

Defines boundary degrees-of-freedom to befree (c-set) during generalized dynamic reduction or component mode synthesis calculations.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SECSET</td><td>SEID</td><td>ID1</td><td>C1</td><td>ID2</td><td>C2</td><td>ID3</td><td>C3</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SECSET</td><td>3</td><td>124</td><td>1</td><td>5</td><td>23</td><td>6</td><td>15</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component numbers. (Any unique combination of the Integers 1 through 6 with no embedded blanks for grid points; Integer O or blank for scalar points.)</td></tr><tr><td>IDi</td><td>Grid or scalar point identification number. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. Exterior grid and scalar points are, by default, fixed during component mode analysis and placed in the b-set unless listed on SECSETi or SESUP entries. Coordinates listed on this entry are considered free (c-set) during component mode calculations. Exterior grid and scalar points are determined by the program and listed in the SEMAP table output.   
2.Degrees-offreedom specified on this entry are assigned to the mutually exclusive c-set. They may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets,111 fora list of these entries.   
3.There must be a sufficient number of degrees-of-freedom specified on SESUP entries to discard any free body modes of the superelement.   
4.If PARAM,AUTOSPC is YES, then singular b-set and c-set degrees-of-freedom willbe reassigned as follows: If there are no o-set (omitted) degrees-of-freedom, then singular b-set and c-set degrees-offreedom are reassigned to the s-set. If there are o-set (omitted) degrees-of-freedom, then singular c-set degrees-of-freedom are reassigned to the b-set. Singular b-set degrees-of-freedom are not reassigned.  

Defines boundary degrees-of-freedom to befree (c-set) during generalized dynamic reduction or component mode synthesis calculations.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SECSET1</td><td>SEID</td><td>C</td><td>G1</td><td>G2</td><td>G3</td><td>G4</td><td>G5</td><td>G6</td><td></td></tr><tr><td></td><td>G7</td><td>G8</td><td>G9</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SECSET1</td><td>5</td><td>2</td><td>135</td><td>14</td><td>6</td><td>23</td><td>24</td><td>25</td><td></td></tr><tr><td></td><td>122</td><td>127</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Formats and Example:  

<html><body><table><tr><td>SECSET1 SEID</td><td>C</td><td>G1</td><td>“THRU"</td><td>G2</td><td></td><td></td><td></td><td></td></tr><tr><td>SECSET1 5</td><td>3</td><td>6</td><td>THRU</td><td>32</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>SECSET1</td><td>SEID</td><td>“ALL”</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>SECSET1</td><td>SEID</td><td>ALL</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. (Integer > 0)</td></tr><tr><td>C</td><td>Component numbers of degree-of-freedoms. (Any unique combination of the Integers 1 through 6 with no embedded blanks for grid points; Integer O or blank for scalar points.)</td></tr><tr><td>Gi</td><td>Grid or scalar point identification number. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. Exterior grid and scalar points are, by default,fixed during component mode analysis and placed in the b-set unless listed on SECSETi or SESUP entries. Degrees-of-freedom listed on this entry are considered free (c-set) during component mode calculations. Exterior grid and scalar points are determined automatically and listed in the SEMAP table output.   
2.If the alternate formats are used, the grid points Giare not required to exist or to beexterior degreesof-freedom and may be listed on SECSET1 entries. Points of this type will cause one warning message but will otherwise be ignored.   
3.Degrees-of-freedom specified on this entry are assigned to the mutually exclusive c-set. They may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets,111 fora list of these entries.  

4. There must be a sufficient number of degrees-of-freedom specified on SESUP entries to discard any free body modes of the superelement.  

5. If PARAM,AUTOSPC is YES,then singular b-set and c-set degrees-of-freedom willbe reassigned as follows:  

If there are no o-set (omitted) degrees-of-freedom, then singular b-set and c-set degrees-offreedom are reassigned to the s-set. ● If there are o-set (omitted) degrees-of-freedom, then singular c-set degrees-of-freedom are reassigned to the b-set. Singular b-set degrees-of-freedom are not reassigned.  

Defines a sector of a conical shell.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7 8</td><td>9 10</td></tr><tr><td>SECTAX</td><td>ID</td><td>RID</td><td>R</td><td>PHI1</td><td>PH12</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SECTAX</td><td>1</td><td>2</td><td>3.0</td><td>30.0</td><td>40.0</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Sector identification number. (Unique Integer > 0)</td></tr><tr><td>RID</td><td>Ring identification number. See RINGAX entry. (Integer > 0)</td></tr><tr><td>R</td><td>Effective radius. (Real)</td></tr><tr><td>PHI1, PHI2</td><td>Azimuthal limits of sector in degrees. (Real)</td></tr></table></body></html>  

## Remarks:  

1. SECTAX is allowed only if an AXIC entry is also present.   
2. SECTAX identification numbers must be unique with respect to allother POINTAX, RINGAX and SECTAX identification numbers.   
3.For a discussion of the conical shell problem, seeConical ShellElement (RlNGAX) (p. 145) in the MSC Nastran Reference Guide.  

Relates one design variable of a PART SE to one or more other design variables from other PART SEs.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEDLINK</td><td>ID</td><td>DSEID</td><td>DDVID</td><td>C0</td><td>CMULT</td><td>ISEID1</td><td>IDV1</td><td>C1</td><td></td></tr><tr><td></td><td>ISEID2</td><td>IDV2</td><td>C2</td><td>ISEID3</td><td>IDV3</td><td>C3</td><td></td><td></td><td></td></tr><tr><td></td><td>ISEID4</td><td>IDV4</td><td>C4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEDLINK</td><td>10</td><td>10</td><td>2</td><td>0.1</td><td>0.33</td><td>8</td><td>8</td><td>-1.0</td><td></td></tr><tr><td></td><td>11</td><td>6</td><td>-1.0</td><td>20</td><td>8</td><td>7.0</td><td></td><td></td><td></td></tr><tr><td></td><td>11</td><td>2</td><td>2.0</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Unique identification number. (Integer > 0)</td></tr><tr><td>DSEID</td><td>PART SE identification number for DDVID (Integer ≥ 0)</td></tr><tr><td>DDVID</td><td>Dependent design variable identification number. (Integer > 0)</td></tr><tr><td>C0</td><td>Constant term. (Real; Default = 0.0)</td></tr><tr><td>CMULT</td><td>Constant multiplier. (Real; Default = 1.0)</td></tr><tr><td>ISEIDi</td><td> PART SE identification number for IDVi (Integer ≥ 0)</td></tr><tr><td>IDVi</td><td>Independent design variable identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Coefficient i corresponding to IDVi. (Real)</td></tr></table></body></html>  

## Remarks:  

1. SEDLINK is provided for inter-PART SE design variables linking and must be placed in main Bulk Data Section for consideration. SEDLINK will be ignored if it shows up under BEGIN SUPER $\v{x}=$ seid’ where seid ${>}0$  

2. SEDLINK defines the relationship  

$$
D D V I D=C0+C M U L T\sum_{i}C i_{I S E I D i}\cdot I D V i_{I S E I D i}
$$  

3. This capability provides a means of linking physical design variables such as element thicknesses to nonphysical design variables such as the coefficients of interpolating functions.  

4. CMULT provides a simple means of scaling the $C i$ For example if $C i=1/7,2/7,4/7$ , etc. is desired, then $C M U L T=1/7$ and $C i=1,2,4$ , etc., may be input.  

5. An independent $I D V i_{I S E I D i}$ must not occur on the same SEDLINK entry more than once.   
6. ID is for user reference only   
7. If a design variable ofa PART SE is specified as dependent on a SEDLINK entry, then it cannot be specified as independent on another SEDLINK or DLINK entry.  

Defines equation responses that are used in thedesign,either as constraints or as an objective with quantities from multiple PART SEs.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>５</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEDRSP2</td><td>ID</td><td>LABEL</td><td>EQID or FUNC</td><td>REGION</td><td>METHOD</td><td>C1</td><td>C2</td><td>C3</td><td></td></tr><tr><td></td><td>“DESVAR”</td><td>DVSEID1</td><td>DVID1</td><td>DVSEID2</td><td>DVID2</td><td>DVSEID3</td><td>DVID3</td><td></td><td></td></tr><tr><td></td><td></td><td>DVSEID4</td><td>DVID4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DTABLE”</td><td>LBSEID1</td><td>LABL1</td><td>LBSEID2</td><td>LABL2</td><td>LBSEID3</td><td>LABL3</td><td></td><td></td></tr><tr><td></td><td></td><td>LBSEID4</td><td>LABL4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DRESP1”</td><td>R1SEID1</td><td>NR1</td><td>R1SEID2</td><td>NR2</td><td>R1SEID3</td><td>NR3</td><td></td><td></td></tr><tr><td></td><td></td><td>R1SEID4</td><td>NR4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DNODE”</td><td>NDSEID1</td><td>G1</td><td>CMP1</td><td>NDSEID2</td><td>G2</td><td>CMP2</td><td></td><td></td></tr><tr><td></td><td></td><td>NDSEID3</td><td>G3</td><td>CMP3</td><td>-etc.-</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DVPREL1</td><td>P1SEID1</td><td>DPIP1</td><td>P1SEID2</td><td>DPIP2</td><td>P1SEID3</td><td>DPIP3</td><td></td><td></td></tr><tr><td></td><td></td><td>P1SEID4</td><td>DPIP4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DVCREL1”</td><td>C1SEID1</td><td>DCIC1</td><td>C1SEID2</td><td>DCIC2</td><td>C1SEID3</td><td>DCIC3</td><td></td><td></td></tr><tr><td></td><td></td><td>C1SEID4</td><td>DCIC4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DVMREL1 ”</td><td>M1SEID1</td><td>DMIM1</td><td>M1SEID2</td><td>DMIM2</td><td>M1SEID3</td><td>DMIM3</td><td></td><td></td></tr><tr><td></td><td></td><td>M1SEID4</td><td>DMIM4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DVPREL2”</td><td>P2SEID1</td><td>PDI2P1</td><td>P2SEID2</td><td>DPI2P2</td><td>P2SEID3</td><td>DPI2P3</td><td></td><td></td></tr><tr><td></td><td></td><td>P2SEID4</td><td>DPI2P4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DVCREL2”</td><td>C2SEID1</td><td>DC12C1</td><td>C2SEID2</td><td>DC12C2</td><td>C2SEID3</td><td>DC12C3</td><td></td><td></td></tr><tr><td></td><td></td><td>C2SEID4</td><td>DCI2C4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>"DVMREL2 ”</td><td>M2SEID1</td><td>DM12M1</td><td>M2SEID2</td><td>DMI2M2</td><td>M2SEID3</td><td>DM12M3</td><td></td><td></td></tr><tr><td></td><td></td><td>M2SEID4</td><td>DMI2M4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEDRSP2</td><td>1</td><td>LBUCK</td><td>5</td><td>3</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>DESVAR</td><td>0</td><td>101</td><td>1</td><td>3</td><td>1</td><td>４</td><td></td></tr><tr><td></td><td></td><td>10</td><td>201</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>DTABLE</td><td>1</td><td>YM</td><td>10</td><td>L</td><td></td><td></td><td></td></tr><tr><td></td><td>DRESP1</td><td>0</td><td>14</td><td>1</td><td>1</td><td>1</td><td>4</td><td></td></tr><tr><td></td><td>DNODE</td><td>10</td><td>14</td><td>0</td><td>1</td><td></td><td></td><td></td></tr><tr><td></td><td>DVPREL1</td><td>0</td><td>101</td><td>1</td><td>102</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td></td><td>DVCREL1</td><td>1</td><td>201</td><td>10</td><td>202</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>DVMREL1</td><td>0</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>DVPREL2</td><td>10</td><td>301 401</td><td>1</td><td>402</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>DVCREL2</td><td>0</td><td>501</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>DVMREL2</td><td>0</td><td>601</td><td>1</td><td>602</td><td>10</td><td>603</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Unique identification number. (Integer > 0)</td></tr><tr><td>LABEL</td><td>User-defined label. (Character)</td></tr><tr><td>EQID</td><td>DEQATN entry identification number. (Integer > 0)</td></tr><tr><td>FUNC</td><td>Function to be applied to the arguments. See Remark 8. of the DRESP2 entry. (Character)</td></tr><tr><td>REGION</td><td>Region identifier for constraint screening. See Remark 5. of the DRESP2 entry. (Integer > 0)</td></tr><tr><td>METHOD</td><td>When used with FUNC = BETA, METHOD = MIN indicates a minimization task while MAX indicates a maximization task. (Default = MIN) When used with FUNCT = MATCH, METHOD = LS indicated a least squares while METHOD = BETA indicated minimization of the maximum difference. (Default = LS)</td></tr><tr><td>Ci</td><td>Constants used when FUNC = BETA or FUNC = MATCH in combination with METHOD = BETA. See Remark 8. of the DRESP2 entry. (Real; Defaults: C1 = 100., C2 = .005)</td></tr><tr><td>“DESVAR”</td><td>Flag indicating DESVAR entry identification numbers. (Character)</td></tr><tr><td>DVSEIDi</td><td>PART SE identification number for DVIDi (Integer ≥ 0)</td></tr><tr><td>DVIDi “DTABLE”</td><td>DESVAR entry identification number. (Integer > 0) DTABLE flag. Indicates that the LABLs for the constants in a DTABLE or</td></tr><tr><td></td><td>DTABLE2 entry follow. This field may be omitted if there are no constants involved in this relation. (Character)</td></tr><tr><td>LBSEIDj LABLi</td><td>PART SE identification number for LABLj. (Integer ≥ 0)</td></tr><tr><td></td><td> Label for a constant on the DTABLE or DTABLE2 entry. (Character)</td></tr><tr><td>“DRESP1”</td><td>Flag indicating DRESP1 entry identification numbers. (Character)</td></tr><tr><td>R1SEIDk</td><td>PART SE identification number for NRk. (Integer ≥ 0)</td></tr><tr><td>NRk</td><td>DRESP1 entry identification number. (Integer > 0)</td></tr><tr><td>“DNODE”</td><td> Flag indicating grid point and component identification numbers. (Character)</td></tr><tr><td>NDSEIDm</td><td>PART SE identification number for (Gm,Cm). (Integer ≥ 0)</td></tr><tr><td>Gm</td><td>Identification number for any grid point in the model. (Integer > 0)</td></tr><tr><td>Cm</td><td>Component number of grid point Gm. (1 < Integer < 3)</td></tr><tr><td>“DVPREL1”</td><td>Flag indicating DVPREL1 entry identification number. (Character)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>P1SEIDi</td><td> PART SE identification number for DPIPi. (Integer ≥ 0)</td></tr><tr><td>DPIPi</td><td>DVPREL1 entry identification number. (Integer > 0)</td></tr><tr><td>“DVCREL1”</td><td>Flag indicating DVCREL1 entry identification number. (Character)</td></tr><tr><td>C1SEIDi</td><td> PART SE identification number for DCICi. (Integer ≥ 0)</td></tr><tr><td>DCICi</td><td>DVCRELl entry identification number. (Integer > 0)</td></tr><tr><td>“DVMREL1”</td><td>Flag indicating DVPREL2 entry identification number. (Character)</td></tr><tr><td>M1SEIDi</td><td> PART SE identification number for DMIMi. (Integer ≥ 0)</td></tr><tr><td>DMIMi</td><td>DVMREL1 entry identification number. (Integer > 0)</td></tr><tr><td>“DVPREL2"</td><td> Flag indicating DVPREL2 entry identification number. (Character)</td></tr><tr><td>P2SEIDi</td><td> PART SE identification number for DPI2Pi. (Integer ≥ 0)</td></tr><tr><td>DPI2Pi</td><td>DVPREL2 entry identification number. (Integer > 0)</td></tr><tr><td>“DVCREL2”</td><td> Flag indicating DVCREL2 entry identification number. (Character)</td></tr><tr><td>C2SEIDi</td><td>PART SE identification number for DCI2Ci. (Integer ≥ 0)</td></tr><tr><td>DCI2Ci</td><td>DVCREL2 entry identification number. (Integer > 0)</td></tr><tr><td>“DVMREL2"</td><td>Flag indicating DVMREL2 entry identification number. (Character)</td></tr><tr><td>M2SEIDi</td><td>PART SE identification number for DMI2Mi. (Integer ≥ 0)</td></tr><tr><td>DMI2Mi</td><td>DVMREL2 entry identification number. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. SEDRSP2 is provided specifically for creating synthetic response with quantities from multiple PART SEs and must be placed in main bulk data section for consideration. SEDRSP2 willbe ignored if it shows up under‘BEGIN SUPER $\v{x}=$ seid' where seid ${>}0$ ，   
2. Items under DTABLE and DNODE flag requires companion items in the same SEID under flags of DESVAR. DVxRELy or DRESP1.   
3.Other than theleadingPART SE ID for each quantity, SEDRSP2 follows rules and shares limitations of DRESP2. Rules and limitations of DRESP2 will not be repeated here.   
4. SEDRSP2 does not support DRESP2 flag.  

Defines constituents from multiple PART SE for an external response using user-supplied routine(s).  

# Format:  

Example:   


<html><body><table><tr><td>１</td><td>2</td><td>3</td><td>4</td><td>5</td><td>６</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEDRSP3</td><td>ID</td><td>LABEL</td><td>GROUP</td><td>TYPE</td><td>REGION</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DESVAR”</td><td>DVSEID1</td><td>DVID1</td><td>DVSEID2</td><td>DVID2</td><td>DVSEID3</td><td>DVID3</td><td></td><td></td></tr><tr><td></td><td></td><td>DVSEID4</td><td>DVID4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DTABLE”</td><td>LBSEID1</td><td>LABL1</td><td>LBSEID2</td><td>LABL2</td><td>LBSEID3</td><td>LABL3</td><td></td><td></td></tr><tr><td></td><td></td><td>LBSEID4</td><td>LABL4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DRESP1</td><td>R1SEID1</td><td>NR1</td><td>R1SEID2</td><td>NR2</td><td>R1SEID3</td><td>NR3</td><td></td><td></td></tr><tr><td></td><td></td><td>R1SEID4</td><td>NR4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DNODE”</td><td>NDSEID1</td><td>G1</td><td>CMP1</td><td>NDSEID2</td><td>G2</td><td>CMP2</td><td></td><td></td></tr><tr><td></td><td></td><td>NDSEID3</td><td>G3</td><td>CMP3</td><td>-etc.-</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DVPREL1”</td><td>P1SEID1</td><td>DPIP1</td><td>P1SEID2</td><td>DPIP2</td><td>P1SEID3</td><td>DPIP3</td><td></td><td></td></tr><tr><td></td><td></td><td>P1SEID4</td><td>DPIP4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DVCREL1”</td><td>C1SEID1</td><td>DCIC1</td><td>C1SEID2</td><td>DCIC2</td><td>C1SEID3</td><td>DCIC3</td><td></td><td></td></tr><tr><td></td><td></td><td>C1SEID4</td><td>DCIC4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>"DVMREL1:</td><td>M1SEID1</td><td>DMIM1</td><td>M1SEID2</td><td>DMIM2</td><td>M1SEID3</td><td>DMIM3</td><td></td><td></td></tr><tr><td></td><td></td><td>M1SEID4</td><td>DMIM4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DVPREL1”</td><td>P2SEID</td><td>DPI2P1</td><td>P2SEID2</td><td>DPI2P2</td><td>P2SEID3</td><td>DPI2P3</td><td></td><td></td></tr><tr><td></td><td></td><td>P2SEID4</td><td>DPI2P4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DVCREL2”</td><td>C2SEID1</td><td>DC12C1</td><td>C2SEID2</td><td>DCI2C2</td><td>C2SEID3</td><td>DCI2C3</td><td></td><td></td></tr><tr><td></td><td></td><td>C2SEID4</td><td>DCI2C4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DVMREL2</td><td>M2SEID</td><td>DMI2M1</td><td>M2SEID2</td><td>DMI2M2</td><td>M2SEID3</td><td>DMI2M3</td><td></td><td></td></tr><tr><td></td><td></td><td>M2SEID4</td><td>DMI2M4</td><td>-etc.-</td><td>String</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“USRDATA"</td><td colspan="7"></td><td></td></tr><tr><td></td><td></td><td colspan="7">-etc.-</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>SEDRSP3 10</td><td>LBUCK</td><td>TAILWING</td><td>BUCK</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>DESVAR</td><td>0</td><td>101</td><td>1</td><td>3</td><td>1</td><td>4</td><td></td><td></td></tr><tr><td></td><td>10</td><td>201</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>DTABLE</td><td>1</td><td>YM</td><td>10</td><td>L</td><td></td><td></td><td></td><td></td></tr><tr><td>DRESP1</td><td>0</td><td>14</td><td>1</td><td>1</td><td>1</td><td>4</td><td></td><td></td></tr><tr><td>DNODE</td><td>10</td><td>14</td><td>0</td><td>1</td><td></td><td></td><td></td><td></td></tr><tr><td>DVPREL1</td><td>0</td><td>101</td><td>1</td><td>102</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td></td><td>DVCREL1</td><td>1</td><td>201</td><td>10</td><td>202</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>DVMREL1</td><td>0</td><td>301</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>DVPREL2</td><td>10</td><td>401</td><td>1</td><td>402</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>DVCREL2</td><td>0</td><td>501</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>DVMREL2</td><td>0</td><td>601</td><td>1</td><td>602</td><td>10</td><td>603</td><td></td><td></td></tr><tr><td></td><td>USRDATA</td><td colspan="7">Constants: 12345.6789.0 99.</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Unique identification number. (Integer > 0)</td></tr><tr><td>LABEL</td><td>User-defined label. (Character)</td></tr><tr><td>GROUP</td><td>Group name the external response type belongs to (Character). See Remark 2. of DRESP3.</td></tr><tr><td>TYPE</td><td>External response type (Character). See Remark 3. of the DRESP3.</td></tr><tr><td>“DESVAR”</td><td>Flag indicating DESVAR entry identification numbers. (Character)</td></tr><tr><td>DVSEIDi</td><td>PART SE identification number for DVIDi. (Integer ≥ 0)</td></tr><tr><td>DVIDi</td><td>DESVAR entry identification number. (Integer > 0)</td></tr><tr><td>“DTABLE”</td><td>DTABLE flag. Indicates that the LABLs for the constants in a DTABLE or DTABLE2 entry follow. This field may be omitted if there are no constants involved</td></tr><tr><td>LBSEIDj</td><td>in this relation. (Character) PART SE identification number for LABLj. (Integer ≥ 0)</td></tr><tr><td>LABLi</td><td> Label for a constant on the DTABLE or DTABLE2 entry. (Character)</td></tr><tr><td>“DRESP1”</td><td>Flag indicating DRESPl entry identification numbers. (Character)</td></tr><tr><td>R1SEIDk</td><td>PART SE identification number for NRk. (Integer ≥ 0)</td></tr><tr><td>NRk</td><td>DRESP1 entry identification number. (Integer > 0)</td></tr><tr><td>“DNODE”</td><td>Flag indicating grid point and component identification numbers. (Character)</td></tr><tr><td>NDSEIDm</td><td>PART SE identification number for (Gm,Cm). (Integer ≥ 0)</td></tr><tr><td>Gm</td><td>Identification number for any grid point in the model. (Integer > 0)</td></tr><tr><td>Cm</td><td>Component number of grid point Gm. (1 < Integer < 3)</td></tr><tr><td>“DVPREL1”</td><td>Flag indicating DVPREL1 entry identification number. (Character)</td></tr><tr><td>P1SEIDi</td><td>PART SE identification number for DPIPi. (Integer ≥ 0)</td></tr><tr><td>DPIPi</td><td>DVPREL1 entry identification number. (Integer > 0)</td></tr><tr><td>“DVCREL1”</td><td>Flag indicating DVCREL1 entry identification number. (Character)</td></tr><tr><td>C1SEIDi</td><td>PART SE identification number for DCICi. (Integer ≥ 0)</td></tr><tr><td>DCICi</td><td>DVCREL1 entry identification number. (Integer > 0)</td></tr><tr><td>“DVMREL1”</td><td>Flag indicating DVPREL2 entry identification number. (Character)</td></tr><tr><td>M1SEIDi</td><td>PART SE identification number for DMIMi. (Integer ≥ 0)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>DMIMi</td><td>DVMRELl entry identification number. (Integer > 0)</td></tr><tr><td>“DVPREL2”</td><td>Flag indicating DVPREL2 entry identification number. (Character)</td></tr><tr><td>P2SEIDi</td><td> PART SE identification number for DPI2Pi. (Integer ≥ 0)</td></tr><tr><td>DPI2Pi</td><td>DVPREL2 entry identification number. (Integer > 0)</td></tr><tr><td>“DVCREL2”</td><td> Flag indicating DVCREL2 entry identification number. (Character)</td></tr><tr><td>C2SEIDi</td><td> PART SE identification number for DCI2Ci. (Integer ≥ 0)</td></tr><tr><td>DCI2Ci</td><td>DVCREL2 entry identification number. (Integer > 0)</td></tr><tr><td>“DVMREL2”</td><td>Flag indicating DVMREL2 entry identification number. (Character)</td></tr><tr><td>M2SEIDi</td><td>PART SE identification number for DMI2Mi. (Integer ≥ 0)</td></tr><tr><td>DMI2Mi</td><td>DVMREL2 entry identification number. (Integer > 0)</td></tr><tr><td>“USRDATA"</td><td>Flag indicating user input data. (Character).</td></tr></table></body></html>  

## Remarks:  

1. SEDRSP3 is provided specificall for creating external response with quantities from multiple PART SEs and must be placed in main Bulk Data Section for consideration. SEDRSP3 willbe ignored if it shows up under ‘BEGIN SUPER ${\boldsymbol{\mathbf{\mathit{\sigma}}}}_{=}$ seid' where seid>0.   
2. Items under DTABLE and DNODE flag requires companion items in the same SEID under flags of DESVAR.DVxRELy or DRESP1.   
3.Other than theleading PART SE ID for each quantity, SEDRSP3 follows rules and shares limitations of DRESP3. Rules and limitations of DRESP3 will not be repeated here.   
4. SEDRSP3 does not support DRESP2 flag.  

Reassigns superelement boundary elements to an upstream superelement.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEELT</td><td>SEID</td><td>EID1</td><td>EID2</td><td>EID3</td><td>EID4</td><td>EID5</td><td>EID6</td><td>EID7</td><td></td></tr><tr><td></td><td>EID8</td><td>EID9</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEELT</td><td>2</td><td>147</td><td>562</td><td>937</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Format and Example:  

<html><body><table><tr><td>SEELT</td><td>SEID</td><td>EID1</td><td>“THRU”</td><td>EID2</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>SEELT</td><td>5</td><td>12006</td><td>THRU</td><td>12050</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. See Remark 7. (Integer > 0)</td></tr><tr><td>EIDi</td><td>Element identification numbers. (Integer > O or“THRU"; for“THRU"option EID1 < EID2.)</td></tr></table></body></html>  

## Remarks:  

1. Elements connected entirely to the exterior points ofan upstream superelement are called boundary elements and are assgned to the downstream superelement. The SEELT entry provides the means of reassigning the element to the upstream superelement. This entry may be applied to boundary elements only.   
2. Open sets are allowed with the“THRU" option.   
3. Elements processed with primary superelements will also be contained in any referencing secondary superelement.   
4. EIDi may refer to plot elements, general elements, and structural elements.   
5. This entry does not change the exterior grid point set of the superelement.   
6. SEELT can only be specified in the main Bulk Data Section and is ignored after the BEGIN SUPER $_{\cdot=\mathrm{n}}$ command.   
7. If the model contains a BEGIN SUPER, the SEELT entry will assign the specified elements to the SEID (not just the boundary elements). This is an alternative to using SESET. In this case, $S_{\mathrm{EID}}=0$ is a valid entry. For further information, refer to the MSc Nastran Reference Manual.  

Defines grids that will be excluded during the attachment of a partitioned superelement.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEEXCLD</td><td>SEIDA</td><td>SEIDB</td><td>GIDA1</td><td>GIDA2</td><td>GIDA3</td><td>GIDA4</td><td>GIDA5</td><td>GIDA6</td><td></td></tr><tr><td></td><td>GIDA7</td><td>GIDA8</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example1:  

<html><body><table><tr><td>SEEXCLD</td><td>110</td><td>10</td><td>45</td><td>678</td><td>396</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example 2:  

<html><body><table><tr><td>SEEXCLD</td><td>400</td><td>ALL</td><td>10</td><td>20</td><td>30</td><td>THRU 40</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEIDA</td><td>Partitioned superelement identification number. (Integer ≥ 0)</td></tr><tr><td>SEIDB</td><td>Superelement identification. (Integer ≥ O or Character = “ALL"; Default = “ALL")</td></tr><tr><td>GIDAi</td><td>Identification number of a grid in superelement SEIDA to be excluded from connection to superelement SEIDB. (Integer > O or “THRU"; for “THRU" option GIDA1 < GIDA2.)</td></tr></table></body></html>  

## Remarks:  

1. SEEXCLD can only be specified in the main Bulk Data Section and willcause a fatal error message if it appears after the BEGIN SUPER $_{\cdot=\mathrm{n}}$ command.   
2. SEIDA and SEIDB may reference only substructures or the residual structure, that is, parts defined after a BEGIN SUPER $\mathbf{\Sigma}=\mathbf{\Sigma}$ entry.   
3. This entry will only work if PART superelements (BEGIN SUPER) exist.  

Defines a label or name to be printed in the superelement output headings.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SELABEL</td><td>SEID</td><td colspan="6">LABEL</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>LEFT REAR FENDER,MODEL XYZ2000</td><td></td></tr></table></body></html>



<html><body><table><tr><td>SELABEL</td><td>10</td><td>LEFT REAR FENDER, MODEL XYZ2000</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Partitioned superelement identification number. (Integer > 0)</td></tr><tr><td>LABEL</td><td> Label associated with superelement SEID for output headings. (Character)</td></tr></table></body></html>  

## Remarks:  

1. SELABEL can only be specified in the main Bulk Data Section and is ignored after the BEGIN SUPER $_{\cdot=\mathrm{n}}$ command.   
2. Only one SELABEL per superelement may be specified.   
3.The label willappear in all superelement output headings.However, in some headings the label may be truncated.   
4. This entry will only work if PART superelements (BEGIN SUPER) exist.  

Defines a partitioned superelement relocation by listing three noncolinear points in the superelement and three corresponding points not belonging to the superelement.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>SELOC</td><td>SEID</td><td>PA1</td><td>PA2</td><td>PA3</td><td>PB1</td><td>PB2</td><td>PB3</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SELOC</td><td>110</td><td>10</td><td>100</td><td>111</td><td>1010</td><td>112</td><td>30</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Partitioned identification number of the partitioned superelement. (Integer > 0)</td></tr><tr><td>PAi</td><td>Identification numbers of three noncolinear grids (GRID entry) or points (POINT entry) which are in the partitioned superelement. (Integer > 0)</td></tr><tr><td>PBi </td><td>Identification numbers of three grids (GRID entry) or points (POINT entry) defined in the main Bulk Data Section to which PAi will be aligned. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1.SELOC can only be specified in the main Bulk Data Section and willcause a fatal error message if it appears after the BEGIN SUPER $_{\cdot=\mathrm{n}}$ command. 2. The superelement will be rotated and translated for alignment of the GAi and GBi locations.   
3. The PAi and PBi can be either GRIDs or POINTs.   
4. PA1, PA2, and PA3 must be contained in superelement SEID. 5. PB1, PB2, and PB3 must be specified in the main Bulk Data Section. If they belong to a superelement that is also relocated, then the original (unmoved) positions of PB1, PB2, and PB3 are used. 6. PB1, PB2, and PB3 must have the same relative locations as PA1, PA2, and PA3. 7. Three grids or points are required even if the superelement connects to only one or two exterior grids. 8. Coordinate systems, global displacement directions, and element coordinate systems for the superelement will rotated and translated. 9. The global coordinate directions of the boundary grid points of the upstream superelement will be transformed internally to the global coordinate directions of the attachment grid points in the downstream superelement. For displacement data recovery, the output willbe in the original global coordinate system.   
10.The translation and rotation of the superelement to the new position is accomplished by defining local rectangular coordinate systems based on the specified grid locations:   
The local systems have their origin at PXl and the x-axis points from PX1 to PX2.   
The y-axis lies in the plane containing PX1, PX2, and PX3, is perpendicular to the x-axis, and points toward PX3.   
● The z-axis is defined by the cross product of the x-axis into the y-axis.   
· The rotation and translation transformation aligns the local system defined by the superelemeni grids with the local system defined by the main Bulk Data Section grids.  

11. This entry will only work if PART superelements (BEGIN SUPER) exist.  

Defines a mirror plane for mirroring a partitioned superelement.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEMPLN</td><td>SEID</td><td>“PLANE”</td><td>P1</td><td>P2</td><td>P3</td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEMPLN</td><td>110</td><td>PLANE</td><td>12</td><td>45</td><td>1125</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td> Describer</td><td> Meaning</td></tr><tr><td>SEID</td><td>Partitioned superelement identification number. (Integer > 0).</td></tr><tr><td>“PLANE”</td><td>Flag indicating that the plane is defined by three noncolinear points.</td></tr><tr><td>Pi</td><td>GRID or POINT entry identification numbers of three noncolinear points. (Integer > 0).</td></tr></table></body></html>  

## Remarks:  

1. SEMPLN can only be specified in the main Bulk Data Section and will causea fatal error message i it appears after the BEGIN SUPER $_{\cdot=\mathrm{n}}$ command. 2. Grids or points referenced on this entry must be defined in the main Bulk Data Section.  

Defines number of internally generated scalar points for superelement dynamic reduction  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SENQSET</td><td>SEID</td><td>N</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SENQSET</td><td>110</td><td>45</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td> SEID</td><td>Partitioned superelement identification number. See Remark 3. (Integer > 0 or Character = “ALL")</td></tr><tr><td>N</td><td>Number of internally generated scalar points for dynamic reduction generalized coordinates. (Integer > O; Default = 0)</td></tr></table></body></html>  

## Remarks:  

1. SENQSET can only be specified in the main Bulk Data Section and is ignored after the BEGIN SUPER $\mathbf{\tau}=\mathbf{n}$ command.   
2. SENQSET is only required if the user wants to internall generated scalar points used for dynamic reduction.   
3. $\mathrm{SEID}=^{\circ}\mathrm{ALL}^{\prime\prime}$ will automatically generate N q-set degrees-of-freedom for all superelements, except the residual structure $\mathrm{(SEID=0}$ ). Specifying additional SENQSET entries for specific superelements will override the value of N specified on this entry.   
4. If the user manually specifies q-set degrees-of-freedom using a SEQSETi or QSETi entries, then the internally generated scalar points will not be generated.   
5. See PARAM,NQSET for an alternate method of specifying QSET degree-of-freedoms.   
6. This entry will only work if PART superelements (BEGIN SUPER) exist.  

Used to manually order the grid points and scalar points of the problem. This entry is used to redefine the sequence of grid and scalar points to optimize bandwidth.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEQGP</td><td>ID1</td><td>SEQID1</td><td>ID2</td><td>SEQID2</td><td>ID3</td><td>SEQID3</td><td>ID4</td><td>SEQID4</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEQGP</td><td>5392</td><td>15.6</td><td>596</td><td>0.2</td><td>2</td><td>1.9</td><td>3</td><td>2</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>IDi</td><td>Grid or scalar point identification number. (Integer > 0)</td></tr><tr><td> SEQIDi</td><td>Sequenced identification number. (Real > O.O or Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. The real format is used to insert a point ID between two consecutively numbered and existing point IDs. In the example above, point ID 5392 is inserted between IDs 15 and 16 by specifying 15.6 for SEQID. If the SEQID is real and $<1.0$ the value must be entered as 0.2 not .2 (see field 5 of example).   
2. The SEQIDi numbers must be unique and may not be the same as a point IDi which is not being changed. No grid point IDi may be referenced more than once.   
3. From one to four grid or scalar points may be resequenced on a single entry.   
4.If a point IDi is referenced more than once, the last reference will determine its sequence.   
5. Automatic resequencing is also available. See OLDSEQ, 963.  

Used with the CSUPER entry to define the correspondence of the exterior grid points between an identical or mirror-image superelement and its primary superelement.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEQSEP</td><td>SSID</td><td>PSID</td><td>GP1</td><td>GP2</td><td>GP3</td><td>GP4</td><td>GP5</td><td>GP6</td><td></td></tr><tr><td></td><td>GP7</td><td>GP8</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEQSEP</td><td>121</td><td>21</td><td>109</td><td>114</td><td>124</td><td>131</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SSID</td><td>Identification number for secondary superelement. (Integer > 0).</td></tr><tr><td>PSID</td><td>Identification number for the primary superelement. (Integer ≥ 0).</td></tr><tr><td>GPi</td><td>Exterior grid point identification numbers for the primary superelement. (Integer > 0).</td></tr></table></body></html>  

## Remarks:  

1. This entry is not needed if the grid points listed on the CSUPER entry with the same SSID are in the order of the corresponding exterior grid points of the primary superelement.  

2. In Figure 9-154,the exterior grid points of 10, 20, and 30 of $\mathrm{SEID}=1$ correspond to the points 13, 12, and 1l, respectively, of image $\mathrm{SEID}=2$ . The CSUPER entry may be defined alone or with a SEQSEP entry as shown in Figure 9-154.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/6d7cc53ead148efc6f63c5a9f42b04b1c9592ae51c81fb6327ea7b81ff6c1a92.jpg)  
Figure 9-154 Grid Point Correspondence Between Primary and Secondary Superelements  

## CSUPER Entry Only:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7 8</td><td>9 10</td></tr><tr><td>CSUPER</td><td>2</td><td>1</td><td>13</td><td>12 11</td><td></td><td></td><td></td></tr></table></body></html>  

## CSUPER and SEQSEP Entries:  

<html><body><table><tr><td>CSUPER</td><td>2</td><td>1</td><td>11</td><td>12</td><td>13</td><td></td><td></td><td></td><td></td></tr><tr><td>SEQSEP</td><td>2</td><td>1</td><td>30</td><td>20</td><td>10</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Defines the generalized degrees-of-freedom of the superelement to be used in generalized dynamic reduction or component mode synthesis.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEQSET</td><td>SEID</td><td>ID1</td><td>C1</td><td>ID2</td><td>C2</td><td>ID3</td><td>C3</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEQSET</td><td>15</td><td>1</td><td>123456</td><td>7</td><td>5</td><td>22</td><td>3</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. Must be a primary superelement. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component number. (Any unique combination of the Integers 1 through 6 with no embedded blanks for grid points; Integer zero or blank for scalar points.)</td></tr><tr><td>IDi</td><td>Grid or scalar point identification numbers. Must be an exterior point. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. Degrees-of-freedom specified on this entry may not be specified for another superelement.   
2. Generalized degrees-of-freedom are interior to the residual structure.   
3. Connectivity to the superelement is provided by this entry. There is no need to use a CSUPEXT entry for this purpose.   
4.Degrees-of-freedom specified on this entry form members of the mutually exclusive q-set.They may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.   
5. This entry describes the set used for generalized degrees-of-freedom only for the SEID listed. Degrees-of-freedom listed on this entry must also be members of a downstream superelement. The set used for these variables in downstream superelements must be prescribed by user action using other entries. If they are scalar points, they are automatically in the residual structure, which is the recommended procedure. If they are grid points, it is the user's responsibility to place them in a downstream superelement. Generalized degrees-of-freedom of superelements that are also members of the residual structure are included as dynamic variables by placing them in the a-set. It is also necessary to place some or all residual structure physical degrees-of-freedom in the a-set to allow the boundary points to participate in the system mode shapes.  

Grid points of downstream superelements used as generalized degrees-of-freedom may be used for advanced applications, such as omitting upstream generalized degrees-of-freedom from assembly into downstream superelements. Again, it is the user's responsibility to place these variables in the proper set in all downstream superelements of which they are members. 6. This entry may be applied only to primary superelements. The CSUPER entry automatically define: these degrees-of-freedom for secondary superelements.  

Defines the generalized degrees-of-freedom of the superelement to be used in generalized dynamic reduction or component mode synthesis.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEQSET1</td><td>SEID</td><td>C</td><td>G1</td><td>G2</td><td>G3</td><td>G4</td><td>GS</td><td>G6</td><td></td></tr><tr><td></td><td>G7</td><td>G8</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEQSET1</td><td>15</td><td>123456</td><td>1</td><td>7</td><td>9</td><td>22 105</td><td>6</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>52</td><td>53</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Format and Example:  

<html><body><table><tr><td>SEQSET1</td><td>SEID</td><td>C</td><td>G1</td><td>“THRU”</td><td>G2</td><td></td><td></td><td></td><td></td></tr><tr><td>SEQSET1</td><td>16</td><td>0</td><td>101</td><td>THRU</td><td>110</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. Must be a primary superelement. (Integer > 0)</td></tr><tr><td>C</td><td>Component numbers. (Any unique combination of the Integers 1 through 6 with no embedded blanks for grid points; Integer O or blank for scalar points.)</td></tr><tr><td>Gi</td><td>Grid or scalar point identification numbers. Must be exterior points. (Integer > 0 or “THRU"; for THRU option G1 < G2.)</td></tr></table></body></html>  

## Remarks:  

1. Degrees-of-freedom specified on this entry may not be specified for another superelement   
2. Generalized degrees-of-freedom are interior to the residual structure.   
3. Connectivity to the superelement is provided by this entry. There is no need to use a CSUPEXT entry for this purpose.   
4.Degrees-of-freedom specified on this entry form members of a mutually exclusive set. They may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets,11 fora list of these entries.   
5. This entry describes the set used for generalized degrees-of-freedom only for the SEID listed. Degrees-of-freedom listed on this entry must also be members of a downstream superelement. The set used for these variables in downstream superelements must be prescribed by user action using other entries. If they are scalar points, they are automatically in the residual structure, which is the recommended procedure. If they are grid points,it is the user's responsibility to place them in a downstream superelement.  

Generalized degrees-of-freedom of superelements that are also members of the residual structure are included as dynamic variables by placing them in the a-set. It is also necessary to place some or all residual structure physical degrees-of-freedom in the a-set, to allow the boundary points to participate in the system mode shapes.  

Grid points of downstream superelements used as generalized degrees-of-freedom may be used for advanced applications, such as omitting upstream generalized degrees-of-freedom from assembly into downstream superelements. Again, it is the user's responsibility to place these variables in the proper set in all downstream superelements of which they are members.  

6. This entry may be applied only to primary superelements. The CSUPER entry automatically define these entries for secondary superelements.  

Defines interior grid points for a superelement.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SESET</td><td>SEID</td><td>G1</td><td>G2</td><td>G3</td><td>G4</td><td>G5</td><td>G6</td><td>G7</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SESET</td><td>5</td><td>2</td><td>17</td><td>24</td><td>25</td><td>165</td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Format and Example  

<html><body><table><tr><td>SESET</td><td>SEID</td><td>G1</td><td>“THRU”</td><td>G2</td><td></td><td></td><td></td></tr><tr><td>SESET</td><td>2</td><td>17</td><td>THRU</td><td>165</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. Must be a primary superelement. (Integer ≥ 0)</td></tr><tr><td>Gi</td><td>Grid or scalar point identification number. (0 < Integer < 100000000; G1 < G2)</td></tr></table></body></html>  

## Remarks:  

1. Interior grid points may also be defined via field 9 of the GRID and GRIDG Bulk Data entries. The SESET entry takes precedence over the SEID field on the GRID on GRIDG entries.SESET defines grid and scalar points to be included as interior to a superelement.SESET may be used as the primary means of defining superelements or it may be used in combination with SEELT entries which define elements interior to a superelement.   
2. Gi may appear on an SESET entry only once.   
3. Scalar points are ignored unless a BEGIN SUPER is in the file.   
4.Open sets are allowed with the“THRU" option. Missing grid points (whether in “THRU"range or mentioned explicitly) are not identified.   
5.All degrees-of-freedom for Gi are placed in the o-set of the superelement.SeeDegree-of-Freedom Sets, 1111.   
6. SESET can only be specified in the main Bulk Data Section and is ignored after the BEGIN SUPER $\mathbf{\sigma}=\mathbf{\sigma}$ n command.  

Defines determinate reaction superelement degrees-of-freedom in a free-body analysis.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SESUP</td><td>SEID</td><td>ID1</td><td>C1</td><td>ID2</td><td>C2</td><td>ID3</td><td>C3</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SESUP</td><td>5</td><td>16</td><td>215</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. Must a primary superelement. (Integer > 0)</td></tr><tr><td>IDi</td><td>Grid or scalar point identification number. Must be exterior points. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component numbers. (Integer zero or blank for scalar points; Any unique combination of the Integers 1 through 6 for grid points.)</td></tr></table></body></html>  

## Remarks:  

1. The degrees-of-freedom specified on this entry form members of the mutualy exclusive r-set. They may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.   
2. The Ci degrees-of-freedom must be exterior degrees-of-freedom of the SEID superelement.   
3.See Rigid Body Supports in the MSC Nastran Reference Guide for a discussion of supported degrees-offreedom (members of the r-set).   
4. There must be a suffcient number of degrees-of-freedom on SESUP entries to discard any free body modes of the superelement.   
5. SESUP Bulk Data entries are not allowed for part (partitioned bulk data) superelements. Use the SUPORT Bulk Data records to identify component rigid body modes.  

Defines a list of structural grid points or element identification numbers.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SET1</td><td>SID</td><td>ID1</td><td>ID2</td><td>ID3</td><td>ID4</td><td>ID5</td><td>ID6</td><td>ID7</td><td></td></tr><tr><td></td><td>ID8</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example 1:  

<html><body><table><tr><td>SET1</td><td>3</td><td>31</td><td>62</td><td>93</td><td>124 16</td><td>17</td><td>18</td><td></td></tr><tr><td></td><td>19</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example 2:  

<html><body><table><tr><td>SET1</td><td>6</td><td>29</td><td>32</td><td>THRU</td><td>50</td><td>61</td><td>THRU</td><td>70</td><td></td></tr><tr><td></td><td>17</td><td>57</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example 3:  

<html><body><table><tr><td>SET1</td><td>7</td><td>SKIN</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Unique identification number. (Integer > 0)</td></tr><tr><td>IDi</td><td>List of structural grid point or element identification numbers. (Integer > O or“THRU"; for the “THRU" option, ID1 < ID2 or “SKIN"; in field 3)</td></tr></table></body></html>  

## Remarks:  

1. When using the“THRU" option for SPLINEi or PANEL data entries, all intermediate grid points must exist.   
2. When using the “THRU" option for XYOUTPUT or AECOMP requests, missing grid points are ignored. The first and last points must exist.   
3.When using the“SKIN"option, a panel willbe generated consisting of the structural portion of the fluid-structural boundary. This option works ONLY with all fields of ACMODL having default value.   
4. THRU may not appear in field 3 or 9 (2 or 9 for continuations).   
5. RC network solver does not support SET1 for thermal analysis.  

Defines a list of structural grid points in terms of aerodynamic macro elements.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SET2</td><td>SID</td><td>MACRO</td><td>SP1</td><td>SP2</td><td>CH1</td><td>CH2</td><td>ZMAX</td><td>ZMIN</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SET2</td><td>3</td><td>111</td><td>0.0</td><td>0.75</td><td>0.0</td><td>0.667</td><td>3.51</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Unique identification number. (Integer > 0)</td></tr><tr><td>MACRO</td><td>Element identification number of an aerodynamic macro element. (Integer > 0)</td></tr><tr><td>SP1,SP2</td><td> Lower and higher span division points defining the prism containing the set. (Real)</td></tr><tr><td>CH1,CH2</td><td> Lower and higher chord division points defining the prism containing the set. (Real)</td></tr><tr><td>ZMAX,</td><td> Z-coordinates of top and bottom (using right-hand rule with the order of the corners as</td></tr><tr><td>ZMIN</td><td>listed on a CAEROi entry) of the prism containing set. (Real)</td></tr></table></body></html>  

## Remarks:  

1. The SET2 entry is referenced by the SPLINEi entry.   
2.Every grid point within the defined prism and within the height range willbe in thelist. For example:  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/6bda393de462e75486317824c27cf06cf7762689b2789caebfe2884514cb344c.jpg)  
Figure 9-155 SET2 Entry Example  

The shaded area in Figure 9-155 defines the crossection of the prism for the sample data given above. Points exactly on the boundary may be missed; therefore, to get all the grid points within the area of the macro element, $\operatorname{SP1}=-.01\$ ， $\mathrm{SP}2{=}1.01\$ , etc. should be used.  

3. A zero value for ZMAX or ZMIN implies a value of infinity. Usually, ZMAX $\ge0.0$ and $\mathrm{ZMIN}\leq0.0$   
4. To print the (internal) grid IDs found, use DIAG 18.  

Defines a list of grids, elements or points.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>SET3</td><td>SID</td><td>DES</td><td>ID1</td><td>ID2 ID3</td><td>ID4</td><td>ID5</td><td>ID6</td><td></td></tr><tr><td></td><td>ID7</td><td>ID8</td><td>-etc-</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SET3</td><td>1</td><td>POINT</td><td>11</td><td>12</td><td>13</td><td>15</td><td>18</td><td>21</td><td></td></tr></table></body></html>  

## Alternate Format and Example:  

<html><body><table><tr><td>SET3 SID</td><td>DES</td><td>ID1</td><td>“THRU”</td><td>ID2</td><td></td><td></td><td></td></tr><tr><td>SET3 33</td><td>POINT</td><td>20</td><td>THRU 60</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Unique identification number. (Integer>0)</td></tr><tr><td>DES</td><td>Set description (Character). Valid options are“GRID",“ELEM",“POINT",“PROP", "RBEin”, and “RBEex".</td></tr><tr><td>IDi</td><td> Identifiers of grids points, elements, points or properties. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. If a SET3 entry is referenced on a PBMSECT or PBRSECT entry, the POINTs must lie in the (xy) plane of the basic coordinate system, and be in the order when traversing the boundary or the profile.   
2. When the SET3 entry is referenced by a panel, describers can be“GRID”,“ELEM" or“PROP".   
3. THRU may not appear in field 4 or 9 (2 or 9 for continuations).   
4. When SET3 is referenced by SOLs 400 entry only GRID or ELEM may be used.   
5. When SET3 is referenced by RFORCE (IDRF field) for SOL 600, only ELEM may be used.   
6. When SET3 is referenced by SOL 400 DEACTEL entries, only ELEM may be used.   
7. When a SET3 is referenced bya ELSIDi or XELSIDi field on an FTGDEF entry, only ELEM may be used. When SET3 is referenced by a NDSIDi field on a FTGDEF entry, only GRID may be used.   
8.When DES $\c=$ "RBEin",the SET selects rigid elements to be included for MPC $\scriptstyle\left.=,\right.$ sid and is applicable to Rigid Element types of RBAR, RBAR1, RBE1, RBE2, RBE2GS, RBE3, RROD, RSPLINE, RSSCON, RTRPLT and RTRPLT1. Note that Rigid Elements with duplicate ID across Rigid Element types will all be utilized.   
9.For DES $\dot{\mathbf{\eta}}=\mathbf{\eta}$ "RBEex", the SET selects rigid elements to be excluded for MPC $\:=\:$ sid and is applicable to Rigid Elements types of RBAR, RBAR1, RBE1, RBE2, RBE2GS, RBE3, RROD, RSPLINE, RSSCON, RTRPLT and RTRPLT1.   
10. Note that "RBEin" and "RBEex" are mutually exclusive and should not appear together for a single SET.   
11. By default, without SET3,mpcid,RBExx, all Rigid Elements in the input deck will be used.   
12. SET selection for rigid elements does not cover additional IDs on MPCADD bulk data entry. This kind of selection is not supported in SOL 106 either.   
13. Rigid element set section is supported in SOL 400 if 'RIGID $\mathbf{\sigma}=\mathbf{\sigma}$ LINEAR' is present in case control deck.  

Defines a list of property IDs  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SET4</td><td>ID</td><td>CLASS</td><td>TYPE</td><td>ID1</td><td>ID2</td><td>ID3</td><td>ID4</td><td>ID5</td><td></td></tr><tr><td></td><td>ID6</td><td>ID7</td><td>ID8</td><td>-etc-</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SET4</td><td>22</td><td>PROP</td><td>PSOLID</td><td>1</td><td>THRU</td><td>20</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Unique identification number. (Integer>0).</td></tr><tr><td>CLASS</td><td>Set to "PROP". (Character = PROP; no default)</td></tr><tr><td>TYPE</td><td>Property type. Valid options are PSOLID, PSHELL, PSHEAR, PBAR, PBEAM, and PWELD.</td></tr><tr><td>IDi</td><td>Property IDs of the specified TYPE flag.</td></tr></table></body></html>  

## Remarks:  

1. THRU option may not appear in field 5 or 9 on first line or field 2 or 9 for continuation lines.   
2. Currently referenced from the FTGDEF entry.  

Specifies superelement reduction order.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SETREE</td><td>SEID</td><td>SEUP1</td><td>SEUP2</td><td>SEUP3</td><td>SEUP4</td><td>SEUP5</td><td>SEUP6</td><td>SEUP7</td><td></td></tr><tr><td></td><td>SEUP8</td><td>SEUP9</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SETREE</td><td>400</td><td>10</td><td>20</td><td>30</td><td>40</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Partitioned superelement identification number of a downstream superelement. (Integer ≥ 0)</td></tr><tr><td>SEUPi</td><td>Identification number of superelements that are upstream of SEID. (Integer > 0)</td></tr></table></body></html>  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/c3c30ce6ad0200d0eb1ee915aed6737e5f7b1469267cf3a1f5a4c8b927e2786e.jpg)  

## Remarks:  

1. SETREE entries or DTI,SETREE entry are required for multilevel superelement configurations.   
2. Atleast one SETREE entry is required for each nontip superelement, including the residual structure $\mathrm{\bigl(SEID=0},$ . Multiple SETREE entries with the same SEID are allowed.   
3. A superelement may appear only once in an SEUPi field on all SETREE entries.   
4. If an DTI,SETREE entry is provided, then SETREE entries are not required.   
5. If both SETREE entries and a DTI,SETREE entry exist, then the DTI,SETREE entry will be ignored.   
6.Ifa superelement is not referenced on the DTI,SETREE or SETREE entry, then the manner in which it is handled depends on the type ofthat superelement.If it is a PART superelement, then the residual will be regarded as its downstream superelement and the undefined superelement willtherefore be placed immediately above the residual in the tree.If it is a Main Bulk Data superelement, then it will also behandled like an undefined PART superelement as above ifall ofits exterior points belong to the residual. However,ifone or more ofits exterior points do not belong to the residual, then the program will terminate with a user fatal error complaining that one of more of the superelements are not in the same path.   
7. The SETREE entry willonly work if PART (BEGIN SUPER) superelements exist in the model. If there are no PARTs in the model, the SETREE entries will be ignored.  

Defines a degree-of-freedom set for a superelement.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEUSET</td><td>SEID</td><td>SNAME</td><td>ID1</td><td>C1</td><td>ID2</td><td>C2</td><td>ID3</td><td>C3</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEUSET</td><td>15</td><td>U4</td><td>1</td><td>123456</td><td>7</td><td>5</td><td>22</td><td>3</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. (Integer > 0)</td></tr><tr><td>SNAME</td><td>Set name. (One to four characters or string “ZERO", followed by the set name.)</td></tr><tr><td>IDi</td><td>Grid or scalar point identification numbers. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component number. (Any unique combination of the Integers 1 through 6 with no embedded blank for grid points; Integer O or blank for scalar points.)</td></tr></table></body></html>  

## Remarks:  

1. SNAME may refer to any of the set names given in Degree-of-Freedom Sets,1111 or their new names on the DEFUSET entry. However, in the Solution Sequences O through 200,it is recommended that SNAME refer only to the set names“U1" through “U6"or their new names on the DEFUSET entry.  

2.If SNA $\mathrm{ME}=\mathrm{^{\infty}Z E R}{\mathrm{\Omega}}$ Oi", where i is a set name, then the degrees-of-freedom are omitted from set i.  

Defines a degree-of-freedom set for a superelement.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4 5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SEUSET1</td><td>SEID</td><td>SNAME</td><td>C</td><td>G1</td><td>G2 G3</td><td>G4</td><td>G5</td><td></td></tr><tr><td></td><td>G6</td><td>G7</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SEUSET1</td><td>15</td><td>U4</td><td>1</td><td>12</td><td>15</td><td>17</td><td>22 25</td><td></td></tr><tr><td></td><td>52</td><td>53</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Format and Example:  

<html><body><table><tr><td>SEUSET1</td><td>SEID</td><td>SNAME</td><td>C</td><td>G1</td><td>“THRU"</td><td>G2</td><td></td><td></td><td></td></tr><tr><td>SEUSET1</td><td>15</td><td>U4</td><td>1</td><td>12</td><td>THRU</td><td>27</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SEID</td><td>Superelement identification number. (Integer > 0)</td></tr><tr><td>SNAME</td><td>Set name. (One to four characters or string “ZERO", followed by the set name.)</td></tr><tr><td>C</td><td>Component numbers. (Any unique combination of the Integers 1 through 6 with no embedded blanks for grid points; Integer O or blank for scalar points.)</td></tr><tr><td>Gi</td><td>Grid or scalar point identification number. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. SNAME may refer to any of the set names given in Degree-of-Freedom Sets,1111 or their new names on the DEFUSET entry. However, in the Solution Sequences O through 200, it is recommended that SNAME refer only to the set names “U1" through “U6"or their new names on the DEFUSET entry.   
2.If SNAME $\stackrel{\cdot}{\lrcorner}=\stackrel{\kappa}{\cdot}$ ZEROi", where i is a set name, then the degrees-of-freedom are omitted from set i.   
3. If the alternate format is used, all of the points G1 through G2 are assigned to the set.  

Defines an elastic shear model with a constant shear modulus. Used in SOL 700 only.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SHREL</td><td>SID</td><td>G</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SHREL</td><td>250</td><td>80.E6</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td> SID</td><td>Unique shear model number referenced from a MATDEUL entry. (Integer > 0; Required)</td></tr><tr><td>G</td><td>Shear-modulus value. (Real; Default = 0.0)</td></tr></table></body></html>  

## Remark:  

1. SID must unique among all SHRxx entries in one model.  

Defines an elastic shear model with a polynomial shear modulus. Used in SOL 700 only.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8 9</td><td>10</td></tr><tr><td>SHRPOL</td><td>SID</td><td>Go</td><td>G1</td><td>G2</td><td>G</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SHRPOL</td><td>250</td><td>80.E6</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Unique shear model number referenced from a MATDEUL entry. (Integer > 0; Required)</td></tr><tr><td>Go</td><td>Coefficient G . (Real; Default = 0.0)</td></tr><tr><td>G</td><td>Coefficient G, . (Real; Default = 0.0)</td></tr><tr><td>G2</td><td>Coefficient G . (Real; Default = 0.0)</td></tr><tr><td>G</td><td>Coefficient G . (Real; Default = 0.0)</td></tr></table></body></html>  

## Remark:  

1. SID must unique among all SHRxx entries in one model.   
2. The shear modulus is computed from  

$$
G=G_{0}+G_{1}\gamma+G_{2}\gamma^{2}+G_{3}\gamma^{3}
$$  

where $\gamma\ =$ effective plastic shear strain and $G_{0}$ $_{0}\ ,G_{1}\ ,$ $G_{2}$ and $G_{3}$ are constants  

Specifies that a user subroutine is being used to define the shear modulus. Use in SOL700 only.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SHRUDS</td><td>SID</td><td>GROUP</td><td>UNAME</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

## In FMS Section of the MSC Nastran input stream:  

CONNECT SERVICE mymat 'SCA.MDSolver.Obj.Uds.Dytran.Materials' In Bulk Data:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SHRUDS</td><td>12</td><td>mymat</td><td>EXSHR</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Unique porosity model ID. (Integer > 0; Required)</td></tr><tr><td>GROUP</td><td>The group name used for the FMS section CONNECT SERVICE statement. (Character; no Default)</td></tr><tr><td>UNAME</td><td>User subroutine name associated with the entry. (Character; default=EXSHR)</td></tr></table></body></html>  

## Remarks:  

1. Only can be used for SOL 700.   
2. The SID must be referenced by a MATDEUL or MAT1 entry.   
3.UNAME $\v{x}_{\mathrm{{,}}}=$ EXSHR can only be used.  

# Format:  

<html><body><table><tr><td>1</td><td>2 3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>SLBDY RHO</td><td>M</td><td>ID1</td><td>ID2</td><td>ID3</td><td>ID4</td><td>ID5 ID6</td><td></td></tr><tr><td>ID7</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SLBDY 0.002</td><td>6</td><td>16</td><td>17</td><td>18</td><td>25</td><td>20</td><td>21</td><td></td></tr><tr><td></td><td>22</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>RHO</td><td>Density of fluid at boundary. (Real > O.0 or blank)</td></tr><tr><td>M</td><td>Number of slots. (Integer ≥ O or blank)</td></tr><tr><td>IDj</td><td>Identification numbers of GRIDS slot points at boundary with axisymmetric fluid cavity, j = 1, 2, .., J. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. SLDBY is allowed only if an AXSLOT entry is also present.   
2. If RHO or M is blank,the default value on the AXSLOT entry is used. The effective value must not be zero for RHO. If the effective value of M is zero, no matrices at the boundary willbe generated.   
3.The order of the list of points determines the topology of the boundary. The points are listed sequentially as one travels along the boundary in either direction.At least two points must be defined  

Defines concentrated static loads on scalar or grid points.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SLOAD</td><td>SID</td><td>S1</td><td>F1</td><td>S2</td><td>F2</td><td>S3</td><td>F3</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SLOAD</td><td>16</td><td>2</td><td>5.9</td><td>17</td><td>-6.3</td><td>14</td><td>-2.93</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td> Load set identification number. (Integer > 0)</td></tr><tr><td>Si</td><td>Scalar or grid point identification number. (Integer > 0)</td></tr><tr><td>Fi</td><td>Load magnitude. (Real)</td></tr></table></body></html>  

## Remarks:  

1. In the static solution sequences, SID is selected by the LOAD Case Control command.   
2.In the dynamic solution sequences, if there is a LOADSET Case Control command, then SID must be referenced in the LID field of a selected LSEQ entry. If there is no LOADSET Case Control command, then SID must be referenced in the EXCITEID field of an ACSRCE, RLOADi or TLOADi entry.   
3. Up to three loads may be defined on a single entry.   
4.If Si refers to agrid point, theload isapplied to component T1 of the displacement coordinate system (see the CD field on the GRID entry).  

Defines concentrated static loads on grid points of heat shell elements with linear or quadratic temperature distribution through the thickness direction.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SLOADN1</td><td> SID</td><td>G1</td><td>C1</td><td>Q1</td><td>G2</td><td>C2</td><td>Q2</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SLOADN1</td><td>10</td><td>10</td><td>12</td><td>1300.</td><td>20</td><td>2</td><td>1300.</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Load set identification number. (Integer > 0)</td></tr><tr><td>Gi</td><td>Grid point identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Composite numbers.(0 ≤ Integer ≤ 3; up to 3 unique Integers may be placed in the field with no embedded blanks.) 1=TOP, 2=BOT, 3=MID. (Integer > -1; Default = 1)</td></tr><tr><td>Qi</td><td>Power. (Real)</td></tr></table></body></html>  

## Remarks:  

1. This entry is for shellelements defined on a PSHLN1 heat transfer to specify power input.   
2. In the steady-state heat transfer analysis, SID is selected by the LOAD Case Control command.   
3.In the transient heat transfer analysis, if there is a LOADSET Case Control command, then SID must be referenced in the LID field of a selected LSEQ entry. If there is no LOADSET Case Control command, then SID must be referenced in the EXCITEID field of an ACSRCE, RLOADi or TLOADi entry.  

Defines a surface normal vector at a grid point for CQUAD4, CQUADR, CTRIA3, and CTRIAR shell elements.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SNORM</td><td>GID</td><td>CID</td><td>N1</td><td>N2</td><td>N3</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SNORM</td><td>3</td><td>2</td><td>0.</td><td>-1.</td><td>0.</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>GID</td><td>Unique grid point identification number. (Integer > 0)</td></tr><tr><td>CID</td><td>Identification number of coordinate system in which the components of the normal vector are defined. See Remark 3. (Integer ≥ 0; Default = O for the basic coordinate system)</td></tr><tr><td>Ni</td><td>Components of normal vector. The three components of the normal need not define a unit vector. (Real; Default = 0.0)</td></tr></table></body></html>  

## Remarks:  

1. The SNORM Bulk Data entry overrides any unique, internally-generated grid point normals that may have been requested with the user parameter SNORM, described in Chapter 6 of this guide.   
2. The normal is used in CQUAD4, CQUADR, CTRIA3, and CTRIAR shell elements. For all other elements, the normal is ignored.   
3.If CID is a cylindrical or spherical coordinate system, the components Ni are in the local tangent system at grid GID. For example, if $C I D=10$ is a spherical coordinate system and normals must be defined pointing outwards in the radial direction of the sphere, see, then the SNORM entries for all grids GID on the sphere are simply SNORM, GID, 10,1., 0., 0.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/37978b87e3ed902adc67055665ed3ac9205bf94f2c93940e55e49e154e64dcfe.jpg)  
Figure 9-156  

Defines a strip based blending of two splines  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPBLND1</td><td>SID</td><td>SID1</td><td>SID2</td><td>OPT</td><td>W1</td><td>GID</td><td>D1</td><td>D2</td><td></td></tr><tr><td></td><td>X1</td><td>X2</td><td>X3</td><td>CID</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPBLND1</td><td>130</td><td>110</td><td>120</td><td>CUB</td><td></td><td>227</td><td>4.05</td><td>4.05</td><td></td></tr><tr><td></td><td>1.0</td><td>0.0</td><td>0.0</td><td>110</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Identification number of blended spline. (Integer > 0)</td></tr><tr><td>SID1</td><td>Identification number of first spline (may be a blended spline). (Integer > 0)</td></tr><tr><td>SID2</td><td>Identification number of second spline (may be a blended spline). (Integer > 0)</td></tr><tr><td>OPT</td><td rowspan="3">Blending Option:</td></tr><tr><td>WAVG</td></tr><tr><td>LIN Linear Blending Functions</td></tr><tr><td>CUB</td><td>Cubic Blending Functions</td></tr><tr><td>W1</td><td colspan="2">Weight to be used with first spline. (0.0 < Real ≤ 1.0; Default = 0.5) (Used only with option WAVG)</td></tr><tr><td>GID</td><td colspan="2">Identification number of an aerodynamic grid to be used as reference grid. (Integer>0)</td></tr><tr><td>D1</td><td colspan="2">Blending Depth of first spline. (Real > 0.0)</td></tr><tr><td>D2</td><td colspan="2">Blending Depth of second spline. (Real > 0.0)</td></tr><tr><td>X1,X2,X3</td><td colspan="2">Components of a direction vector v, in the coordinate system defined by CID, which is used to measure the distance from the reference grid. (See Remark 3.)</td></tr><tr><td>CID</td><td colspan="2">Identification number of a rectangular coordinate system used to define the direction vector. (Integer > 0; Default = O; indicating the basic coordinate system)</td></tr></table></body></html>  

## Remarks:  

1.The blending depth defines the maximum distance from the reference grid point of an aerodynamic grid point to be used in blending. It is also needed to evaluate the blending functions.   
2. With option WAVG, the definition ofGID, D1, D2 and the direction vector is optional. The weight W2 to be used with the second spline is computed from $\mathbb{W}2=1\textrm{-}\mathbb{W}1$ ·  

3. The blended displacement is computed from  

$$
u_{b}=f_{1}(x)u_{1}+f_{2}(x)u_{2}
$$  

where $f_{1}(x)$ and $f_{2}(x)$ are the blending functions (see Figure 9-157) and $\mathbf{x}$ is the distance from the reference grid point, measured in the direction of the direction vector v . Functions $f_{1}(x)$ and $f_{2}(x)$ sum up to 1.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/5fd3e222de1362e89fcaddd65906cd55d309f67a50e7af0312035e0ba2b15385.jpg)  
Figure 9-157 Blending Functions  

4. If the overlap region extends beyond $-\mathrm{D}1<+<\mathrm{D}2$ , then $f_{1}(x)~=~1.0$ and $f_{2}(x)=0$ for $x<-{\textnormal D}1$ $f_{1}(x)=0$ and $f_{2}(x)~=~1.0$ for $x>\mathbf{D}2$  

5. The referenced splines must have the same USAGE flag. This USAGE flag defines the USAGE flag of the blended spline. 6. If the splined aero components are of type CAERO, a MDLPRM,MLTSPLIN,1 entry must be usec to enable blending. This is not required with AEGRID based aerodynamics.  

Defines a curve based blending of two splines.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPBLND2</td><td>SID</td><td>SID1</td><td>SID2</td><td>OPT</td><td>AELIST</td><td>D1</td><td>D2</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPBLND2</td><td>130</td><td>110</td><td>120</td><td>LIN</td><td>4</td><td>1.5</td><td>2.5</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Identification number of blended spline. (Integer > 0)</td></tr><tr><td>SID1</td><td>Identification number of first spline (may be a blended spline). (Integer > 0)</td></tr><tr><td>SID2</td><td>Identification number of second spline (may be a blended spline). (Integer > 0)</td></tr><tr><td>OPT</td><td>Blending Option:</td></tr><tr><td></td><td>LIN Linear Blending Functions (Default)</td></tr><tr><td></td><td>CUB Cubic Blending Functions</td></tr><tr><td>AELIST</td><td>Identification number of an AELIST entry listing the aerodynamic grid points that define a reference curve. (Integer > 0)</td></tr><tr><td>D1</td><td>Blending Depth of first spline. (Real > 0.0)</td></tr><tr><td>D2</td><td>Blending Depth of second spline. (Real > 0.0)</td></tr></table></body></html>  

## Remarks:  

1. The blending depth defines the maximum value of the distance of an aerodynamic grid point from the reference curve. It is also needed to evaluate the blending functions.   
2. Blending functions are evaluated based on the distance of an aerodynamic grid point from the reference curve.   
3.The reference curve is approximated by a polygon through the grid points listed on the AELIST entry referenced by AELIST.The list may contain coincident grid points.The order of the grid points is arbitrary.   
4.The referenced splines must have the same USAGE flag.This USAGE flag defines the USAGE flag of the blended spline.   
5. If the splined aero components are of type CAERO,a MDLPRM,MLTSPLIN,1 entry must be used to enable blending. This is not required with AEGRID based aerodynamics.  

Defines a set of single-point constraints and enforced motion (enforced displacements in static analysis and enforced displacements, velocities or acceleration in dynamic analysis).  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPC</td><td> SID</td><td>G1</td><td>C1</td><td>D1</td><td>G2</td><td>C2</td><td>D2</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPC</td><td>2</td><td>32</td><td>3</td><td>-2.6</td><td>5</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Identification number of the single-point constraint set. (Integer > 0)</td></tr><tr><td>Gi</td><td>Grid or scalar point identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component number. See Remark 8. (0 ≤ Integer ≤ 6; up to six Unique Integers, 1 through 6, may be placed in the field with no embedded blanks. O or lapplies to scalar points and 1 through 6 applies to grid points.)</td></tr><tr><td>Di</td><td>Value of enforced motion for components Gi at grid Ci. (Real; Default = 0.0)</td></tr></table></body></html>  

## Remarks:  

1. Single-point constraint sets must be selected with the Case Control command $S\mathrm{PC}=S\mathrm{ID}$ ·   
2. Degrees-of-freedom specified on this entry form members of the mutually exclusive s-set. They may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets,1111 for a list of these entries.   
3. Single-point forces of constraint are recovered during stress data recovery.   
4. From 1 to 12 degrees-of-freedom may be specified on a single entry.   
5. Degrees-of-freedom on this entry may be redundantly specified as permanent constraints using the PS field on the GRID entry.   
6.For reasons of effciency, the SPCD entry is the preferred method forapplying enforced motion rather than the Di field described here.   
7. For SOL 400, the SPC entry requests enforced total displacement (Di) while the SPCl entry requests null enforced relative displacements for a step. See the SPCD and SPCR entries for additional information.   
8.For heat shellelement with linear or quadratic nodal distribution (seeoption TEMPP for NLMOPTS entry $1{=}\mathrm{TOP}$ 。 $2{=}\mathrm{BOT}$ or $\scriptstyle3=$ MID.)   
9.In thermal analysis, this entry specifies a constant temperature boundary condition applied on the selected grid or scalar point.For SOL 400, transient thermal analysis with any time-varying boundary condition, a constant temperature condition should be specified using the SPCD and SPC1 Bulk Data entries.For SOLs 153 and 159 thermal analysis, no TEMPBC Bulk Data entries with TYPE $\v=$ “STAT" may be specified with this entry.  

<html><body><table><tr><td colspan="2">Enforced Relative Displacement</td></tr><tr><td>SPCR*</td><td> associated with SPC1 or GRID/PS</td></tr><tr><td colspan="2">Enforced Total Displacement</td></tr><tr><td>SPCD</td><td>associated with SPC and overwrite the value of enforced motion on SPC</td></tr><tr><td>SPCD</td><td> associated with SPC1 or GRID/PS</td></tr><tr><td>SPC</td><td>No association required</td></tr><tr><td colspan="2">In SOL 400, when a GRID has an applied load associated with it in the previous STEP and the user wishes to pick up the resulting displacement as an enforced displacement in the current STEP, then the recommended procedure is to use the SPCR. Alternatively, the user may apply instead an SPCl to the GRID to lock in the position of the grid from the previous STEP.</td></tr><tr><td colspan="2">For SOL 600, the SPC entry requests enforced total displacement just like SPCD, however SPC may only be used in SOL 600 to enforce displacements if there is just one subcase in the analysis. If two or more subcases exist, SPCD or SPCR must be used to prescribe the enforced motion.</td></tr></table></body></html>  

Defines a set of single-point constraints.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPC1</td><td>SID</td><td>C</td><td>G1</td><td>G2</td><td>G3 G4</td><td>G5</td><td>G6</td><td></td></tr><tr><td></td><td>G7</td><td>G8</td><td>G9</td><td>-etc.-</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPC1</td><td>3</td><td>2</td><td>1</td><td>3</td><td>10</td><td>9</td><td>6</td><td>5</td><td></td></tr><tr><td></td><td>2</td><td>8</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Format and Example:  

<html><body><table><tr><td>SPC1</td><td>SID C</td><td>G1</td><td></td><td>“THRU” G2</td><td></td><td></td><td></td><td></td></tr><tr><td>SPC1</td><td>313</td><td>12456</td><td>6</td><td>THRU 32</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td> SID</td><td>Identification number of single-point constraint set. (Integer > 0)</td></tr><tr><td>C</td><td>Component numbers. See Remark 7. (Any unique combination of the Integers 1 through 6 with no embedded blanks for grid points. This number must be Integer 0, 1 or blank for scalar points.)</td></tr><tr><td>Gi</td><td>Grid or scalar point identification numbers. (Integer > O or “THRU"; For “THRU" option, G1 < G2.)</td></tr></table></body></html>  

## Remarks:  

1. Single-point constraint sets must be selected with the Case Control command $S_{ Ḋ }\mathrm{PCḌḌ=S_{Ḋ}\mathrm{ID} Ḍ$   
2. Enforced displacements are available via this entry when used with the recommended SPCD entry.   
3. Degrees-of-freedom specified on this entry form members of the mutually exclusive s-set. They may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.   
4. Degrees-of-freedom on this entry may be redundantly specified as permanent constraints using the PS field on the GRID entry.   
5.If the alternate format is used, points in the sequence G1 through G2 are not required to exist. Points that do not exist will collectively produce a warning message but will otherwise be ignored.   
6. For SOL 400, the SPCl entry requests nullenforced relative displacement for a step while the SPC entry requests enforced total displacements.SPCl can always hold the displacement from the previous STEP. See the SPC, SPCD and SPCR entries for additional information.   
7.For heat shellelement with linear or quadratic nodal distribution (see option TEMPP for NLMOPTS entry $1{=}\mathrm{TOP}$ 。 $2{=}\mathrm{BOT}$ or $\scriptstyle3=$ MID.)   
8.In thermalanalysis,this entry is used with SPCD to specifya temperature boundary condition applied on the selected grid or scalar point. To define time-varying boundary conditions, the user should specify SPCl and SPC Bulk Data entries for SOL 400 while using TEMPBC Bulk Data entries with TYPE $\c=$ “TRAN" for SOL 159.  

<html><body><table><tr><td colspan="3">Enforced Relative Displacement</td></tr><tr><td>SPCR*</td><td>associated</td><td>SPC1 or GRID/PS</td></tr><tr><td colspan="3">Enforced Total Displacement</td></tr><tr><td>SPCD</td><td>associated</td><td>SPC</td></tr><tr><td>SPCD</td><td>associated</td><td>SPC1 or GRID/PS</td></tr><tr><td>SPC</td><td> No association required</td><td></td></tr><tr><td colspan="3">In SOL 400 if a“control" GRID has an applied load associated with it in the previous STEP and if the user wishes to pick up the resulting displacement as an enforced displacement in the current STEP, then the recommended procedure is stillto use the SPCR, however, the</td></tr></table></body></html>  

Defines a single-point constraint set as a union of single-point constraint sets defined on SPC or SPC1 entries.  

# Format:  

Example:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPCADD</td><td>SID</td><td>S1</td><td>S2</td><td>S3</td><td>S4</td><td>S5</td><td>S6</td><td>S7</td><td></td></tr><tr><td></td><td>S8</td><td>S9</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>SPCADD</td><td>101</td><td>3</td><td>2</td><td>9</td><td>1</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Single-point constraint set identification number. (Integer > 0)</td></tr><tr><td>Si</td><td>Identification numbers of single-point constraint sets defined via SPC or by SPC1 entries. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. Single-point constraint sets must be selected with the Case Control command $S\mathrm{PC}=S\mathrm{ID}$ ·   
2. No Si may be the identification number ofa single-point constraint set defined by another SPCADD entry.   
3. The Si values must be unique.   
4. If Modules are present then this entry may only be specified in the main Bulk Data section.   
5. SPCADD entries take precedence over SPC entries.If both have the same SID, only the SPCADD entry will be used.  

Defines a set of single-point constraints or enforced displacements for conical shellcoordinates.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7 8</td><td>9 10</td></tr><tr><td>SPCAX</td><td>SID</td><td>RID</td><td>HID</td><td>C D</td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPCAX</td><td>2</td><td>3</td><td>4</td><td>13</td><td>6.0</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Identification number of a single-point constraint set. (Integer > 0)</td></tr><tr><td>RID</td><td>Ring identification number. See RINGAX entry. (Integer ≥ 0)</td></tr><tr><td>HID</td><td>Harmonic identification number. (Integer ≥ 0)</td></tr><tr><td>C</td><td>Component identification number. (Any unique combination of the Integers 1 through 6.)</td></tr><tr><td>D</td><td>Enforced displacement value. (Real)</td></tr></table></body></html>  

## Remarks:  

1. SPCAX is allowed only if an AXIC entry is also present.   
2. Single-point constraint sets must be selected with the Case Control command $S\mathrm{PC}=S\mathrm{ID}$   
3. Coordinates appearing on SPCAX entries may not appear on MPCAX, SUPAX,or OMITAX entries.   
4.For a discussion of the conical shell problem, see Conical Shell Element(RlNGAX) (p.145) in the MSC   
Nastran Reference Guide.  

Defines an enforced displacement value for static analysis and an enforced motion value (displacement, velocity or acceleration) in dynamic analysis.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPCD</td><td> SID</td><td>G1</td><td>C1</td><td>D1</td><td>G2</td><td>C2</td><td>D2</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPCD</td><td>100</td><td>32</td><td>3</td><td>-2.6</td><td>5</td><td></td><td>2.9</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>SID</td><td>Set identification number of the SPCD entry. (Integer > 0)</td></tr><tr><td>Gi</td><td>Grid or scalar point identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component numbers. See Remark 10. (0 ≤ Integer ≤ 6; any unique combination of Integers 1 through 6 with no embedded blanks for grid points; Integer O, 1 or blank for</td></tr><tr><td>Di</td><td>scalar points) Value of enforced motion for components Ci at grid Gi. (Real)</td></tr></table></body></html>  

## Remarks:  

1. In the static solution sequences, the set ID of the SPCD entry (SID) is selected by the LOAD Case Control command. For SOL 600, it may also be selected by Li on the Bulk Data entry LOAD.  

2.In dynamic analysis, the selection of SID is determined by the presence of the LOADSET request ir Case Control as follows:  

· There is no LOADSET request in Case Control SID is selected by the EXCITEID field of an RLOAD1, RLOAD2, TLOAD1 or TLOAD2 Bulk Data entry that has enforced motion specified in its TYPE field   
There is a LOADSET request in Case Control SID is selected by LID in the selected LSEQ entries that correspond to the EXCITEID entry of an RLOAD1, RLOAD2, TLOAD1 or TLOAD2 Bulk Data entry that has enforced motion specified in its TYPE field.  

3. The SPCD entry is not supported in SOL 200.  

4.A global coordinate (Gi and Ci) referenced on this entry must also be referenced on a SPC or SPC1 Bulk Data entry and selected by the SPC Case Control command. This requirement is optional for SOL 600.  

5. Enforced motion may be specified on both SPCD and SPC Bulk Data entries. The SPCD entry is selected according to Remark 2 and the SPC entry is selected by the SPC Case Control command. The Di values from both of the selected SPCD and SPC entries willbe combined to form a static (or spatial) loading condition. But ifa degree-of-freedom is duplicated on both SPCD and SPC then the value of Di on the selected SPCD entry will override the value of Dion the selected SPC entry. In addition, any degrees-of-freedom from the selected SPC entries and not duplicated will still be included in the loading condition. This is illustrated in the examples below.  

Static analysis: In the example below in SUBCASE 11, ${\mathrm{D}}{=}1.0$ at GRID 101 overrides $\mathrm{D}{=}1.2$ 0 the SPC entry. But GRID 201 is not specified on the selected SPCD and therefore $\mathrm{D}{=}1.2$ fro1 the SPC entry is also enforced. Similary, in subcase 12, ${\mathrm{D}}{=}1.0$ is enforced at GRID 201 and $\mathrm{D}{=}1.2$ at GRID 101. $S P C=77$ SUBCASE 11 LOAD=701 SUBCASE 12 LOAD=702 BEGIN BULK SPCD,701,101,2,1.0 SPCD,702,201,2,1.0 SPC ,77 ,101,2,1.2 SPC ,77 ,201,2,1.2 Dynamic analysis: In the example below, there are two unique EXCITEIDs specified on TLOAD2 and thusly two static loading conditions are created and identical to the conditions created in the static analysis example above. SPC=77 DLOAD=201 BEGIN BULK DLOAD,201,1.0,1.0,401,1.0,402 TLOAD2, 401, 701,,DISP,0., 10.0,60.,90. TLOAD2, 402,702,,DISP,0.,10.0,20.,270. SPCD,701,101,2,1.0 SPCD,702,201,2,1.0 SPC ,77 ,101,2,1.2 SPC ,77 ,201,2,1.2 6. The LOAD Bulk Data entry will not combine an SPCD load entry except for SOL 600.  

7.In static analysis,this method ofapplyingenforced displacements is more eficient than the SPC entry when more than one enforced displacement condition is applied. It provides equivalent answers.  

8.In dynamic analysis, this direct method of specifying enforced motion is more accurate, efficient and elegant than the large mass and Lagrange multiplier techniques.   
9.For SOL 400,the SPCD entry requests enforced total displacement for a STEP while the SPCR entry requests enforced relative displacements. SPCD is the position at the end of the applied STEP for ANALYSIS $\c=$ NLSTAT.   
10.For SOL 400 using heat shellelement with linear or quadratic nodal distribution, see option TEMPP for NLMOPTS entry $1{=}\mathrm{TOP}$ ， $2{=}\mathrm{BOT}$ or $3{=}\mathrm{MID}^{\cdot}$ ）   
11.In thermalanalysis, this entry is used with SPCl to specifya temperature boundary condition applied on the selected grid or scalar point. To define time-varying boundary conditions, the user should specify SPCl and SPCD Bulk Data entries for SOL 40O while using TEMPBC Bulk Data entries with TYPE $\v{r}_{\mathbf{\lambda}}=$ “TRAN" for SOL 159 and SOL 600.   
12.If it is desired to enforce motion on the boundary point (a-set) of a superelement then define a high stiffness element attached to the boundary point and apply the SPCD to the opposite point of the high stiffness element. High stiffness elements may be easily defined with CBUSH or CBAR.  

<html><body><table><tr><td>Enforced Relative Displacement</td></tr><tr><td>SPCR* associated with SPC1 or GRID/PS</td></tr><tr><td>Enforced Total Displacement</td></tr><tr><td>SPCD associated with SPC and overwrite the value of enforced motion on SPC</td></tr><tr><td>SPCD associated with SPC1 or GRID/PS</td></tr><tr><td>SPC No association required</td></tr><tr><td>In SOL 400, when a GRID has an applied load associated with it in the previous STEP and the user wishes to pick up the resulting displacement as an enforced displacement in the current STEP, then the recommended procedure is to use the SPCR. Alternatively, the user may apply instead an SPCl to the GRID to lock in the position of the grid from the previous STEP.</td></tr><tr><td>For SOL 600, the SPCD entry requests enforced total displacement for the subcase and is the position at the end of the SUBCASE. SPCR requests displacement or rotation for the current subcase relative to that of the previous subcase. SPCD may be used for nonlinear statics or dynamics and does not need to be associated with SPC, SPC1 or GRID/PS. In</td></tr></table></body></html>  

Defines a set of degrees-of-freedom to be excluded from the AUTOSPC operation. See Constraint and Mechanism Problem Identification in SubDMAP SEKR in the MSC Nastran Reference Guide for a description of the AUTOSPC operation.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPCOFF</td><td>G1</td><td>C1</td><td>G2</td><td>C2</td><td>G3</td><td>C3</td><td>G4</td><td>C4</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPCOFF</td><td>32</td><td>436</td><td>5</td><td>1</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>Gi</td><td>Grid or scalar point identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component numbers. (Integer O, 1 or blank for scalar points; Integers 1 through 6 with no embedded blanks for grid points.)</td></tr></table></body></html>  

## Remarks:  

1. Degrees-of-freedom specified on this entry are to be excluded from the AUTOSPC operation. If any degree-of-freedom in this set is found to be singular, a warning message is issued and no constraint is applied. 2. Degrees-of-freedom that are specified as both SPC and SPCOFF will be considered as SPC.  

Defines a set of degrees-of-freedom to be excluded from the AUTOSPC operation. See Constraint and Mechanism Problem Identification in SubDMAP SEKR in the MSC Nastran Reference Guide for a description of the AUTOSPC operation.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>SPCOFF1</td><td>C</td><td>G1</td><td>G2</td><td>G3</td><td>G4 G5</td><td>G6</td><td>G7</td><td></td></tr><tr><td></td><td>G8</td><td>G9</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPCOFF1</td><td>2 8</td><td>1 3</td><td>10</td><td>9</td><td>6 5</td><td>4</td></tr></table></body></html>  

## Alternate Format and Example:  

<html><body><table><tr><td>SPCOFF1 C SPCOFF1 12456</td><td>G1</td><td>“THRU”</td><td></td><td>G2</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>C</td><td>Component numbers. (Any unique combination of the Integers 1 through 6 with no embedded blanks for grid points; Integer O, 1 or blank for scalar points.)</td></tr><tr><td>Gi</td><td>Grid or scalar point identification numbers. (Integer > O or “THRU"; for “THRU" option, G1<G2.)</td></tr></table></body></html>  

## Remarks:  

1. Degrees-of-freedom specified on this entry are to be excluded from the AUTOSPC operation. Ifany degree-of-freedom in this set is found to be singular, a warning message is issued and no constraint is applied.   
2. Degrees-of-freedom that are both specified as SPC and SPCOFF will be considered as SPC.   
3.If the alternate format is used, points in the sequence Gl through G2 are not required to exist. Points which do not exist will collectively produce a warning message but will otherwise be ignored.  

Defines an enforced relative displacement value for a load step in SOL 400 and SOL 600.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPCR</td><td>SID</td><td>G1</td><td>C1</td><td>D1</td><td>G2</td><td>C2</td><td>D2</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPCR</td><td>100</td><td>32</td><td>436</td><td>-2.6</td><td>5</td><td></td><td>2.9</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td> Set identification number of the SPCR entry. (Integer > 0)</td></tr><tr><td>Gi</td><td>Grid or scalar point identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component number. (0 ≤ Integer ≤ 6; up to six unique Integers may be placed in the field with no embedded blanks,a blank or O is treated the same as 1.)</td></tr><tr><td>Di</td><td>Value of enforced motion for Gi and Ci. (Real)</td></tr></table></body></html>  

## Remarks:  

1. SPCR requests relative motion foraload step with respect to the previous step in SOL 400 or subcase in SOL 600. SPCR is the companion entry to SPCD. SPCD requests total motion while SPCR requests relative motion. SPCR is the position at activation of the boundary condition.  

<html><body><table><tr><td>Enforced Relative Displacement</td></tr><tr><td>SPCR* associated with SPC1 or GRID/PS</td></tr><tr><td>Enforced Total Displacement</td></tr><tr><td>SPCD associated with SPC and overwrite the value of enforced motion on SPC</td></tr></table></body></html>  

<html><body><table><tr><td colspan="2">Enforced RelativeDisplacement</td></tr><tr><td> SPCD</td><td> associated with SPC1 or GRID/PS</td></tr><tr><td> SPC</td><td>No association required</td></tr><tr><td colspan="2">In SOL 400, when a GRID has an applied load associated with it in the previous STEP and the user wishes to pick up the resulting displacement as an enforced displacement in the current STEP, then the recommended procedure is to use the SPCR. Alternatively, the user may apply instead an SPC1 to the GRID to lock in the position of the grid from the previous STEP.</td></tr><tr><td colspan="2">For SOL 600, the SPCR entry requests displacement or rotation for the current subcase relative to that of the previous subcase. The SPCD requests enforced total displacement for the subcase and is the position at the end of the SUBCASE. SPCR may be used for nonlinear statics or dynamics and does not need to be associated with SPC, SPC1 or GRID/PS. In other words, the association can be made but is not required for SOL 600.</td></tr></table></body></html>  

2. The enforced motion for a step,for SOL 400 or subcase for SOL 600,can be either total value or relative value. For SOL 400,SPC and SPCD request total enforced motion. SPC1 and SPCR request the relative value. For example, if a DOF is specified on a SPCR with 0.0 for step 2, the relative displacement of this DOF for step 2 with respective to step 1 is 0.0. The total displacement of step 2 is 0.2 if the solution of step 1 for this DOF is 0.2.   
3. The SCPD and SPCR entries can have the same SID,but they cannot be specified on the same DOF A user fatal error will be issued if SPCD and SPCR are specified on the same DOF.   
4.In the static solution sequences, the SID of the SPCR entry (SID), same as SPCD, is selected by the LOAD Case Control command   
5. For SOL 400,a global coordinate (Gi and CI) referenced on this entry must also be referenced on a SPC1 Bulk Data entry and selected by the SPC Case Control command. Please note that, for this purpose, SPC cannot be used together with SPCR. If SPC is used, a user fatal error willbe issued.   
6. For SOL 400, the LOAD Bulk Data entry will not combine an SPCR load entry.   
7. For SOL 60O if SPCR is entered, PARAM,MARCTOTT,1 must also be entered.  

Spherical shape used in the initial condition definition on the TICEULl entry. Used in SOL 700 only.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPHERE</td><td>VID</td><td></td><td>X</td><td>Y</td><td>Z</td><td>RADIUS</td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPHERE</td><td>100</td><td>1.</td><td>1.</td><td>1.</td><td>5</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>VID</td><td>Number of the sphere. (Integer > O; Required)</td></tr><tr><td>X,Y,Z</td><td>Coordinates of the center of the sphere. (Real; Default = 0.0)</td></tr><tr><td>RADIUS</td><td>Radius of the sphere. (Real > O; Required)</td></tr></table></body></html>  

Defines a surface spline for interpolating motion and/or forces for aeroelastic problems on aerodynamic geometries defined by regular arrays of aerodynamic points.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPLINE1</td><td>EID</td><td>CAERO</td><td>BOX1</td><td>BOX2</td><td>SETG</td><td>DZ</td><td>METH</td><td>USAGE</td><td></td></tr><tr><td></td><td>NELEM</td><td>MELEM</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPLINE1</td><td>3</td><td>111</td><td>115</td><td>122</td><td>14</td><td>0.</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>EID</td><td>Unique spline identification number. (Integer > 0)</td></tr><tr><td>CAERO</td><td> Aero-element (CAEROi entry ID) that defines the plane of the spline. (Integer > 0)</td></tr><tr><td>BOX1,BOX2</td><td>First and last box with motions that are interpolated using this spline; see Remark 3. when using Mach Box method. (Integer > 0; BOX2 ≥ BOX1)</td></tr><tr><td>SETG</td><td>Refers to the SETi entry that lists the structural grid points to which the spline is attached. (Integer > 0)</td></tr><tr><td>DZ</td><td>Linear attachment flexibility. (Real ≥ 0.0; Default = 0.0)</td></tr><tr><td>METH</td><td> Method for the spline fit. IPS,TPS or FPS. See Remark 1. (Character; Default = IPS)</td></tr><tr><td>USAGE</td><td>Spline usage flag to determine whether this spline applies to the force transformation, displacement transformation or both. FORCE, DISP or BOTH. See Remark 5. (Character; Default = BOTH)</td></tr><tr><td>NELEM</td><td>The number of FE elements along the local spline x-axis if using the FPS option. (Integer > 0; Default = 10)</td></tr><tr><td>MELEM</td><td>The number of FE elements along the local spline y-axis if using the FPS option. (Integer > 0; Default = 10)</td></tr></table></body></html>  

## Remarks:  

1. The default METHOD will result in the use of the Harder-Desmarais Infinite Plate Spline (IPS). The other options are the Thin Plate Spline (TPS) and the Finite Plate Spline (FPS). The continuation applies only to the FPS option and is required only if the defaults are not adequate.   
2.The interpolated points (k-set) will be defined by aero boxes. Figure 9-158 shows the cell for which $u_{k}$ is interpolated if $\mathrm{BOX1}=115$ and $\mathrm{BOX}2=122$ ·  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/2a7409433973a5138db9bd979e29c6d4050f08f6cc019c6dffbc10cedee70c8b.jpg)  
Figure 9-158 SPLINE1 Entry Example  

3. The attachment flexibility (units of area) is used for smoothing the interpolation. If $\mathrm{DZ}=0.0$ ,the spline will pass through all deflected grid points. If DZ is much greater than the spline area, a least squares plane fit will be applied. Intermediate values will provide smoothing.  

4.When using the Mach Box method, BOXl and BOX2 refer to the ID number of the first and last aerodynamic grids (x,y pairs on the AEFACT entry) which willbe used for interpolation to structural grids. BOX1 and BOX2 do not refer to Mach Boxes.  

5. The USAGE field allows you to specify that the particular spline interpolant defined in this entry is to be used for just the force transformation (FORCE) or just the displacement transformation (DISP) or for both (BOTH).  

$$
\begin{array}{l l}{{F g=[G P k g]^{T}\{P k\}}}&{{\mathrm{(FORCE/BOTH~splines~are~in~the~transform)}}}\\ {{{\cal U}k=[G D k g]\{U g\}}}&{{\mathrm{(DISP/BOTH~splines~are~in~the~transform)}}}\end{array}
$$  

In general, the two transforms are done with distinct matrices. Only when ALL splines are of type BOTH is the familiar transpose relationship $\left[G P g k\right]^{T}=\left[G D k g\right]$ satisfied. The default behavior (BOTH for allsplines) is compatible with versions of MSC Nastran prior to Version 70.5.  

In general, the USAGE field can be used to apply aerodynamic forces to the structure from aerodynamic panels that are intended NOT to move (USAGE $\v{r}_{\mathbf{r}}=$ FORCE) or to apply structural displacements to aerodynamic grids whose forces are not to be applied to the structure (USAGE $\backslash=$ DISP).The DISP option is somewhat esoteric in that you are then suggesting that the aeroelastic effect of the surface is important while its forces are not. (In other words,only the forces arising from its efects on other surfaces is important.) While there may be circumstances where this is true,it is unlikely. Take care that you included allthe FORCEs from aerodynamic panels that are important by including them in either FORCE or BOTH spline(s). MSC Nastran will NOT issue a warning unless ALL forces are omitted. All displacements may be omitted without warning (and is a means to perform “rigid aerodynamic" analyses).  

6. The SPLINE1 EID must be unique with respect to all SPLINEi entries.  

Defines a beam spline for interpolating motion and/or forces for aeroelastic problems on aerodynamic geometries defined by regular arrays of aerodynamic points.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPLINE2</td><td>EID</td><td>CAERO</td><td>ID1</td><td>ID2</td><td>SETG</td><td>DZ</td><td>DTOR</td><td>CID</td><td></td></tr><tr><td></td><td>DTHX</td><td>DTHY</td><td></td><td>USAGE</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPLINE2 5</td><td>8</td><td>12</td><td>24</td><td>60</td><td>0.</td><td>1.0</td><td>3</td><td></td></tr><tr><td></td><td>1.</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>EID</td><td>Unique spline identification number. (Integer > 0)</td></tr><tr><td>CAERO</td><td>Aero panel or body (CAEROi entry ID) that is to be interpolated. (Integer > 0)</td></tr><tr><td>ID1, ID2</td><td>First and last box or body element whose motions are interpolated using this spline. See Remark 6. when using the Mach Box method. (Integer > 0; ID2 ≥ ID1)</td></tr><tr><td>SETG</td><td>Refers to an SETi entry that lists the structural grid points to which the spline is attached. (Integer > 0)</td></tr><tr><td>DZ</td><td>Linear attachment flexibility. (Real ≥ 0.0; Default = 0.0)</td></tr><tr><td>DTOR</td><td>Torsional flexibility ratio (EI/GJ). (Real > 0.0; Default = 1.0; use 1.0 for bodies.)</td></tr><tr><td>CID</td><td>Rectangular coordinate system for which the y-axis defines the axis of the spline. Not used for bodies, CAERO2. (Integer ≥ 0)</td></tr><tr><td>DTHX, DTHY</td><td>Rotational attachment flexibility. DTHX is for rotation about the spline's x-axis (in- plane bending rotations); however, it is not used for bodies. DTHY is for rotation about the spline's y-axis (torsion); however, it is used for slope of bodies. (Real)</td></tr><tr><td>USAGE</td><td>Spline usage flag to determine whether this spline applies to the force transformation, displacement transformation or both. FORCE, DISP or BOTH. See Remark 9. (Character; Default = BOTH)</td></tr></table></body></html>  

## Remarks:  

1. The interpolated points (k-set) will be defined by aero boxes.   
2.The spline axis for panels is the projection of the y-axis of coordinate system CID, projected onto the plane of the panel. For bodies,the spline axis is paralel to the x-axis of the aerodynamic coordinate system.   
3.The flexibilities DZ, DTHX, and DTHY are used for smoothing. (Zero attachment flexibility values will imply rigid attachment (i.e., no smoothing, whereas negative values of DTHX or DTHY will imply infinity, therefore, no attachment). See the MSC Nastran Aeroelastic Analysis User's Guide for a discussion of special cases.   
4. The continuation entry is required.   
5. The SPLINE2 EID must be unique with respect to all SPLINEi entries.   
6. When using the Mach Box method, ID1 and ID2 refer to the ID number of the first and last aerodynamic grids $\scriptstyle(\mathbf{x},\mathbf{y}$ pairs on the AEFACT entry) which will be used for interpolation to the structural grids. ID1 and ID2 do not refer to Mach Boxes.   
7. DTOR is the ratio of rotational to linear deflection and, in lieu ofa more accurate estimate, a value of 1.0 is recommended. A different value may be used; e.g.,if DTOR is much greater than 1.0, primarily rotational deflection will occur; if DTOR is much lessthan 1.0, primarily linear deflection will occur.   
8.Ifa SPLINE2 element only references one grid point, the job willfail without a message in the GI Module.   
9.The USAGE field allows you to specify that the particular spline interpolant defined in this entry is to be used for just the force transformation (FORCE) or just the displacement transformation (DISP) or for both (BOTH). See Remark 5. of the SPLINE1 Bulk Data entry.  

Defines a constraint equation for aeroelastic problems. Useful for control surface constraints.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPLINE3</td><td>EID</td><td>CAERO</td><td>BOXID</td><td>COMP</td><td>G1</td><td>C1</td><td>A1</td><td>USAGE</td><td></td></tr><tr><td></td><td>G2</td><td>C2</td><td>A2</td><td></td><td>-etc.</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPLINE3 7000</td><td>107</td><td>109</td><td>6 5</td><td>3</td><td>1.0</td><td></td></tr><tr><td>43</td><td>5</td><td>-1.0</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Unique spline identification number. (Integer > 0)</td></tr><tr><td>CAERO</td><td>Identification number of the macro-element on which the element to be interpolated lies. (Integer > 0)</td></tr><tr><td>BOXID</td><td>Identification number of the aerodynamic element; i.e., the box number. (Integer > 0)</td></tr><tr><td>COMP</td><td>The component of motion to be interpolated. See Remark 4. (One of the Integers 1, 2, 3,4,5, or 6.)</td></tr><tr><td>Gi</td><td>Grid point identification number of the independent grid point. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component numbers in the displacement coordinate system. (One of the Integers 1 through 6 for grid points, or O for scalar points.)</td></tr><tr><td>Ai</td><td>Coefficient of the constraint relationship. (Real)</td></tr><tr><td>USAGE</td><td>Spline uage flag to determine whether this spline applies to the force transformation, displacement transformation or both. FORCE, DISP or BOTH. See Remark 6. (Character; Default = BOTH).</td></tr></table></body></html>  

## Remarks:  

1. The independent grid points and components must refer to degrees-of-freedom in the g-set.   
2. The constraint is given by  

$u_{d}=\sum A_{i}u_{i}$ where:  

$u_{d}~=~$ value of the dependent component of the aerodynamic element $u_{i}~=$ displacement at grid Gi, component Ci.  

3. The SPLINE3 EID must be unique with respect to all SPLINEi entries.  

4. The allowable components by CAEROi entry type are indicated by an“X" in the table below:  

<html><body><table><tr><td rowspan="2">Entry Type</td><td colspan="5">COMP</td></tr><tr><td>1</td><td>2</td><td>3</td><td>5</td><td>6</td></tr><tr><td>CAERO1</td><td></td><td></td><td>X</td><td>X</td><td></td></tr><tr><td>CAERO2</td><td></td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>CAERO3</td><td></td><td></td><td>X</td><td></td><td></td></tr><tr><td>CAERO4</td><td></td><td></td><td>X</td><td>X</td><td>X</td></tr><tr><td>CAERO5</td><td></td><td></td><td>X</td><td>X</td><td>X</td></tr><tr><td>3D Geometry</td><td>X</td><td>X</td><td>X</td><td>X</td><td>X</td></tr></table></body></html>  

${\mathrm{COMP}}=2$ ： lateral displacement  

${\mathrm{COMP}}=3$ transverse displacement  

${\mathrm{COMP}}=5 $ : pitch angle  

${\mathrm{COMP}}=6 $ : relative control angle for CAERO4 and CAERO5 yaw angle for CAERO2.  

For general 3D aerodynamic geometries the components numbers refer to axes of the Aerodynamic Coordinate System $({u_{x}},{u_{y}},{u_{z}},{\theta_{x}},{\theta_{y}},{\theta_{z}})$ ，  

5. For Strip theory and Piston theory, the ${\mathrm{COMP}}=6 $ control surface relative angle is positive when the trailing edge has a negative $\mathbf{z}$ -deflection in the element coordinate system (see the MSc Nastran Aeroelastic Analysis User's Guide).  

6.The USAGE field allows you to specify that the particular spline interpolant defined in this entry is to be used for justthe force transformation (FORCE)or just the displacement transformation (DISP) or for both (BOTH).See Remark 5. of the SPLINE1 Bulk Data entry.  

Defines a curved surface spline for interpolating motion or forces for aeroelastic problems on general aerodynamic geometries.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>５</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPLINE4</td><td>EID</td><td>CAERO</td><td>AELIST</td><td></td><td>SETG</td><td>DZ</td><td>METH</td><td>USAGE</td><td></td></tr><tr><td></td><td>NELEM</td><td>MELEM</td><td>FTYPE</td><td>RCORE</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPLINE4</td><td>3</td><td>111</td><td>115</td><td>14</td><td>0.</td><td>IPS</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Unique spline identification number. (Integer > 0)</td></tr><tr><td>CAERO</td><td>Identification number of aerodynamic component that defines the interpolation surface. (Integer > 0)</td></tr><tr><td>AELIST</td><td>Identification of an AELIST entry listing the boxes or aerodynamic grid points to be interpolated using this spline. See Remark 2. (Integer > 0)</td></tr><tr><td>SETG</td><td>Identification number of a SETl entry that lists the structural grid points to which the spline is attached. (Integer > 0)</td></tr><tr><td>DZ</td><td>Linear attachment flexibility. (Real ≥ O.O; Default = 0.0)</td></tr><tr><td>METH</td><td>Spline method:</td></tr><tr><td rowspan="5"></td><td>IPS Infinite Plate Spline (Default)</td></tr><tr><td>TPS Thin Plate Spline</td></tr><tr><td>FPS Finite Plate Spline</td></tr><tr><td>RIS Radial Interpolation Spline</td></tr><tr><td>Spline usage flag to determine whether this spline applies to the force transformation, displacement transformation or both. Legal values are FORCE, DISP or BOTH. See</td></tr><tr><td>NELEM</td><td>Remark 3. (Character, Default = BOTH) The number of FE elements along the local x-axis if using the FPS option. (Integer > 0;</td></tr><tr><td>MELEM</td><td>Default = 10) The number of FE elements along the local y-axis if using the FPS option. (Integer > 0;</td></tr><tr><td></td><td>Default = 10)</td></tr><tr><td>FTYPE</td><td>Selects the radial interpolation function to be used with the RIS option: WFO CO continuous Wendland function</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td></td><td>WF2 C2 continuous Wendland function (Default)</td></tr><tr><td>RCORE</td><td>Radius of support of radial interpolation function. (Real > O.O; no Default)</td></tr></table></body></html>  

## Remarks:  

1. The attachment flexibility (units of area) is used for smoothing the interpolation. If $\mathrm{D}Z=0.0$ ,the spline will pass through all deflected grid points. If DZ is much greater than the spline area, a least squares plane fit willbe applied. Intermediate values will provide smoothing.   
2. For aerodynamic meshes input using AEGRID/AEQUAD4/AETRIA3 entries,the AELIST items are AEGRIDS. For the Mach Box method, the AELIST refers to the aerodynamic grids $\left(\mathbf{x},\mathbf{y}\right.$ pairs on the AEFACT entry). For all other aero methods, the AELIST items are box id's.   
3.The USAGE field allows you to specify that the particular spline interpolant defined in this entry is to be used forjust the force transformation (FORCE) or just the displacement transformation (DISP) or for both (BOTH). See Remark 5. of the SPLINE1 Bulk Data entry.   
4. NELEM and MELEM are used only for the METH $\underline{{\underline{{\mathbf{\Pi}}}}}=\underline{{\underline{{\mathbf{\Pi}}}}}$ FPS and are required only when the defaults are not adequate.   
5. FTYPE and RCORE used onlv with METH $\dot{.}=\dot{}$ RIS.FTYPE $\v{x}_{1}=$ WFO uses a Wendland function:  

$$
\Phi{\Bigg(}{\frac{r}{r_{c}}}{\Bigg)}=\left(1-{\frac{r}{r_{c}}}\right)^{2} 
$$  

while $\mathrm{FTYPE}=\mathrm{WF}2$ uses  

$$
\Phi\Bigl(\frac{r}{r_{c}}\Bigr)=\Bigl(1-\frac{r}{r_{c}}\Bigr)_{t}^{4}\Bigl(4\frac{r}{r_{c}}+1\Bigr)
$$  

where  

$$
(y)_{t}={\left\{\begin{array}{l l}{y}&{{\mathrm{~if~y>0~}}}\\ {o}&{{\mathrm{~if~y<0~}}}\end{array}\right.}
$$  

Defines a 1D beam spline for interpolating motion and/or forces for aeroelastic problems on aerodynamic geometries.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPLINE5</td><td>SID</td><td>CAERO</td><td>AELIST</td><td></td><td>SETG</td><td>DZ</td><td>DTOR</td><td>CID</td><td></td></tr><tr><td></td><td>DTHX</td><td>DTHY</td><td></td><td>USAGE</td><td>METH</td><td></td><td>FTYPE</td><td>RCORE</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPLINE5 5</td><td>8</td><td>12</td><td>60</td><td></td><td>3</td></tr><tr><td></td><td>1.</td><td></td><td>BOTH</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Unique spline identification number (Integer > 0)</td></tr><tr><td>CAERO</td><td>Identification number of aerodynamic component that defines the interpolation surface. (Integer > 0)</td></tr><tr><td>AELIST</td><td>Identification of an AELIST entry listing the boxes or aerodynamic grid points to be interpolated using this spline. See Remark 6. (Integer > 0)</td></tr><tr><td>SETG</td><td>Refers to an SETi entry that lists the structural grid points to which the spline is atached. (Integer > 0)</td></tr><tr><td>DZ</td><td> Linear attachment flexibility. (Real ≥ O.0; Default = 0.0)</td></tr><tr><td>DTOR</td><td>Torsional flexibility ratio (EI/GJ) for the bending in the zy-plane. This value is ignored for slender bodies since they have no torsion; see Remark 7. (Real > 0.0; Default = 1.0; ignored for CAERO2 bodies.)</td></tr><tr><td>CID</td><td>Rectangular coordinate system that defines the y-axis of the spline and the xy- and yz- planes for bending. Not used for bodies, CAERO2. (Integer ≥ 0)</td></tr><tr><td>DTHX,</td><td>Rotational attachment flexibility. DTHX is for rotation about the spline's x-axis (the</td></tr><tr><td>DTHY</td><td>bending rotations). DTHY is for rotation about the spline's y-axis (torsion); however, it is used for bending of bodies. (Real)</td></tr><tr><td>USAGE</td><td>Spline usage flag to determine whether this spline applies to the force transformation, displacement transformation or both. FORCE, DISP or BOTH. See Remark 8. (Character; Default = BOTH)</td></tr><tr><td rowspan="3">METH</td><td>Spline method:</td></tr><tr><td>BEAM Beam Spline (Default)</td></tr><tr><td>RIS Radial Interpolation Spline</td></tr><tr><td>FTYPE</td><td> Selects the radial interpolation function to be used with the RIS option:</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td><td></td></tr><tr><td></td><td>WFO</td><td>CO continuous Wendland function</td></tr><tr><td></td><td>WF2</td><td>C2 continuous Wendland function. (Default)</td></tr><tr><td>RCORE</td><td colspan="2">Radius of support of radial interpolation function. (Real > 0.0; no Default)</td></tr></table></body></html>  

## Remarks:  

1. The interpolated points (k-set) will be defined by aero boxes.   
2.The splineaxis for panels is the projection of the y-axis of coordinate system CID, projected onto the plane of the panel. For bodies, the interpolating beam (y-axis) is paralel to the x-axis of the aerodynamic coordinate system; the z-axis is taken from the referenced CID and x is made orthogonal.   
3. The flexibilities DZ, DTHX and DTHY are used for smoothing.(Zero attachment flexibility values imply rigid atachment; i.e., no smoothing, whereas negative values of DTHX or DTHY imply infinity,therefore, no attachment.) See the MSC Nastran Aeroelastic Analysis User's Guide for a discussion of special cases.   
4. The continuation entry is required.   
5. The SPLINE5 EID must be unique with respect to all SPLINEi entries.   
6. For aerodynamic meshes input using AEGRID/AEQUAD4/AETRIA3 entries,the AELIST items are AEGRIDS. For the Mach Box method, the AELIST refers to the aerodynamic grids (x,y pairs on the AEFACT entry). For all other aero methods, the AELIST items are box id's.   
7. DTOR is the ratio of axial rotational to bending deflection and, in lieu of a more accurate estimate, a value of 1.0 is recommended. A different value may be used; e.g.,if DTOR is much greater than 1.0, primarily rotational deflection will occur; if DTOR is much less than 1.0, primarily linear deflection will occur. The values willafect the results only if the structural grids over constrain the motion of the interpolating beam. Slender bodies have no torsional motion, so these values will not be used for CAERO2 entries.   
8.The USAGE field allows you to specify that the particular spline interpolant defined in this entry is to be used for just the force transformation (FORCE) or just the displacement transformation (DISP) or for both (BOTH). See Remark 5. of the SPLINE1 Bulk Data entry.   
9. FTYPE and RCORE are only used for METHOD $\mid=$ RIS. See Remark 5. on the SPLINE 4 entry for descriptions of the Wendland functions.  

Defines a 6DOF or 3DOF finite surface spline for interpolating motion and/or forces between two meshes.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPLINE6</td><td>EID</td><td>CAERO</td><td>AELIST</td><td></td><td>SETG</td><td>DZ</td><td>METHOD</td><td>USAGE</td><td></td></tr><tr><td></td><td>VSTYPE</td><td>VSLIST</td><td>I2VNUM</td><td>D2VNUM</td><td>METHVS</td><td>DZR</td><td>METHCON</td><td>NGRID</td><td></td></tr><tr><td></td><td>ELTOL</td><td>NCYCLE</td><td>AUGWEI</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPLINE6</td><td>5</td><td>8</td><td>12</td><td></td><td>60</td><td></td><td>FPS6</td><td>DISP</td></tr><tr><td></td><td>AERO</td><td>2</td><td>4</td><td>4</td><td>VS6</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Unique spline identification number. (Integer > 0)</td></tr><tr><td>CAERO</td><td>Aero panel (CAEROi entry ID) that is to be interpolated. See Remarks 2.and 4. (Integer > O or blank)</td></tr><tr><td>AELIST</td><td>Identification of an AELIST entry listing the boxes or aerodynamic grid points to be interpolated using this spline. See Remark 2. (Integer > 0)</td></tr><tr><td>SETG</td><td>Refers to an SETi entry that lists the structural grid points to which the spline is attached. (Integer > 0)</td></tr><tr><td>DZ</td><td>Linear attachment flexibility. (Real ≥ 0.0; Default = 0.0)</td></tr><tr><td>METHOD</td><td>Method for the spline fit. Either FPS3 or FPS6. See Remark 5. (Character; Default = FPS6)</td></tr><tr><td>USAGE</td><td>Spline usage flag to determine whether this spline applies to the force transformation, displacement transformation or both. FORCE, DISP or BOTH. See Remark 3. (Character; Default = BOTH)</td></tr><tr><td>VSTYPE</td><td>Virtual surface connectivity type. Either AERO or STRUC. (Character; Default = AERO)</td></tr><tr><td>VSLIST</td><td>Identification number of an AELIST entry listing quadrilateral and/or triangular shell elements of the VSTYPE mesh which define the connectivity of the virtual surface mesh. See Remark 2. (Integer > O or can be blank if CAERO is not blank and VSTYPE=AERO)</td></tr><tr><td>12VNUM</td><td>The minimum number of structural mesh points to connect to each virtual mesh point. See Remarks 7., 8. and 9. (0 < Integer; Default = 3)</td></tr><tr><td>D2VNUM</td><td>The minimum number of aero mesh points to connect to each virtual mesh point. See Remarks 7., 8. and 9. (0 < Integer; Default = 3)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>METHVS</td><td>Similar to METHOD, this field chooses whether or not to include the rotational degrees-of-freedom of virtual surface. Either VS6 or VS3. See Remark 5. (Character, Default VS6)</td></tr><tr><td>DZR</td><td>Rotational attachment flexibility. (Real ≥ 0.O; Default = 0.0)</td></tr><tr><td>METHCON</td><td>Method used to determine RBE3 connecting points between the meshes. Either NODEPROX or CIRCBIAS. See Remarks 7., 8. and 9. (Character; Default =</td></tr><tr><td>NGRID</td><td>NODEPROX) Number of closest grids that are used to determine the element list that is used to define the RBE3 elements. Only valid for METHCON=CIRCBIAS. See Remarks 7. and 9. (Integer > 0; Default = 1)</td></tr><tr><td>ELTOL</td><td>Tolerance used to determine whether or not a node projects onto an element of the mesh. Specified as % of element size. Only valid for METHCON=CIRCBIAS. See Remarks 7. and 9. (Real; Default = 100.0)</td></tr><tr><td>NCYCLE</td><td>Maximum number of cycles used to find elements onto which the nodes project. Only valid for METHCON=CIRCBIAS. See Remark 7. and 9. (Integer > 0; Default = 3)</td></tr><tr><td>AUGWEI</td><td>RBE3 weighting factor augmentation parameter. Only valid for METHCON=CIRCBIAS. See Remarks 7. and 9. (Real ≥ 0.0; Default = 0.0)</td></tr></table></body></html>  

## Remarks:  

1. The flexibilities DZ and DZR are used for smoothing. (Zero attachment flexibility values will imply rigid attachment (i.e., no smoothing). The DZ and DZR values are used to derive stiffness of the translational and rotational (respectively) bushing stiffnesses. Bushing elements are placed between the interpolating surface and the connections to the dependent and independent grids.   
2. If an aerodynamic mesh is entered using AEGRID/AETRIA3/AEQUAD4 entries, the CAERO ID is not required and the AELIST refers to the element ID's of the aero mesh. In this scenario,if VSTYPE $\v{S}_{\v{r}}=\v{U}_{\mathbf{\tilde{\tau}}}$ AERO, VSLIST must point to an AELIST that defines the virtual surface mesh by identifying the aerodynamic elements that make up the surface. For the Mach Box method, the AELIST refers to the aerodynamic grids $\left(\mathbf{x},\mathbf{y}\right.$ pairs on the AEFACT entry).For all other aero methods, the AELIST items are box id's.   
3.The USAGE field allows you to specify that the particular spline interpolant defined in this entry is to be used for just the force transformation (FORCE)or just the displacement transformation (DISP) or for both (BOTH). See Remark 5. of the SPLINE1 Bulk Data entry.   
4. CAERO2 entries are not supported. The CAERO entry may be blank unless points from a CAERO4 or a CAERO5 are specified. Thelist of splined points may span multiple aerodynamic components. If the spline defines points from multiple CAERO4 or CAERO5 entries, then any one of the referenced CAERO IDs is valid input.   
5. The METHOD option provides a choice in using all 6 degrees of freedom (FPS6) on the independent points or only the translational degrees of freedom (FPS3) in connecting between the virtual surface and the independent points. Similarly, there is a choice in connecting the virtual surface to the dependent points (METHVS). The connection between the independent points (structural) and the dependent points (aero) is made through a virtual surface whose mesh is defined by elements listed in the VSLIST (these are either AERO box id's or STRUCtural shell elements (CQUAD4, CQUADR, CTRIA3 ,CTRIAR).   
7. To bind the points to the virtual surface,a connection is made between the points and the surface using automatically generated virtual RBE3 elements. Two methods exist to choose which independent mesh points are connected to each dependent mesh point: nodal-proximity (NODEPROX) and circular bias (CIRCBIAS). The nodal proximity method selects the closest independent mesh points to each dependent mesh point. The actual number of points will depend on the user inputs I2VNUM and D2VNUM as well as collinearity checks. Larger values willspread the connectivity (smearing).Smaller values allow for more concentration (with additional points added as necessary for collinearity).   
9.The circular bias method uses elements of the virtual mesh in an attempt to select independent mesh points that encircle each dependent mesh point.This method will be restricted to the case where the virtual mesh is the target mesh. This method willdo the following: ● For each splined dependent mesh node,find the closest NGRID splined independent mesh node(s). ● Assemble the list of virtual mesh elements that use the closest node(s). Check each of these elements to see if the dependent node projects onto the element in the element's mean plane normal direction. Note that this check may be computationally expensive, so it is performed only to the "possible" elements, not the entire virtual mesh.The projection check will contain a user-defined tolerance, ELTOL, to expand the area of the element that is acceptable for a match. · If the dependent node does not project onto any element, use the candidate element's nodes to expand the list of elements to check. Repeat the projection check (the original elements will not be rechecked). Repeat this process up to NCYCLE times. · All elements that are found to encompass the dependent node (and there may be more than one due to curvature) will be selected to move forward. · Assemble the list of all splined nodes that connect the selected elements. Generate RBE3 elements based on this node list. An optional user-defined input parameter, AUGWEI, will be used to augment the RBE3 weighting factors with the following formula: weight $\mathbf{\tau}=(\mathrm{NE}-1)\cdot\mathrm{AUGWEI}+1$ where NE is the number of elements that are connected with the RBE3 node.  

Defines a 6DOF finite beam spline for interpolating motion and/or forces between two meshes.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPLINE7</td><td>EID</td><td>CAERO</td><td>AELIST</td><td></td><td>SETG</td><td>DZ</td><td>DTOR</td><td>CID</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td>USAGE</td><td>METHOD</td><td>DZR</td><td>IA2</td><td>EPSBM</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPLINE7 5</td><td>8</td><td>12</td><td>60</td><td></td><td>3</td></tr><tr><td></td><td></td><td></td><td>BOTH FBS6</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EID</td><td>Unique spline identification number. (Integer > 0)</td></tr><tr><td>CAERO</td><td>Aero panel (CAEROi entry ID) that is to be interpolated. See Remark 6. (Integer > 0 or blank)</td></tr><tr><td>AELIST</td><td>Identification of an AELIST entry listing the boxes or aerodynamic grid points to be interpolated using this spline. See Remark 2. (Integer > 0)</td></tr><tr><td>SETG</td><td>Refers to an SETi entry thatlists the structural grid points to which the spline is attached. (Integer > 0)</td></tr><tr><td>DZ</td><td>Linear attachment flexibility. (Real ≥ 0.O; Default = 0.0)</td></tr><tr><td>DTOR</td><td>Ratio of the beam bending stiffness to the beam torsional stiffness. See Remark 3.. (Real > 0.0; Default = 1.0)</td></tr><tr><td>USAGE</td><td>Spline usage flag to determine whether this spline applies to the force transformation, displacement transformation or both. FORCE, DISP or BOTH. See Remark 4. (Character, Default = BOTH)</td></tr><tr><td>CID</td><td>Rectangular coordinate system that defines the y-axis of the spline and the xy- and yz- planes for bending. Not used for bodies, CAERO2. (Integer ≥ 0)</td></tr><tr><td>METHOD</td><td>Method for the spline fit. Either FBS3 or FBS6. See Remark 5. (Character; Default = FBS6)</td></tr><tr><td>DZR</td><td>Rotational attachment flexibility. (Real ≥ 0.O; Default = 0.0)</td></tr><tr><td>IA2</td><td>Ratio of the beam bending stiffness to the beam extensional stiffness. (Real > O0.0; Default = 1.0)</td></tr><tr><td>EPSBM</td><td>Ratio of the minimum beam length to the total beam length. See Remark 7. (Real > 0.0; Default = 0.01)</td></tr></table></body></html>  

## Remarks:  

1. The flexibilities DZ and DZR are used for smoothing.(Zero attachment flexibility values will imply rigid attachment (i.e., no smoothing).The DZ and DZR values are used to derive stiffness of the translational and rotational (respectively) bushing stiffnesses. Bushing elements are placed between the interpolating beam and the connections to the dependent and independent grids.   
2. For aerodynamic meshes input using AEGRID/AEQUAD4/AETRIA3 entries,the AELIST items are AEGRIDS.For the Mach Box method, the AELIST refers to the aerodynamic grids $\mathbf{\Psi}(\mathbf{x},\mathbf{y}$ pairs on the AEFACT entry). For all other aero methods, the AELIST items are box id's.   
3.DTOR is the ratio of axial rotational to bending deflection and, in lieu of a more accurate estimate, a value of 1.0 is recommended. A diferent value may be used; e.g.,if DTOR is much greater than   
1.0, primarily rotational deflection will occur; if DTOR is much lessthan 1.0, primarily translational deflection willoccur. The values willaffect the results only if the structural grids over constrain the motion of the interpolating beam. Slender bodies have no torsional motion, so these values will not be used for CAERO2 entries.   
4.The USAGE field allows you to specify that the particular spline interpolant defined in this entry is to be used for just the force transformation (FORCE) or just the displacement transformation (DISP) or for both (BOTH). See Remark 5. of the SPLINE1 Bulk Data entry.   
5. The FBS3 method will map only the three translational degrees of freedom. The FBS6 method will map all six degrees of freedom.   
6. CAERO2 entries are not supported. The CAERO entry may be blank unless points from a CAERO4 or a CAERO5 are specified. The list of splined points may span multiple aerodynamic component: If the spline defines points from multiple CAERO4 or CAERO5 entries, then any one of the referenced CAERO IDs is valid input.   
7. EPSBM is the minimum length of a SPLINE7 beam as a fraction of the total SPLINE7 FEM length. Thus, an EPSBM value of 0.01 (Default), would produce a minimum beam length that is $1\%$ of the total FEM length. Defining a value of EPSBM that is smaller than 0.O1 will decrease the minimum length and potentially increase the number of beams used to define the SPLINE7 FEM.  

Defines the input for a spline that will be evaluated with a user-supplied procedure.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPLINEX</td><td>EID</td><td>GROUP</td><td>DGCOMP</td><td>IGCOMP</td><td>DECOMP</td><td>IECOMP</td><td></td><td>USAGE</td><td></td></tr><tr><td></td><td>AELIST</td><td>AEFACT</td><td>AELISTC</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPLINEX</td><td>3</td><td>SPLNGRP4</td><td>GWNG1A</td><td>GWNG1S</td><td></td><td></td><td></td><td>BOTH</td><td></td></tr><tr><td></td><td>101</td><td>201</td><td>301</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>EID</td><td>Element identification number. (Integer > 0)</td></tr><tr><td>GROUP</td><td>Group name to which the external spline type belongs. (Character; no Default)</td></tr><tr><td>DGCOMP</td><td>The name of an AECOMP or AECOMPL entry that defines the set of points for the dependent mesh. See Remarks 3. and 4. (Character; Default = Blank).</td></tr><tr><td>IGCOMP</td><td>The name of an AECOMP or AECOMPL entry that defines the set of points for the independent mesh. See Remarks 3. and 4. (Character; Default = Blank).</td></tr><tr><td>DECOMP</td><td>The name of an AECOMP or AECOMPL entry that defines the set of elements for the dependent mesh. See Remarks 3., 4. and 5. (Character; Default = Blank).</td></tr><tr><td>IECOMP</td><td>The name of an AECOMP or AECOMPL entry that defines the set of elements for the independent mesh. See Remarks 3., 4. and 5. (Character; Default = Blank).</td></tr><tr><td>USAGE</td><td>Spline usage flag to determine whether this spline applies to the force transformation, displacement transformation or both. FORCE, DISP or BOTH. See Remark 2. (Character; Default = BOTH)</td></tr><tr><td>AELIST</td><td>ID of an AELIST that contains a list of user-defined integer data. See Remark 6. (Integer; no Default).</td></tr><tr><td>AEFACT</td><td>ID of an AEFACT that contains a list of user-defined real data. See Remark 6. (Integer; no Default).</td></tr><tr><td>AELISTC</td><td>ID of an AELISTC that contains a list of user-defined character data. See Remark 6. (Integer; no Default).</td></tr></table></body></html>  

## Remarks:  

1. The SPLINEX EID must be unique with respect to all SPLINEi entries.  

2. The USAGE field allows you to specify that the particular spline interpolant defined in this entry is to be used for just the force transformation (FORCE)or just the displacement transformation (DISP) or for both (BOTH).  

$F g=(G P k g)^{T}\{P k\}$ (FORCE/BOTH splines are in the transform) $U k=/G D k g/\{U g\}$ (DISP/BOTH splines are in the transform)  

In general, the two transforms are done with distinct matrices. Only when ALL splines are of type BOTH is the familiar transpose relationship $\boldsymbol{I}G P g\boldsymbol{k}\boldsymbol{J}^{T}=\left\langle\boldsymbol{G}D\boldsymbol{k}g\right\rangle$ satisfied. The default behavior (BOTH for all splines) is compatible with version of MSC Nastran prior to Version 70.5. In general, the USAGE field can be used to apply aerodynamic forces to the structure from aerodynamic panels that are intended NOT to move (USAGE $\v{x}_{1}=$ FORCE) or to apply structural displacements to aerodynamic grids whose forces are not to be applied to the structure (USAGE $\v{S}_{\v{r}}=$ DISP). The DISP option is somewhat esoteric in that you are then suggesting that the aeroelastic effect of the surface is important while its forces are not. (In other words, only the forces arising from its effects on other surfaces is important.) While there may be circumstances where this is true, it is unlikely. Take care that you included allthe FORCEs from aerodynamic panels that are important by including them in either FORCE or BOTH spline(s). Nastran will NOT issue a warning unless ALL forces are omitted. All displacements may be omitted without warning (and is a means to perform “rigid aerodynamic" analyses).  

3.Typically,foraero-to-structure splines“dependent" means“aerodynamic",and“independent" means "structural".  

4.If the component defines a structural mesh, then the grid component may be left blank and the list of grids willbe obtained from the element component member's connectivity. Both may not be left blank.   
5. Structural elements referenced by DECOMP and IECOMP are limited to the following element types: CQUAD4, CQUADR, CTRIA3, CTRIAR. In one list, elements from the diferent types may not share the same ID.   
6. The data that are defined on the AELIST, AEFACT, and AELISTC have no meaning to Nastran. These lists are generic containers for data that has meaning to the spline server.Note that the AELIST is limited to numbers greater than zero.  

Defines a rigid body spline for interpolating motion or forces for aeroelastic problems on general aerodynamic geometries.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPLINRB</td><td>SID</td><td>CAERO</td><td>AELIST</td><td>USAGE</td><td>G1</td><td>C1</td><td>G2</td><td>C2</td><td></td></tr><tr><td></td><td>G3</td><td>C3</td><td>G4</td><td>C4</td><td>G5</td><td>C5</td><td>G6</td><td>C6</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPLINRB</td><td>110</td><td>20</td><td>2</td><td>BOTH</td><td>1093</td><td>123456</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Unique spline identification number. (Integer > 0)</td></tr><tr><td>CAERO</td><td>Identification number of aerodynamic component that defines the interpolation surface. (Integer > O or blank)</td></tr><tr><td>AELIST</td><td>Identification of an AELIST entry listing the boxes or aerodynamic grid points to be interpolated using this spline. See Remark 3. (Integer > 0)</td></tr><tr><td>USAGE</td><td>Spline usage flag to determine whether this spline applies to the force transformation, displacement transformation or both. Legal values are FORCE, DISP or BOTH. (Character; Default = BOTH)</td></tr><tr><td>Gi</td><td>Identification number of a structural grid point. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component numbers: Any unique combination of the Integers 1 through 6 with no embedded blanks.</td></tr></table></body></html>  

## Remarks:  

1. Up to six structural grid points can be used to select exactly 6 structural degrees-of-freedom that define the motion of the rigid body.   
2. The selected degrees-of-freedom must define statically determinate supports of the rigid body.   
3. For aerodynamic meshes input using AEGRID/AEQUAD4/AETRIA3 entries,the AELIST item ar AEGRIDS. For the Mach Box method, the AELIST refers to the aerodynamic grids (x,y pairs on the AEFACT entry). For all other aero methods, the AELIST items are box id's.  

Defines scalar points.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPOINT</td><td>ID1</td><td>ID2</td><td>ID3</td><td>ID4</td><td>ID5</td><td>ID6</td><td>ID7</td><td>ID8</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPOINT</td><td>3</td><td>18</td><td>1</td><td>4</td><td>16</td><td>2</td></tr></table></body></html>  

## Alternate Format and Example  

<html><body><table><tr><td>SPOINT</td><td>ID1</td><td>“THRU”</td><td>ID2</td><td></td><td></td><td></td></tr><tr><td>SPOINT</td><td>5</td><td>THRU</td><td>649</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>IDi</td><td>Scalar point identification number. (0 < Integer < 100,0o0,0o0; For“THRU" option, ID1 <ID2)</td></tr></table></body></html>  

## Remarks:  

1. A scalar point defined by itsappearanceon the connection entry for a scalar element (se the CELASi CMASSi, and CDAMPi entries) need not appear on an SPOINT entry.   
2.All scalar point identification numbers must be unique with respect toall other structural, scalar, fluid and extra (EPOINT) points. However, duplicate scalar point identification numbers are allowed in the input.   
3.This entry is used primarily to define scalar points appearing in single-point or multipoint constrain equations to which no scalar elements are connected.   
4. If the alternate format is used, all scalar points ID1 through ID2 are defined.   
5. For a discussion of scalar points, see Scalar Elements (CELASi, CMASSi, CDAMPi) (p.174) in the MSC Nastran Reference Guide.  

Defines relaxation of a spline based on an adjacent spline.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SPRELAX</td><td>SID1</td><td>SID2</td><td>LIST2</td><td>DREF</td><td>LIST1</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SPRELAX</td><td>140</td><td>130</td><td>50</td><td>5.0</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID1</td><td>Identification number of spline to be modified (may be a blended spline and need not be unique). (Integer > 0)</td></tr><tr><td>SID2</td><td>Identification number of adjacent spline (may be a blended spline). (Integer > 0)</td></tr><tr><td>LIST2</td><td>Identification of an AELIST entry listing aerodynamic grid points that define the curve used in the relaxation . (Integer > O) (See Remark 1.)</td></tr><tr><td>DREF</td><td>Reference Distance (Real > 0.) (See Remark 2.)</td></tr><tr><td>LIST1</td><td>Identification number of an AELIST entry listing aerodynamic grid points of the spline to be modified (optional). (Integer > 0; Default = O) (See Remark 3.)</td></tr></table></body></html>  

## Remarks:  

1. The aerodynamic grid points referenced by LIST2 have to define a curve. The curve need not be contiguous, i.e., coincident grid points are alowed. The order of the grid points is arbitrary.  

2. Displacements of spline 1 are modified according to  

$$
u_{1m o d}=u_{1}+f\bigg(\frac{r}{D R E F}\bigg)(u_{2}-u_{1})
$$  

where $r$ is the shortest distance of the aerodynamic grid point considered from the curve, $u_{2}$ is the displacement from spline 2, interpolated to the position on the curve which is closest to the aerodynamic grid point considered, and function $f$ is defined by  

$$
f(x)={\left\{\begin{array}{l l}{1-x}&{{\mathrm{if~x~}}\leq1}\\ {0}&{{\mathrm{if~x}}>1}\end{array}\right.}
$$  

3.If LIST1 is defined, only aerodynamic grid points contained in the referenced list are processed. Otherwise, all aerodynamic grid points of spline 1 are processed.  

Specifies statistics used in randomization selected model parameters.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>STOCHAS</td><td>SID</td><td>PENTRY</td><td>CDF</td><td>CoV</td><td>m</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>MENTRY</td><td>CDF</td><td>CoV</td><td>m</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>CENTRY</td><td>CDF</td><td>CoV</td><td>m</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>LOADS</td><td>CDF</td><td>CoV</td><td>m</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>SPCD</td><td>CDF</td><td>CoV</td><td>m</td><td></td><td></td><td></td></tr></table></body></html>  

## Example 1: (Randomize all element and material properties with the default settings.)  

<html><body><table><tr><td>STOCHAS</td><td>100</td><td>PENTRY MENTRY</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example 2: (Randomize material properties with $\mathbf{\hat{c}0}\mathbf{\check{V}}=\mathbf{0.}1$ and loadings with $\pmb{\mathrm{CoV}}\b{=}\pmb{0.3}$ and default multipliers of standard deviations.)  

<html><body><table><tr><td>STOCHAS</td><td>200</td><td>LOADS</td><td>GAUSS</td><td>0.3</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>MENTRY</td><td>GAUSS</td><td>0.1</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Unique identification number that is selected by the STOCHASTICS Case Control command. (Integer> 0)</td></tr><tr><td>“PENTRY"</td><td>Flag for randomizing real values on all the element property entries. (Character)</td></tr><tr><td>“MENTRY"</td><td>Flag for randomizing real values on all the independent material property entries. (Character)</td></tr><tr><td>“CENTRY"</td><td>Flag for randomizing real values on all the connectivity entries. (Character)</td></tr><tr><td>“LOADs”</td><td>Flag for randomizing real values on all the load entries. (Character)</td></tr><tr><td>“SPCD”</td><td>Flag for randomizing real values on all the SPCD entries. (Character)</td></tr><tr><td>CDF</td><td>Name of a cumulative distribution function. See Remark 2. (Character; Default = GAUSSIANS or blank).</td></tr><tr><td>CoV</td><td>Coefficient of variance. (Real > 0; Default = 0.05)</td></tr><tr><td>m</td><td>Number of standard deviations. See Remark 3. (Real > O; Default = 3.0)</td></tr></table></body></html>  

## Remarks:  

1. At least one flag must exist but they can be placed in any order.   
2. Currently, only Gaussian distributions are supported.  

3. The range of a random variable is defined as $\left(\upmu-m\cdot\upsigma,\upmu+m\cdot\upsigma\right)$ where $\upmu$ is the mean of the random variable (or the value of one analysis model parameter on a Bulk Data entry), $\upsigma$ is the standard deviation that is related to $\upmu$ ， $\mathrm{CoV}$ by $\upsigma=\mathrm{CoV}\cdot\upmu$ and m is the multiplier of the standard deviations.  

4. $m\cdot\mathrm{CoV}$ must be $<1.0$  

Defines determinate reaction degrees-of-freedom in free bodies for conical shell analysis.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>SUPAX</td><td>RID1</td><td>HID1</td><td>C1</td><td>RID2</td><td>HID2</td><td>C2</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SUPAX</td><td>4</td><td>3</td><td>2</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td> Describer</td><td>Meaning</td></tr><tr><td>RIDi</td><td>Ring identification number. (Integer > 0)</td></tr><tr><td>HIDi</td><td>Harmonic identification number. (Integer ≥ 0)</td></tr><tr><td>Ci</td><td>Conical shell degree-of-freedom numbers. (Any unique combination of the Integers 1 through 6.)</td></tr></table></body></html>  

## Remarks:  

1. SUPAX is allowed only if an AXIC entry is also present.   
2. Up to 12 degrees-of-freedom may appear on a single entry.   
3. Degrees-of-freedom appearing on SUPAX entries may not appear on MPCAX, SPCAX, or OMITAX entries.   
4.Fora discussion of conical shell analysis, seeConical ShellElement(RINGAX) (p.145) in the MSC Nastran Reference Guide.  

Defines determinate reaction degrees-of-freedom in a free body.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SUPORT</td><td>ID1</td><td>C1</td><td>ID2</td><td>C2</td><td>ID3</td><td>C3</td><td>ID4</td><td>C4</td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SUPORT</td><td>16</td><td>215</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>IDi</td><td>Grid or scalar point identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component numbers. (Integer O or blank for scalar points. Any unique combination of the Integers 1 through 6 for grid points with no embedded blanks.)</td></tr></table></body></html>  

## Remarks:  

1. The SUPORT entry specifies reference degrees-of-freedom for rigid body motion. It is not intended to be used in place of a constraint (i.e., SPCi entry or PS on the GRID entry).   
2. SUPORT and/or SUPORT1 entries are required to perform inertia relief in static analysis (SOL 101) if PARAM,INREL,-1 is specified. But if PARAM,INREL,-2 is specified, then SUPORT and/or SUPORT1 entries are not required.   
3. Be careful not to spell SUPORT with two Ps.   
4. Degrees-of-freedom specified on this entry form members of the mutually exclusive r-set. They may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets,1111 for a list of these entries.   
5. From 1 to 24 support degrees-of-freedom may be defined on a single entry.   
6. See Rigid Body Supports in the MSC Nastran Reference Guide for a discussion of supported degrees-offreedom (members of the r-set).   
7. An alternative to SUPORT is the SUPORT1 entry, which is requested by the SUPORT1 Case Control command.   
8. The SUPORT entry is not allowed in SOLs 106, 129, and 400.   
9. The SUPORT entry may not be used in contact in SOL 10l as this is tantamount to executing SOL 400.Additionally, INREL, -2 will not in general converge in SOL1O1 if run with contact. Inertial Relief is supported in SOL400 and invoked with the Case Control Command IRLOAD. Therefore, SOL101 runs with contact should be converted over to SOL400.  

Defines determinate reaction degrees-of-freedom (r-set) in a free body-analysis. SUPORT1 must be requested by the SUPORT1 Case Control command.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 ９</td><td></td><td>10</td></tr><tr><td>SUPORT1</td><td>SID</td><td>ID1</td><td>C1</td><td>ID2</td><td>C2</td><td>ID3</td><td>C3</td><td></td><td></td></tr><tr><td></td><td>ID4</td><td>C4</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SUPORT1</td><td>5</td><td>16</td><td>215</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Identification number of the support set. See Remark 1. (Integer > 0)</td></tr><tr><td>IDi</td><td>Grid or scalar point identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component numbers. (Integer O or blank for scalar points. Any unique combination of the Integers 1 through 6 for grid points with no embedded blanks.)</td></tr></table></body></html>  

## Remarks:  

1. The SUPORT entry specifies reference degrees-of-freedom for rigid body motion. It is not intended to be used in place of a constraint; (i.e., SPCi entry or PS on the GRID entry).   
2. SUPORT and/or SUPORT1 entries are required to perform inertia reliefin static analysis (SOL 101) if PARAM,INREL,-1 is specified. But if PARAM,INREL,-2 is specified, then SUPORT and/or SUPORT1 entries are not required. In SOL 101, PARAM,INREL,-1 must also be specified or the SUPORTi entries willbe treated as constraints.   
3. SUPORT1 must be requested by the SUPORT1 Case Control command. The degrees-of-freedom specified on SUPORTi willbe combined with those on the SUPORT entry.   
4. Be careful not to spell SUPORT with two Ps.   
5. Degrees-of-freedom specified on this entry form members of the mutually exclusive r-set. They may not be specified on other entries that define mutually exclusive sets. See Degree-of-Freedom Sets, 1111 for a list of these entries.   
6. From 1 to 18 support degree-of-freedom may be defined on a single entry.   
7. See Rigid Body Supports in the MSC Nastran Reference Guide for a discussion of supported degrees-offreedom (members of the r-set).   
8.In superelement analysis, SUPORTl may be specified for points belonging to the residual structure only.  

9. The SUPORT1 entry is not allowed in SOLs 106, 129, and 400.  

10. The SUPORT1 entry may not be used in contact in SOL 101 as this is tantamount to executing SOL 400. Additionally, INREL, -2 will not in general converge in SOL101 if run with contact. Inertial Relief is supported in SOL40O and invoked with the Case Control Command IRLOAD. Therefore, SOL101 runs with contact should be converted over to SOL400.  

Inertia relief used in SOL 600 only.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>SUPORT6</td><td>SID</td><td>METH</td><td>IREMOV</td><td></td><td></td><td>IDS1</td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SUPORT6</td><td>0</td><td>3</td><td>1</td><td></td><td>101</td><td></td></tr><tr><td>SUPORT6</td><td>4</td><td>3</td><td>-2</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td rowspan="5">SID</td><td colspan="2">Set ID corresponding to a Case Control SUPORT1 entry or zero. (Integer; Default = 0)</td></tr><tr><td>0</td><td>If this is the only SUPORT6 entry, use this SUPORT6 entry for all subcases. If there are multiple SUPORT6 entries, use the one with SID=O for Marc increment zero.</td></tr><tr><td>N</td><td>Use this SUPORT6 entry for the subcase specified by Case Control SUPORT1=N.</td></tr><tr><td colspan="2">Different SUPORT6 entries can be used for each subcase if desired and different subcases can use different methods.</td></tr><tr><td colspan="2">If there is only one SUPORT6 entry (with SID=0), no Case Control SUPORT1 entries are necessary.</td></tr><tr><td rowspan="3">METH</td><td>Method to use (Integer; Default = 0)</td><td></td></tr><tr><td>0</td><td>Inertia relief is not active for this subcase.</td></tr><tr><td>3</td><td>Use the“Support Method", usually specified using param,inrel,-1 for other solution sequences. (See Remark 1.) Input will come from all SUPORT entries and those SUPORT1 entries with ID=SID.</td></tr><tr><td rowspan="3">IREMOV</td><td></td><td> Method to retain or remove inertia relief from a previous subcase (Integer; Default = 1).</td></tr><tr><td>1</td><td>Retain inertia relief conditions from previous subcase.</td></tr><tr><td>-1</td><td>Remove inertia relief loads immediately.</td></tr><tr><td>-2</td><td></td><td>Remove inertia relief loads gradually</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td></td><td>IREMOV should be blank or 1 unless METH is 0.</td></tr><tr><td>IDS1</td><td>ID of SUPORT1 entries to be used if METH=3 and SID=0 (Integer; no Default).</td></tr><tr><td></td><td>For METH=3, only SUPORT1 entries with ID=IDS1 will be used in Marc increment zero. All SUPORT entries will be used.</td></tr><tr><td></td><td>(Used for METH=3 when SID=0 ONLY.)</td></tr></table></body></html>  

## Remark:  

1. The parameter INREL is ignored by SOL 600.  

Defines a surface that is used for initialization of regions of an Eulerian mesh. Used in SOL 700 only.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SURFINI</td><td>VID</td><td>BSID</td><td>COVER</td><td>REVERSE</td><td>CHECK</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SURFINI</td><td>100</td><td>37</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td>VID</td><td colspan="2">Unique number of an SURFINI region entry. Referenced from TICEUL1. (Integer > 0; Required)</td></tr><tr><td>BSID</td><td colspan="2">ID of a BSURF entry defining the initialization surface. (Integer > O; Required)</td></tr><tr><td rowspan="3">COVER</td><td colspan="2">The processing strategy for Eulerian elements inside and outside of the initialization surface. (Character; Default = INSIDE)</td></tr><tr><td>INSIDE</td><td>The part of the Eulerian elements that lie inside the closed volume of the initialization surface will obtain the initial conditions belonging to</td></tr><tr><td>OUTSIDE</td><td>that surface. The part of the Eulerian elements that lie outside the closed volume of the initialization surface will obtain the initial conditions that belong to</td></tr><tr><td rowspan="2">REVERSE</td><td colspan="2">that surface Auto reverse switch for SURFINI surface segments. (Character; Default = ON)</td></tr><tr><td>ON</td><td>If necessary, the normals of the SURFINI surface segments are automatically reversed so that they all point in the same general direction and give a positive closed volume.</td></tr><tr><td rowspan="4">CHECK</td><td>OFF</td><td>The segments normals are not automatically reversed.</td></tr><tr><td>Checking switch for SURFINI surface segments. (Character; Default = ON)</td><td></td></tr><tr><td>ON</td><td>The normals of the segments are checked to see whether they all point in the same general direction and give a positive closed volume.</td></tr><tr><td>OFF</td><td>The segment normals are not checked.</td></tr><tr><td></td><td colspan="2">When“REVERSE” is set to “ON”,“CHECK” is automatically set to“ON".</td></tr></table></body></html>  

## Remarks:  

1. All initialization surfaces must form a multifaceted closed volume.  

2. An initialization surface can only be used to initialize regions in a Eulerian mesh with appropriate initial conditions. An initialization surface cannot be used as a coupling surface, contact surface or rigid surface.   
3.The normal vectors of allsegments that form the initialization surface must point in the same general direction, and result in a positive, closed volume.Setting the“REVERSE” option to“ON" ensures that this condition is satisfied, regardless of how segments are initially defined.   
4.The“COVER"option determines how Eulerian elements that are (partially) inside or outside of the initialization surface are processed.  

Overrides default values of parameters for CFAST, CWELD, and CSEAM connectivity search.  

# Format:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SWLDPRM</td><td>PARAM1</td><td>VAL1</td><td>PARAM2</td><td>VAL2</td><td>PARAM3</td><td>VAL3</td><td>PARAM4</td><td>VAL4</td><td></td></tr><tr><td></td><td>PARAM5</td><td>VAL5</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Example:  

<html><body><table><tr><td>SWLDPRM GSPROJ</td><td>15.0</td><td>GSMOVE</td><td>2</td><td>PRTSW</td><td>1</td><td></td><td></td><td></td></tr></table></body></html>  

## Alternate Format and Examples:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>SWLDPRM</td><td>PARAM1</td><td>VAL1</td><td>PARAM2</td><td>VAL2</td><td>etc.</td><td>CFAST</td><td>PARAM1</td><td>VAL1</td><td></td></tr><tr><td></td><td>PARAM2</td><td>VAL2</td><td>etc.</td><td>CWELD</td><td>PARAM1</td><td>VAL1</td><td>PARAM2</td><td>VAL2</td><td></td></tr><tr><td></td><td>etc.</td><td>CSEAM</td><td>PARAM1</td><td>VAL1</td><td>PARAM2</td><td>VAL2</td><td>etc.</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>SWLDPRM CHKRUN</td><td>2</td><td></td><td></td><td></td><td></td></tr><tr><td>CWELD</td><td>GSMOVE</td><td>2</td><td>PROJTOL .04</td><td>PRTSW 1</td><td>CSEAM</td></tr><tr><td>PROJTOL</td><td>0.06</td><td>GMCHK</td><td>1</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>SWLDPRM CHKRUN</td><td>2</td><td></td><td></td><td></td><td></td></tr><tr><td>CWELD</td><td>GSMOVE</td><td>2</td><td>PROJTOL .04</td><td>PRTSW 1</td><td></td></tr><tr><td>CSEAM</td><td>PROJTOL</td><td>0.06</td><td>GMCHK 1</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>PARAMi</td><td>Name of the connector parameter. Alowable names are listed in Table 9-36. (Real or Integer)</td></tr><tr><td>VALi</td><td>Value of the parameter. See Table 9-36 (Real or Integer)</td></tr><tr><td>CFAST, CWELD, CSEAM</td><td>Keywords to control element type specific parameters. Any parameter following a keyword is applied only to that element type. See Remarks 2 and 3. (Character)</td></tr></table></body></html>  

Table 9-36 PARAMi Names and Descriptions   


<html><body><table><tr><td>Name ACTVTOL</td><td>Type</td><td>Default</td><td>Description</td></tr><tr><td rowspan="2">(SOL 600)</td><td>Integer ≥ 0 Integer ≤ 2211</td><td>1111</td><td>Parameter controlling the behavior of PROJTOL for the different CWELD connection methods. This parameter is entered as an integer and is converted to a four-character string. If its value is less than 1000, the string will be prepended with zeros. The first character (from the left) controls the behavior when method PARTPAT is used. The second controls the behavior when method ELPAT is used. The third controls the behavior when method ELEMID is used and th fourth contorls the behavior when method GRIDID is used. For ALIGN the PROJTOL tolerance has no significance. Each digit (d;） in the string can have the value O or 1 or 2, where the value 2 only has significance for the methods ELPAT or PARTPAT. The values have the following meaning: 0 = PROJTOL is completely deactivated</td></tr><tr><td>CHKRUN Integer 0, 1, 2</td><td>0</td><td>PROJTOL is only activated over free edges of the patch in auxiliary projections for ELPAT and in initial and auxiliary projections for PARTPAT. Free edges have not neighbors within the set that defines the complete surface. 2 = PROJTOL is always activated Stop run or allow run to continue after the connectivity elements are generated. O=abort on first error;</td></tr><tr><td>CNRAGLI</td><td>90.0<Real<180.0 or -1.0</td><td>160.0</td><td>1=stop after connectivity has been checked; 2=continue run if no errors are found. CSEAM only. Minimum angle allowed between the free edges of shell elements EIDSA and EIDEA or shell elements EIDSB and EIDEB. The CSEAM will not be generated if the angle is less than the value of</td></tr><tr><td>CNRAGLO</td><td>0.0≤Real<90.0 or20.0 -1.0</td><td></td><td>CNRAGLI. If set to -1.0, the check will be skipped. CSEAM only. Maximum angle allowed between the normal vectors of shell elements EIDSA and EIDEA or shell elements EIDSB and EIDEB. The CSEAM will not be generated if the angle is greater than the value of CNRAGLO. If set to -1.0, the check will be skipped.</td></tr></table></body></html>  

Table 9-36 PARAMi Names and Descriptions   


<html><body><table><tr><td>Name</td><td>Type</td><td>Default</td><td>Description</td></tr><tr><td rowspan="2">CSVOUT</td><td rowspan="2">Integer ≥ 0</td><td rowspan="2">0</td><td>Print diagnostic output in a comma separated .csv file useful for reports. The users may view or manipulate data using Microsoft Excel, or other spread sheet programs that can process CSV format.</td></tr><tr><td>0 no .csv output. unitnum> O unit number of the .csv file assigned via</td></tr><tr><td rowspan="5">CWSETS (SOL 600)</td><td rowspan="2">Integer > 0</td><td rowspan="2">0</td><td>for example, ASSIGN USERFILE=myfile.csv UNIT=unitnum FORM=FORMATTED DELETE STATUS=NEW Parameter to control the automatic creation of four</td></tr><tr><td>element sets with the elements involved in the CWELD connections. 0 = the sets will not be created 1 = four sets will be created automatically "fastener_all_beams_inc0000", the set containing all</td></tr><tr><td>0 < Integer < 3</td><td>1</td><td>all elements with patches on side B of the connection. "all_fastener_warnings_incOooo", the set containing all elements involved in CWELD warning messages. Defining sets with any of these names must be avoided and will be considered an error. Parameter to choose the method for modifying the beam length. 1 = scale the stiffness of the beam 2 = reposition the end nodes of the beam</td></tr><tr><td>DELMAX Real (SOL 600)</td><td>0.1</td><td>3 = reposition the auxiliary patch nodes and dthe end nodes of the beam. Maximum allowable parametric coordinate change during the iteration processfor finding the projection on a patch. At first DELMAX is not activated, i.e., the parametric coordinate change is not limited during the iteration process. The parameter is only activated when</td></tr><tr><td>DLDMAX Real > 0.0 (SOL 600)</td><td>5.0</td><td>the full Newton Raphson iteration process for a projection did not converge. In that case the iteration process is restarted with DELMAX activated. Default value for LDMAX, the largest ratio of length to characteristic diameter.</td></tr></table></body></html>  

Table 9-36 PARAMi Names and Descriptions   


<html><body><table><tr><td>Name</td><td> Type </td><td>Default</td><td>Description</td></tr><tr><td>DLDMIN (SOL 600)</td><td>Real > 0.0</td><td>0.2</td><td>Default value for LDMIN, the smallest ratio of length to characteristic diameter.</td></tr><tr><td>DRATIO</td><td>1.0 ≤ Real ≤10.0</td><td>1.0</td><td>CFAST or CWELD (PARTPAT and ELPAT) only. Increases the Connector patch diameter and is used to stiffen the connector patch when a loss of stiffness occurs for the FEM model as mesh size is made smaller. See Remark 10.</td></tr><tr><td>EPSITR (SOL 600)</td><td>Real > 0.0</td><td>1.0E-5</td><td>Tolerance to terminate the iteration process for finding the projection on a patch. If the parametric coordinate change in an iteration is less than EPSITR the projection is accepted as converged.</td></tr><tr><td rowspan="7">GMCHK</td><td>Integer 0, 1, 2, 3</td><td>0</td><td>For CSEAM, CWELD with ELPAT or PARTPAT format, and CFAST only.</td></tr><tr><td></td><td></td><td>O=no geometry error checks; 1=check errors of the CSEAM across a cutout or over a corner with patch elements in plane or out of plane;</td></tr><tr><td></td><td></td><td>2=check errors of CSEAM and output all candidate shell elements if an error is encountered. If GMCHK=1 or 2 and an error is detected, the program will loop back to search for next candidate</td></tr><tr><td></td><td></td><td>element until a good pair of connection is found or all adjacent elements have been checked. In the latter case, a user fatal message 7595, 7638, or 7667 will be issued. A UFM 7595 is issued if the normal angles between the patches at end GS or the patches at end GE exceed the value of GSPROJ; a UFM 7638 is issued if either the</td></tr><tr><td></td><td></td><td>length of the seam spans more than three elements or the seam spans a cutout; a UFM 7667 is issued if the normal angles between the top patches at GS and GE or</td></tr><tr><td></td><td></td><td>the normal angles between the bottom patches at GS and GE exceeds CNRAGLO or if the angle between the free edges of the shell elements onto which GS and GE are projected is less than CNRAGLI.</td></tr></table></body></html>  

8.  

Table 9-36 PARAMi Names and Descriptions   


<html><body><table><tr><td></td><td>Type</td><td>Default</td><td>Description</td></tr><tr><td>Name GSMOVE</td><td> Integer</td><td>0</td><td>Maximum number of times GS for the CFAST or CWELD (PARTPAT or ELPAT options only) or GS/GE for the CSEAM is moved in case a complete</td></tr><tr><td>MOVGAB</td><td>Integer 0, 1</td><td>0</td><td>projection of all auxiliary points has not been found. See Remark 9. Option to correct the locations of user defined GA/GB for CFAST and CWELD elements.</td></tr><tr><td></td><td></td><td></td><td>0 = keep the locations of the user specified GA/GB and connect them to shell elements directly. 1 = generate new grids with corrected locations to connect shell elements.</td></tr><tr><td>GSPROJ</td><td>0.0 ≤ Real ≤ 90.0 or -1.0</td><td>20.0 (-89.0 for SOL 600)</td><td>Maximum angle allowed between the normal vectors of shell A and shell B. The connector element will not be generated if the angle between these two normal vectors is greater than the value of GSPROJ. For CSEAM, see also GMCHK for additional error checks using GSPROJ. If GSPROJ is set to -1.0 (or -89.0 for SOL</td></tr><tr><td>GSTOL</td><td>Real ≥ 0.0</td><td>0.0</td><td>600), the program will skip the checking of GSPROJ. For CFAST or CWELD (PARTPAT and ELPAT only), if GSTOL > 0.0 and the distance between GS and the projected point GA or GB is greater the GSTOL, a UFM 7549 is issued and the CFAST or CWELD is rejected. For CSEAM, if GSTOL > 0.0 and the distance between GS and the projected point GSA or GSB or the distance between GE and the projected point GEA or GEB is greater than the GSTOL, a UFM 7549 is issued</td></tr><tr><td>MAXEXP (SOL 600)</td><td>Integer > 0</td><td>2</td><td>and the CSEAM is rejected. Parameter to control the maximum number of expansions in the search for projections of the auxiliary nodes. First the master patch will be searched. If no projection is found on the master patch a first expansion will be made including all neighboring patches of the master patch. If no projection is found on any of the new patches a second expansion will be made including all neighbors of the patches tried so far. This process continues until the number of expansions exceeds MAXEXP. Two patches are neighbors if they share at least one node in their connectivities.</td></tr></table></body></html>  

Table 9-36 PARAMi Names and Descriptions   


<html><body><table><tr><td>Name</td><td> Type</td><td>Default</td><td>Description</td></tr><tr><td>MAXITR (SOL 600) NREDIA</td><td>Integer > 0</td><td>20</td><td>The maximum number of iterations allowed in the iteration process for finding the projoection on a patch. CFAST or CWELD (PARTPAT and ELPAT) only.</td></tr><tr><td></td><td>Integer 0, 1,2, 3, 4,5,6,7,8</td><td>0</td><td>Maximum number of times the diameter D is reduced in half in case a complete projection of all points has not been found. For CFAST or CWELD, tolerance to accept the</td></tr><tr><td>PROJTOL</td><td>0.0 ≤ [Real ≤ 1.00.02 Integer 0, 1</td><td>(0.199 for SOL 600)</td><td>projected point GA or GB if the computed coordinates of the projection point lie outside the shell element but is located within |PROJTOL|*(dimension of the shell element forming the patch). For the CSEAM, a projection from GS/GE will always be attempted as if PROJTOL=0.0 and if one cannot be found then the non-zero value of |PROJTOLl will be used. Regardless of the value of SWLDPRM PROJTOL, the algorithm starts by assuming a zero projection tolerance for the projections of GA/GB for the CWELD option "PARTPAT" or the CFAST option "PROP" and for GAHi/GBHi for the CWELD options "PARTPAT" and "ELPAT" and any CFAST option. The tolerance is increased by 0.02 until a projection is found or the PROJTOL value is reached.</td></tr><tr><td>WMASS</td><td></td><td></td><td>This can be turned off while computing the auxiliary grid projection onto EIDA/EIDB or onto the adjacent elements of EIDA/EIDB by setting PROJTOL= - value where 0.0 ≤ value ≤ 1.0. In this case, the projection calculation starts at tolerance = |PROJTOLl. For the rest of the projection search, the algorithm reverts back to the iteration starting at tolerance = 0.0. For CWELD to react to a non-zero density 1 value is</td></tr></table></body></html>  

Table 9-36 PARAMi Names and Descriptions   


<html><body><table><tr><td>Name</td><td> Type</td><td>Default</td><td>Description</td></tr><tr><td>PRTSW</td><td>Integer 0,1,2, 11,12,100, 101, 111</td><td>0 (2 for SOL 600)</td><td>Print diagnostic in output or punch out internaly generated RBE3 elements and auxiliary grids in Bulk Data format for the connector elements. O=no diagnostic output (appropriate USER MESSAGES such as 'USER WARNING MESSAGE 7636 will continue to be issued); 1=print diagnostic output in exponential format to f06 file; 2=punch diagnostic output in exponential format to .pch file; 1l=print diagnostic output in real format to .f06 file; 12=punch diagnostic output in real format to .pch file. 100=punch out Bulk Data without diagnostic output. 101= punch out Bulk Data and print diagnostic output</td></tr><tr><td>RBE3WT (SOL 600)</td><td>Real</td><td>0.0</td><td>111= punch out Bulk Data and print diagnostic output in real format to f06 file. Default RBE3 distance weighting exponent. The weight factor for each retained node in a RBE3 involved in a CWELD connection is: f: = 1/d ,where: f is the weighting factor for retained node 1. d, is the distance from the tied node to retained node i n is the weighting exponent RBE2WT Negative values for RBE3WT are not recommended, since they will result in heavier weighting for nodes</td></tr></table></body></html>  

Table 9-36 PARAMi Names and Descriptions   


<html><body><table><tr><td>Name</td><td>Type</td><td>Default</td><td> Description</td></tr><tr><td>GSCURV (SOL 600)</td><td>-90 < Real<90</td><td>20.0</td><td>Maximum angle allowed between the normal vectors of a patch to which an auxiliary node projects and its corresponding auxiliary and master patches. It provides a measure to monitor the curvature of a surface and to recognize patches that belong to, for example, stiffeners. A connection is not generated if the angle between the normal vectors is greater than 90-GSCURVE meaning that the patches are almost normal to each other. In that case, the patch is reflected and the search proceeds to the next patch in the list. If the angle is between zero and GSCURV, no message is displayed. If the angle is between GSCURV and 90-GSCURV, a large angle warning is displayed. The following three tests are performed in the order given below when GSCURV is positive: If 0 <angle< GSCURVE ≥ OK If GSCURVE < angle < 90-GSCURV > trigger a warning.</td></tr><tr><td>SCLSKIN</td><td>Real ≥ 0.0</td><td>0.0</td><td>accepted and a warning is issued when the angle is larger than |GSCURV| . CFAST or CWELD (PARTPAT and ELPAT) only. If set to a value > 0.0 the CFAST or CWELD connector will be stiffened by increasing the bending moment of inertia ratio by SCLSKIN of the shell elements involved in the connector patch. SCLSKIN is Factor used to stiffen the connector patch when a loss of stiffness occurs for the FEM model as mesh size is made smaller.</td></tr></table></body></html>  

## Remarks:  

1. This entry changes the default settings of control variables for the CFAST, CWELD, and CSEAM connector elements.None of the parameters of this entry are required. Only one SWLDPRM entry is allowed in the Bulk Data Section.  

2. If any of the key words CFAST, CWELD, and CSEAM does not appear on this entry, then a parameter set on this entry is considered“global" and applies to allthe connector elements in the model. Any parameter set on this entry that comes before a key word CFAST, CWELD, or CSEAM is considered global.  

3. Any parameter set on the entry that comes after a key word such as CFAST willonly apply to that connector element type until another key word such as CSEAM is encountered. If a parameter is defined for a specific connector type that does not apply to that connector type then it will be ignored.  

4. Blank fields are allowed for readability. However, a parameter name must be followed in the immediately following field by the corresponding parameter value. If the parameter name falls in the field just before a continuation field, then its parameter value must be placed in the first field after the continuation marker of the continuation entry.  

5. Connectivity information is generated for the CFAST and CSEAM elements. For the CWELD elements, connectivity information is only generated for the PARTPAT, ELPAT, ELEMID, and GRIDID options.  

6. The details of individual connector connectivity can be found on the appropriate CFAST, CWELD. and CSEAM Bulk Data entries  

7. The CHKRUN parameter must be global.  

8.Backward connections sometimes occur if the patch is near the boundary ofa structure and there is a "vertical" flange associated with the patch elements. In this case GMCHK $\scriptstyle\dot{=}3$ may be used to prevent backward projection. See the figure below. If GMCHK $\scriptstyle\cdot=3$ and a backward projection is detected, the program will not connect this projected shell element. Instead, it will continue searching iterations until a satisfying connection is reached.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/4c81f8e1da13c9fd1d872ac25ef22a0b7646d430364175cc0c110588eb9f1c3a.jpg)  

9. If the GSMOVE specification limit is reached for the CFAST or the CWELD with options "PARTPAT" and "ELPAT" and SWLDPRM NREDIA $\geq0$ ; then the diameter of the connector will be reduced by half to compute new locations of auxiliary grids.If necessary this is repeated until the NREDIA specified value is reached.  

a. When the $\mathrm{\DeltaNREDIA}\neq0$ is initiated, the GS at its current location is used for ${\mathrm{GSMOVE}}\geq0$ b. When the NREDIA $\neq0$ is initiated, the GS at its originallocation is used for the new option GSMOVE $<0$  

10. Connector contribution to a structural model's overall stiffness is sensitive to the model's mesh size and the orientation of the connector relative to the mesh. Thus, the discretization process itself may cause,for example, a model using a fine mesh to be stifer in torsion than a corresponding model using a coarse mesh. Also for production models that correlate well with test, refining the mesh may cause an inherent overall loss of stiffness due to mesh refinement and hence loss of correlation.  

To allow the user some control over model stiffness,the new connectors (CWELD with ELPAT or PARTPAT or CFAST) are provided with two options to provide additional connector stiffness. The two options may be used individually or in combination.  

The first stiffening technique is activated by "SWLDPRM, DRATIO, ( $1.0\leq$ value $\leq10.0$ " or "CONCTL, SETID,,DRATIO,(1.0 ≤value $\leq10.0$ )". For this option the diameter, $\mathrm{D}_{\mathrm{ratio}}$ , is defined 3 $\mathrm{D_{ratio}=D R A T I O\ ^{*}D_{c o n t}}$ nectorThisresultsinthediameterofthepatchtakingavalueof $\mathrm{{D}_{p a t c h}=}$ $\sqrt{\pi/2}\mathrm{~D~}_{\mathrm{ratio}}$ . The default of DRATIO is a valu ${\mathrm{:=}}1.0$ which implies the diameter of the patch is computed in the standard fashion. For the patch to patch connection for the "beam" properties of the CWELD,the area is still computed as $\mathrm{A}_{\mathrm{connector}}=\pi\mathrm{~I~}$ $\mathrm{D}^{2}$ connector $/4$ as defined in the PWELD entry.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/ce9ea40dc18bef67565432beb07fed35a4086a0806b685f1c6ba9395bdeb8087.jpg)  
Acnneta=T\*D²connector/4; Aconector is used by PWELDonly forbeam properties of Patchto Patchconnection  

$$
\mathsf{A}_{\mathrm{toass}}=\mathsf{L}^{2};\quad\mathsf{L}=\sqrt{\pi}\mathsf{D}_{\mathrm{toass}}I^{2};\quad\mathsf{D}_{\mathrm{passh}}\equiv\sqrt{2}\mathsf{L}=\sqrt{\pi/2}\mathsf{D}_{\mathrm{tass}}\equiv1.253\mathsf{D}_{\mathrm{tass}}
$$  

A disadvantage of this method is that as DRATIO is increased using the global command SWLDPRM, DRATIO, value"; some connector elements may begin to fail because they may no longer be able to find a patch projection.  

To overcome this, the "SWLDPRM, NREDIA, Integer_value" can be increased to a value as high as Integer_value $=8$ to allow failing welds to halve their patch diameters up to eight times. Whenever a connector has its diameter reduced a message such as: "DA IS REDUCED BY HALF TO $8.8623\mathrm{E}{+}00"$ when PRTSW diagnostic output is requested. In this message the DA is computed as … $\mathrm{DA}=\mathrm{L}/2$  

If the "SWLDPRM, NREDIA, Integer_value" is not an approach the user wishes to pursue, then for these failing elements, the bulk data entry CONCTL, SETID,,DRATIO,value can be used to define a set for failing connectors and set a value of DRATIO for these connectors that allows them to find a projection.  

The second stiffning algorithm attempts, based on the diameter of the connector, to determine a measure of the mesh discretization.  

This feature is activated by setting "SWLDPRM, $\mathrm{SCLSKIN}>0.0{}"$ or "CONCTL, SETID, $\mathrm{SCLSKIN}>0.0"$ . The default is a value $=0.0$ which implies no stiffening. When activating the "SWLDPRM, SCLSKIN, real value"option for the first time with a new FEM, it is recommended that an initial value $=0.1$ be used.  

Depending on the complexity of the model and the overall mesh size and the number of connectors within the modeland the diameter of the connectors relative to the mesh, the default value tends to stiffen a structural model from about $0.4\%$ to about $4\%$ . A value of $\mathrm{SCLSKIN}{=}10.0$ stiffens coarser mesh models by about $10\%$ to $11\%$ and finer mesh models by about $2\%$ to $6\%$  

The contribution of the stiffening algorithm to the overall stiffness of the FEM model eventually reaches a limit. For example, a very large value $\mathrm{SCLSKIN}{=}100$ increases the stiffness of the models overall by only about $0.1\%$ to $2\%$ over the stiffness obtained for $\mathrm{SCLSKIN}{=}10$  

For a correlated structural model evaluated at a specific mesh size, with an aim to refine the mesh for some portion of this model containing connectors, while leaving other portions containing connectors with an unmodified mesh, it is recommended that the "SCLSKIN, real value" be entered on the CONCTL bulk data entry referring to the connectors within the area of the refined mesh. Different refined mesh areas within the structural model can have different values of SCLSKIN associated to the specific connectors in each refined region.  

For post processing affected shell elements, an updated EPT table is available after module MODGM2.It contains the PSKNSHL record that correlates the property data of the shell involved and a list of shell elements for each patch modified.  

Neither of these stiffening methods have any effect on the mass computations of the model.  

11. This entry is ignored in part super-elements. Inside the part super-elements, the default setings will be applied.  

12. If Modules are present then this entry may only be specified in the main Bulk Data section.  

# Entries T-Y  

## TABD1MD  

Defines how TABLED1 entries are internally modified in SOL 600.  

SOL 600 usuallyrequires that thefirst point ofallTABLEDl entries used to describe time histories start with time/amplitude of (0.0,0.0).If theuser omits this entry, all TABLED1 entries that do not start with (0.0, 0.0)will be modified internally toadd two points at the start,thefirst at (O.0, O.O)and thesecond at (0.001, V1) where Vl is the first amplitude of the original TABLEDl entry for that curve.  

Format   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABD1MD</td><td>TID1</td><td>THRU</td><td>ID2</td><td>MOD</td><td>T2</td><td>A2</td><td>T3</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABD1MD</td><td>1</td><td>THRU</td><td>5</td><td>1</td><td>.002</td><td>1.0</td><td>.003</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID1</td><td>First TABLED1 ID. (Integer > 0; no Default required)</td></tr><tr><td>ID2</td><td>Last TABLED1 ID to which MOD, T1 and A1 apply. See Remark 2. (Integer; Default = ID1)</td></tr><tr><td rowspan="3">MOD</td><td>Flag indicating whether or not to modify TABLEDl entries with ID in the range ID1 to</td></tr><tr><td>ID2. (Integer; Default = 1) 0 Do not modify the table</td></tr><tr><td>1 Modify the table</td></tr><tr><td>T1</td><td>New time for the second point. See Remark 1. (Real; Default = 0.001)</td></tr><tr><td>A1</td><td>New amplitude of the second point. See Remark 2. (Real; Default = 1.0)</td></tr><tr><td>T2</td><td>New time for the third point. See Remark 1. (Real; Default = 0.002)</td></tr></table></body></html>  

Remarks:  

1.If $_\mathrm{MOD=1}$ , all TABLED1 entries with ID's in described by ID1 to ID2 willbe modified to add two points to the beginning of the each table. The first point willbe at (O.0, 0.O) the second point will be at (T1,A1). The original first point will be modified to be at time T3.   
2. All TABLEDl entries in the range IDl to ID2 willbe modified as indicated. Repeat this entry as many times as necessary to specify all TABLED1 ID's that should either be modified or not be modified.   
3. Make sure to set MOD $\scriptstyle1=0$ to all TABLEDl entries that are not used to describe time history loading.   
4. The ID1 to ID2 range may include values that do not have any TABLED1 ID's in the model.  

5.Ifall TABLEDl entriesare to be modified or if they do not allstart with the same T2,A2, T3 values, PARAM,MTALBD1M PARAM,MTALBD1T may be entered.  

Defines modal damping as a tabular function of natural frequency.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABDMP1</td><td>TID</td><td>TYPE</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>f1</td><td>g1</td><td>f2</td><td>g2</td><td>f3</td><td>g3</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABDMP1</td><td>2</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>2.5</td><td>.01057</td><td>2.6</td><td>.01362</td><td>ENDT</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td> Table identification number. (Integer > 0)</td></tr><tr><td>TYPE</td><td>Type of damping units. (Character: “G”,“CRIT",or “Q"; Default is “G")</td></tr><tr><td>fi</td><td> Natural frequency value in cycles per unit time. (Real ≥ 0.0)</td></tr><tr><td>gi</td><td>Damping value. (Real)</td></tr></table></body></html>  

Remarks:  

1. Modal damping tables must be selected with the Case Control command SDAMPING $\mathbf{\Sigma}=\mathbf{\Sigma}$ TID.   
2. The frequency values,fi, must be specified in either ascending or descending order, but not both   
3. Discontinuities may be specified between any two points except the two starting points or two end points. For example, in Figure 9-159 discontinuities are allowed only between points f2 through f7. Also, if $\mathrm{\Phi_{g}}$ is evaluated at a discontinuity, then the average value of $\mathrm{g}$ is used. In Figure 9-159, the value of $\mathrm{g}$ at $\mathrm{f}=\mathrm{f}3$ is $g\ =\ (g3+g4)/2$ ，   
4. At least one continuation entry must be specified.   
5. Any fi or gi entry may be ignored by placing“SKIP"in either of the two fields used for that entry.   
6.The end ofthe table is indicated by the existence of"ENDT"in either ofthe two fields folowing the last entry. An error is detected if any continuations follow the entry containing the end-of-table flag “ENDT”.   
7. The TABDMPl uses the algorithm  

$$
g\ =\ g_{T}(f)
$$  

where $f$ is input to the table and $g$ is returned. The table look-up $g_{T}(f)$ is performed using linear interpolation within the table and linear extrapolation outside the table using thelast two end points. See Figure 9-159. No warning messages are issued if table data is input incorrectly. See Remark 11.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/a984ee0614a176eb541c0161c87c86b9b2dbafc8c0577ad7b3170211749f711f.jpg)  
Figure 9-159 Example of Table Extrapolation and Discontinuity  

8. This form of damping is used only in modal formulations of complex eigenvalue analysis, frequency response analysis, or transient response analysis. The type of damping used depends on the solution sequence (structural damping is displacement-dependent, and viscous damping is velocity-dependent). SeeFormulation of Dynamic Equations in SubDMAP GMA in the MSC Nastran Reference Guide for the equations used.  

9. PARAM,KDAMP may be used in solution sequences that perform modal frequency and modal complex analysis, to select the type of damping.  

<html><body><table><tr><td>KDAMP</td><td>Result</td></tr><tr><td>1 (Default)</td><td>B Matrix</td></tr><tr><td>-1</td><td>(1+ig)K</td></tr></table></body></html>  

See Formulation of Dynamic Equations in SubDMAP GMA in the MSC Nastran Reference Guide for a full explanation.  

10.If TYPE is $^{\mathfrak{c}}\mathbf{G}^{\mathfrak{n}}$ or blank, the damping values gi, etc., are in units of equivalent viscous dampers, a follows:  

$$
b_{i}=\frac{\mathrm{gi}}{\upomega_{i}}K_{i}
$$  

(See Formulation of Dynamic Equations in SubDMAP GMA in the MSC Nastran Reference Guide) If TYPE is “CRIT",the damping values gi, etc., are in the units of fraction ofcritical damping $C/C_{0}$ . IfTYPE is $\"{\mathrm{Q}}\"{\$ , the damping values gi are in the units of the amplification or quality factor, $Q.$ These constants are related by the following equations:  

$$
\begin{array}{l}{{C/C_{0}=g/2}}\\ {{\ Q=\left\{1/(2C/C_{0})\right.}}\\ {{\left.1/g\right.}}\end{array}
$$  

11. A user warning message is used if either of the following conditions is satisfied:  

a. The modal damping value is computed as a result of extrapolation.   
b. The computed modal damping value is negative.  

For any modal damping value that satisfies condition a or b, the program lists the cyclic frequency and the corresponding modal damping value and indicates whether this value was computed as a result of interpolation or extrapolation. For the latter case, it also indicates whether the extrapolation was beyond the left end of the table or beyond the right end of the table.  

If a modal damping value satisfies both of the conditions, a and b above (that is, the modal damping value is computed as a result of extrapolation and it is negative), the program terminates the job with a user fatal message.  

The user can prevent the program from terminating the job as above by specifying MDAMPEXT $\mathbf{\bar{\rho}}_{=1}^{\ }$ [or $\mathrm{SYSTEM}(426){=}1]$ on the NASTRAN statement. The user fatal message mentioned above does inform the user of this avoidance scheme.  

12.The modal damping matrix generated by this approach is not affcted by the presence of rotors in the model. Also, the circulation terms are not generated for damping corresponding to rotor degrees of freedom.  

13.If Modules are present then this entry may only be specified in the main Bulk Data section.  

Specifies atable where an entry can bea function ofup to 4 variables such as strain,temperature,strain rate, etc for SOL 600 and SOL 400.  

Format O: Simple Table Type O - entry is a function of only one variable:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>TABL3D0</td><td>ITID</td><td></td><td>KIND</td><td>EXTRP</td><td>ITIDS</td><td>ITIDB</td><td>SM</td><td></td></tr><tr><td></td><td>X1</td><td>Y1</td><td>X2</td><td>Y2</td><td>X3</td><td>Y3</td><td>X4</td><td>Y4</td></tr><tr><td></td><td>X5</td><td>Y5</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Format1: Multi-Dimensional Table Type 1 - entry is a function of 2, 3, or 4 variables, data entered one row at a time   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABL3D1</td><td>ITID</td><td>NV</td><td>KIND1</td><td>KIND2</td><td>KIND3</td><td>KIND4</td><td>NW1</td><td>NW2</td><td></td></tr><tr><td></td><td>NW3</td><td>NW4</td><td>EXTRP1</td><td>EXTRP2</td><td>EXTRP3</td><td>EXTRP4</td><td></td><td></td><td></td></tr><tr><td></td><td>ITIDS1</td><td>ITIDB1</td><td>ITIDS2</td><td>ITIDB2</td><td>ITIDS3</td><td>ITIDB3</td><td>ITIDS4</td><td>ITIDB4</td><td></td></tr><tr><td></td><td>SM1</td><td>SM2</td><td>SM3</td><td>SM4</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>X11</td><td>X12</td><td>X13</td><td>X14</td><td>X15</td><td>X16</td><td>-etc.-</td><td></td><td></td></tr><tr><td></td><td>X21</td><td>X22</td><td>X23</td><td>X24</td><td>X25</td><td>X26</td><td>-etc.-</td><td></td><td>Enter if NW2>0</td></tr><tr><td></td><td>X31</td><td>X32</td><td>X33</td><td>X34</td><td>X35</td><td>X36</td><td>-etc.-</td><td></td><td>Enter if NW3>0</td></tr><tr><td></td><td>X41</td><td>X42</td><td>X43</td><td>X44</td><td>X45</td><td>X46</td><td>-etc.-</td><td></td><td>Enter if NW4>0</td></tr><tr><td></td><td>Y1</td><td>Y2</td><td>Y3</td><td>Y4</td><td>Y5</td><td>Y6</td><td>-etc.-</td><td></td><td>See Remark 1</td></tr></table></body></html>  

Format 2: Multi-Dimensional Table Type 2- entry is a function of 2,3, or 4 variables,data entered one point at a time   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABL3D2</td><td>ITID</td><td>NV</td><td>KIND1</td><td>KIND2</td><td>KIND3</td><td>KIND4</td><td>NW1</td><td>NW2</td><td></td></tr><tr><td></td><td>NW3</td><td>NW4</td><td>EXTRP1</td><td>EXTRP2</td><td>EXTRP3</td><td>EXTRP4</td><td></td><td></td><td></td></tr><tr><td></td><td>ITIDS1</td><td>ITIDB1</td><td>ITIDS2</td><td>ITIDB2</td><td>ITIDS3</td><td>ITIDB3</td><td>ITIDS4</td><td>ITIDB4</td><td></td></tr><tr><td></td><td>SM1</td><td>SM2</td><td>SM3</td><td>SM4</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>X11</td><td>X12</td><td>X13</td><td>X14</td><td>X15</td><td>X16</td><td>-etc.-</td><td></td><td></td></tr><tr><td></td><td>X21</td><td>X22</td><td>X23</td><td>X24</td><td>X25</td><td>X26</td><td>-etc.-</td><td></td><td>Enter if NW2>0</td></tr><tr><td></td><td>X31</td><td>X32</td><td>X33</td><td>X34</td><td>X35</td><td>X36</td><td>-etc.-</td><td></td><td>Enter if NW3>0</td></tr></table></body></html>  

Format 3: Multi-Dimensional Table Type 3- entry is specified by a formula (SOL 600 only)   


<html><body><table><tr><td></td><td>X41</td><td>X42</td><td>X43</td><td>X44</td><td>X45</td><td>X46</td><td>-etc.-</td><td></td><td>Enter if NW4>0</td></tr><tr><td></td><td>Y1</td><td>Y2</td><td>Y3</td><td>Y4</td><td>Y5</td><td>Y6</td><td>-etc.-</td><td></td><td>See Remark 2</td></tr></table></body></html>  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABL3D3</td><td>ITID</td><td>NV</td><td>KIND1</td><td>KIND2</td><td>KIND3</td><td>KIND4</td><td>NW1</td><td>NW2</td><td></td></tr><tr><td></td><td>NW3</td><td>NW4</td><td>EXTRP1</td><td>EXTRP2</td><td>EXTRP3</td><td>EXTRP4</td><td></td><td></td><td></td></tr><tr><td></td><td>ITIDS1</td><td>ITIDB1</td><td>ITIDS2</td><td>ITIDB2</td><td>ITIDS3</td><td>ITIDB3</td><td>ITIDS4</td><td>ITIDB4</td><td></td></tr><tr><td></td><td>SM1</td><td>SM2</td><td>SM3</td><td>SM4</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>Formula</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>See Remark 3</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ITID</td><td>Table identification number. (Integer > O; no Default)</td></tr><tr><td rowspan="2">SM or SMi</td><td> Flag to indicate smoothing of the table data. (Integer; Default = 0)</td></tr><tr><td>0 Do not smooth the data</td></tr><tr><td></td><td>1 Smooth the data</td></tr><tr><td>NV</td><td>Number of variables the entry is a function of (Integer, 1, 2, 3, or 4; no Default)</td></tr><tr><td>KIND or KINDi</td><td>"Independent" variable type (such as strain, temperature, Integer > O; no Default; see Table 9-37 for application values)</td></tr><tr><td>EXTRP or EXTRPi</td><td>Extrapolation flag. (Integer; Default = 2)</td></tr><tr><td rowspan="3"></td><td>1 Do not allow extrapolation</td></tr><tr><td>2 Allow extrapolation (both ends of curve)</td></tr><tr><td> Table IDs meant for future expansion to reference other tables from this table when</td></tr><tr><td>ITIDS or ITIDSi, ITIDB or</td><td>trying to evaluate this table outside its defined range. Currently not used, leave blank.</td></tr><tr><td>ITIDBi Nwi</td><td></td></tr><tr><td>Xi or Xij</td><td>Number of X values of each variables. (i can range from 1 to 4) (Integer > 0; no Default)</td></tr><tr><td></td><td>Value of "independent" variable such as strain, temperature, .. (Real; no Default)</td></tr><tr><td>Yi</td><td>Value of the quantity desired such as stress, Poisson's ratio, .. (Real; no Default)</td></tr></table></body></html>  

The “Independent" variable(s) should be selected from Table 9-37:  

Table 9-37   


<html><body><table><tr><td colspan="5">Independent Variable Type</td></tr><tr><td>1</td><td>time 26</td><td>Zg coordinate</td><td>51</td><td>wavelength (used in spectral radiation)</td></tr><tr><td>2</td><td>normalized time</td><td>27 s=²+²+</td><td>52</td><td>creep strain</td></tr><tr><td>3</td><td> increment number</td><td>28 contact force |F|</td><td>53</td><td>pressure or primary quantity in diffusion</td></tr><tr><td>4</td><td> normalized increment time</td><td>29 not available</td><td>54</td><td>equivalent strain rate for non-Newtonian viscosity</td></tr><tr><td>5</td><td>x coordinate</td><td>30 On (normal stress)</td><td>55</td><td>normalized arc distance</td></tr><tr><td>6</td><td> y coordinate</td><td>31 voltage*</td><td>56</td><td>distance to other contact surface (near contact only)</td></tr><tr><td>7</td><td>z coordinate</td><td>32 current**</td><td>57</td><td>terms of series</td></tr><tr><td>8</td><td>s=√x²+y²+2²</td><td>33 radius of ahioa) (see throat)</td><td>58</td><td>hydrostatic stress</td></tr><tr><td>9</td><td>θ angle</td><td>34 Not available</td><td></td><td>59 hydrostatic strain</td></tr><tr><td>10</td><td> mode number</td><td>35 Not available</td><td>60</td><td>Not available</td></tr><tr><td>11</td><td>frequency</td><td>36 Not available</td><td>61</td><td> Not available</td></tr><tr><td>12</td><td> temperature</td><td>37 gasket closure distance</td><td>62</td><td>2nd state variable</td></tr><tr><td>13</td><td>function</td><td>38 displacement magnitude</td><td>63</td><td>3rd state variable</td></tr><tr><td>14</td><td>fourier</td><td>39 stress rate</td><td>64</td><td>4th state variable</td></tr><tr><td>15</td><td> (equivalent plastic strain)</td><td>40 experimental data</td><td>65</td><td>5th state variable</td></tr><tr><td>16</td><td> (equivalent strain rate)</td><td>41 porosity</td><td>66</td><td>loadcase number*</td></tr><tr><td>17</td><td>Not available</td><td>42 void ratio</td><td>67</td><td>degree of cure*</td></tr><tr><td>18</td><td> arc length</td><td>43 rate)</td><td>(quivalent ceepstrain 68</td><td>magnetic field intensity**</td></tr><tr><td>19</td><td>relative density (not available for shells)</td><td>44 minor principal strain</td><td>69</td><td> equivalent mechanical strain</td></tr><tr><td>20</td><td> (equivalent stress)</td><td>45 (-1/2, +t/2)</td><td>distance from neutral axis 70</td><td>lst strain invariant</td></tr><tr><td>21</td><td> magnetic induction**</td><td>46</td><td>normalized distance from neutral axis (-1,+1)</td><td>71 2nd strain invariant</td></tr><tr><td>22</td><td>velocity</td><td>47 local x-coordinate of layer point for open or closed section beam</td><td>72</td><td>3rd strain invariant</td></tr></table></body></html>  

Table 9-37   


<html><body><table><tr><td colspan="6">Independent Variable Type</td></tr><tr><td>23</td><td> parameter diameter**</td><td>48</td><td>local y-coordinate of layer point for open or closed section beam</td><td>73</td><td>local strain component</td></tr><tr><td>24</td><td>Xo coordinate</td><td>49</td><td> not available</td><td>74</td><td>damage</td></tr><tr><td>25</td><td> yo coordinate</td><td>50</td><td>not available</td><td>75</td><td>accumulated crack growth</td></tr><tr><td></td><td></td><td></td><td></td><td>76</td><td>relative sliding velocity</td></tr></table></body></html>  

Remarks (General):  

1. Independent Variable Types marked as ‘NOT AVAILABLE' are not available in either SOL 600 or SOL 400. Independent variable types marked with \* are only available in SOL 600. Independent variable types marked with \*\*are only available in SOL 600 through hand-editing of the Marc input file. The rest are available in SOL 600 and SOL 400.   
2. Dependent quantities cannot be arbitrary functions of the Independent Variable Types shown in Table 9-37. For e.g., Young's Modulus can be varied with Temperature and Space but cannot be varied with Time. Incorrect tabular settings that are not allowed will be errored out by the program.   
3.For time-independent materials, dependent variables (i.e., yield stress) can typically be defined only as a function of temperature, stressstrain data or coordinates. For time-dependent materials, (e.g., creep coefficient), properties can also be defined as a function of time.   
4.For contact dependent variables, (i.e,friction coefficient) can typically be defined as a function of temperature, contact body quantities like normal stress, body force, distance from body, relative velocity, etc.   
5.If the independent variable is out of range of the table,the user can indicate if the last point in the table should be used orif the table should be extrapolated. Extrapolation means the table is continued with its first or last slope. Care should be taken with extrapolation, particularly for material properties.   
6.Independent variable typesfor coordinates (5,6,7) depend on the type ofanalysis flagged.For a small strain or Total Lagrange or non-mechanical analysis, these coordinates refer to the original coordinates. For Updated Lagrange mechanical analysis, these coordinates refer to the updated   
7. At present, options to specify additional tables using ITIDS, ITIDB, ITIDS1, ITIDB1, .. ITIDS4, ITIDB4are not active and will be ignored if entered.   
marks (for SOL 600 only):  

1. The function is read by giving NW1 data points (NW4\*NW3\*NW2) times.The program reads the data using the following method.  

do $k4=1$ ,nw4 do $\operatorname{k}3=1$ ，nw3 do $k2\mathop{=}1$ ,nw2 read nwl values f(X1, K2, K3, K4) enddo   
enddo   
enddo  

2. The function is read one value at a time. There are NW1\*NW2\*NW3\*NW4 values. The program uses the values as follows:  

do $k4=1$ ,nw4 do $\operatorname{k}3=1$ ,nw3 do $k2\mathop{=}1$ ,nw2 do $\mathrm{k}1=1$ ,nwl read one value f(K1, K2, K3, K4) enddo enddo   
enddo   
enddo  

3. The formula can extend from field 2 through field 9 and must be comprised of the items listed previously.  

4. This parameter may also be used to control the BOLT entry. For BOLT, the default for MMBOLTUS $^{-1}$ to achieve the same results as SOL 400. If the results appear to be backwards, set MMBOLTUS $\c=$ -1. BOLT and MBOLTUS may not both be entered in the same model.  

Remarks for SOL 400 only:  

1.Independent variable types are typically specified for materials or contact. When material properties are varied through TABL3DX, the tables are honored only for elements with property extensions.For e.g., if TABL3DO is used in conjunction with MATEP for a CHEXA mesh with PSOLID properties, then the elements should be given the PSLDNl property extension for the table to be valid. Note that, with default property mapping (NLMOPTS,SPROPMAP,0), the property extensions will be added automatically based on the rules specified in Remark 9. of the NLMOPTS entry.  

2. The strains and stresses identified as independent variables depend n the parameters flagged for larg displacement.  

a. For PARAM,LGDISP,-1, the strains and stresses are engineering quantities. b. For PARAM,LGDISP, $\mathbf{n}$ $\mathrm{(n>0)}$ ) or with NLMOPTS,LRGSTRN $\mathbf{n}$ $\mathrm{(n>0)}$ ), the strains are typically Logarithmic strains and the stresses are Cauchy Stresses.  

Specify a function of three variables for the GMBC, GMLOAD, and TEMPF entries only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>８</td><td>9</td><td>10</td></tr><tr><td>TABLE3D</td><td>TID</td><td>X0</td><td>Y0</td><td>Z0</td><td>F0</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>X1</td><td>Y1</td><td>Z1</td><td>F1</td><td>X2</td><td>Y2</td><td>Z2</td><td>F2</td><td></td></tr><tr><td></td><td>X3</td><td>Y3</td><td>Z3</td><td>F3</td><td>X4</td><td>Y4</td><td>Z4</td><td>F4</td><td></td></tr><tr><td></td><td>-etc.-</td><td>ENDT</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLE3D</td><td>128</td><td>0.</td><td>0.</td><td>1.</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>7.</td><td>8.</td><td>9.</td><td>100.</td><td>12.</td><td>14.</td><td>11.</td><td>200.</td></tr><tr><td></td><td>17.</td><td>18.</td><td>19.</td><td>1100.</td><td>112.</td><td>114.</td><td>111.</td><td>1200.</td></tr><tr><td></td><td>ENDT</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td><td>Type</td><td>Default</td></tr><tr><td>TID</td><td>Table identification number.</td><td>Integer > 0</td><td>Required</td></tr><tr><td>X0,Y0,Z0</td><td>Offset of the independent variables.</td><td>Real</td><td>0.0</td></tr><tr><td>F0</td><td>Offset of the dependent variables.</td><td>Real</td><td>0.0</td></tr><tr><td>Xi,Yi,Zi</td><td>Independent variables.</td><td>Real</td><td>0.0</td></tr><tr><td>Fi</td><td>Dependent variable.</td><td>Real</td><td>0.0</td></tr></table></body></html>  

Remarks:  

1. At least two continuation entries must be specified.   
2. The value of the function at $(x,y,z)$ is calculated as  

$$
f={\frac{i=1}{4}}{\begin{array}{l}{\displaystyle{\sum_{i=1}^{4}{\frac{F i-F0}{d_{i}}}}}\\ {\displaystyle{\sum_{i=1}^{4}{\frac{1}{d_{i}}}}}\end{array}}
$$  

where $f$ are the function values at the four points with the lowest value of  

$$
d_{i}^{2}=\left(x-X0-X i\right)^{2}+\left(y-\mathbf{Y0}-\mathbf{Yi}\right)^{2}+\left(z-Z0-Z\mathbf{i}\right)^{2}
$$  

Defines a tabular function for use in generating frequency-dependent and time-dependent dynamic loads.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLED1</td><td>TID</td><td>XAXIS</td><td>YAXIS</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>x1</td><td>y1</td><td>x2</td><td>y2</td><td>x3</td><td>y3</td><td>-etc.-</td><td>“ENDT”</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLED1</td><td>32</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>-3.0</td><td>6.9</td><td>2.0</td><td>5.6</td><td>3.0</td><td>5.6</td><td>ENDT</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0)</td></tr><tr><td>XAXIS</td><td>Specifies a linear or logarithmic interpolation for the x-axis. See Remarks 6. and 10. (Character: “LINEAR” or“LOG"; Default = “LINEAR")</td></tr><tr><td>YAXIS</td><td>Specifies a linear or logarithmic interpolation for the y-axis. See Remarks 6. and 10. (Character: “LINEAR”or“LOG"; Default =“LINEAR")</td></tr><tr><td>xi, yi</td><td>Tabular values. (Real)</td></tr><tr><td>“ENDT”</td><td>Flag indicating the end of the table.</td></tr></table></body></html>  

Remarks:  

1. xi must be in either ascending or descending order, but not both.   
2. Discontinuities may be specified between any two points except the two starting points or two end points. For example, in Figure 9-160 discontinuities are allowed only between points $\mathbf{x}2$ through $\mathbf{x}7$ Also, ify is evaluated at a discontinuity, then the average value of y is used. In Figure 9-160, the value of y at $x\ =\ x3$ is $y=(y3+y4)/2$ . If the y-axis is a LOG axis then the jump at the discontinuity is evaluated as $y~=~\sqrt{y3y4}$ ，   
3. At least one continuation must be specified.   
4.Any xi-yi pair may be ignored by placing the character string“SKIP"in either of the two fields.   
5.The endofthe table is indicated by the existence of the character string“ENDT"in either of the two fields following the last entry. An error is detected if any continuations follow the entry containing the end-of-table flag“ENDT".  

6. TABLED1 uses the algorithm  

$$
y\ =\ y_{T}(x)
$$  

where $x$ is input to the table and $y$ is returned. The table look-up is performed using interpolation within the table and extrapolation outside the table using the two starting or end points. See Figure 9-160. The algorithms used for interpolation or extrapolation are:  

<html><body><table><tr><td>XAXIS</td><td>YAXIS</td><td>yπ(x)</td></tr><tr><td>LINEAR</td><td>LINEAR</td><td>xj-xiyj</td></tr><tr><td>LOG</td><td>LINEAR</td><td>ln(xj/x) ln(x/xi) ln(xj /xi) ln(xj / xi)yj</td></tr><tr><td>LINEAR</td><td>LOG</td><td>exp[xj=n yi+=xin yi] Lxj-xi xj - xi</td></tr><tr><td>LOG</td><td>LOG</td><td>exp n（xi/）n yi+ ln(xj/xi) ln(x/ xi） In yj]</td></tr></table></body></html>  

where $x j$ and $y j$ follow $x i$ and $y i$ ·  

No warning messages are issued if table data is input incorrectly  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/cff7cab61b7bf8be2c54e518d8af29fc0c42e84094824f79aac20796461cf6dc.jpg)  
Figure 9-160 Example of Table Extrapolation and Discontinuity  

7. Linear extrapolation is not used for Fourier transform methods. The function is zero outside the range of the table.   
8.For frequency-dependent loads, xi is measured in cycles per unit time.   
9. Tabular values on an axis if XAXIS or Y $\mathrm{AXIS}=\mathrm{LOC}$ must be positive. A fatal message will be issued if an axis has a tabular value $\leq0$   
10. LOG is not supported for SOL 600 or SOL 700. Fields 3 and 4 must be blank.   
11. RC network solver only supports LINEAR type XAXIS and YAXIS for thermal analysis.   
12. The X-Y plot information resulting from a dynamic response solution (like any response versus frequency in SOLs 108/11l or any response versus time in SOLs 109/112) can be generated in TABLED1 format by using the XYTRAN module via DMAP. The 6th parameter of this module, which is an integer value, can be used for this purpose. Details can be obtained by referring to the description of this module in the DMAP Programmer's Guide. Defines a tabular function for use in generating frequency-dependent and time-dependent dynamic loads.   
Also contains parametric data for use with the table.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLED2</td><td>TID</td><td>X1</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>x1</td><td>y1</td><td>x2</td><td>y2</td><td>x3</td><td>y3</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLED2</td><td>15</td><td>-10.5</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>1.0</td><td>-4.5</td><td>2.0</td><td>-4.2</td><td>2.0 2.8</td><td>7.0</td><td>6.5</td><td></td></tr><tr><td></td><td>SKIP</td><td>SKIP</td><td>9.0</td><td>6.5</td><td>ENDT</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0)</td></tr><tr><td>X1</td><td>Table parameter. See Remark 6. (Real)</td></tr><tr><td>xi, yi</td><td>Tabular values. (Real)</td></tr></table></body></html>  

Remarks:  

1. xi must be in either ascending or descending order, but not both.  

2. Discontinuities may be specified between any two points except the two starting points or two end points. For example, in Figure 9-161 discontinuities are allowed only between points $x2$ and $x7$ . Also f $y$ is evaluated at a discontinuity, then the average value ofy is used. In Figure 9-161, the value of $y$ at $x\ =\ x3$ is $y=(y3+y4)/2$ ·  

3. At least one continuation entry must be specified.  

4. Any xi-yi pair may be ignored by placing“SKIP" in either of the two fields  

5.Theend ofthe table is indicated by the existenceof"ENDT"in either ofthe two fields folowing the last entry. An error is detected if any continuations follow the entry containing the end-of-table flag “ENDT”.  

6. TABLED2 uses the algorithm  

$$
y~=~y_{T}(x-\mathrm{X}1)
$$  

where $x$ is input to the table and $y$ is returned. The table look-up is performed using linear interpolation within the table and linear extrapolation outside the table using the two starting or end points. See Figure 9-161. No warning messages are issued if table data is input incorrectly.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/b90a80b471db7aca0d8990db8f11a5c36ce742278ec5462961594e5842e22184.jpg)  
Figure 9-161 Example of Table Extrapolation and Discontinuity  

7. Linear extrapolation is not used for Fourier transform methods. The function is zero outside the range of the table. 8. For frequency-dependent loads, $X1$ and $x i$ are measured in cycles per unit time.  

Defines a tabular function for use in generating frequency-dependent and time-dependent dynamic loads.   
Also contains parametric data for use with the table.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLED3</td><td>TID</td><td>X1</td><td>X2</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>x1</td><td>y1</td><td>x2</td><td>y2</td><td>x3</td><td>y3</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLED3</td><td>62</td><td>126.9</td><td>30.0</td><td></td><td></td><td></td></tr><tr><td></td><td>2.9</td><td>2.9</td><td>3.6</td><td>4.7 5.2</td><td>5.7 ENDT</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0)</td></tr><tr><td>X1,X2</td><td>Table parameters. (Real; X2 ≠ 0.0)</td></tr><tr><td>xi, yi</td><td>Tabular values. (Real)</td></tr></table></body></html>  

Remarks:  

1. xi must be in either ascending or descending order, but not both.  

2. Discontinuities may be specified between any two points except the two starting points or two end points. For example, in Figure 9-162 discontinuities are allowed only between points $x2$ and $x7$ .Also if $y$ is evaluated at a discontinuity, then the average value ofy is used. In Figure 9-162, the value of $y$ at $x\ =\ x3$ is $y=(y3+y4)/2$ ·  

3. At least one continuation entry must be present.  

4. Any xi-yi pair may be ignored by placing“SKIP" in either of the two fields.  

5.Theend of the table is indicated by the existenceof"ENDT"in either ofthe two fields folowing the last entry. An error is detected if any continuations follow the entry containing the end-of-table flag “ENDT".  

6. TABLED3 uses the algorithm  

$$
y~=~y_{T}\Big(\frac{x-\mathrm{X1}}{\mathrm{X2}}\Big)
$$  

where $x$ is input to the table and $y$ is returned. The table look-up is performed using interpolation within the table and linear extrapolation outside the table using the two starting or end points. See Figure 9-162. No warning messages are issued if table data is input incorrectly.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/0b467b91683cc8f2953f4e9f109a609966e5729d14fcc92b6b92ace6b9c2c8e1.jpg)  
Figure 9-162 Example of Table Extrapolation and Discontinuity  

7. Linear extrapolation is not used for Fourier transform methods. The function is zero outside the range of the table. 8. For frequency-dependent loads, X1, X2, and xi are measured in cycles per unit time.  

Defines the coefficients of a power series for use in generating frequency-dependent and time-dependent dynamic loads. Also contains parametric data for use with the table.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLED4</td><td>TID</td><td>X1</td><td>X2</td><td>X3</td><td>X4</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>A0</td><td>A1</td><td>A2</td><td>A3</td><td>A4</td><td>A5</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLED4 28</td><td>0.0</td><td>1.0</td><td>0.0</td><td>100.</td><td></td><td></td><td></td><td></td></tr><tr><td>2.91</td><td>-0.0329</td><td>6.51-5</td><td>0.0</td><td>-3.4-7</td><td>ENDT</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0)</td></tr><tr><td>Xi</td><td>Table parameters. (Real; X2 ≠ 0.0; X3<X4)</td></tr><tr><td>Ai</td><td>Coefficients. (Real)</td></tr></table></body></html>  

Remarks:  

1. At least one continuation entry must be specified. 2.The end ofthe table is indicated by the existence of"ENDT"in the field folowing thelast entry. An error is detected if any continuations follow the entry containing the end-of-table flag“ENDT".  

3. TABLED4 uses the algorithm  

$$
y~=~\sum_{i~=~0}^{N}\mathrm{Ai}\biggl(\frac{x-\mathrm{X}1}{\mathrm{X}2}\biggr)^{i}
$$  

where $x$ is input to the table, $y$ is returned, and $\mathrm{\DeltaN}$ is the number of pairs. Whenever $x<\mathrm{X}3$ ,use X3 for $x;$ whenever $x>\mathrm{X4}$ , use X4 for $x$ There are $\Nu+1$ entries in the table. There are no error returns from this table look-up procedure.  

4. For frequency-dependent loads, $x i$ is measured in cycles per unit time.  

Defines a value asafunction of two variables for use in generatingfrequency-dependent and time-dependent dynamic loads.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>TABLED5</td><td>TID</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>X(1)</td><td>TID(1)</td><td>X(2)</td><td>TID(2)</td><td>X(3)</td><td>TID(3)</td><td>X(4)</td><td>TID(4)</td></tr><tr><td></td><td>…</td><td>…</td><td>ENDT</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLED5</td><td>52</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>0.0</td><td>101</td><td>10.0</td><td>102</td><td>30.0</td><td>103</td><td>ENDT</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0)</td></tr><tr><td>X(i)</td><td>X value for the function specified by TID(i) (Real; no Default).</td></tr><tr><td>TID(i)</td><td>ID ofa TABLED1, TABLED2, TABLED3 or TABLED4 defining the function Y for the given value of X. (Integer > O; no Default).</td></tr></table></body></html>  

Remarks:  

1. This table returns a value that is a function of 2 variables $f(x,y)$ . The first variable value $x$ is specified on this entry as X(i), the function versus y for the specified value for $\mathrm{X(i)}$ is specified on the referenced table TID(i).   
2. When used with the NLRGAP entry to define a frequency dependent gap force as a function of penetration, the frequency values are input as $\mathrm{X(i)}$ and the variation of force vs. penetration is input on aseries of TABLEDl entries referenced by the table values TID(i),one for each required change in properties with respect to frequency.   
3. 2D linear interpolation is carried out for values of $(x,y)$ not specified on the tabular entries.   
4. X(i) values must be in ascending order.   
5. TABLED5 Usage for frequency as function of temperature:  

## TABLED5 usage  

<html><body><table><tr><td></td><td>ID</td><td>E</td><td>G</td><td>NU</td><td></td><td></td><td></td><td>GE</td><td></td></tr><tr><td>MAT1</td><td>33</td><td>7.2+10</td><td></td><td>.3</td><td></td><td></td><td></td><td>.02</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>MAT1F</td><td>33</td><td>110</td><td>111</td><td>112</td><td></td><td></td><td>200</td><td></td></tr></table></body></html>  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/a4eef6b8e423da816e9a8cc9891afece24687c97270ceadfbe88e161d0420970.jpg)  

Usage Example  

E is dependent only on frequency, therefore points to a TABLED1 entry.  

GE is both temperature and frequency dependent and therefore points to a TABLED5 entry  

<html><body><table><tr><td></td><td></td><td>E</td><td>G</td><td>NU</td><td></td><td></td><td></td><td>GE</td><td></td></tr><tr><td>MAT1</td><td>1</td><td>7.2+10</td><td>2.8+10</td><td>.3</td><td></td><td>2.22-5</td><td></td><td>0.02</td><td></td></tr><tr><td>MAT1F</td><td>1</td><td>110</td><td>111</td><td>112</td><td></td><td></td><td></td><td>200</td><td></td></tr><tr><td>TABLED1</td><td>110</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>10.</td><td>7.2+10</td><td>200.</td><td>7.1+10</td><td>300.</td><td>6.9+10</td><td>ENDT</td><td></td><td></td></tr><tr><td>TABLED1</td><td>111</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>10.</td><td>2.8+10</td><td>200.</td><td>2.7+10</td><td></td><td>2.6+10</td><td>ENDT</td><td></td><td></td></tr><tr><td>TABLED1</td><td>112</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>10.</td><td>.3</td><td>200.</td><td>.3</td><td></td><td>.3</td><td>ENDT</td><td></td><td></td></tr><tr><td colspan="8">GE has frequency as a function of temperature</td><td></td><td></td></tr><tr><td>TABLED5</td><td>200</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>0.</td><td>3</td><td>40.</td><td>4</td><td>100.</td><td>5</td><td>ENDT</td><td></td><td></td></tr><tr><td>TABLED1</td><td>3</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>10.</td><td>0.02</td><td>200.</td><td></td><td></td><td>0.025</td><td>ENDT</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>TABLED1</td><td>4</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>10.</td><td>0.025</td><td>200.</td><td></td><td></td><td>0.03</td><td>ENDT</td><td></td><td></td></tr><tr><td>TABLED1</td><td>5</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>10.</td><td>0.03</td><td>200.</td><td>0.04</td><td>300.</td><td>0.035</td><td>ENDT</td><td></td><td></td></tr><tr><td colspan="8">TABLED1 units are x=frequency, y=material value</td></tr><tr><td colspan="8">TABLED5 input is numerical temperature - frequency table ID For an element with average temperature of 15.0 degrees the GE value will be selected from TABLED1 ID=3;</td></tr></table></body></html>  

6. TABLED5 in Solution Sequence SOL108, SOL111, SO200, or SOL400 with ANALYSIS $\dot{\mathbf{\eta}}=\mathbf{\eta}$ DFREQ or MFREQ:  

Example(1): TABLED5 specification using TEMP(INIT） or TEMP(MATE) entry, no TEMP(LOAD) in Case Control section.  

SOL 108   
TEMP(INIT) $=5$   
BEGIN BULK   
TEMP， 5，   
ENDDATA  

The temperatures specified by TEMP(INIT) willbe used for TABLED5 look up  

Example (2): TABLED5 specification using TEMP(LOAD) entry.  

SOL 108  
?  
TEMP (INIT) $=5$   
SUBCASE 1  
TEMP (LOAD) $\begin{array}{r l}{\mathbf{\Psi}}&{{}=}\\ {\mathbf{\Psi}}&{{}}\end{array}$   
…  
BEGIN BULK  
▪·  
TEMP, 5，  
TEMP，12，  
ENDDATA  

The temperatures specified by TEMP(LOAD) will be used for TABLED5 look up.  

User is reminded that for dynamic solutions sequences, the above willnot apply thermal loading unless there is a DLOAD entry pointing to an RLOAD1 or RLOAD2 referencing TEMP(LOAD) with $\mathrm{ID}{=}12$ specified.  

Example (3): TABLED5 specification using TEMP(LOAD) entry and thermal loading desired.  

SOL 108  
··  
TEMP( $\cdot\ I{\mathrm{NIT}})=5$   
SUBCASE 1  
TEMP(LOAD) $\begin{array}{r l}{\mathbf{\Psi}}&{{}=}\end{array}.$   
DLOAD = 50  
··\*  
BEGIN BULK  
RLOAD，50，12，，,1.0，,LOAD  
TEMP，5，  
TEMP，12，  
…  
ENDDATA  

The temperatures specified by TEMP(LOAD) will be used for TABLED5 look up and will also be used to compute thermal loads in elements.  

Specifies a function of two variables for convection heat transfer coefficient.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8 9</td><td>10</td></tr><tr><td>TABLEHT</td><td>TID</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>x1</td><td>TID1</td><td>x2</td><td>TID2</td><td>x3 -etc.</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLEHT 85</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>10.0</td><td>101</td><td>25.0</td><td>102</td><td>40.0</td><td>110</td><td>ENDT</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td> Table identification number. (Integer > 0)</td></tr><tr><td>xi</td><td>Independent variables. (Real)</td></tr><tr><td>TIDi</td><td>Table identification numbers ofTABLEH1 entries. (Integer > 0)</td></tr></table></body></html>  

Remarks:  

1. xi must be listed in ascending order.   
2. At least one continuation entry must be present.   
3.The end of the table is indicated bythe existence of"ENDT"in either of the two fields following the last entry. An error is detected if any continuations follow the entry containing the end-of-table flag ENDT.   
4. This table is referenced only by PCONV entries that define free convection boundary condition properties.  

Defines a tabular function referenced by TABLEHT for convection heat transfer coefficient.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLEH1</td><td>TID</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>y1</td><td>f1</td><td>y2</td><td>f2</td><td>y3</td><td>-etc.-</td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLEH1 123</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>50.0</td><td>5.23</td><td>75.0</td><td>3.76 110.0</td><td>0.97 ENDT</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0)</td></tr><tr><td>yi</td><td>Independent variables. (Real)</td></tr><tr><td>fi</td><td>Dependent variable. (Real)</td></tr></table></body></html>  

Remarks:  

1. yi must be listed in ascending order.   
2. At least one continuation entry must be present.   
3.Any yi-fi pair may be ignored by placing“SKIP"in either of the two fields used for that entry.   
4.The end of the table is indicated by the existence of"ENDT"in either of the two fields following the last entry. An error is detected if any continuations follow the entry containing the end-of-table flag ENDT.   
5. TABLEH1 is used to input a curve in the form of $f=f(y)$ where $y$ is input to the table and $f$ is returned. The table look-up is performed using linear interpolation within the table and is evaluated at the starting or end point outside the table. No warning messages are issued if table data is input incorrectly.   
6. Discontinuities are not recommended and may lead to unstable results.  

## Specifies a Table of Amplitude vs Pseudo-Time for Static Loads Specified in LDTABL Entries  

Specifie a table of amplitude vs pseudo-time for static loads specified in LDTABL entries SOL 600 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLEL1</td><td>TID</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>X1</td><td>Y1</td><td>X2</td><td>Y2</td><td>X3</td><td>Y3</td><td>etc.</td><td>“ENT”</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLEL1</td><td>101</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>0.0</td><td>0.0</td><td>0.5</td><td>1.0</td><td>1.0</td><td>0.0</td><td>ENDT</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td> Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0; no Default)</td></tr><tr><td>Xi, Yi</td><td>Tabular values. (Real; no Default)</td></tr><tr><td>“ENDT”</td><td>Flag indicating end of the table. (Character)</td></tr></table></body></html>  

Remarks:  

1. TABLELl can only be used in SOL 600.   
2. TABLEDl may be used instead of TABLEL1, however, XAXIS and YAXIS must be LINEAR or blank.   
3. The TID must be unique among all TABLEL1's and TABLEDi's.   
4. The string“SKIP” used in TABLED1 may not be used in TABLEL1.   
5. Log X and Y is not available in TABLEL1.   
6.No blank fields are allowed starting with the second field of the first continuation line until the ENDT string.   
7. There must be at least two points in the table.  

Defines a tabular function for use in generating temperature-dependent materialorfatigue related properties.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLEM1</td><td>TID</td><td>XAXIS</td><td>YAXIS</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>x1</td><td>y1</td><td>x2</td><td>y2</td><td>x3</td><td>y3</td><td>-etc.-</td><td>“ENDT”</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLEM1 32</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>-3.0</td><td>6.9</td><td>2.0</td><td>5.6</td><td>3.0</td><td>5.6 ENDT</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>TID</td><td>Table identification number. See Remark 8. (Integer > O or Integer < 0)</td></tr><tr><td>XAXIS</td><td>Specifies a linear or logarithmic interpolation for the x-axis. (Character: “LINEAR" or “LOG"; Default = “LINEAR") See Remark 9.</td></tr><tr><td>YAXIS</td><td>Specifies a linear or logarithmic interpolation for the y-axis. (Character: “LINEAR” or “LOG"; Default = “LINEAR") See Remark 9.</td></tr><tr><td>xi, yi</td><td>Tabular values. (Real)</td></tr><tr><td>“ENDT”</td><td>Flag indicating the end of the table.</td></tr></table></body></html>  

Remarks:  

1. xi must be in either ascending or descending order, but not both.   
2. Discontinuities may be specified between any two points except the two starting points or two end points. For example, in Figure 9-163 discontinuities are allowed only between points $x2$ through $x7$ ， Also, if $y$ is evaluated at a discontinuity, then the average value ofy is used. In Figure 9-163, the value of $y$ at $x\ =\ x3$ is $y=(y3+y4)/2$ ，   
3. At least one continuation entry must be specified.   
4. Any xi-yi pair may be ignored by placing“SKIP" in either of the two fields.   
5.The end of the table is indicated by the existence of"ENDT"in either ofthe two fields following the last entry. An error is detected if any continuations follow the entry containing the end-of-table flag “ENDT".   
6. TABLEMl uses the algorithm $y\ =\ y_{T}(x)$ (for heat transfer, see Remark 7.) where $x$ is input to the table and $y$ is returned. The table look-up is performed using linear interpolation within the table and linear extrapolation outside the table using the two starting or end points. See Figure 9-163. No warning messages are issued if table data is input incorrectly.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/4a9b143e8af328e8f188c3290d124351c340c182040000cd7cc7f7e88cc7a45b.jpg)  
Figure 9-163 Example of Table Extrapolation and Discontinuity  

7. For Nastran heat transfer, the TABLEM1 assumes  

$$
y\ =\ z y_{T}(x)
$$  

where $x$ is input to the table, $y$ is returned and $z$ is supplied from MAT4 or MT5 entries.  

8. A negative TID is used to associate thermal strain $\varepsilon(\mathrm{T})$ ordinate values instead of coefficient of thermal expansion ordinate values to the $\mathrm{T}(\mathrm{Ai})$ fields of MATT1, MATT2, or MATT8 Bulk Data entries asdescribed intheremarksof thoseentries.Internally toNastran,a negative $\mathrm{{ID}_{T(A i)}}$ value will be changed to $\mathrm{\left|ID_{T(Ai)}\right|+100000000}$ ：  

9. Logarithmic XAXIS and YAXIS is only recognized when specifying S-N curves referenced by MATFTG entries for TYPE $\v{r}_{*}=$ TABLE. All other uses use linear and ignore these fields.  

10. TABLEM1 in RESTART job will cause recalculation of eigenvalues even in the cases where TABLEM1 does not change stiffness and/or mass matrix. An example is SOL 111 RESTART for fatigue analysis with TABLEM1 referenced on MATFTG.  

Defines a tabular function for use in generating temperature-dependent material properties. Also contains parametric data for use with the table.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLEM2</td><td>TID</td><td>X1</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>x1</td><td>y1</td><td>x2</td><td>y2</td><td>x3</td><td>y3</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLEM2</td><td>15</td><td>-10.5</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>1.0</td><td>-4.5</td><td>2.0</td><td>-4.5</td><td>2.0 2.8</td><td>7.0</td><td>6.5</td><td></td></tr><tr><td></td><td>SKIP</td><td>SKIP</td><td>9.0</td><td>6.5</td><td>ENDT</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td> Table identification number. See Remark 7. (Integer > O or Integer < 0)</td></tr><tr><td>X1</td><td>Table parameter. (Real)</td></tr><tr><td>xi, yi</td><td>Tabular values. (Real)</td></tr></table></body></html>  

Remarks:  

1. xi must be in either ascending or descending order, but not both.  

2. Discontinuities may be specified between any two points except the two starting points or two end points. For example,in Figure 9-164, discontinuities are allowed only between points $\mathbf{x}2$ through $\mathbf{x}7$ · Also, ifyis evaluated at a discontinuity, then the average value of y is used. In Figure 9-164, the value of y at $\mathbf{X}=\mathbf{X}{\boldsymbol{3}} $ is $y=(y3+y4)/2$ ·  

3. At least one continuation entry must be specified.  

4. Any xi-yi pair may be ignored by placing“SKIP" in either of the two fields.  

5.The end ofthe table is indicated by the existenceof"ENDT"in either ofthe two fields folowing the last entry. An error is detected if any continuations follow the entry containing the end-of-table flag “ENDT”.  

6. TABLEM2 uses the algorithm  

$$
y~=~z y_{T}(x-\mathrm{X1})
$$  

where $\mathbf{x}$ is input to the table, y is returned and z is supplied from the MATi entry. The table look-up is performed using linear interpolation within the table and linear extrapolation outside the table using the two starting or end points. See Figure 9-164. No warning messages are issued if table data is input incorrectly.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/57618dc7bfc7da2644328613f0e6cf3d67fee4c6570f67d02d5f27725078f186.jpg)  
Figure 9-164 Example of Table Extrapolation and Discontinuity  

7. A negative TID is used to associate thermal strain ε(T) ordinate values instead of coefficient of thermal expansion ordinate values to the T(Ai) fields of MATT1, MATT2, or MATT8 Bulk Data entries as described in the remarks of those entries.Internally to Nastran, a negative $\mathrm{{ID}_{T(A i)}}$ value will be changed to $\mathrm{\left|ID_{T(Ai)}\right|+100000000}$ ：  

Defines a tabular function for use in generating temperature-dependent material properties. Also contains parametric data for use with the table.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLEM3</td><td>TID</td><td>X1</td><td>X2</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>x1</td><td>y1</td><td>x2</td><td>y2</td><td>x3</td><td>y3</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLEM3</td><td>62</td><td>126.9</td><td>30.0</td><td></td><td></td><td></td></tr><tr><td></td><td>2.9</td><td>2.9</td><td>3.6</td><td>4.7 5.2</td><td>5.7 ENDT</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. See Remark 7. (Integer > O or Integer < 0)</td></tr><tr><td>X1,X2</td><td>Table parameters. See Remark 6. (Real; X2 ≠ 0.0)</td></tr><tr><td>xi, yi</td><td>Tabular values. (Real)</td></tr></table></body></html>  

Remarks:  

1. Tabular values for xi must be specified in either ascending or descending order, but not both.  

2. Discontinuities may be specified between any two points except the two starting points or two end points. For example, in Figure 9-165 discontinuities are allowed only between points $\mathbf{x}2$ through $\mathbf{x}7$ · Also, ifyis evaluated at a discontinuity, then the average value of yis used. In Figure 9-165,the value of y at $\mathbf{X}=\mathbf{X}{\boldsymbol{3}} $ is $y=(y3+y4)/2$ ·  

3. At least one continuation entry must be specified.  

4. Any xi-yi pair may be ignored by placing“SKIP" in either of the two fields.  

5.The end ofthe table is indicated by the existenceof"ENDT"in either ofthe two fields folowing the last entry. An error is detected if any continuations follow the entry containing the end-of-table flag “ENDT".  

6. TABLEM3 uses the algorithm  

$$
y~=~z y_{T}\mathrm{\Big({\frac{x-X1}{X2}}\Big)}
$$  

where $x$ is input to the table, $y$ is returned and $z$ is supplied from the MATi entry. The table look-up is performed using linear interpolation within the table and linear extrapolation outside the table using the two starting or end points. See Figure 9-165. No warning messages are issued if table data is input incorrectly.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/1d75350aeb8916d3114aa70e77ccdafe63296e8de6aa2ade5bea99f7f0ccbf5a.jpg)  
Figure 9-165 Example of Table Extrapolation and Discontinuity  

7. A negative TID is used to associate thermal strain ε(T) ordinate values instead of coefficient of thermal expansion ordinate values to the T(Ai) fields of MATT1, MATT2, or MATT8 Bulk Data entries asdescribed intheremarks ofthoseentries.Internally toNastran,a negative $\mathrm{ID}_{\mathrm{T(Ai)}}$ value will be changed to $\mathrm{\left|ID_{T(Ai)}\right|+100000000}$ ，  

Defines coeffcients of a power series for use in generating temperature-dependent material properties. Also contains parametric data for use with the table.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLEM4</td><td>TID</td><td>X1</td><td>X2</td><td>X3</td><td>X4</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>A0</td><td>A1</td><td>A2</td><td>A3</td><td>A4</td><td>A5</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLEM4 28</td><td>0.0</td><td>1.0</td><td>0.0</td><td>100.</td><td></td><td></td></tr><tr><td>2.91</td><td>-0.0329</td><td>6.51-5</td><td>0.0</td><td>-3.4-7</td><td>ENDT</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. See Remark 4. (Integer > O or Integer < 0)</td></tr><tr><td>Xi</td><td>Table parameters. (Real; X2 ≠ 0.0; X3 < X4)</td></tr><tr><td>Ai</td><td>Coefficients. (Real)</td></tr></table></body></html>  

Remarks:  

1. At least one continuation entry must be specified. 2.The end of the table is indicated by the existenceof"ENDT"in the field folowing thelast entry. An error is detected if any continuations follow the entry containing the end-of-table flag“ENDT".  

3. TABLEM4 uses the algorithm  

$$
y=z\sum_{i=0}^{N}\mathrm{Ai}\bigg(\frac{x-\mathrm{X}1}{\mathrm{X}2}\bigg)^{i}
$$  

where $x$ is input to the table, $y$ is returned and $z$ is supplied from the MATi entry. Whenever $\mathbf{x}<\mathrm{X}3$ ， use X3 for x; whenever $\mathbf{x}>\mathrm{X4}$ , use X4 for x. There are $N+1$ entries in the table. There are no error returns from this table look-up procedure.  

4. A negative TID is used to associate thermal strain $\varepsilon(\mathrm{T})$ ordinate values instead of coefficient of thermal expansion ordinate values to the $\mathrm{T}(\mathrm{Ai})$ fields of MATT1, MATT2, or MATT8 Bulk Data entries asdescribed inthe remarks ofthoseentries.Internally toNastran,anegative $\mathrm{{ID}_{T(A i)}}$ value will be changed to $\mathrm{\left|ID_{T(Ai)}\right|+100000000}$ ，  

Defines a tabular function for stress-dependent material properties such as the stress-strain curve (MATS1 entry),creep parameters (CREEP entry) and hyperelastic material parameters (MATHP entry).  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLES1</td><td>TID</td><td>TYPE</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>x1</td><td>y1</td><td>x2</td><td>y2</td><td>x3</td><td>y3</td><td>-etc.-</td><td>“ENDT”</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLES1</td><td>32</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>0.0</td><td>0.0</td><td>.01</td><td>10000.</td><td>.02</td><td>15000.</td><td>ENDT</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0)</td></tr><tr><td>TYPE</td><td>Flag to define type of the stress-strain curve. See Remark 10. (Integer = 1 or 2; Default = 1)</td></tr><tr><td>xi, yi</td><td>Tabular values. (Real)</td></tr><tr><td>“ENDT”</td><td>Flag indicating the end of the table.</td></tr></table></body></html>  

Remarks:  

1. xi must be in either ascending or descending order, but not both.   
2. Discontinuities may be specified between any two points except the two starting points or two end points. For example, in Figure 9-166 discontinuities are allowed only between points $\mathbf{x}2$ through $\mathbf{x}7$ Also,if y is evaluated at a discontinuity, then the average value of y is used. In Figure 9-166, the value of y at $\mathbf{X}=\mathbf{X}{\boldsymbol{3}} $ .i $y=(y3+y4)/2$ ，  

3. At least one continuation entry must be present.  

4. Any xi-yi pair may be ignored by placing“SKIP" in either of the two fields used for that entry.  

5.The end ofthe table is indicated by the existenceof"ENDT"in either of the two fieldsfollowing the last entry. An error is detected ifany continuations follow the entry containing the end-of-table flag ENDT.  

6. TABLES1 is used to input a curve in the form of  

$$
y\ =\ y_{T}(x)
$$  

where $x$ is input to the table and $y$ is returned. The table look-up is performed using linear interpolation within the table and linear extrapolation outside the table using the two starting or end points. See Figure 9-166. No warning messages are issued if table data is input incorrectly.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/f0f0c2058f4c07239abd91e224c8eeb91c154a0989b76239aaf565f401ffbc59.jpg)  
Figure 9-166 Example of Table Extrapolation and Discontinuity  

7. Discontinuities are not recommended and may lead to unstable results. Discontinuities are not allowed in nonlinear solution sequences.  

8. For SOL 60O, general temperature-dependent stressvs. plastic strain curves may be entered using a combination ofTABLEST and TABLES1 entries. Each TABLES1 entry is at a constant temperature. All entries must be in the form of stress vs. plastic strain using the stressand strain measures to be incorporated into the analysis. Allsets of stress-strain values for a particular TABLES1 entry must be at the same temperature. One set is required for the lowest temperature in the model and another at or above the highest temperature in the model.   
9.For SOL 600, the stressand strain values entered here depend on the stressand strain measures selected for the analysis. In addition, the strain is controlld using PARAM,MRTABLS1 which provides several methods of converting an engineering stress-strain curve to a stress vs. plastic strain curve (see MRTABLS1 in the Parameters Section).   
10. For SOL 400, TYPE denotes the type of stresstrain curve; 1 - Cauchy (true) stressvs.total true strain; and 2 - Cauchy (true) stress vs. plastic true strain. For MATS1 Bulk Data entry, only $\mathrm{{TYPE}=}$   
1 can be used. A user fatal error will be issued if $\mathrm{TYPE}=2$ is used. For MATEP Bulk Data entry both $\mathrm{{TYPE}=1}$ and 2 can be used.  

Specifies the material property tables for nonlinear elastic temperature-dependent materials.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLEST</td><td>TID</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>T1</td><td>TID1</td><td>T2</td><td>TID2</td><td>T3</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLEST</td><td>101</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>150.0</td><td>10</td><td>175.0</td><td>20</td><td>ENDT</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0)</td></tr><tr><td>Ti</td><td>Temperature values. (Real)</td></tr><tr><td>TIDi</td><td>Table identification numbers of TABLES1 entries. (Integer > 0)</td></tr></table></body></html>  

Remarks:  

1. TIDi must be unique with respect to all TABLES1 and TABLEST table identification numbers.   
2. Temperature values must be listed in ascending order.   
3.The end of the table is indicated by the existence of ENDT in either of thetwo fields following the last entry. An error is detected ifany continuations follow the entry containing the end-of-table flag ENDT.   
4. This table is referenced only by MATS1 entries that define nonlinear elastic $(\mathrm{TYPE}=^{\mathrm{*}}\mathrm{NLELAST^{\mathrm{*}}})$ materials.   
5. For SOL 600, this entry provides IDs of TABLES1 curves as a function of temperature for use with Marc's AF_flowmat. The strains are plastic strain for all curves entered. The first curve must be entered at the lowest temperature encountered in the analysis run. Curves must be defined that equal or exceed the maximum temperature encountered in the run.  

Defines tabular data for specifying fatigue cyclic loading variation.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLFTG</td><td>TID</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>y1</td><td>y2</td><td>y3</td><td>y4</td><td>y5</td><td>y6</td><td>y7</td><td>"ENDT"</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABLFTG</td><td>1</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>0.000</td><td>-1.0</td><td>1.0</td><td>0.0</td><td>ENDT</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer </td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0)</td></tr><tr><td>yi</td><td>Y value of each point in the time history curve. (Real).</td></tr><tr><td>"ENDT"</td><td>Flag indicating the end of the table.</td></tr></table></body></html>  

Remarks:  

1. The TABLFTG is referenced by a FTGLOAD entry.   
2. The x-values are assumed to be in ascending order. For rainflow cycle counting purposes the actual x values are inconsequential.   
3. For modal analysis using SOL 103, this would define the modal participation factors for a particular mode.  

Defines a tabular function for use in generating time-dependent loads from an externally defined channel data file.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLRPC</td><td>TID</td><td>XAXIS</td><td>YAXIS</td><td>UID</td><td>TYPE</td><td>CHAN</td><td>TOTIM</td><td>PUNCH</td><td></td></tr><tr><td></td><td>x1</td><td>xj1</td><td>x2</td><td>xj2</td><td>x;3</td><td>xj3</td><td>-etc.-</td><td>"ENDT"</td><td></td></tr></table></body></html>  

Examples:   


<html><body><table><tr><td>TABLRPC</td><td>32</td><td></td><td>33</td><td>RPC</td><td>5</td><td></td><td></td></tr><tr><td>UDNAME</td><td>33</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>C:\myrpcfile.rsp</td><td colspan="7"></td></tr></table></body></html>  

<html><body><table><tr><td>TABLRPC</td><td>32</td><td></td><td></td><td>33</td><td>DAC</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>0.0</td><td>20.0</td><td>35.0</td><td>60.0</td><td>ENDT</td><td></td><td></td><td></td><td></td></tr><tr><td>UDNAME</td><td>33</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td colspan="7">C:\myrpcfile.dac</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>TABLRPC</td><td>32</td><td></td><td></td><td>-33</td><td></td><td>5</td><td></td><td></td><td></td></tr><tr><td></td><td>0.0</td><td>20.0</td><td>35.0</td><td>60.0</td><td>ENDT</td><td></td><td></td><td></td><td></td></tr><tr><td>UDNAME</td><td>33</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td colspan="7">C:\myrpcfile.rsp</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > O, no default)</td></tr><tr><td>XAXIS</td><td>Specifies a linear or logarithmic interpolation for the x-axis. (Character: “LINEAR” or “LOG"; Default = “LINEAR")</td></tr><tr><td>YAXIS</td><td>Specifies a linear or logarithmic interpolation for the y-axis. (Character: “LINEAR" or “LOG"; Default =“LINEAR")</td></tr><tr><td>UID</td><td>Identification number of a UDNAME entry to specify the external file that defines the x-y pair values that define the actual tabular function. Required. (Integer != O, no default)</td></tr><tr><td>TYPE</td><td>Type of external file to specify via UID field. (Character:“RPC”,“DAC", or“S3T"; Default =“RPC")</td></tr><tr><td>CHAN</td><td>Channel number to read for Y (load) values from “RPC” and “S3T" files. Leave blank for “DAC” files. (Integer > 0, Default = 1)</td></tr><tr><td>TOTIM</td><td>Total time of the signal defined in channel CHAN. Optional. (Real > 0., Default=Blank). See remarks below.</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>PUNCH</td><td>Specify whether equivalent TABLEDl entries containing the actual x-y pairs should be written to the PUNCH file. (Character: “YES" or “NO"; Default= “NO")</td></tr><tr><td>x;i/xi</td><td>x-y pair Filter mechanism.The given (x;i,xji) pairs reflect the start and end x-values for inclusion from the external file; or if UID is negative, the given pairs reflect the start and end x-values to exclude from reading from the external file. See remarks below. Optional. (Real).</td></tr><tr><td>"ENDT"</td><td>Flag indicating the end of the table.</td></tr></table></body></html>  

Remarks:  

1. The TABLRPC entry can be referenced by any entry that can reference a TABLED1.The TABLRPC is internaly converted to a TABLEDl entry using the channel data specified. This internal TABLED1 entry can be written to the punch (.pch) file if the PUNCH field is set to YES.   
2. The CHANnel specified contains the Y(load) data.The X (time) data for each point is automatically extracted from the channel file at each point to create the x-y pairs for a TABLEDl entry. The TOTIM (total time) of the signal can be optionally supplied, in which case the time increment of each point is calculated as TOTIM / (NPNTS-1) where NPNTS are the number of signal points. This will override any time specifications for the points from the original channel file.   
3. $\mathbf{x_{i}}\mathbf{i}/\mathbf{x_{j}}\mathbf{i}$ field pairs are purely optional. If not needed, no continuation lines should be present, in which case the entire signal defined in the specified CHANnel is taken.   
4.The $\mathbf{x_{i}}\mathbf{i}/\mathbf{x_{j}}\mathbf{i}$ field pairs represent sections of the channel to read and must be in the order in which they appear in the external file. For example, to read from only $\scriptstyle\mathbf{x}=0.0$ to ${\bf x}{=}1.0$ ,specify $\mathbf{x_{i}}1{=}0.0$ and $\mathrm{x}_{\mathrm{j}}\mathrm{l}{=}1.0$ and $\mathrm{x_{i}}2\mathrm{=ENDT}$ If the first xji is left blank, reading begins at the first data point.If the last xi value isleft blank,thentherestofthedatapointsarereadtotheendofthechannel.Ifaspecifiedxiorxji value does not exist, only the points in between are retained or excluded.   
5.Any $\mathbf{x_{i}}\mathbf{i}/\mathbf{x_{j}}\mathbf{i}$ field pair may be ignored by placing the character string“SKIP" in either of the two fields.   
6.Theend of the table is indicated by the existence of thecharacter string“ENDT"in either of the twc fields following the last entry. An error is detected if any continuations follow the entry containing the end-of-table flag “ENDT”   
7. As this data is converted to a TABLEDl entry, all comments pertaining to the TABLEDl entry are also valid.  

Specifies that a user routine is being used to define an arbitrary function. Use in SOL700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLUDS</td><td>TID</td><td>GROUP</td><td>UNAME</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example: In FMS Section of the MSC Nastran input stream:  

CONNECT SERVICE myfunc 'SCA.MDSolver.Obj.Uds.Dytran.Loads' In Bulk Data:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABLUDS</td><td>12</td><td>myfunc</td><td>EXFUNC</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Unique output number. (Integer > O; Required)</td></tr><tr><td>GROUP</td><td>The group name used for the FMS section CONNECT SERVICE statement. (Character; no Default)</td></tr><tr><td>UNAME</td><td>User subroutine name associated with the entry. (Character; default=EXFUNC)</td></tr></table></body></html>  

Remarks:  

1. Since tables and user-defined functions belong to the same group,the table numbers must be unique.  

2. UNAME can be:  

<html><body><table><tr><td>Subroutine Name</td><td>Function</td></tr><tr><td>EXFUNC</td><td>Standard user defined function</td></tr></table></body></html>  

Defines power spectral density as a tabularfunction of frequency for use in random analysis. Referenced by the RANDPS entry.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABRND1</td><td>TID</td><td>XAXIS</td><td>YAXIS</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>f1</td><td>g1</td><td>f2</td><td>g2</td><td>f3</td><td>g3</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABRND1 3</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>2.5</td><td>.01057</td><td>2.6</td><td>.01362</td><td>ENDT</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0)</td></tr><tr><td>XAXIS</td><td>Specifies a linear or logarithmic interpolation for the x-axis. (Character: “LINEAR" or “LOG"; Default =“LINEAR")</td></tr><tr><td>YAXIS</td><td>Specifies a linear or logarithmic interpolation for the y-axis. (Character: “LINEAR” or “LOG"; Default = “LINEAR")</td></tr><tr><td>fi</td><td>Frequency value in cycles per unit time. (Real ≥ 0.0)</td></tr><tr><td>gi</td><td>Power spectral density. (Real)</td></tr></table></body></html>  

Remarks:  

1. The fi must be in either ascending or descending order, but not both.   
2. Discontinuities may be specified between any two points except the two starting points or two end points. For example, in Figure 9-167 discontinuities are alowed only between points f2 through f7. Also, if $\mathrm{g}$ is evaluated at a discontinuity, then the average value ofg is used. In Figure 9-167, the value of $\mathbf{g}$ t $\mathrm{f}=\mathrm{f}3$ .s $g\ =\ (g3+g4)/2$ If the y-axis is a LOG axis then the jump at the discontinuity is evaluated as $y~=~\sqrt{y3y4}$ ，   
3. At least two entries must be present.   
4.Any fi-gi pair may be ignored by placing“SKIP"in either of the two fields used for that entry.   
5.Theend of the table is indicated by the existenceof"ENDT"in either ofthe two fields folowing the last entry. An error is detected if any continuations follow the entry containing the end-of-table flag “ENDT".  

6. TABRND1 uses the algorithm  

$$
g\ =\ g_{T}(f)
$$  

where $f$ is input to the table and $g$ is returned. The table look-up is performed using linear interpolation within the table and linear extrapolation outside the table using the two starting or end points. See Figure 9-167. No warning messages are issued if table data is input incorrectly.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/cd249f17cf65050611d789ab6f309fd107fdcbcbffd5f0e8b79c6a9a01568211.jpg)  
Figure 9-167 Example of Table Extrapolation and Discontinuity  

7. For auto spectral density, the value of $g$ returned must be greater than or equal to zero, as shown in Remark 6.  

8. Tabular values on an axis if XAXIS or $\mathrm{YAXIS}=\mathrm{LOG}$ must be positive. A fatal message willbe issuer if an axis has a tabular value $\leq0$  

9. The algorithms used are:  

<html><body><table><tr><td>XAXIS</td><td>YAXIS</td><td>f(x)</td></tr><tr><td>LINEAR</td><td>LINEAR</td><td>f-fi fi+1-f Fi+1-f8i+ Ji+1-f8i+1</td></tr><tr><td>LOG</td><td>LINEAR</td><td>ln(fi+1/f) ln(f/fi) ln(fi+1/f）8i+ln(fi+1/f）8i+1</td></tr><tr><td>LINEAR</td><td>LOG</td><td>fi+1-f f-fi exp -fi fi+1-fi lngi lngi+1</td></tr><tr><td>LOG</td><td>LOG</td><td>ln(fi+1/f) In(f/f) exp [In(fi+1/f) lngi+ Ingi+ 1 In(fi+1/f)</td></tr></table></body></html>  

where ff<f<fi+1 ·  

10. If Modules are present then this entry may only be specified in the main Bulk Data section.  

Defines the power spectral density (PSD) of a gust for aeroelastic response analysis.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABRNDG</td><td>TID</td><td>TYPE</td><td>L/U</td><td>WG</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABRNDG</td><td>1020</td><td>1</td><td>1.3</td><td>.1</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Table identification number. (Integer > 0)</td></tr><tr><td>TYPE</td><td>PSD type: von Karman (TYPE = 1) or Dryden model (TYPE = 2). (Integer = 1 or 2)</td></tr><tr><td>L/U</td><td>Scale of turbulence divided by velocity (units of time). See L/U in Remark 2. (Real)</td></tr><tr><td>WG</td><td>Root-mean-square gust velocity. (Real)</td></tr></table></body></html>  

Remarks:  

1. This entry must be referenced by a RANDPS entry.   
2. The power spectral density is given by  

$$
S_{q}(\omega)\ =\ 2(\mathrm{WG})^{2}(\mathrm{L}/\mathrm{U})\frac{1+2(p+1)k^{2}{(\mathrm{L}/\mathrm{U})}^{2}\mathrm{w}^{2}}{[1+k^{2}(\mathrm{L}/\mathrm{U})^{2}\mathrm{w}^{2}]^{p+3/2}}
$$  

where:  

<html><body><table><tr><td>Type</td><td>p</td><td>k</td></tr><tr><td>1=von Karman</td><td>1/3</td><td>1.339</td></tr><tr><td>2=Dryden</td><td>1/2</td><td>1.0</td></tr></table></body></html>  

and $\omega\ =\ 2\pi f$ . The units of $S_{q}(\omega)$ are velocity squared per frequency $(f)$ \*  

3. Other power spectral density functions may be defined using the TABRND1 entry.   
4. If Modules are present then this entry may only be specified in the main Bulk Data section.  

This option allows the user to provide user criteria for load stepping control. It is referred to byan NLSTEP entry.The criteria defined herein are used for controlling the load step size.Thecriteria come in two flavors as defined in the NLSTEP entry:limit and target. When used as limits,the time step willbe reduced if the criterionwould be violated. When used as target, the time stepwillalso be increased if the calculated results are less than what is specified by the criteria.  

The criteria are calculated for elements or grids as defined below. By default allelements or nodes are used for evaluating the respective criterion, but thiscan be limited to specific sets.(Seethe NLSTEP,2616 entry.)  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TABSCTL</td><td>TID</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>ICRIT_1</td><td>SET3_ID1</td><td>YT1_1</td><td>MT1_1</td><td>YT2_1</td><td>MT2_1</td><td>YT3_1</td><td>MT3_1</td><td></td></tr><tr><td></td><td>YT4_1</td><td>MT4_1</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>ICRIT_2</td><td>SET3_ID2</td><td>YT1_2</td><td>MT_2</td><td>YT2_2</td><td>MT2_1</td><td>YT3_2</td><td>MT3_2</td><td></td></tr><tr><td></td><td>YT4_2</td><td>MT4_2</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>…</td><td>…</td><td>…</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>ICRIT_n</td><td>SET3_IDn</td><td>YT1_n</td><td>MT1_n</td><td>YT1_n</td><td>MT2_n</td><td>YT3_n</td><td>MT3_n</td><td></td></tr><tr><td></td><td>YT4_n</td><td>MT4_n</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TABSCTL 17</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>ESI</td><td>84</td><td>.03</td><td>21. 0.4</td><td>55. 0.6</td><td></td></tr><tr><td>ESRI</td><td>18</td><td>.03</td><td>21.</td><td></td><td></td></tr><tr><td>EPSI</td><td>ALL</td><td>1.1</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td>TID ICRITi</td><td colspan="2">ID of TABSCTL entry. (Integer > 0)</td></tr><tr><td rowspan="7"></td><td colspan="2">Type of user criterion to use and the type of entity it refers to: (Character; no Default)</td></tr><tr><td>ESI</td><td>Element Strain Increment</td></tr><tr><td>EPSI</td><td>Element Plastic Strain Increment</td></tr><tr><td>ECSI</td><td>Element Creep Strain Increment</td></tr><tr><td>ENCSI</td><td>Element Normalized Creep Strain Increment</td></tr><tr><td>ESTRI</td><td>Element STRess Increment</td></tr><tr><td>ESRI</td><td>Element Strain Energy Increment</td></tr><tr><td>GTI</td><td>Grid Temperature Increment</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td rowspan="4">SET3_IDi</td><td>GDI</td><td>Grid Displacement Increment</td></tr><tr><td>GRI</td><td>Grid Rotation Increment</td></tr><tr><td>ENSTRI</td><td>Element Normalized STRess Increment</td></tr><tr><td colspan="2">ID of a SET3 Bulk Data entry. (Integer > O or (ALL or BLANK); Default = ALL)</td></tr><tr><td>YT1_i</td><td colspan="2">First limit or target value for the current criterion i. (Real; no Default)</td></tr><tr><td>MT1_i</td><td colspan="2">First range or target value for the current criterion i. See Remark 2. (Real-default blank- always active)</td></tr><tr><td>YT2_i</td><td colspan="2">Second limit or target value for criterion. (Real; no Default)</td></tr><tr><td>MT2_i</td><td colspan="2">Second range of applicability for criterion i. See Remark 2. (Real-default blank-always active)</td></tr></table></body></html>  

Remarks:  

1. This entry is selected by the CRITTID field of the NLSTEP Bulk Data entry.   
2.For each criterion ICRIT_n,up to four ranges of target/limit values can be given. This allows the use of different limit/target values for different ranges of the corresponding total quality.For example,for the first criterion type, YT1_1 is the strain incrementwhile MT1_1 is thelargest total strain for which YT1_1 willbe used. Typically, the last MTn used should be zero in which case the corresponding YTn will be used for all larger total values.  

3. The TID must be unique among all TABSCTL entries.  

Defines temperature at grid points for determination of thermal loading, temperature-dependent material properties, or stress recovery.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TEMP</td><td> SID</td><td>G1</td><td>T1</td><td>G2</td><td>T2</td><td>G3</td><td>T3</td><td></td><td></td></tr></table></body></html>  

Example:  

<html><body><table><tr><td>TEMP</td><td>3</td><td>94</td><td>316.2</td><td>49</td><td>219.8</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Temperature set identification number. (Integer > 0)</td></tr><tr><td>Gi</td><td>Grid point identification number. (Integer > 0)</td></tr><tr><td>Ti</td><td>Temperature. (Real)</td></tr></table></body></html>  

Remarks:  

1. In the static solution sequences, SID must be selected by the TEMP Case Control command. In the dynamic solution sequences, if there is a LOADSET Case Control command, then SID must be referenced in the TID field of a selected LSEQ entry. If there is no LOADSET Case Control command, then SID must be referenced in the EXCITEID field of an RLOADi or TLOADi entry.   
2. Set ID must be unique with respect to allother LOAD type entries if TEMP(LOAD) is specified in the Case Control Section.   
3.From one to three grid point temperatures may be defined on a single entry.   
4.If thermal efects are requested, allelements must have a temperature field defined either directly on a TEMPP1, TEMPP3, or TEMPRB entry or indirectly as the average of the connected grid point temperatures defined on the TEMP or TEMPD entries. Directly defined element temperatures always take precedence over the average of grid point temperatures.   
5.If the element material is temperature dependent,its properties are evaluated at the average temperature.   
6. Average element temperatures are obtained as a simple average of the connecting grid point temperatures when no element temperature data are defined. Gauss point temperatures are averaged for solid elements instead of grid point temperature.   
7. For steady state heat transfer analysis,this entry together with the TEMPD and TEMPN1 entries supplies the initialization temperatures for nonlinear analysis. The Case Control command $\mathrm{TEMP(INIT)=SID}$ requests selection of this entry. The temperature values specified here must be coincident with any temperature boundary conditions that are specified.   
8. For transient heat transfer analysis, this entry together with the TEMPD and TEMPNl entries supplies the initial condition temperatures. The Case Control command $\mathrm{IC}=\mathrm{SID}$ requests selections of this entry. The temperature values specified here must be coincident with any temperature boundary condition specified.   
9.In linear and nonlinear buckling analysis,the follower force effects due to loads from this entry are not included in the differential stiffness. See Buckling Analysis in SubDMAP MODERS, 417 and Nonlinear Static Analysis in the MSC Nastran Reference Guide.  

Defines temperature sets for conical shell problems  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TEMPAX</td><td>SID1</td><td>RID1</td><td>PHI1</td><td>T1</td><td>SID2</td><td>RID2</td><td>PHI2</td><td>T2</td><td></td></tr></table></body></html>  

Example:  

<html><body><table><tr><td>TEMPAX</td><td>4</td><td>7</td><td>30.0</td><td>105.3</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>SIDi</td><td>Temperature set identification number. (Integer > 0)</td></tr><tr><td>RIDi</td><td>Ring identification number (see RINGAX entry). (Integer > 0)</td></tr><tr><td>PHIi</td><td>Azimuthal angle in degrees. (Real)</td></tr><tr><td>Ti</td><td>Temperature. (Real)</td></tr></table></body></html>  

Remarks:  

1. TEMPAX is allowed only if an AXIC entry is also present.   
2. SIDi must be unique with respect to allother LOAD type entries if TEMP(LOAD) is specified in the Case Control Section.   
3. Temperature sets must be selected with the Case Control command TEMP $\mathbf{\bar{\rho}}=\mathbf{\rho}$ SID.   
4. One or two temperatures may be defined on each entry.   
5. Fora discussion of the conical shell problem, see Restart Procedures in the MSC Nastran Reference Guide.   
6. TEMP(INIT) is not used with this entry.  

Defines a temperature field for the three-node beam element (CBEAM3 entry).  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TEMPB3</td><td>SID</td><td>EID</td><td>T(A)</td><td>T(B)</td><td>T(C)</td><td>TPY(A)</td><td>TPZ(A)</td><td>TPY(B)</td><td></td></tr><tr><td></td><td>TPZ(B)</td><td>TPY(C)</td><td>TPZ(C)</td><td>TC(A)</td><td>TD(A)</td><td>TE(A)</td><td>TF(A)</td><td>TC(B)</td><td></td></tr><tr><td></td><td>TD(B)</td><td>TE(B)</td><td>TF(B)</td><td>TC(C)</td><td>TD(C)</td><td>TE(C)</td><td>TF(C)</td><td></td><td></td></tr><tr><td></td><td>Element</td><td>ID</td><td></td><td>List</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TEMPB3 101</td><td>23</td><td>45.9</td><td>10.0</td><td>0.0</td><td>1.3</td><td>23.9</td><td>3.8</td><td></td></tr><tr><td></td><td>2.5</td><td>68.0</td><td>91.0</td><td>45.0</td><td></td><td>48.0</td><td>80.0</td><td></td></tr><tr><td>20.0</td><td></td><td>33.9</td><td></td><td></td><td>45.6</td><td></td><td></td><td></td></tr><tr><td>9</td><td>10</td><td>THRU</td><td>30</td><td>41</td><td>51</td><td>67</td><td>78</td><td></td></tr><tr><td>THRU</td><td>110</td><td>BY</td><td>2</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Temperature set identification number. (Integer > O; Required)</td></tr><tr><td>EID</td><td> Element identification number. (Integer > O; Required)</td></tr><tr><td>T(j)</td><td>Temperature at j (j=A,B,C) on the neutral axis. (Real; Default = 0.0)</td></tr><tr><td>TPi()</td><td>Effective linear gradient in local direction i (i= y, z) at j (j = A, B, C).(Real; Default = 0.0)</td></tr><tr><td>Ti()</td><td>Temperature at stress recovery point i (i=C, D, E, F) defined in PBEAM3 at location j (j=A, B, C). (Real; Default = 0.0; see Remark 3.)</td></tr><tr><td>Element ID List</td><td>List of CBEAM3 element identification numbers. Character strings“THRU” and “BY" may be used in the list. (Integer > O; “THRU" or “BY". At least one element ID is required.)</td></tr></table></body></html>  

Remarks:  

1. In the static solution sequences, SID must be selected by the TEMP Case Control command. In the dynamic solution sequences, if there is a LOADSET Case Control command, then SID must be referenced in the TID field of a selected LSEQ entry. If there is no LOADSET Case Control command, then SID must be referenced in the EXCITEID field of an RLOADi or TLOADi entry.   
2. SID must be unique with respect to all other LOAD type entries if TEMP(LOAD) is specified in the Case Control Section.   
3.If all $\operatorname{T}i(j)$ fields are blank, linear temperature gradients are assumed for stress recovery.   
4. Temperature field defined by TEMPB3 entry always takes precedence over the grid point temperatures given by TEMP and TEMPD entries.   
5. The effective thermal gradients are defined in the local coordinate system. For their definitions, see Remark 6 of Bulk Data entry TEMPRB for the details.  

Defines the temperature boundary conditions for heat transfer analysis. Applies to steady-state and transient conditions (SOLs 153 and 159 only).  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TEMPBC</td><td>SID</td><td>TYPE</td><td>TEMP1</td><td>GID1</td><td>TEMP2</td><td>GID2</td><td>TEMP3</td><td>GID3</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TEMPBC</td><td>10</td><td>STAT</td><td>100.0</td><td>1</td><td>100.0</td><td>2</td><td>100.0</td><td>3</td><td></td></tr></table></body></html>  

Alternate Format and Example:  

<html><body><table><tr><td>TEMPBC</td><td>SID</td><td>TYPE</td><td>TEMP1</td><td>GID1</td><td>“THRU”</td><td>GID2</td><td>“BY”</td><td>INC</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>TEMPBC</td><td>20</td><td>STAT</td><td>100.0</td><td>4</td><td>THRU</td><td>50</td><td>BY</td><td>2</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Temperature set identification number. (Integer > 0)</td></tr><tr><td rowspan="2">TYPE</td><td>Type of temperature boundary condition. See Remarks. (Character; Default = “STAT"):</td></tr><tr><td> STAT - Constant temperature boundary condition</td></tr><tr><td>TEMPi</td><td> TRAN - Time-varying temperature boundary condition</td></tr><tr><td>GIDi</td><td>Temperature (Real) Grid point identification number. (Integer>O or “THRU" or “BY")</td></tr><tr><td>INC</td><td>Grid point number increment. (Integer)</td></tr></table></body></html>  

Remarks:  

1. For a constant Boundary Condition $(\mathrm{TYPE}=^{\infty}\mathrm{STAT^{\infty}})$ , the temperature boundary load set (SID) is selected in the Case Control Section $(\mathrm{SPC}=\mathrm{SID}),$ .TYPE $\mathbf{\Sigma}=\mathbf{\Sigma}$ “STAT" may be used in both steady-state (SOL 153) and transient analysis (SOL 159).   
2. For transient analysis (SOL 159),a constant boundary condition should be specified using the SPC Bulk Data entry.   
3. For a time-varying boundary condition $(\mathrm{TYPE}=^{\mathrm{*}}\mathrm{TRAN}^{\mathrm{*}\mathrm{\cdot}},$ , SID is referenced by a TLOADi Bulk Data entry through the EXCITEID specification. TYPE $\mathbf{\Sigma}=\mathbf{\Sigma}$ “TRAN" is permitted only in transient analysis (SOL 159). A function of time $F(t-\tau)$ defined on the TLOADi entry multiplies the general load. t provides any required time delay. The load set identifier on the TLOADi entry must be selected in Case Control $(\mathrm{DLOAD}=\mathrm{SID})$ for use in transient analysis.  

4. In the alternate format, TEMPl is the nodal temperature for the grid points GID1,GID1 $^+$ INC,...,GID2. If “BY" and INC are not specified, then the grid point number increment is unity.  

5.If $\mathrm{TYPE}=\mathrm{^{\ast}S T A T^{\circ}}$ , then no SPCi Bulk Data entries may be specified.  

6.If T $\mathrm{\DeltaYPE}=\mathrm{\Delta^{\mathrm{\infty}}T R A N}$ ", then no CELAS2 or DAREA Bulk Data entries may be specified. Also, “U" must be specified in the CONV field on the entry to obtain accurate results.  

7. All TEMPBC entries in the Bulk Data Section must indicate either TYI $\mathrm{\?E=\mathrm{\}}^{\ast},$ STAT”or $\mathrm{TYPE}=\mathrm{^{\infty}T R A N^{\mathrm{{\scriptscriptstyle3}}}}$ but not both.  

8. In transient thermal analysis, the TEMPBC option is used to set a grid, known temperature as a function of time. Internally NASTRAN uses SLOAD and CELAS2 entries to enforce the temperature as a function of time. The $\scriptstyle{\mathrm{u=P/K}}$ or temperature is equal to SLOAD divided by CELAS2.The default stiffness for the CELAS2 entry is 1.OE10. This value is fine most of the time. However, if the user desired to run the model using thermal conductivity in the following unit (Btu/sec.inch.F), then it may run into a numerically convergence issue. This is because the thermal conductivity for this unit has conductivity value in the l.OE-6 range. The avoidance is to set a NASTRAN system cell, TBCMAG to 1.0E2.  

9. The TEMPBC with type $\c=$ TRAN is no longer supported in SOL 400 transient thermal analysis. One should use the SPCl and SPCD to enforced temperature.For example, convection coefficient as a function of time, mass flow rate as a function of time, or ambient temperature as a function of time all used the TEMPBC,TRAN option to apply a time varying nodal quantity in SOL 159. Following are the procedures for a user to convert SOL 159 into SOL 400 when there is TEMPBC,TRAN entries.  

The SPC entry used to fixed a boundary temperature at a particular value at all time. However, if you have a TEMPBC,TRAN in your test file this means that all the permanent SPC must be converted into SPCD and SPC1 with a unit step function on the TABLED1 in SOL 400. The avoidance to this, using a constant temperature with SPC and a time-varying temperature in the same run, is using the large stiffness method to enforced the time varying quantity.The large stiffness used SLOAD and CELAS2 which $\mathbf{u}=\mathrm{P}/\mathrm{K}$ which ${\mathrm{P}}=$ SLOAD, and $\mathrm{K}=$ CELAS2, and u is the desired temperature times the time-varying quantity in the TABLEDx.  

To Convert SOL 159 Models to SOL 400 Models:  

a. Executive Control Section - change SOL 159 to SOL 400.  

b. Case Control Section - replace ANALYSIS $\dot{}=\mathbf{\nabla}$ HEATby ANALYSIS $\dot{\mathbf{\eta}}=\mathbf{\eta}$ HTRAN, also add SPC if all temperature boundary conditions are transient (the following Case 3b).  

c. Bulk Data Section - replace the “TRAN" type TEMPBC by SPC1 and SPCD. The details are explained below.  

If all temperature boundary conditions are constant, no changes are required.  

If all temperature boundary conditions are transient, replace TEMPBC by SPCl and SPCD and modify TLOAD1.  

For example, replace the following entries of SOL 159 model:   
TLOAD1,40,400,,4000   
TEMPBC,400,TRAN,300.0,99 by   
$S\mathrm{PC}=111$ (Case CC)   
：   
TLOAD1,40,400,,1,4000   
SPCD,400,99,300.0   
SPC1,111,99   
If a model has both constant and transient temperature boundary conditions, all boundary conditions must be converted into SPC1 and SPCD.   
For example, replace the following entries of SOL 159 model:   
DLOAD,222,1.0,1,0,30,1.0,40   
TLOAD1,40,400,,4000   
TEMPBC,400,TRAN,300.0,99   
SPC,111,98,,20.0   
by   
DLOAD,222,1.0,1,0,30,1.0,40,1.0,50   
TLOAD1,40,400,1,4000   
SPCD,400,99,300.0   
SPC1,111,,99   
TLOAD1,50,500,,1,5000   
SPCD,500,98,20.0   
SPC1,111,98   
TABLED1,5000,,   
,0.0,1.0,1000.0,1.0,ENDT  

10．If TYPE $\v=$ TRAN and the initial temperature is non zero, then the initial temperature must be supplied. Use case control IC and bulk data TEMP entries.  

Defines a temperature value forallgrid points ofthe structural model that have not been givena temperature on a TEMP or TEMPN1 (for heat transfer analysis) entries.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TEMPD</td><td>SID1</td><td>T1</td><td>SID2</td><td>T2</td><td>SID3</td><td>T3</td><td>SID4</td><td>T4</td><td></td></tr></table></body></html>  

Example:  

<html><body><table><tr><td>TEMPD</td><td>１</td><td>216.3</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SIDi</td><td>Temperature set identification number. (Integer > 0)</td></tr><tr><td>Ti</td><td>Default temperature value. (Real)</td></tr></table></body></html>  

Remarks:  

1. In the static solution sequences, SID must be selected by the TEMP Case Control command. In the dynamic solution sequences, if there is a LOADSET Case Control command, then SID must be referenced in the TID field of a selected LSEQ entry. If there is no LOADSET Case Control command, then SID must be referenced in the EXCITEID field of an RLOADi or TLOADi entry.   
2. SIDi must be unique with respect to allother LOAD type entries if TEMP(LOAD) is specified in the Case Control Section.   
3. From one to four default temperatures may be defined on a single entry.   
4.If thermal efects are requested, allelements must have a temperature field defined either directly on a TEMPP1, TEMPP3, or TEMPRB entry or indirectly as the average of the connected grid point temperatures defined on the TEMP or TEMPD entries. Directly defined element temperatures always take precedence over the average of grid point temperatures.   
5. If the element material is temperature dependent, its properties are evaluated at the average temperature.   
6. Average element temperatures are obtained as a simple average of the connecting grid point temperatures when no element temperature data is defined.   
7. For steady-state heat transfer analysis,this entry together with the TEMP and TEMPNl entries supplies the initialization temperatures for nonlinear analysis. The Case Control command $\mathrm{TEMP(INIT)=SID}$ requests selection of this entry. The temperature values specified here must be coincident with any temperatures boundary conditions that are specified.   
8.For transient heat transfer analysis,this entry together with the TEMP and TEMPN1 entries supplies the initial condition temperatures. The Case Control command IC $\dot{\mathbf{\Omega}}=\mathbf{\Omega}$ SID request selection of this entry. The temperature values specified here must be coincident with any temperature boundary conditions that are specified.   
9.In linear and nonlinear buckling analysis,the follower force effects due to loads from this entry are not included in the differential stiffness. See Buckling Analysis in SubDMAP MODERS,417 and Nonlinear Static Analysis in the MSC Nastran Reference Guide.   
10. For partitioned Bulk Data superelements and auxiliary models, TEMPD must be specified in all partitioned Bulk Data Sections.   
11. If Modules are present then this entry may only be specified in the main Bulk Data section.  

Defines the thermal loading to be applied to a group of elements.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5 6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>TEMPF</td><td>SID</td><td>EID1</td><td>FTEMP</td><td>FTABID</td><td></td><td></td><td></td></tr><tr><td></td><td>EID2</td><td>EID3</td><td>-etc.-</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:  

<html><body><table><tr><td>TEMPF</td><td>127</td><td>12</td><td>111</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Alternate Format:  

<html><body><table><tr><td>TEMPF</td><td>SID EID2</td><td>EID1 “THRU”</td><td>FTEMP EIDn</td><td>FTABID</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td><td>Type</td><td>Default</td></tr><tr><td>SID</td><td>Temperature set identification number.</td><td>Integer > 0</td><td rowspan="3"> Required</td></tr><tr><td>FTEMP</td><td>ID ofa DEQATN entry describing the temperature Integer > 0 field as a function of x,y,z. See Remark 1.</td><td></td></tr><tr><td>FTABID</td><td>ID of a TABLE3D entry describing the temperature Integer > 0 field. See Remark 1.</td><td></td></tr><tr><td>EIDi</td><td>Identification numbers of the p-elements to which this thermal load is applied.</td><td> Integer > 0</td><td>Required</td></tr></table></body></html>  

Remarks:  

1. Either FTEMP or FTABID must be specified but not both.   
2. The TEMPF entry overrides the temperature at the element vertices specified on the TEMP or TEMPD entries.  

Defines initial temperature at grid points of heat shellelements with linear or quadratic temperature distribution across the thickness direction.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>TEMPN1</td><td>SID</td><td>G1</td><td>C1</td><td>T1</td><td>G2</td><td>C2</td><td>T2</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TEMPN1</td><td>10</td><td>100</td><td>123</td><td>1300.</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Temperature set identification number. (Integer > 0)</td></tr><tr><td>Gi</td><td>Grid point identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component numbers. (0 ≤ Integer ≤ 3; up to 3 unique Integers may be placed in the field with no embedded blanks.) 1=TOP, 2=BOT, 3=MID. (Integer > -1; Default = 1)</td></tr><tr><td>Ti</td><td>Temperature. (Real)</td></tr></table></body></html>  

Remarks:  

1. This entry is for shell elements defined on a PSHLN1 heat transfer.   
2. In the steady-state solution sequences, SID is selected by the LOAD Case Control command.   
3.In the transient solution sequences, if there is a LOADSET Case Control command, then SID must be referenced in the LID field of a selected LSEQ entry. If there is no LOADSET Case Control command, then SID must be referenced in the EXCITEID field of an ACSRCE, RLOADi or TLOADi entry.   
4. The TEMPN1 Bulk Data entry is used to complement the TEMP Bulk Data entry.The TEMP entry willjust initiate the TOP grids.This entry alows specifying of the TOP, BOT, and MID or any combination. See the NLMOPTS,TEMGO,vmaptg Bulk Data entry on how to list internally generated grids.   
5. For steady-state heat transfer analysis, this entry together with the TEMPD and TEMP entries supplies the initialization temperatures for nonlinear analysis. The Case Control command TEMP(INIT) $\O=$ SID requests selection of this entry. The temperature values specified here must be coincident with any temperature boundary conditions that are specified.   
6.For transient heat transfer analysis,this entry together with the TEMPD and TEMP entries supplies the initial condition temperatures. The Case Control command $\scriptstyle{\mathrm{IC}}=S{\mathrm{ID}}$ requests selections of this entry. The temperature values specified here must be coincident with any temperature boundary condition specified.  

Defines a temperature field for plate, membrane, and combination elements (by an average temperature and a thermal gradient through the thicknes) for determination of thermal loading, temperature-dependent material properties, or stress recovery.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>TEMPP1</td><td>SID</td><td>EID1</td><td>TBAR</td><td>TPRIME</td><td>T1</td><td>T2</td><td></td><td></td></tr><tr><td></td><td>EID2</td><td>EID3</td><td>EID4</td><td>EID5</td><td>EID6</td><td>EID7</td><td>-etc.-</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TEMPP1</td><td>2 26</td><td>24</td><td>62.0 19</td><td>10.0 30</td><td>57.0</td><td>67.0</td><td></td><td></td><td></td></tr></table></body></html>  

Alternate Format and Example of Continuation Entry:  

<html><body><table><tr><td></td><td>EID2</td><td>“THRU”</td><td>EIDi</td><td>EIDj</td><td>“THRU" EIDk</td><td></td><td></td></tr><tr><td></td><td>1</td><td>THRU</td><td>10</td><td>30</td><td>THRU 61</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Temperature set identification number. (Integer > 0)</td></tr><tr><td>EIDi, EIDj, EIDk</td><td>Unique element identification number(s). (Integer > O or the continuation entries may have “THRU" in fields 3 and/or 6, in which case EID2 < EIDi and EIDj < EIDk.)</td></tr><tr><td>TBAR</td><td>Temperature at the element's reference plane as defined by ZOFFS on the connection entry. (Real, Default 0.0)</td></tr><tr><td>TPRIME</td><td>Effective linear thermal gradient. Not used for membranes. (Real, Default 0.0)</td></tr><tr><td>T1,T2</td><td>Temperatures for stress calculation at points defined on the element property entry. (Z1 and Z2 field on PSHELL entry.) T1 may be specified on the lower surface and T2 on the upper surface for the CQUAD4, CQUAD8, CTRIA3, CTRIA6, CQUADR, and CTRIAR elements. These data are not used for membrane elements. See Remark 9. If both Tl and T2 are blank, they are computed from the equation T = TBAR + z : TPRIME, where z is the distance from the center fiber. The program replaces T1 with a flag, and z is computed in a later operation. (Real)</td></tr></table></body></html>  

Remarks:  

1. In the static solution sequences, SID must be selected by the TEMP Case Control command.  

In the dynamic solution sequences, if there is a LOADSET Case Control command, then SID must be referenced in the TID field of a selected LSEQ entry. If there is no LOADSET Case Control command, then SID must be referenced in the EXCITEID field of an RLOADi or TLOADi entry. TBAR and TPRIME are used for the analysis. Ifboth are left blank the elements in essence see no thermal loading. T1 and T2 are used for post analysis for stress calculations.  

2. Set ID must be unique with respect to allother LOAD type entries if TEMP(LOAD) is specified in the Case Control Section.  

3.If continuation entries are present, ElDl and elements specified on the continuation entry are used. Elements must not be specified more than once.  

4.If thermal effects are requested, allelements must have a temperature field defined either directly on a TEMPPl or TEMPRB entry or indirectly as the average of the connected grid point temperatures defined on the TEMP or TEMPD entries. Directly defined element temperatures always take precedence over the average of grid point temperatures.  

5.For temperature field other than a constant gradient, the“effective gradient"fora homogeneous plate is  

$$
\mathrm{TPRIME}\ =\ {\frac{1}{I}}{\int_{z}}T(z)z d z
$$  

where $I$ is the bending inertia and $z$ is the distance from the neutral surface in the positive normal direction.  

6. The“average" temperature for a homogeneous plate is  

$$
\mathrm{TBAR}\ =\ \frac{1}{V o l u m e}\int\displaylimits_{V o l u m e}T d V o l u m e
$$  

7. If the element material is temperature dependent, its properties are evaluated at the average temperature TBAR.  

8.Large“THRU"ranges willead to System Fatal Message 3008 (“Insufficient Core"） and should be avoided, particularly for open sets.  

9.If the element material is nonlinear then Tl and T2 should be left blank (see the MATSl entry).  

10.Inlinear and nonlinear buckling analysis, the follower force effects due to loads from this entry are not included in the differential stiffness. See Buckling Analysis in SubDMAP MODERS, 417 and Nonlinear Static Analysis in the MSC Nastran Reference Guide.  

11. The bending and twisting moments can be reduced to outer fiber stresses and combined with membrane stresses in the composite plate elements. If, in addition, the temperature is specified by the userat a point where outer fiber stresses are calculated, the thermal expansion due to the difference between the specified temperature and the temperature that would be produced by a uniform gradient, $T^{\prime}$ , is assumed to be completely restrained. Stated differently, the second and higher order moments of the thermal expansion are assumed to be completely restrained by elastic stiffness. The resulting stress increment is  

$$
\{\Delta\upsigma\}~=~-[G_{e}]\{\upalpha_{e}\}(T-T_{o}-T^{\prime}z)
$$  

where $[G_{e}]$ and $\{\boldsymbol{\alpha}_{e}\}$ are evaluated for the average temperature of the element $\Bar{T}$ ·  

TEMPP3 is no longer available. Use TEMPP1.  

Defines a temperature field for the CBAR, CBEAM, CBEND, CROD, CTUBE, and CONROD elements for determination of thermal loading, temperature-dependent material properties, or stressrecovery.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TEMPRB</td><td>SID</td><td>EID1</td><td>TA</td><td>TB</td><td>TP1A</td><td>TP1B</td><td>TP2A</td><td>TP2B</td><td></td></tr><tr><td></td><td>TCA</td><td>TDA</td><td>TEA</td><td>TFA</td><td>TCB</td><td>TDB</td><td>TEB</td><td>TFB</td><td></td></tr><tr><td></td><td>EID2</td><td>EID3</td><td>EID4</td><td>EID5</td><td>EID6</td><td>EID7</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td rowspan="2">TEMPRB</td><td rowspan="2">200</td><td rowspan="2">1</td><td rowspan="2">68.0</td><td rowspan="2">23.0 0.0</td><td>28.0</td><td>2.5</td><td rowspan="2"></td></tr><tr><td>48.0</td><td>80.0 20.0</td></tr><tr><td></td><td>68.0 9</td><td>91.0 10</td><td>45.0</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Alternate Format and Example of Continuation Entry:  

<html><body><table><tr><td></td><td>EID2 2</td><td>“THRU" THRU</td><td>EIDi 4</td><td>EIDj 10</td><td>“THRU" THRU</td><td>EIDk 14</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Temperature set identification number. (Integer > 0)</td></tr><tr><td>EIDi,EIDj, EIDk</td><td>Unique element identification number(s). (Integer > O or the second continuation entry may have“THRU" in fields 3 and/or 6 in which case EID2 <EIDi and EIDj < EIDk.)</td></tr><tr><td>TA, TB</td><td>Temperature at end A and end B on the neutral axis. (Real, default 0.0)</td></tr><tr><td>TPij</td><td>Effective linear gradient in direction i on end j; used with CBAR, CBEAM, and CBEND only. (Real)</td></tr><tr><td>Tij</td><td>Temperature at point i (i=C, D, E, or F)as defined on the PBAR, PBEAM, and PBEND entries at end j (j=A or B). This data is used for stress recovery only with CBAR, CBEAM,and CBEND exclusively. See Remark 3. (Real)</td></tr></table></body></html>  

Remarks:  

1. In the static solution sequences, SID must be selected by the TEMP Case Control command. In the dynamic solution sequences, if there is a LOADSET Case Control command, then SID must be referenced in the TID field of a selected LSEQ entry. If there is no LOADSET Case Control command, then SID must be referenced in the EXCITEID field of an RLOADi or TLOADi entry.   
2. SID must be unique with respect to all other LOAD type entries if TEMP(LOAD) is specified in the Case Control Section.  

3.If at least one nonzero or nonblank Tij is present, the point temperatures given are used for stress recovery. If no Tijvalues are given, linear temperature gradients are assumed for stressrecovery. The Tij values are not used in the calculation of differential stiffness. The default for Tij for $\mathrm{j}{=}\mathrm{A}$ is TA and the default for Tij for $\scriptstyle\mathbf{j}=\mathbf{B}$ is TB.  

4.If the second (and succeeding) continuation is present, EID1 and elements specified on the second (and succeeding) continuations are used. Elements must not be specified more than once.  

5.If thermal effects are requested, allelements must have a temperature field defined either directly on a TEMPPl or TEMPRB entry or indirectly as the average of the connected grid point temperatures defined on the TEMP or TEMPD entries. Directly defined element temperatures always take precedence over the average of grid point temperatures.  

6. The effective thermal gradients in the element coordinate system for the CBAR element are defined by the following integrals over the cross section. For end $^{\mathfrak{a}}\mathrm{A}^{\mathfrak{n}}$ (end $\"{\mathrm{B}}\"{}$ is similar),  

$$
\begin{array}{l}{{\mathrm{TA}=\displaystyle\frac{1}{A}\Big[T A(y,z)d A}}\\ {{\mathrm{TPlA}=\displaystyle\frac{I_{2}}{\Delta}\Big\{(y-y_{n})T A(y,z)d A-\frac{I_{12}}{\Delta}\Big\{(z-z_{n})T A(y,z)d A}}}\\ {{\mathrm{TP2A}=\displaystyle\frac{I_{1}}{\Delta}\Big\{(z-z_{n})T A(y,z)-\frac{I_{12}}{\Delta}\Big\{(y-y_{n})T A(y,z)d A}}}\\ {{\ A}}\\ {{\Delta=\ I_{1}I_{2}-\bar{I}_{12}^{2}}}\end{array}
$$  

$$
\begin{array}{r l}{{\mathrm{TP1A}}}&{{=\displaystyle\frac{1}{I_{1}}\int(y-y_{n}){\cal T}A(y,z)d A}}\\ {{}}&{{}}\\ {{\mathrm{TP2A}}}&{{=\displaystyle\frac{1}{I_{2}}\int(z-z_{n}){\cal T}A(y,z)d A}}\end{array}
$$  

where $T A(y,z)$ is the temperature at point y,z (in the element coordinate system) at end $^{\alpha}\mathrm{A}^{\gamma}$ of the bar. See the CBAR entry description for the element coordinate system: $I1,I_{2}$ and $I_{12}$ are the moments of inertia about the $\mathbf{z}$ and y axes, respectively. The temperatures are assumed to vary linearly along the length ( $\mathbf{x}.$ -axis). Note that if the temperature varies linearly over the cross section, then TP1A, TP1B, TP2A and TP2B are the actual gradients.  

7.If the element material is temperature-dependent, the material properties are evaluated at the averag temperature $(T A+T B)/2$ ·  

8.In linear and nonlinear buckling analysis,the follower force effects due to loads from this entry are not included in the differential stiffness. See Buckling Analysis in SubDMAP MODERS,417 and Nonlinear Static Analysis in the MSC Nastran Reference Guide.  

9. If any $T_{y}$ is specified the stresses computed by the effective gradient are corrected by $\Delta\upsigma$ such that:  

$$
\upsigma=\upsigma\Big\vert_{T_{A}+y}T P I A_{+z}T P2A^{+}\Delta\upsigma
$$  

where $\Delta\upsigma$ is in the form  

$\Delta\upsigma\ =\ -\alpha E[T_{C A}-T_{o}-C_{1}\cdot T P I A-C_{2}\cdot T P2A]$ etc   
for CBAR and CBEAM   
$\Delta\upsigma\ =\ -\upalpha E[T_{C A}-T_{o}-(C_{1}+\Delta N)\cdot T P I A-C_{2}\cdot T P2A]$ etc for CBEND.  

Used in SOL 600 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TERMIN</td><td>ID</td><td>NC</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>NTYPE</td><td>NBN</td><td>ICRIT</td><td>VAL</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TERMIN</td><td>2</td><td>2</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>7</td><td>1000</td><td>-1</td><td>2.0</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>7</td><td>1000</td><td>-2</td><td>0.8</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>ID corresponding to a Case TERMIN entry. (Integer > 0; no Default)</td></tr><tr><td>NC</td><td>Number of termination conditions to be specified. (Integer > 0; Default = 1; Max number is 10)</td></tr><tr><td rowspan="5">NTYPE</td><td>Termination Criteria Type (Integer; no Default) Enter l if termination occurs when a percentage of the boundary nodes are in contact.</td></tr><tr><td>Enter 2 if termination occurs when the maximum force on a rigid body is exceeded. Enter 3 if termination occurs when the displacement of the rigid body exceeds the allowed displacement.</td></tr><tr><td>Enter 5 if termination occurs when the distance between the reference points of two</td></tr><tr><td>rigid bodies is less or greater than the specified value. Enter 6 if termination occurs, when any displacement in body, is greater than the</td></tr><tr><td>specified value. Enter 7 if termination occurs, when the displacement in the node, is greater than the</td></tr><tr><td colspan="2">NBN Body number, for criterion type 7, grid ID (Integer > 0; no Default)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td rowspan="5">ICRIT</td><td>Criteria specification. (Integer; no Default) For criterion type 1, enter the percentage of nodes to be in contact for termination;</td></tr><tr><td>default = 100.</td></tr><tr><td>For criterion type 2, enter direction 1/2/3 for the x, y, z global directions For criterion type 5, enter the second body.</td></tr><tr><td></td></tr><tr><td>For criterion type 6 or 7, enter the degree of freedom. For criterion type 6 or 7, enter -1 if the total translational displacement.</td></tr><tr><td>VAL</td><td>For criterion type 6 or 7, enter -2 if the total rotation. Termination value. (Real; no Default) For criterion type 2, enter the critical force. For criterion type 3, enter the critical maximum displacement. For criterion type 5, enter the critical distance. If the value is positive, the termination occurs when the distance is less than the value. If the value is negative, the termination</td></tr></table></body></html>  

Remarks:  

1. Different TERMIN entries may be used in different subcases.   
2. Not all subcases require TERMIN entries if used in other subcases.  

Defines a dynamic transfer function of the form  

$$
({\bf B}0+{\bf B}1\cdot p+{\bf B}2\cdot p^{2})u_{d}+\sum_{i}({\bf A}0(i)+{\bf A}1(i)p+{\bf A}2(i)p^{2})u_{i}=0
$$  

Where:  

$$
\begin{array}{r l r l}{\mathrm{U}_{\mathrm{d}}}&{=}&&{\mathrm{dependent~coordinate}}\\ {\mathrm{U}_{\mathrm{i}}}&{=}&&{\mathrm{independent~degree~of~freedon}}\\ {\mathrm{p}}&{=}&&{\mathrm{differential~operator~(p=d/dt~\phantom{1}{'}d r~}}\end{array}
$$  

Can also be used as a means of direct matrix input. See Remark 4  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>９</td><td>10</td></tr><tr><td>TF</td><td>SID</td><td>GD</td><td>CD</td><td>B0</td><td>B1</td><td>B2</td><td></td><td></td><td></td></tr><tr><td></td><td>G(1)</td><td>C(1)</td><td>A0(1)</td><td>A1(1)</td><td>A2(1)</td><td>-etc.-</td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TF 1</td><td>2</td><td>3</td><td>4.0</td><td>5.0</td><td>6.0</td><td></td><td></td><td></td></tr><tr><td>3</td><td>4</td><td>5.0</td><td>6.0</td><td>7.0</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Set identification number. (Integer > 0)</td></tr><tr><td>GD, G(i)</td><td>Grid, scalar, or extra point identification numbers. (Integer > 0)</td></tr><tr><td>CD, C(i)</td><td>Component numbers. (Integer zero or blank for scalar or extra points, any one of the Integers 1 through 6 for a grid point.)</td></tr><tr><td>B0, B1, B2 A0(i),A1(i),A2(i)</td><td>Transfer function coefficients. (Real)</td></tr></table></body></html>  

Remarks:  

1. Transfer function sets must be selected with the Case Control command $\mathrm{TFL}=\mathrm{SID}$   
2. Continuation entries are optional.   
3. The matrix elements defined by this entry are added to the dynamic matrices for the problem.   
4.The constraint relation given in Eq.(9-34) willhold only if no structural elements or other matrix elements are connected to the dependent coordinate $u_{d}$ . In fact, the terms on the left side ofEq. (9-34) are simply added to the terms from allother sources in the row for $u_{d}$ ·  

5. See the MSC Nastran Dynamic Analysis User's Guide for a discussion of transfer functions.   
6. For each SID, only one logical entry is allowed for each GD, CD combination.   
7. For heat transfer analysis, the initial conditions must satisfy Eq. (9-34)   
8. RC network does not support TF for thermal analysis.   
9.For more information see DMIGs,Extra Points, and Transfer Functions (p.658) in the Dynamic Analysis   
User's Guide.  

Allows the user to provide the parameters fora tilting pad bearing for use with ROMAC's THPAD service.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>５</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>THPAD</td><td>RID</td><td>TLIMIT</td><td></td><td>Title1</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td colspan="10">Title2</td></tr><tr><td></td><td>RADIUS</td><td>CLEAR</td><td>OUTR</td><td>LENGT H</td><td>ALPHP</td><td>E</td><td>ALPHJ</td><td>ALPHS</td><td></td></tr><tr><td></td><td>NPADS</td><td>NEL</td><td>IECC</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>ARC1</td><td>OFFSET1</td><td>PRELOAD1</td><td>PVANG1</td><td>IP1</td><td>KP1</td><td>MP1</td><td>IT1</td><td></td></tr><tr><td></td><td>ARC2</td><td>OFFSET2</td><td>PRELOAD</td><td>PVANG2</td><td>IP2</td><td>KP2</td><td>MP2</td><td>IT2</td><td></td></tr><tr><td></td><td>…</td><td>…</td><td>…</td><td>…</td><td>…</td><td>…</td><td>…</td><td>…</td><td></td></tr><tr><td></td><td>KFILM</td><td>KPAD</td><td>TBACK</td><td>TJF</td><td>PSUMP</td><td>TIN</td><td>KCAV</td><td>CCAV</td><td></td></tr><tr><td></td><td>DENSIT Y</td><td>SPEC</td><td>TA</td><td>MUA</td><td>TB</td><td>MUB</td><td>ESUMP</td><td>TMANU</td><td></td></tr><tr><td></td><td>ERROR</td><td>XG</td><td>YG</td><td></td><td></td><td>NAX</td><td>FACTOR</td><td>XFACT</td><td></td></tr><tr><td></td><td>ITJ </td><td>IBC</td><td>ITUR</td><td>IDIM</td><td></td><td>ICOND</td><td>ITB</td><td>ITG</td><td></td></tr><tr><td></td><td></td><td></td><td>ICAV</td><td>ICROSS</td><td>IDEF</td><td>IFLEX</td><td>IUN</td><td>ISUMP</td><td></td></tr><tr><td></td><td>KTHETA</td><td>DELO</td><td>HOTOVER</td><td>COLDOVE R</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>NCASE</td><td>MAXC</td><td>IALPH</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>RPM1</td><td>FX1</td><td>FY1</td><td>PGNU1</td><td>RELAX1</td><td>OFLOW1</td><td>DEREL1</td><td></td><td></td></tr><tr><td></td><td>RPM2</td><td>FX2</td><td>FY2</td><td>PGNU2</td><td>RELAX2</td><td>OFLOW2</td><td>DEREL2</td><td></td><td></td></tr><tr><td></td><td>…</td><td>…</td><td>…</td><td></td><td>…</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example: In the FMS Section of the Nastran input stream a connect statement is required:  

CONNECT SERVICE GRl SCR.MDSolver.Obj.Uds.Elements.thpad' In Bulk Data:  

<html><body><table><tr><td>CBUSH2D</td><td>100</td><td>200</td><td>1</td><td>2</td><td></td><td>XY</td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>PBUSH2D</td><td>200</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>ELEMUDS</td><td>200</td><td>PBUSH2D</td><td>GR1</td><td>THPAD</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td>FREQ</td><td></td><td></td><td></td></tr><tr><td>THPAD</td><td>200</td><td>1000.0</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td colspan="6"> Tilting pad bearing used for the 8 stage certrifugal compressor</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td></td><td colspan="8">Load on Pad</td><td></td></tr><tr><td></td><td>2.5</td><td>0.0038</td><td>3.5</td><td>3.0</td><td>3.0E7</td><td>6.5E-6</td><td>6.5E-6</td><td>6.5E-6</td><td></td></tr><tr><td></td><td>５</td><td>30</td><td>0</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>60.0</td><td>0.5</td><td>0.3</td><td>54.0</td><td>0.001</td><td>0.0</td><td>0.0</td><td>0.0</td><td></td></tr><tr><td></td><td>60.0</td><td>0.5</td><td>0.3</td><td>126.0</td><td>0.001</td><td>0.0</td><td>0.0</td><td>0.0</td><td></td></tr><tr><td></td><td>60.0</td><td>0.5</td><td>0.3</td><td>198.0</td><td>0.001</td><td>0.0</td><td>0.0</td><td>0.0</td><td></td></tr><tr><td></td><td>60</td><td>0.5</td><td>0.3</td><td>270.0</td><td>0.001</td><td>0.0</td><td>0.0</td><td>0.0</td><td></td></tr><tr><td></td><td>60.0</td><td>0.5</td><td>0.3</td><td>342.0</td><td>0.001</td><td>0.0</td><td>0.0</td><td>0.0</td><td></td></tr><tr><td></td><td>2.0E-6</td><td>0.00067</td><td>120.0</td><td>175.0</td><td>0.0</td><td>175.0</td><td>5.0</td><td>0.0</td><td></td></tr><tr><td></td><td>8.0E-5</td><td>180.0</td><td>100.0</td><td>4.13E-6</td><td>210.0</td><td>6.8E-7</td><td>1.0</td><td>75.0</td><td></td></tr><tr><td></td><td>0.001</td><td>0.2</td><td>0.2</td><td></td><td></td><td>2.0</td><td>100.0</td><td>100.0</td><td></td></tr><tr><td></td><td>0</td><td>2</td><td>1</td><td>0</td><td></td><td>0</td><td>0</td><td>0</td><td></td></tr><tr><td></td><td></td><td></td><td>1</td><td>0</td><td>2</td><td>0</td><td>0</td><td>0</td><td></td></tr><tr><td></td><td>0.0</td><td>0.0</td><td>100.0</td><td>0.0</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>2</td><td>100</td><td>100</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>1000.0</td><td>0.0</td><td>931.5</td><td>1.0</td><td>1.0</td><td>0.0</td><td>1.0</td><td></td><td></td></tr><tr><td></td><td>2000.0</td><td>0.0</td><td>931.5</td><td>1.0</td><td>1.0</td><td>0.0</td><td>1.0</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>RID</td><td>ROMAC bearing identification number that matches the property identification number on an ELEMUDS entry as well as a PBUSH2D entry. (Integer > 0)</td></tr><tr><td>TLIMIT</td><td>Time limit for a call to THPAD. If the call takes longer than this, the service call will be killed. (Real)</td></tr><tr><td>TITLE1</td><td>User supplied title. (Character)</td></tr><tr><td>TITLE2</td><td>User supplied title. (Character)</td></tr><tr><td>RADIUS</td><td> Journal radius (Real, in)</td></tr><tr><td>CLEAR</td><td>Ground-in pad clearance. (Real, in)</td></tr><tr><td>OUTR</td><td>Outer radius of bearing pads. (Real, in)</td></tr><tr><td>LENGTH</td><td>Axial length of bearing pads. (Real, in)</td></tr><tr><td>E</td><td>Young's modulus for the pads. (Real, psi)</td></tr><tr><td>ALPHP</td><td>Pad thermal expansion coefficient. (Real, 1/F)</td></tr><tr><td>ALPHJ</td><td> Journal thermal expansion coefficient. (Real, 1/F)</td></tr><tr><td>ALPHS</td><td>Shell thermal expansion coefficient. (Real, 1/F)</td></tr><tr><td>NPADS</td><td>Number of pads. (Integer > 0)</td></tr><tr><td>NEL</td><td>Number of elements per pad. (Integer > 0)</td></tr><tr><td>IECC</td><td>Eccentricity variation flag. (Integer) 0 Allow eccentricity variation to match load.</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td></td><td>1 Eccentricity fixed at initial value.</td></tr><tr><td>ARCi</td><td>Arc length for the pad. (Real, deg)</td></tr><tr><td>OFFSETi</td><td>Offset factor for the pad. (Real)</td></tr><tr><td>PRELOADi</td><td>Preload factor for the pad. (Real)</td></tr><tr><td>PVANGi</td><td>Location of pad pivot angle. (Real, deg)</td></tr><tr><td>IPi</td><td>Pad polar moment. (Real, lb-sec²-in)</td></tr><tr><td>KPi</td><td>Pad pivot stiffness. KPi=O for rigid pivots. (Real, lb/in)</td></tr><tr><td>MPi</td><td>Pad mass. (Real, lb-sec2/in)</td></tr><tr><td>ITi</td><td> Pad bending inertia. (Real, in4)</td></tr><tr><td>KFILM</td><td>Fluid thermal conductivity. (Real, btu/in-sec-F)</td></tr><tr><td>KPAD</td><td> Pad thermal conductivity. (Real, btu/in-sec-F)</td></tr><tr><td>TBACK</td><td>Back of pad temperature. (Real, F)</td></tr><tr><td>TJF</td><td>Temperature of the journal surface. (Real, F)</td></tr><tr><td>PSUMP</td><td>Sump oil pressure. (Real, psi)</td></tr><tr><td>TIN</td><td>Pad inlet oil temperature. (Real, F)</td></tr><tr><td>KCAV</td><td> Thermal conductivities cavitation ratio. (Real)</td></tr><tr><td>CCAV</td><td>Cavitation latent heat ratio. (Real, btu/sec-in2-F)</td></tr><tr><td>DENSITY</td><td> Lubricant density. (Real, Ibf-sec²/in4)</td></tr><tr><td>SPEC</td><td> Lubricant specific heat. (Real, btu-in/lbf-sec²-F)</td></tr><tr><td>TA</td><td>First temperature datum.(Real, F)</td></tr><tr><td>MUA</td><td>Viscosity at TA. (Real)</td></tr><tr><td>TB</td><td> Second temperature datum. (Real, F)</td></tr><tr><td>MUB</td><td>Viscosity at TB. (Real)</td></tr><tr><td>ESUMP</td><td>Sump heating factor. (Real)</td></tr><tr><td>TMANU</td><td>Clearance set temperature. (Real, F)</td></tr><tr><td>ERROR</td><td>Error criterion. (Real)</td></tr><tr><td>XG</td><td>Initial guess of x/cp. (Real)</td></tr><tr><td>YG</td><td> Initial guess of y/cp. (Real)</td></tr><tr><td>NAX</td><td>Axial pressure exponent. (Real, 2.0 is recommended)</td></tr><tr><td>FACTOR</td><td> Perturbation effect on position iteration. (Real)</td></tr><tr><td>XFACT</td><td>Percentage of cross-coupled terms in position update. (Real)</td></tr><tr><td>ITJ</td><td>Journal temperature flag. (Integer)</td></tr><tr><td></td><td>0 Journal temperature found as average of film</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td></td><td>1</td><td> Journal temperature fixed by user.</td></tr><tr><td></td><td>2</td><td> Journal temperature set for zero heat flux to shaft.</td></tr><tr><td>IBC</td><td colspan="2">Boundary condition flag. (Integer)</td></tr><tr><td></td><td>0</td><td>Reynolds boundary condition with flow correction.</td></tr><tr><td></td><td>1</td><td>Not used.</td></tr><tr><td></td><td>2</td><td> Reynolds boundary condition for pressure.</td></tr><tr><td>ITUR</td><td colspan="2"> Turbulence flag. (Integer)</td></tr><tr><td></td><td>0 Laminar solution.</td><td></td></tr><tr><td></td><td>1 Turbulence allowed.</td><td></td></tr><tr><td>IDIM</td><td colspan="2">Dimension flag. (Integer)</td></tr><tr><td></td><td>0</td><td>Two-dimensional conduction in the pad.</td></tr><tr><td></td><td colspan="2">1 Radial conduction in the pad.</td></tr><tr><td>ICOND</td><td colspan="2">Conduction flag. (Integer)</td></tr><tr><td></td><td>0</td><td>Energy equation includes conduction.</td></tr><tr><td></td><td>1</td><td> Adiabatic (isothermal) energy equation.</td></tr><tr><td>ITB</td><td colspan="2"> Back temperature flag. (Integer)</td></tr><tr><td></td><td colspan="2">0 Pad back temperature equals sump temperature.</td></tr><tr><td></td><td>1</td><td>Pad back temperature fixed by user.</td></tr><tr><td>ITG</td><td colspan="2">Groove temperature flag. (Integer)</td></tr><tr><td></td><td colspan="2">0 Groove temperature found iteratively by heat balance.</td></tr><tr><td></td><td>1</td><td> Groove temperature fixed at sump temperature.</td></tr><tr><td>ICAV</td><td colspan="2">Cavitation flag. (Integer)</td></tr><tr><td></td><td colspan="2"> No cavitation effects in energy equation.</td></tr><tr><td></td><td></td><td> Include cavitation effects in energy equation.</td></tr><tr><td>ICROSS</td><td colspan="2">Cross-film viscosity flag. (Integer)</td></tr><tr><td></td><td colspan="2">0 Constant cross-film viscosity.</td></tr><tr><td></td><td>1 Variable cross-film viscosity.</td><td></td></tr><tr><td>IDEF</td><td colspan="2">Deformation flag. (Integer)</td></tr><tr><td></td><td>0</td><td>No pad/pivot deformations.</td></tr><tr><td></td><td>1</td><td>Pivot deformations.</td></tr><tr><td></td><td>2</td><td>Pad, journal and shell thermal deformations.</td></tr><tr><td></td><td>4</td><td>Pad mechanical deformations.</td></tr><tr><td>IELEX</td><td>T</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td rowspan="5">IUN</td><td>0</td><td>Curved beam analysis.</td></tr><tr><td>1</td><td> Straight beam analysis.</td></tr><tr><td>2</td><td>Simple curvature calculation.</td></tr><tr><td>Unloaded pads flag. (Integer)</td><td></td></tr><tr><td>0</td><td>Effect of unloaded pads is considered.</td></tr><tr><td rowspan="3">ISUMP</td><td>1</td><td> Effect of unloaded pads is neglected.</td></tr><tr><td> Sump temperature flag. (Integer)</td><td></td></tr><tr><td>0</td><td> Sump temperature set to pad inlet oil temperature.</td></tr><tr><td></td><td>1</td><td> Sump temperature found iteratively by heat balance.</td></tr><tr><td>KTHETA</td><td></td><td>Pivot rotational stiffness. (Real, lb-in, Default = 0.0)</td></tr><tr><td>DELO</td><td></td><td>Initial pad angle for moment balance. (Real, rad, Default = 0.0)</td></tr><tr><td>HOTOVER</td><td></td><td>Percentage of hot oil available carried to the groove. (Real, Default = 100.0)</td></tr><tr><td>COLDOVER</td><td></td><td>Percentage of groove oil made up of inlet oil. (Real, Default = 0.0)</td></tr><tr><td>NCASE</td><td></td><td>Number of speed/load cases. (Integer > 0)</td></tr><tr><td>MAXC</td><td></td><td>Maximum number of position iterations. (Real, Default = 100)</td></tr><tr><td>IALPH</td><td>New stiffness smoothing factor. (Real)</td><td></td></tr><tr><td>RPMi</td><td>Speed of journal. (Real, rpm)</td><td></td></tr><tr><td>FXi</td><td></td><td>Applied force in the negative x-direction. (Real, lb)</td></tr><tr><td>FYi</td><td></td><td>Applied force in the negative y-direction. (Real, lb)</td></tr><tr><td>PGNUi</td><td>Whirl ratio of shaft. (Real)</td><td></td></tr><tr><td>RELAXi</td><td></td><td>Position iteration relaxation factor. (Real)</td></tr><tr><td>OFLOWi</td><td>Oil flow to bearing. (Real, cips)</td><td></td></tr><tr><td>DERELi</td><td></td><td>Relaxation factor for pivot deformation iteration. (Real)</td></tr></table></body></html>  

Remarks:  

1. This entry triggers the callto the THPAD service. The GROUP must match the GROUP field o   
the CONNECT SERVICE FMS entry.   
2. On the FMS CONNECT entry, only the CONNECT SERVICE can be used with this entry.   
3. PID must match an existing ELEMUDS and PBUSH2D PIDs.   
4. All units must be in the English system.   
5. Refer to http://www.virginia.edu/romac/ for more information.  

6.Use of this entry requires,that the user, has obtained the source for the THPAD routine from the University of Virginia Rotating Machinery and Controls Laboratory (ROMAC) and use the MSC Nastran Software Development Kit (SDK) to build it as a User Defined Service (UDS). SDK and UDS build instructions are available in the Msc Nastran Rotordynamics User's Guide.  

Defines values for the initial conditions of variables used in structural transient analysis.Both displacement and velocity values may be specified at independent degrees-of-freedom(See Remark 6.).This entry may not be used for heat transfer analysis.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>９</td><td>10</td></tr><tr><td>TIC</td><td>SID</td><td>G</td><td>C</td><td>U0</td><td>VO</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TIC</td><td>100</td><td>10</td><td>3</td><td>0.1</td><td>0.5</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Set identification number. (Integer > 0)</td></tr><tr><td>G</td><td>Grid, scalar, or extra point or modal coordinate identification number. (Integer > O). See Remark 4.</td></tr><tr><td>C</td><td>Component numbers. (Any one of the integers 1 through 6 for grid points, integer zero or blank for scalar or extra points and -1 for modal coordinates.)</td></tr><tr><td>UO</td><td>Initial displacement. (Real)</td></tr><tr><td>V0</td><td>Initial velocity. (Real)</td></tr></table></body></html>  

Remarks:  

1. Transient analysis initial condition sets must be selected with the IC Case Control command. Note the use of IC in the Case Control command versus TIC on the Bulk Data entry. For heat transfer, the IC Case Control command selects TEMP or TEMPD entries for initial conditions and not the TIC entry.   
2.If no TIC set is selected in the Case Control Section, allinitial conditions are assumed to be zero.   
3. Initial conditions for coordinates not specified on TIC entries will be assumed to be zero.   
4.In direct transient analysis (SOL 109 and 129) as well as in modal transient analysis (SOL 112) wherein the TIC Bulk Data entry is selected by an IC or IC(PHYSICAL) Case Control command, G may reference only grid, scalar or extra points. In modal transient analysis (SOL 112) wherein the TIC Bulk Data entry is selected by an IC(MODAL) Case Control command, G may reference only modal coordinates or extra points.   
5. The initial conditions for the independent degrees-of-freedom specified by this Bulk Data entry are distinct from, and may be used in conjunction with, the initial conditions for the enforced degreesof-freedom specified by TLOAD1 and/or TLOAD2 Bulk Data entries.   
6. SOL700 does not support U0 (initial displacement).  

Defines the initial values of element variables at the beginning of the analysis. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TICEL</td><td>SID</td><td>SETID</td><td>NAME1</td><td>VALUE1</td><td>NAME2</td><td>VALUE2</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TICEL</td><td>3</td><td>40</td><td>DENSITY</td><td>100.</td><td>SIE</td><td>1.E5</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Set identification number. (Integer > 0; Required)</td></tr><tr><td>SETID</td><td>Number of a SET1 entry defining the elements to be initialized. (Integer > O; Required)</td></tr><tr><td>NAMEi</td><td>Element variable to be initialized. See Remark 5. (Character; Required)</td></tr><tr><td>VALUEi</td><td>Value of the variable. (Real; Required)</td></tr></table></body></html>  

Remarks:  

1. Initial conditions for elements that are not specified on TICEL entries are assumed to be zero except density, which is set to the reference density.   
2. Only initial conditions that are selected in the Case Control Section $\mathrm{(IC=SID)}$ will be activated by the solver.   
3.As many continuation lines as required can be used to specify all the variables being initialized.A blank field terminates the list.   
4. Element variables for Eulerian elements can be initialized with a TICEL ora TICEULl entry. The TICEL entry initializes a set of elements, while the TICEULl entry initializes either a set of elements or geometrical regions (sphere, cylinder..). When a Euler element is part of both a TICEL and a TICEULl entry, the TICEL entry takes precedence, and overrules the TICEULl initialization for the element.  

5. The following variables for NAMEi can be used to initialize the Eulerian regions:  

<html><body><table><tr><td>XVEL</td><td>x-velocity</td></tr><tr><td>YVEL</td><td>y-velocity</td></tr><tr><td>ZVEL</td><td>z-velocity</td></tr><tr><td>DENSITY</td><td> Density</td></tr><tr><td>SIE</td><td>Specific internal energy</td></tr><tr><td>Q</td><td>Artificial viscosity</td></tr></table></body></html>  

<html><body><table><tr><td>DIV</td><td>Divergence</td></tr><tr><td>VOID</td><td>Void fraction</td></tr><tr><td>FMAT</td><td>Material fraction</td></tr><tr><td>XMOM</td><td>X-momentum</td></tr><tr><td>YMOM</td><td>y-momentum</td></tr><tr><td>ZMOM</td><td>z-momentum</td></tr></table></body></html>  

6.To initialize the pressure use density.And depending on the equation of states also define the specific internal energy (SIE).  

7. For the Euler solvers,you can, in addition to the“normal" element variables that the solver has defined, also define an initial radial velocity field.You have to enter the location of the center from where the radial emerges, the velocity to be applied to the element center and the decay coefficient for the velocity field. The center is defined by the keywords “X-CENTER, Y-CENTER, ZCENTER", the radial velocity by"R-VEL"and the decay coefficient by "DECAY". You have to input these keywords in the above order, and have every keyword followed by its value.  

## TICEUL1  

Defines the initial valuessets forEulerian regions.TheEulerian regions are defined by geometric shapes. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5 6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>TICEUL1</td><td>SID</td><td>TSID</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TICEUL1</td><td>300</td><td>200</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Unique TICEUL1 number referenced from a PEULER1 entry. (Integer > O; Required)</td></tr><tr><td>TSID</td><td>Group of geometric region TICREG ID. (Integer > 0; Required)</td></tr></table></body></html>  

Remarks:  

1. Element variables for Eulerian elements can be initialized with a TICEL or a TICEULl entry. The TICEL entry initializes a set of elements, while the TICEULl entry initializes either aset of elements or geometrical regions (sphere, cylinder, ..). When a Euler element is part of both a TICEL and a TICEULl entry, the TICEL entry takes precedence and overrules the TICEULl initialization for the element.  

Defines the initialvalues of element or grid point variables at the beginning of the analysis bya user written subroutine. Use in SOL700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TICEUDS</td><td>SID</td><td>GROUP</td><td>UNAME</td><td>SETID</td><td>COPT</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example: In FMS Section of the MSC Nastran input stream:  

CONNECT SERVICE initex 'SCAI.MDSolver.Obj.Uds.Dytran.InitOut' In Bulk Data:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TICEUDS</td><td>12</td><td>initex</td><td>EXINIT</td><td>100</td><td>GRID</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td><td></td></tr><tr><td>SID</td><td colspan="2">Unique output number. (Integer > O; Required)</td></tr><tr><td>GROUP</td><td>The group name used for the FMS section CONNECT SERVICE statement. (Character; no Default)</td><td></td></tr><tr><td>UNAME</td><td colspan="2">User subroutine name associated with the entry. (Character; default=EXINIT)</td></tr><tr><td>SETID</td><td colspan="2">Number of a SET1 entry defining the elements or grids to be initialized. (Integer > 0, Required)</td></tr><tr><td>COPT</td><td colspan="2">Flag for assigning initial velocities. (Character; default=Element)</td></tr><tr><td></td><td colspan="2">Element Apply the initial variables on elements GRID Apply the initial variables on grids</td></tr></table></body></html>  

Remarks:  

1. Only can be used for SOL 700.   
2. Initial conditions to be used must be selected in the Case Control Section $(\mathrm{TIC}=\mathrm{SID}),$   
3.UNAME $\v{x}_{\mathrm{{,}}}=$ EXINIT can only be used  

Defines the initial values sets for Eulerian regions.The Eulerian regions are defined by geometric shapes. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>TICREG</td><td>TRID</td><td>TSID</td><td>TYPE</td><td>VID</td><td>MID</td><td>TSID</td><td>LEVEL</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TICREG</td><td>300</td><td>200</td><td>SPHERE</td><td>400</td><td>100</td><td>3</td><td>4.0</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer Meaning</td><td colspan="2"></td></tr><tr><td>TRID</td><td colspan="2">Unique TRID number. (Integer > 0; Required)</td></tr><tr><td>TSID</td><td colspan="2">ID of group of Euler regions referenced from the TICEUL1 entry. (Integer > O; Required)</td></tr><tr><td>TYPE</td><td colspan="2"> The type of Eulerian region. (Character; Required)</td></tr><tr><td rowspan="7">VID</td><td>SURF</td><td>Region inside or outside a surface.</td></tr><tr><td>SPHERE</td><td>Region inside a sphere.</td></tr><tr><td>CYLINDER</td><td>Region inside a cylinder.</td></tr><tr><td>BOX</td><td>Region inside a box.</td></tr><tr><td>ELEM</td><td> Region defined by list of Euler elements.</td></tr><tr><td> ID of a geometric entity. (Integer > 0; Required)</td><td></td></tr><tr><td colspan="2"></td></tr><tr><td rowspan="6"></td><td>Type:</td><td>Region:</td></tr><tr><td>SURF SPHERE</td><td>SURFINI</td></tr><tr><td></td><td>SPHERE</td></tr><tr><td>CYLINDER</td><td>CYLINDR</td></tr><tr><td>BOX ELEM</td><td>BCBOX</td></tr><tr><td></td><td>SET1</td></tr><tr><td>MID TSID</td><td colspan="2">ID of a MATDEUL entry defining this material. (Integer ≥ 0; Default = 0)</td></tr><tr><td></td><td colspan="2">ID of a TICVAL entry containing a list of initial values for this material. (Integer ≥ 0; Default = 0)</td></tr><tr><td>LEVEL</td><td colspan="2">Level indicator for this material and initial values. (Real; Default = 0.0)</td></tr></table></body></html>  

## Remarks:  

1. A number of TICREG may exist in the input file with the same TSID.The TICEUl entry will combine all TICREGs with the same TSID into one initial definition for the Euler elements that are referenced from the same PEULER1 definition.   
2.When the material number is left blank or zero, the Eulerian elements inside the region willbe void. Note that this is not allowed in the Riemann solution-based Euler solvers, as they willnot handle void elements.Ifyou define void elements and select either the lstOrder or 2ndOrder scheme, an error message will be issued and the analysis will stop.   
3. All level indicators LEVEL of the same TSID group must have different values. The level indicato can be negative.   
4. See also the parameter MICRO for the accuracy of the initial value generation.  

Defines the initial values of an Eulerian geometric region. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>TICVAL</td><td>TSID</td><td>METHOD</td><td>NAME1</td><td>VALUE1</td><td>NAME2 VALUE2</td><td>NAME3</td><td>VALUE3</td><td></td></tr><tr><td></td><td>NAMEi</td><td>VALUEi</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TICVAL</td><td>3</td><td></td><td>DENSITY</td><td>100.</td><td>YVEL</td><td>25.</td><td>SIE</td><td>3.7</td><td></td></tr><tr><td></td><td>XVEL</td><td>3.5</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TSID</td><td>Unique TICVAL number referenced from a TICEUL entry. (Integer > 0; Required)</td></tr><tr><td rowspan="3">METHOD</td><td>Type of input definition. (Character; Default = NORMAL)</td></tr><tr><td>RADIAL Initializes material with radial profiles. The entries VALUEi are interpreted as TABLED1 IDs. See Remarks 2.,3., and 4.</td></tr><tr><td>NORMALNormal initialization.</td></tr><tr><td>NAMEi</td><td>Variable to be initialized. See TICEL, 3251. (Character; Required)</td></tr><tr><td>VALUEi</td><td>Value of the variable. (Real; Required)</td></tr></table></body></html>  

Remarks:  

1. Element variables for Eulerian elements can be initialized with a TICEL or a TICEULl entry. The TICEL entry initializes a set of elements, while the TICEULl entry initializes either aset of elements or geometrical regions (sphere, cylinder, ..). When an Euler element is part of both a TICEL and a TICEULl entry, the TICEL entry takes precedence and overrules the TICEULl initialization for the element.   
2.METHOD $\mathbf{\Sigma}=\mathbf{\Sigma}$ RADIAL allows to map results of a spherical symmetric 1-D solution onto a full 3-D model. For initialized variables SIE and DENSITY,a 1-D table has to be defined that specifies the variable value for a number of distances from the center.The center is by default (0,0,0) but can be changed by setting X-CENTER, Y-CENTER, Z-CENTER. The velocity is a radial velocity and has to be specified as R-VEL. Its values is also a TABLED1 ID.   
3. DYPARAM,SPHERSYM can be used to define a proper 1-D spherical mesh and speeds up the run by taking only the mesh-size in radial direction into account.  

4. Radial initialization of JWL is supported. The entries DETSPH and the JWL entry from the 1-D spherical solution stage have to be included in the remap run.Alternatively, the l-D solution may be run with JWL and the follow-up run with ideal gas, provided that allJWL material has fully ignited. Radial initialization of EOSIG is not supported. In the follow-up run, ideal gas material has to be used instead of IG material.  

Allows for the definition of a velocity field of grid points consisting of a rotation and a translation specification. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>８</td><td>9</td><td>10</td></tr><tr><td>TIC3</td><td>SID</td><td>G</td><td></td><td>SCALE</td><td></td><td></td><td></td><td></td><td>+</td></tr><tr><td>+</td><td>XVEL</td><td>YVEL</td><td>ZVEL</td><td>XROT</td><td>YROT</td><td>ZROT</td><td></td><td></td><td>+</td></tr><tr><td>+</td><td>G1</td><td>G2</td><td>THRU</td><td>G3</td><td>BY</td><td>G4</td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TIC3 +</td><td>7 100.0</td><td>5</td><td>10. 5.0</td><td>-7.5</td><td></td><td></td><td>+ +</td></tr><tr><td>+</td><td>1</td><td>2 THRY</td><td>1000 BY</td><td>23</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Number of a set of loads. (Integer > O; Required)</td></tr><tr><td>G</td><td>Number of a grid point at the center of rotation. (Integer > O; Required)</td></tr><tr><td>SCALE</td><td>Scale factor of initial velocity. (Real, Default=1.0)</td></tr><tr><td>XVEL,YVEL, ZVEL</td><td>Initial translational velocity components. (Real; Default = 0.0)</td></tr><tr><td>XROT,YROT, ZROT</td><td>Initial rotational velocity components. (Real; Default = 0.0)</td></tr><tr><td>G1, G2,...</td><td>Grid points to be initialized. THRU indicates a range of grid points. BY is the increment to be used within this range. (Integer > O; Required)</td></tr></table></body></html>  

Remarks:  

1. Any number of TIC3 entries can be used.   
2. The rotational velocity components are defined in radians per unit time.   
3.For six degree of freedom grid points,the angular velocity components are also initialized.   
4. Initial conditions for grid points that are not specified on TICn entries are assumed to be zero.   
5.If the THRU specification is used, the grid points in the range definition are required to exist. The BY option enables grid points to be ignored in this range.   
6.None of the fields in thelistofgrid points can be blank or zero,since this indicatestheend of the list   
7. The initial conditions to be used in SOL 700 must be selected in the Case Control Section $\mathrm{(IC=}$ SID).  

8.If grid points are part of a rigid body, it is recommended you enable double precision in SOL700. It is possible that a single precision SOL70O analysis will not assign the correct initial velocities.  

## TIM2PSD  

Fast Fourier Transformation (FFT) conversion tool for use in SOL 108 or SOL 11l random vibration fatigue analysis.This entry is used to convert time history data into power spectral density (PSD)functions directly input to the fatigue analysis.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TIM2PSD</td><td>ID</td><td>SRATE</td><td>WINDOW</td><td>FORMAT</td><td>MEANS</td><td>NSKIP</td><td></td><td></td><td></td></tr><tr><td></td><td>“EVENT"</td><td>EVNTID1</td><td></td><td></td><td></td><td></td><td>T1</td><td>81</td><td></td></tr><tr><td></td><td></td><td>EVNTID2</td><td></td><td></td><td></td><td></td><td>T2</td><td>82</td><td></td></tr><tr><td></td><td></td><td>…</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>EVNTIDn</td><td></td><td></td><td></td><td></td><td>Tn</td><td>Sn</td><td></td></tr><tr><td></td><td>“DELETE”</td><td>EVNTID1</td><td>Ti1_1</td><td>Tf1_1</td><td>Ti2_1</td><td>Tf2_1</td><td>Ti3_1</td><td>Tf3_1</td><td></td></tr><tr><td></td><td></td><td>EVNTID2</td><td>Ti1_2</td><td>Tf1_2</td><td>Ti2_2</td><td>Tf2_2</td><td>Ti3_2</td><td>Tf3_2</td><td></td></tr><tr><td></td><td></td><td>… EVNTIDn</td><td>Til_n</td><td>Tf1_n</td><td>Ti2_n</td><td>Tf2_n</td><td>Ti3_n</td><td>Tf3_n</td><td></td></tr><tr><td></td><td>“MAP”</td><td>LCID1</td><td>CHAN1</td><td>LCID2</td><td>CHAN2</td><td>LCID3</td><td>CHAN3</td><td></td><td></td></tr><tr><td></td><td></td><td>LCID4</td><td>CHAN4</td><td>…</td><td>-etc.-</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TIM2PSD</td><td>42</td><td>512.0</td><td>HANNIN G</td><td>CSV</td><td>YES</td><td>1</td><td></td><td></td></tr><tr><td></td><td>EVENT</td><td>80001</td><td></td><td></td><td></td><td></td><td>2.0</td><td>1.0</td></tr><tr><td></td><td></td><td>80002</td><td></td><td></td><td></td><td></td><td>1.0</td><td>0.5</td></tr><tr><td></td><td></td><td>80003</td><td></td><td></td><td></td><td></td><td>2.0</td><td>1.0</td></tr><tr><td></td><td>DELETE</td><td>80001</td><td>1.1</td><td>1.9</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>MAP</td><td>1</td><td>3</td><td>2</td><td>5</td><td>3</td><td>7</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Unique identification number referenced by FATIGUE case control, otherwise TIM2PSD entry is ignored (Integer > 0).</td></tr><tr><td>SRATE</td><td>Number of samples per second (required) - thus dt = 1/SRATE (Real; No Default).</td></tr><tr><td>WINDOW</td><td>Window function to use. Choices are HANNING or NONE. This is applied to the "block" of data extracted from the total time signal. (Character; Default = HANNING).</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>FORMAT</td><td>Format of time signal files (RPC or CSV) (Character; Default = CSV). RPC files are binary channel data usually with the .rsp file extension. CSV files are typical MS Excel comma separated files in which the channels are in the columns (i.e. three columns of data is three channels of data - y-values only. x-values assumed to be in ascending order with no regards to length of time between points).</td></tr><tr><td>MEANS</td><td>Used to decide if overall signal mean values are to be calculated (YES or NO) (Character; Default = NO). Currently this is only calculated and not applied in the</td></tr><tr><td>NSKIP</td><td>analysis. Ignored if no mean stress correction specified on FTGPARM entry. Number of header lines to skip if an FORMAT=CSV file (Integer>=0; Default=0).</td></tr><tr><td></td><td>The next continuation lines are required and repeat for as many Events as necessary.</td></tr><tr><td>EVENT</td><td>Flag indicating that event parameters are to follow (one optional set for each event).</td></tr><tr><td></td><td>EVNTIDi Number of this Event - must correspond to the TID of a FTGLOAD entry of TYPE=PSD that is referenced by an active FTGEVNT entry. (Note: it is NOT the</td></tr><tr><td></td><td>actual FTGEVNT ID). Ti Length of window function in time for this Event (Real>0.0; no Default).</td></tr><tr><td></td><td> SiOverlap or gap in time between windows for this Event (real) (+ means overlap)</td></tr></table></body></html>  

The next continuation lines are optional and can repeat for as many Events as necessary.  

DELETE Flag indicating that event parameters are to follow for signal deletion. For any Event, time value pairs can be specified for deleting up to three (3) portions of thetime signal for each Event. EVNTIDi Number ofthis Event - correspond to a previously defined EVNTIDi in the“EVENT" section above. Ti_i Used to specify sections in an Event (defined by pairs of time values tl-t2, t3-t4, t5-t6) Tf_i to delete from Event files before FFT process is applied (Real>0; $\scriptstyle{\mathrm{t}}1<={\mathrm{t}}2<={\mathrm{t}}3<{\mathrm{t}}=4<=\dots$ .。 no Defaults; if none are specified, entire signal is used). Only three (3) delete pairs per event are currently supported.  

The next continuation lines are optional and only necessary if the SUBCASEs corresponding to the channel data is not one-to-one.  

Flag used to map the channel data and load case (SUBCASE) IDs.  

LCIDi SUBCASE oftransfer function (TF) corresponding to ith load event. SUBCASEs must be in ascending order in the Case Control! There cannot be more SUBCASEs listed than there are channels of data in the CSV/RPC files.  

CHANi Channel # corresponding to ith load event. Channels must be referenced in ascending order and cannot be repeated.  

Remarks:  

1. TIM2PSD bulk data entries are ignored if not selected by a FATIGUE case control.  

2. The actual RPC/CSV files are specified with a UDNAME entry referenced by TID field on the FTGLOAD entry for each Event (FTGEVNT). This is a requirement in the presence ofa TIM2PSD entry.   
3.All events must be in the same format, use the same window function,have the same sample rate, and have the same number and order of channels.   
4.Each event can be a different length and can have a different block length and gap.   
5．IfLOGLVL $_{,=1}$ or 2 on the FTGPARM entry, the input time histories and direct PSD computations are written to CSV files for possible plotting with MS Excel.   
6. The TID on the FTGLOAD is also used as the SID of the auto-generated RANDPS entries in this process.   
7. A file containing the auto-generated RANDPS and TABRNDl entries is created in the same directory as the referenced UDNAME filename. This file can then be used as an include file for subsequent analyses that use the same generated PSD data rather than using the TIM2PSD entry again in subsequent runs.   
8.This process also determines the overall mean values of the time histories for each event. The means are normally thrown away in conversion to PSDs and cross-PSDs. Currently the mean efect is not taken into account in the subsequent fatigue analysis.These means are appended to the end of the file containing the auto-generated RANDPS and TABRND1 entries.   
9.MAP flag is not necessary if all channels in RPC/CSVfile are used in the exact same order as the SUBCASEs corresponding to the transfer functions. SUBCASE IDs must be in ascending order. Channels must be referenced in ascending order.  

Defines a time-dependent dynamic load or enforced motion of the form  

$$
\{P(t)\}~=~\{A\}\cdot F(t-\uptau)
$$  

for use in transient response analysis.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TLOAD1</td><td>SID</td><td>EXCITEID</td><td>DELAYI/ DELAYR</td><td>TYPE</td><td>TID/F</td><td>USO</td><td>VSO</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TLOAD1</td><td>5</td><td>7</td><td>15</td><td>LOAD</td><td>13</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Set identification number. (Integer > O) See Remarks 1. and 5.</td></tr><tr><td>EXCITEID</td><td>Identification number of a static load set or a DAREA or SPCD entry set or a thermal load set (in heat transfer analysis) that defines {A} . See Remarks 2. and 3. (Integer > 0)</td></tr><tr><td>DELAYI</td><td>Identification number of DELAY Bulk Data entry that defines time delay t . See Remark 8.and 13. (Integer > 0 or blank)</td></tr><tr><td>DELAYR</td><td>Value of time delay t that will be used for all degrees-of-freedom that are excited by this dynamic load entry. See Remark 8. and 13. (Real or blank)</td></tr><tr><td>TYPE</td><td>Defines the type of the dynamic excitation. See Remarks 2., 3.and 12. (Integer, character or blank; Default = 0)</td></tr><tr><td>TID/F</td><td>Identification number of TABLEDi entry that gives F(t). (Integer > O). Value of F to be used for all times. (Real, non-zero)</td></tr><tr><td>US0</td><td>Factor for initial displacements of the enforced degrees-of-freedom. See Remarks 9., 11. and 14. (Real; Default = 0.0)</td></tr><tr><td>VS0</td><td>Factor for initial velocities of the enforced degrees-of-freedom. See Remarks 10., 11. and 14. (Real; Default = 0.0)</td></tr></table></body></html>  

Remarks:  

1. Dynamic excitation sets must be selected with the Case Control command $\mathrm{DLOAD}=\mathrm{SID}$ .  

The type of the dynamic excitation is specified by TYPE (field 5)according to the folowing table:  

<html><body><table><tr><td>TYPE</td><td>TYPE of Dynamic Excitation</td></tr><tr><td>0, L, LO, LOA or LOAD</td><td>Applied load (force or moment) (Default)</td></tr><tr><td>1, D, DI, DIS, or DISP</td><td>Enforced displacement using large mass or SPC/SPCD data</td></tr><tr><td>2, V, VE,VEL or VELO</td><td>Enforced velocity using large mass or SPC/SPCD data.</td></tr><tr><td>3,A, AC, ACC or ACCE</td><td>Enforced acceleration using large mass or SPC/SPCD data</td></tr><tr><td>4</td><td>FLOW boundary condition on the face of an Eulerian solid element (SOL 700 only).</td></tr><tr><td>12</td><td>Velocity of the center of gravity of a rigid body (SOL 700 only)</td></tr><tr><td>13</td><td>Force or moment on the center of gravity of a rigid body (SOL 700 only).</td></tr></table></body></html>

For enforced displacement, velocity and acceleration, the large mass method is not supported in SOL 400.  

The enforced motion options (SPC/SPCD) defined by TYPE $\bullet{\dot{}$ 1, 2, 3 are currently used for SOLs 109, 112, 146, 200, and where applicable SOL 400.  

3. TYPE (field 5) also determines the manner in which EXCITEID (field 3) is used by the program as described below  

Excitation specified by TYPE is applied load  

There is no LOADSET request in Case Control EXCITEID may reference DAREA, static and thermal load set entries   
There is a LOADSET request in Case Control The program may reference DAREA entries as well as static and thermal load set entries specifiec by the LID and TID fields, respectively, in the selected LSEQ entry corresponding to EXCITEID.  

Excitation specified by TYPE is enforced motion  

There is no LOADSET request in Case Control  

EXCITEID will reference SPCD entries. If such entries indicate null enforced motion, the program will then assume that the excitation is enforced motion using large mass and will reference DAREA and static and thermal load set entries just as in the case of applied load excitation.  

There is a LOADSET request in Case Control The program will reference SPCD entries specified by the LID field in the selected LSEQ entry corresponding to EXCITEID. If such entries indicate null enforced motion, the program wil then assume that the excitation is enforced motion using large mass and will reference static and thermalload set entries specified by the LID and TID fields, respectively, in the selected LSEQ entry corresponding to EXCITEID, just as in the case of applied load excitation.  

4. EXCITEID may reference sets containing QHBDY, QBDYi, QVECT, QVOL and TEMPBC entries when using the heat transfer option.   
5. SID need not be unique for all ACSRCE, RLOAD1, RLOAD2, TLOAD1 and TLOAD2 dynamic load entries. The DLOAD $\mathbf{\Sigma}=\mathbf{\Sigma}$ SID Case Control command will select all dynamic load entries with the set identification of SID.   
6. If the heat transfer option is used, the referenced QVECT entry may also contain references to functions of time, and therefore A may be a function of time.   
7. If TLOADi entries are selected in SOL 11l or 146 then a Fourier analysis is used to transform the time-dependent loads on the TLOADi entries to the frequency domain and then combine them with loads from RLOADi entries. Then the analysis is performed as a frequency response analysis but the solution and the output are converted to and printed in the time domain. Please refer to Fourier Transform (Ch. 20) in the MSC Nastran Dynamic Analysis User's Guide.   
8. If the DELAYI/DELAYR field is blank or zero, t will be zero.   
9. The USO field is used only when the dynamic excitation defined by the TYPE field is enforced velocity or enforced acceleration using SPC/SPCD specification. The initial displacements for the enforced degrees-of-freedom in this case are given by the product $\{A\}({\mathrm{US0}})$ where $\{A\}$ is defined by the EXCITEID field.   
10. The VSO field is used only when the dynamic excitation defined by the TYPE field is enforced acceleration using SPC/SPCD specification.The initial velocities for the enforced degrees-of-freedom in this case are given by the product $\{A\}({\mathrm{VS0}})$ where $\{A\}$ is defined by the EXCITEID field.   
11. The initial conditions for the enforced degrees-of-freedom implied by the USO and VSO fields are distinct from, and may be used in conjunction with, the initial conditions for the independent degrees-of-freedom specified by a TIC Bulk Data entry (which, in turn, is selected by an IC Case Control command).   
12．For TYPE $\scriptstyle,=$ 4, TID must be blank if it references a FLOW entry. Use the FLOWT entry to define a time dependent flow boundary on the face of an Eulerian element.   
13. For RC network solver in thermal analysis, the DELAY1/DELAYR is ignored.   
14. Fields USO and VSO are not supported in SOL 700.   
15. DELAYI/DELAYR (Integer ${>}0$ or Real) is not supported for the follower force in SOL129 and SOL400. The corresponding loads are neglected in the analysis.   
16. If Modules are present then this entry may only be specified in the main Bulk Data section.  

Defines a time-dependent dynamic excitation or enforced motion of the form  

$$
\{P(t)\}=\left\{\begin{array}{l c l}{{0}}&{{,}}&{{t<(\mathrm{T1+\uptau})\mathrm{or}\up t>(\mathrm{T2+\uptau})}}\\ {{\{A\}\tilde{t}^{B}e^{C\tilde{t}}c o s(2\uppi F\tilde{t}+P)}}&{{,}}&{{(\mathrm{T1+\uptau})\leq t\leq(\mathrm{T2+\uptau})}}\end{array}\right.
$$  

for use in a transient response problem, where $\tilde{\boldsymbol{t}}=\boldsymbol{t}-\boldsymbol{\mathrm{T}}\boldsymbol{1}-\boldsymbol{\uptau}$  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TLOAD2</td><td>SID</td><td>EXCITEID</td><td>DELAYI/ DELAYR</td><td>TYPE</td><td>T1</td><td>T2</td><td>F</td><td>P</td><td></td></tr><tr><td></td><td>C</td><td>B</td><td>USO</td><td>VS0</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TLOAD2 4</td><td>10</td><td>5.0</td><td>2.1</td><td>4.7 12.0</td><td></td></tr><tr><td>2.0</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>SID</td><td>Set identification number. See Remarks 1. and 6. (Integer > 0)</td></tr><tr><td>EXCITEID</td><td>Identification number of a static load set or a DAREA or SPCD entry set or a thermal load set (in heat transfer analysis) that defines {A). See Remarks 2. and 3. (Integer > 0)</td></tr><tr><td>DELAYI</td><td>Identification number of DELAY Bulk Data entry that defines time delay t . See Remark 5. (Integer > O or blank)</td></tr><tr><td>DELAYR</td><td>Value of time delay t that will be used for all degrees-of-freedom that are excited by this dynamic load entry. See Remark 5. (Real or blank)</td></tr><tr><td>TYPE</td><td>Defines the type of the dynamic excitation. See Remarks 2. and 3. (Integer; character or blank; Default = 0)</td></tr><tr><td>T1</td><td>Time constant. (Real ≥ 0.0)</td></tr><tr><td>T2</td><td>Time constant. (Real; T2 > T1)</td></tr><tr><td>F</td><td>Frequency in cycles per unit time. (Real ≥ 0.0; Default = 0.0)</td></tr><tr><td>P</td><td>Phase angle in degrees. (Real; Default = 0.0)</td></tr><tr><td>C</td><td>Exponential coefficient. (Real; Default = 0.0)</td></tr><tr><td>B</td><td>Growth coefficient. (Real; Default = 0.0)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>USO</td><td>Factor for initial displacements of the enforced degrees-of-freedom. See Remarks 9., 11. and 16. (Real; Default = 0.0)</td></tr><tr><td>VSO</td><td>Factor for initial velocities of the enforced degrees-of-freedom. See Remarks 10., 11. and 16.(Real; Default = 0.0)</td></tr></table></body></html>  

Remarks:  

Dynamic excitation sets must be selected with the Case Control command with DLOAD $\mid=$ SID. 2. The type of the dynamic excitation is specified by TYPE (field 5)according to the folowing table  

<html><body><table><tr><td>TYPE</td><td>TYPE of Dynamic Excitation</td></tr><tr><td>0, L, LO, LOA or LOAD</td><td>Applied load (force or moment) (Default)</td></tr><tr><td>1, D, DI, DIS, or DISP</td><td>Enforced displacement using large mass or SPC/SPCD data</td></tr><tr><td>2,V,VE,VEL or VELO</td><td>Enforced velocity using large mass or SPC/SPCD data</td></tr><tr><td>3,A,AC,ACC or ACCE</td><td> Enforced acceleration using large mass or SPC/SPCD data</td></tr><tr><td>12</td><td>Velocity of the center of gravity of a rigid body. (SOL 700 only)</td></tr><tr><td>13</td><td>Force or moment on the center of gravity of a rigid body. (SOL 700 only)</td></tr><tr><td colspan="2">For enforced displacement, velocity and acceleration, the large mass method is not supported in SOL 400.</td></tr></table></body></html>  

The enforced motion options (SPC/SPCD) defined by TYPE $\v{x}_{1}=$ 1,2, 3 are currently used for SOLs 109,112, 146, 200, and where applicable SOL 400.  

3. TYPE (field 5)also determines the manner in which EXCITEID (field 3) is used by the program as described below  

Excitation specified by TYPE is applied load  

There is no LOADSET request in Case Control EXCITEID may reference DAREA, static and thermal load set entries   
There is a LOADSET request in Case Control The program may reference DAREA entries as wellas static and thermal load set entries specified by the LID or TID fields, respectively, in the selected LSEQ entry corresponding to EXCITEID.  

Excitation specified by TYPE is enforced motion  

There is no LOADSET request in Case Control EXCITEID will reference SPCD entries. If such entries indicate null enforced motion, the   
program willthen assume that the excitation is enforced motion using large mass and will reference DAREA and static and thermal load set entries just as in the case of applied load excitation.  

There is a LOADSET request in Case Control  

The program will reference SPCD entries specified by the LID field in the selected LSEQ entry corresponding to EXCITEID. If such entries indicate null enforced motion, the program wil then assume that the excitation is enforced motion using large mass and will reference static and thermalload set entries specified by the LID and TID fields, respectively,in the selected LSEQ entry corresponding to EXCITEID, just as in the case of applied load excitation.  

4. EXCITEID (field 3) may reference sets containing QHBDY, QBDYi, QVECT, and QVOL and TEMPBC entries when using the heat transfer option.   
5. If the DELAYI/DELAYR field is blank or zero,t will be zero.   
6. SID need not be unique for all ACSRCE, RLOAD1, RLOAD2, TLOAD1 and TLOAD2 dynamic load entries. The DLOAD $\mathbf{\Sigma}=\mathbf{\Sigma}$ SID Case Control command will select all dynamic load entries with the set identification of SID.   
7. If the heat transfer option is used, the referenced QVECT entry may also contain references to functions of time, and therefore A may be a function of time.   
8.If TLOADi entries are selected in SOL 1ll or 146 then a Fourier analysis is used to transform the time-dependent loads on the TLOADi entries to the frequency domain and them combine them with loads from RLOADi entries. Then the analysis is performed as a frequency response analysis but the solution and the output are converted to and printed in the time domain. In this case, B will be rounded to the nearest integer.Please refer to Fourier Transform (Ch. 20) in the MSC Nastran Dynamic Analysis User's Guide.   
9. The USO field is used only when the dynamic excitation defined by the TYPE field is enforced velocity or enforced acceleration using SPC/SPCD specification. The initial displacements for the enforced degrees-of-freedom in this case are given by the product $\{A\}({\mathrm{US0}})$ where $\{A\}$ is defined by the EXCITEID field.   
10. The VSO field is used only when the dynamic excitation defined by the TYPE field is enforced acceleration using SPC/SPCD specification.The initial velocities for the enforced degrees-of-freedom in this case are given by the product $\{A\}({\mathrm{VS0}})$ where $\{A\}$ is defined by the EXCITEID field.   
11. The initial conditions for the enforced degrees-of-freedom implied by the USO and VSO fields are distinct from, and may be used in conjunction with, the initial conditions for the independent degrees-of-freedom specified bya TIC Bulk Data entry (which, in turn, is selected by an IC Case Control command).   
12. The continuation entry is optional.   
13.TYPE $\scriptstyle-4$ (SOL 700) is not supported using TLOAD2.   
14. For SOL 700, TLOAD2 is converted to TLOAD1 and a TABLED1 is generated internally.   
15. RC network solver does not support TLOAD2 for thermal analysis.   
16. Fields USO and VSO are not supported in SOL 700.   
17. DELAYI/DELAYR (Integer ${\mathrm{>}}0$ or Real) is not supported for the follower force in SOL129 and  

SOL400. The corresponding loads are neglected in the analysis.  

18.If comparing results between pre-2005 versions andlater versions,please note that results are shifted by one time step in later versions.The tload2 should be updated accordingly if there is a need to compare to these pre-2005 versions.   
19. If Modules are present then this entry may only be specified in the main Bulk Data section.  

Define a time-dependent dynamic thermalload group for use in TTEMP Bulk Data entry in SOL 400.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TMPSET</td><td>ID</td><td>G1</td><td>G2</td><td>G3</td><td>G4</td><td>G5</td><td>G6</td><td>G7</td><td></td></tr></table></body></html>  

Alternate Format:  

<html><body><table><tr><td>TMPSET</td><td>ID</td><td>G1</td><td>“THRU”</td><td>G2</td><td>“BY"</td><td>INC</td></tr></table></body></html>  

The Continuation Entry formats may be used more than once and in any order. They may also be used with sither format above.  

Continuation Entry Format 1:  

<html><body><table><tr><td></td><td>G8</td><td>G9</td><td>G10</td><td>G11</td><td>-etc.-</td><td></td><td></td></tr></table></body></html>  

Continuation Entry Format 2:  

Example:   


<html><body><table><tr><td>G8</td><td>“THRU”</td><td>G9</td><td>“BY”</td><td>INC</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>TMPSET</td><td>15</td><td>5</td><td>THRU</td><td>21 33</td><td>BY</td><td>4</td><td></td><td></td><td></td></tr><tr><td></td><td>27 35</td><td>30 THRU</td><td>32 44</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>67</td><td>68</td><td>72</td><td>75</td><td>84</td><td>93</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning </td></tr><tr><td>ID</td><td>Temperature group identification number. (Integer > 0)</td></tr><tr><td>Gi</td><td>Grid point Identification numbers in the group. (Integer > 0)</td></tr></table></body></html>  

## Remarks:  

1. This entry is used in SOL 400 only when ANALYSIS $\dot{\bf\Phi}=\dot{\bf\Phi}$ NLTRAN (nonlinear transient analysis) and the temperature load is applied. It only applies to the nonlinear elements in the Residual ${\mathrm{(SEID{=}0}},$ ，   
2. GROUP_ID determines the group of a specified the time-dependent distribution of temperatures. It is used by the TTEMP Bulk Data entry to define the corresponding TABLEDi entry. GROUP_ID must be unique for all of the other TMPSET entries.   
3. The temperature of grid point Gi must be defined using TEMP, TEMPD, TEMPPl, or TEMPRB Bulk Data entry.These bulk data entries must have the same SID as that referenced on the associated TTEMP Bulk Data entry. Allbulk data entries between TODYNA and ENDDYNA willbe passed directly from SOL 70O to Dytran.   
Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TODYNA</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TODYNA</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>MAT1</td><td>345 29.0E6</td><td>0.285</td><td>0.0004</td><td></td><td></td></tr><tr><td>ENDDYN</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Defines a design region for topometry optimization (element-by-element optimization).  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TOMVAR</td><td>ID</td><td>TYPE</td><td>PID</td><td>PNAME/FID</td><td>XINIT</td><td>XLB</td><td>XUB</td><td>DELXV</td><td></td></tr><tr><td></td><td>“DLINK”</td><td>TID</td><td>C0</td><td>C1</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“DDVAL”</td><td>DSVID</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“STRESS”</td><td>STLIM</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:  

Design all element's thickness referencing PSHELL ID $=5$ with initial design $\mathit{\Theta}=\ 10.0$ ${\mathit{i}}_{0}~=~10.0$ input element thickness, lower b $0.5\cdot t_{0}$ and upper bound $1.5\cdot t_{0}$ ，  

<html><body><table><tr><td>TOMVAR</td><td>1</td><td>PS1</td><td>PSHELL 5</td><td>T</td><td>10.0</td><td></td><td></td><td></td></tr><tr><td></td><td>STRESS</td><td>5.0</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:  

Design all element's Young Modulus referred by PSHELL ID $=100$ with initial design $\mathrm{XINIT}=3.\mathrm{E}{+}5$ 。 $\mathrm{XLB}{=}1.0$ and ${\mathrm{XUB}}=1.0\mathrm{E}+6.$  

<html><body><table><tr><td>TOMVAR</td><td>10</td><td>PSHELL</td><td>100</td><td>E</td><td>3.E+5</td><td>1.0</td><td>1.E+6</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Unique topometry design region identification number. (Integer > 0)</td></tr><tr><td>TYPE</td><td>Property entry type. Used with PID to identify the elements to be designed. See Remark 2.(Character:“PBAR",“PSHELL"，‘PSOLID",and “PCOMP",etc.)</td></tr><tr><td>PID</td><td>Property entry identifier (Integer > O). This PID must be unique for PIDs referenced by other TOPVAR,DVPREL1, DVPREL2, DVMREL1, and DVMREL2 entries. Topometry, topology, and sizing variables cannot share the same properties. (Integer > 0). Combined topometry, topology, topography, sizing, and shape variables are allowed.</td></tr><tr><td>PNAME/FID</td><td>Property name or property material name, such as “T",“A",“E", and “GE", or field position of the property entry or word position in the element property table of the analysis model. Property names that begin with an integer such as 12I/T**3 may only be referenced by field position. Only one property value for each property can be designed by TOMVAR in a job. See Remark 2. (Character or Integer > 0.)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>XINIT</td><td>Initial value. (Real or blank, no Default). Typically, XINIT is defined to match the mass target constraint (so the initial design does not have violated constraints) or the analysis model input property value.</td></tr><tr><td>XLB</td><td>Lower bound. (Real or blank; Default = blank) . The default is XLB=O.5*XINIT.</td></tr><tr><td>XUB</td><td>Upper bound . (Real or blank; Default = blank). The default is XLB=1.5*XINIT.</td></tr><tr><td>DELXV</td><td>Fractional change allowed for the design variable during approximate optimization. See Remark 6. (Real > 0.0; Default = 0.5)</td></tr><tr><td>“DLINK"</td><td>Indicates that this line relates a ply thickness to another ply thickness. See Remark 10.</td></tr><tr><td>TID</td><td>TOMVAR entry identifier. (Integer > 0)</td></tr><tr><td>C0</td><td>Constant term. (Real; Default = 0.0)</td></tr><tr><td>C1</td><td>Coefficient term. (Real; no Default)</td></tr><tr><td>“DDVAL”</td><td>Indicates that this line defines discrete TOMVAR variables.</td></tr><tr><td>DSVID</td><td>DDVAL entry identifier. (Integer > 0)</td></tr><tr><td>“STRESS"</td><td>Indicates that this line defines a stress limit.</td></tr><tr><td>STLIM</td><td>Von Mises stress upper bound. See Remark 11. (Real >0.0)</td></tr></table></body></html>  

## Remarks:  

1. Multiple TOMVAR's are allowed in a single file.   
2. Property name and $\mathrm{FID}>0$ can be used for element property values just like the DVPREL1 Bulk Data entry. Only property name can be used for material property values like DVMREL1.   
3. Property name $^{\mathfrak{a}}\mathrm{A}^{\mathfrak{n}}$ is shared by material and property entries. If"A" is used for PNAME, it is a Material. For PROD, PBEAM and PBAR, the integer field ID must be used to point to the area of these entries. TOMVAR supports MAT1 only.   
4. PBARL, PBEAML, PBRSECT and PBMSECT are not supported.   
5．For TYPE $\mathbf{\Sigma}=\mathbf{\Sigma}$ PSHELL and PNAME selecting a material property, allthe MATi fields on the PSHELL must be the same.   
6.Combined topometry, topography, topology, sizing, and shape optimization is supported in a single file. However, topometry and topology cannot reference the same property ID. It is possible to topometry certain elements while sizing others. It is allowed to simultaneously design the same elements with topometry and desvar (sizing and/or shape) variables but topometry and sizing cannot reference the same property name.   
7. Topometry optimization with element response constraints is slow due to many design variables. In this case, fully stressed design (FSD) is an alternative for certain problems   
8. Parameters DESPCH and DESPCH1 specify when the topometry optimized design values are written to the element result history file jobname.des that can be imported to Patran and other postprocessor to view topometry optimized results.   
9. The TOMVAR entry cannot be used with thermal loads.   
10. The DLINK line can only be used when TYPE $\v{r}_{\mathbf{\lambda}}=$ PCOMP. The PID must be the same as the PID given on the TOMVAR referenced by TID and the PNAMES in the two TOMVAR entries must differ   
11. “STRESS" limits can only be used for PTYPE $\begin{array}{r}{{\bf\Pi}=\frac{\bf\Pi}{\bf\Pi}}\end{array}$ PSHELLandPNAME $\c=$ T.The Von Mises stress (at element center) constraints apply to allshellelements in both designed and non-designed regions. All TOMVAR entries must have the same STLIM.  

Define a topology design region for topology optimization.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TOPVAR</td><td>ID</td><td>LABEL</td><td>PTYPE</td><td>XINIT</td><td>XLB</td><td>DELXV</td><td>POWER</td><td>PID</td><td></td></tr><tr><td></td><td>“SYM"</td><td>CID</td><td>MS1</td><td>MS2</td><td>MS3</td><td>CS</td><td>NCS</td><td></td><td></td></tr><tr><td></td><td>“CAST”</td><td>CID</td><td>DD</td><td>DIE</td><td>ALIGN</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“EXT”</td><td>CID</td><td>ED</td><td>ALIGN</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“PRINT”</td><td>CID</td><td>PD</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“TDMIN"</td><td>TVMIN</td><td>TVMAX</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“STRESS”</td><td>STLIM</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TOPVAR</td><td>1</td><td>PS1</td><td>PSHELL</td><td>5</td><td>T</td><td>10.0</td><td>4</td><td>1</td><td></td></tr><tr><td></td><td>STRESS</td><td>5.0</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Unique topology design region identification number. (Integer > 0)</td></tr><tr><td>LABEL</td><td>User-supplied name for printing purpose. (Character)</td></tr><tr><td>PTYPE</td><td>Property entry name. Used with PID to identify the elements to be designed. (Character:“PBAR",“PSHELL",‘PSOLID",etc.)</td></tr><tr><td>XINIT</td><td>Initial value. (Blank or Real, XLB < XINIT ≤ 1.0; Default = Blank). Typically, XINIT is defined to match the mass constraint on DRESPl=FRMASS, so the initial design does not have violated constraints. In this case, the default is set to the constraint value. If the mass (DRESP1=FRMASS or WEIGHT) is the objective, the default is 0.9. The default of XINIT is 0.6 for the other cases.</td></tr><tr><td>XLB</td><td>Lower bound to prevent the singularity of the stiffness matrix. (Real; Default = 0.001)</td></tr><tr><td>DELXV</td><td>Fractional change allowed for the design variable during approximate optimization. See Remark 3. (Real > 0.0; Default = 0.2)</td></tr><tr><td>POWER</td><td>A penalty factor used in the relation between topology design variables and element Young's modulus. (Real > 1.0; Default = 3.0, or 4.0 if symmetry constraints used).2.0 ≤ POWER ≤ 5.0 is recommended.</td></tr><tr><td>PID</td><td>Property entry identifier. This PID must be unique for PIDs referenced by other TOPVAR, DVPRELl and DVPREL2 entries. Topology and sizing variables</td></tr><tr><td>“SYM"</td><td>cannot share the same properties. (Integer > 0) Indicates that this line defines symmetry constraints.</td></tr></table></body></html>  

<html><body><table><tr><td> Describer</td><td> Meaning</td></tr><tr><td>CID</td><td>Rectangular coordinate system ID used for specifying manufacturing constraints. See Remark 4. (Blank or Integer > 0; Default = blank)</td></tr><tr><td>MSi</td><td> Mirror symmetry plane. See Remark 5. & 7. (Character, ‘XY','YZ', or “ZX)</td></tr><tr><td>CS</td><td>Cyclic symmetry axis. (character X, Y, Z). See Remark 12.</td></tr><tr><td>NCS</td><td>Number of cyclic symmetric segments in 360 degrees (Integer > 0). See Remark 9.</td></tr><tr><td>“CAST”</td><td>Indicates that this line defines casting constraints (i.e.,die draw direction constraints). See Remarks 6., 7., 8., and 10.</td></tr><tr><td>DD</td><td>Draw Direction. DDi=X, Y, Z or X-, Y-, Z- for a single die option (DIE=1) where X-, Y-, Z- indicates the opposite direction of X, Y, and Z respectively. DDi=X, Y, and Z for two die option (DIE =2) (Character)</td></tr><tr><td rowspan="3">DIE</td><td>Die Options. (Blank or integer 1 or 2; Default = 1)</td></tr><tr><td>= 1 (or blank). A single die will be used and the die slides in the given draw direction (i.e., material grows from the bottom in the draw direction) = 2. Two dies willbe used and the dies split apart along the draw direction (i.e.,</td></tr><tr><td>material grows from the splitting plane in opposite direction along the axis specified by the draw direction DDi. The splitting plane is determined by optimization)</td></tr><tr><td>ALIGN</td><td>Indicates whether the designed property finite element mesh is precisely aligned with the draw direction or extrusion direction. (Character: “YES” or“NO” or Blank; Default = blank = “NO") See Remark 10.</td></tr><tr><td>“EXT”</td><td>Indicates that this line defines extrusion constraints (i.e., enforce constant cross- section) See Remark 6. and 7.</td></tr><tr><td>ED</td><td>Extrusion direction. (Character, X, Y, or Z)</td></tr><tr><td>“PRINT”</td><td>Indicates that this line defines overhang constraints (maximum overhang angle is 45 degree). See Remark 12.</td></tr><tr><td>CID</td><td> Rectangular coordinate system ID used for specifying overhang constraints.</td></tr><tr><td>PD</td><td>PRINT Direction. PD =X, Y, Z or X-, Y-, and Z- where X-, Y-, Z- indicates the opposite direction of X, Y, and Z respectively (Character).</td></tr><tr><td>“TDMIN"</td><td>Indicates that this line defines a minimum and/or maximum member size., See remarks 11. and 12.</td></tr><tr><td>TVMIN</td><td> Minimum member size. See Remarks 11. and 12. (Real>=0.0 or blank)</td></tr><tr><td>TVMAX</td><td>Maximum member size. See Remarks 11. and 12. (Real > TVMIN or blank)</td></tr><tr><td>“STRESS”</td><td>Indicates that this line defines a stress limit.</td></tr><tr><td>STLIM</td><td>Von Mises stress upper bound. See Remark 13.. (Real >0.0)</td></tr></table></body></html>  

## Remarks:  

1. The topologically designable element properties include PROD, PBAR, PBARL, PBEND, PBEAM, PBEAML, PSHELL, PSHEAR, PSOLID, and PWELD. Multiple TOPVAR's are allowed in a single file. Combined topology, topography (BEADVAR), topometry (TOMVAR) sizing, and shape optimization is supported in a single file. However, TOPVAR cannot be used with DVMRELl and DVMREL2 entries.   
2. All designed element properties must refer to a MATl entry or MAT9 entry (PSOLID only); therefore, a PCOMP/PCOMPG cannot be used as designed property in topology optimization. PCOMP/PCOMPG's can be used as non-designed properties in a topology optimization job.   
3. If DELXV is blank, the default is taken from the specification of DELX parameter on the DOPTPRM entry.   
4. Only CORD1R and CORD2R can be used as a referenced coordinate system to specify topology manufacturing constraints.Only one reference coordinate system CID is allowed for each TOPVAR entry.   
5. One, two or three different mirror symmetry planes can present (such as MS1 $\c=$ XY, ${\mathrm{MS}}2{\mathrm{=Y}}Z$ , and MS3=ZX).   
6. Casting ("CAST") and Extrusion (“EXT")） manufacturability constraints can be applied to PTYPE $\v=$ "PSOLID" only. Casting constraints cannot be combined with extrusion constraints for the same TOPVAR entry.   
7. Some symmetry constraint types can be combined with casting or extrusion constraints. The referenced coordinate system CID must be the same for the combined constraints. Some possible combinations are: ·For“EXT” constraints, possible combinations are (ED $\mathsf{\Pi}_{=\mathrm{X}}$ , MSi=XY, and/or ZX or $\mathrm{CS}{=}\mathrm{X},$ ， (ED=Y, MSi=YZ, and/or XY or $\mathrm{CS=Y},$ ，(ED $\scriptstyle1=Z$ , MSi=ZX, and/or YZ or $\mathrm{CS}{=}Z$ 。 For“CAST" constraints, possible combinations are ( $\mathrm{\DeltaDD=X}$ or X-, ${\mathrm{MSi{=}X Y}}$ and/or ZX or $\mathrm{CS}{=}\mathrm{X})$ ， 0 $\mathrm{\DeltaDD=Y}$ or Y-, ${\mathrm{MSi}}{=}\mathrm{Y}Z$ and/or XY or $\mathrm{CS=Y},$ ， $\mathrm{\DeltaDD=}Z$ or Z-, MSi=ZX and/or YZ or $\mathrm{CS}{=}Z,$ 。   
8. For two dies option $\mathrm{(DIE}=2)$ , the splitting plane is optimized.Fora single die $\mathrm{DIE}=1$ , the parting plane is the bottom surface of the designed part in the draw direction.   
9.The first symmetry segment starts at the X-axis when $C S=Z$ (at $Z$ -axis when $\mathrm{CS}=\mathrm{Y}$ and at the Yaxis when $\mathrm{CS}=\mathrm{X}$ . One cycle symmetry can be combined with one mirror symmetry constraint as long as the axis of cyclic symmetry is normal to the plane of mirror symmetry. For example, ${\mathrm{MSi}}={}$ YZ and $\mathrm{CS}=\mathrm{X},$ $\mathrm{MSi}=\mathrm{XZ}$ and ${\mathrm{CS}}={\mathrm{Y}}_{\mathrm{:}}$ and ${\mathrm{MSi}}={\mathrm{XY}}$ and $\mathrm{CS}=\mathrm{Z}$ . This feature can also be used for $<360$ degrees but NCS must be given in 360 degrees.   
10.It is recommended to use aligned mesh for casting property due to smaller tolerance used.   
11. Without a TDMIN continuation line, the minimum member size constraint is taken from the specification of TDMIN parameter on the DOPTPRM entry. This option is applied on 2 and $3\mathrm{D}$ elements only. Minimum member size constraints can be used with $^{\mathrm{s}}\mathrm{SYM}^{\mathrm{*}}$ ,“CAST", and“EXT" constraints.   
12. TVMIN and TVMAX are dimensional quantities.A guideline is that TVMIN be atleast three times a representative element dimension. TVMAX must be greater than TVMIN and it is recommended that it be twice as big. If TVMAX is blank, no maximum member size is imposed. It is recommended that TVMIN always be used when TVMAX is specified.   
13.“STRESS" limits can only be used for PTYPE $\v{r}_{\mathbf{\lambda}}=$ PSOLID and PSHELL referencing MAT1 only. The Von Mises stress (at element center) apply to all solid and/or shellelements in both designed and nondesigned regions. All TOPVAR entries must have the same STLIM.   
14. The TOPVAR entry cannot be used with thermal loads.   
15. For normal mode topology optimization, lower and higher mode may switch during optimization. This often occurs while maximizing or contraining the first eigenfrequency. This leads toa diverging solution. A workaround is using the mean value of a few of the lowest eigenfrequency (3-6) by DRESP2.   
16. The CASI solver is strongly recommended for solid elements topology problems for efficiency.   
17.“PRINT”(overhang constraints) can be used for PTYPE $\v{r}_{\mathbf{\overline{{\Pi}}}}=$ PSOLID only and limited to one TOPVAR entry. The result is mesh dependent. If used with minimum member size, the location of reference coordinate system may have some influence on the optimal design.  

Specifies constraints for aeroelastic trim variables.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TRIM</td><td>SID</td><td>MACH</td><td>Q</td><td>LABEL1</td><td>UX1</td><td>LABEL2</td><td>UX2</td><td>AEQR</td><td></td></tr><tr><td></td><td>LABEL3</td><td>UX3</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TRIM 1</td><td>0.9</td><td>100.</td><td>URDD3</td><td>1.0</td><td>ANGLEA</td><td>7.0</td><td>0.0</td><td></td></tr><tr><td>ELEV</td><td>0.2</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>SID</td><td>Trim set identification number. (Integer > O). See remarks 1 and 2.</td></tr><tr><td>MACH</td><td>Mach number. (Real ≥ 0.0 and ≠ 1.0)</td></tr><tr><td>Q</td><td>Dynamic pressure. (Real > 0.0)</td></tr><tr><td>LABELi</td><td>The label identifying aerodynamic trim variables defined on an AESTAT or AESURF entry. (Character)</td></tr><tr><td>UXi</td><td> The magnitude of the aerodynamic extra point degree-of-freedom. (Real)</td></tr><tr><td>AEQR</td><td>Flag to request a rigid trim analysis (Real ≥ 0.0 and ≤ 1.0; Default =1.0). A value of 0.0 provides a rigid trim analysis, see Remark 5.</td></tr></table></body></html>  

Remarks:  

1. The TRIM entry must be selected with the Case Control command TRIM $\v{x}=$ SID.   
2. The SID must be unique among all the TRIM and TRIM2 entries.   
3.The selected TRIM entry specifies the constrained values ofthe listed extra point degrees-of-freedom ("trim variables") for a particular loading condition. These variables are listed on AESTAT and/or AESURF entries.   
4.IfMACH is lessthan 1.0, then the Doublet-Lattice theory is used. IfMACH is greater than 1.0, then the ZONA51 theory is used.   
5. $\mathrm{AEQR=}0.0$ can be used to perform a rigid trim analysis (ignoring the effects of structural deformation on the loading). $\mathrm{AEQR}{=}1.0$ provides standard aeroelastic trim analysis. Intermediate values are permissible, but have no physical interpretation (they may be useful for model checkout).  

Defines the state of the aerodynamic extra points for atrim analysis.All undefined extra points willbe set to zero.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TRIM2</td><td>SID</td><td>MACH</td><td>Q</td><td></td><td></td><td></td><td>AEQR</td><td></td></tr><tr><td></td><td>LABEL1</td><td>VALUE1</td><td>LABEL2</td><td>VALUE2</td><td>-etc.-</td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TRIM2 1</td><td>0.9</td><td>100.</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>URDD3</td><td>1.0</td><td>ANGLEA</td><td>FREE</td><td>ELEV</td><td>0.2</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer </td><td>Meaning</td></tr><tr><td>SID</td><td>Trim set identification number (Integer>O). See Remarks 1. and 2.</td></tr><tr><td>MACH</td><td>Mach number. (Real ≥ 0.O and + 1.0). See Remark 5.</td></tr><tr><td>Q</td><td>Dynamic pressure. (Real > 0.0)</td></tr><tr><td>AEQR</td><td>Flag to request a rigid trim analysis (Real ≥ 0.0 and ≤ 1.0; Default = 1.0). A value of 0.0 provides a rigid trim analysis. See Remark 6.</td></tr><tr><td>LABELi</td><td>The label identifying aerodynamic trim variables defined on an AESTAT, AESURF, or AEPARM entry (Character)</td></tr><tr><td>VALUEi</td><td>The value assigned to LABELi. Either a real number that indicates the variable's fixed value or one of the following words: FREE, LINKED, or SCHED. See Remarks 3. and 4.</td></tr></table></body></html>  

Remarks:  

1. The TRIM2 entry must be selected with the Case Control command TRIM $\mathbf{\Psi}_{:}=\mathbf{\Psi}_{:}$ SID.   
2. The SID must be unique among all TRIM and TRIM2 entries.   
3.A value of FREE indicates that the controller value will be solved for by the trim process.A value of LINKED indicates that the controller value willbe set by an AELINK entry. A value of SCHED indicates that the controller value willbe set by a CSSCHD entry. The LINKED and SCHED inputs are optional and provided as a convenience to the user. Nastran will determine the linked and scheduled controller states from the AELINK and CSSCHD entries, respectively.   
4. All aerodynamic extra points that have not been defined on a TRIM2, AELINK,or CSSHED entry will be fixed to a value of zero.   
5.IfMACH is lessthan 1.0, then the Doublet-Lattice theory is used.IfMACH isgreater than 1.0, then the ZONA51 theory is used.  

6. $\mathrm{AEQR=}0.0$ can be used to perform a rigid trim analysis (ignoring the effects of structural deformation on the loading). $\mathrm{AEQR}{=}1.0$ provides standard aeroelastic trim analysis. Intermediate values are permissible, but have no physical interpretation (they may be useful for model checkout).  

Defines the interface coupling parameters for computing interface coupling matrices.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>TRMCPL</td><td>TID</td><td>CTYPE</td><td>PLTOL</td><td>GAPTOL1</td><td>GAPTOL2</td><td>GAPTOL3</td><td>GAPTOL4</td><td></td></tr></table></body></html>  

Example:  

<html><body><table><tr><td>TRMCPL</td><td>1</td><td>SGLUED</td><td>0.12</td><td>5</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TID</td><td>Identification number of trim component. (Integer>O; Required)</td></tr><tr><td>CTYPE</td><td>Interface coupling type; see Remark 2.(Character, “SGLUED”,“SSLIDE",“SOPEN", “SIMPER” or“SAIRGAP"; Required)</td></tr><tr><td>PLTOL</td><td>Relative tolerance for in-plane/in-element/normal acceptance with respect to CTYPE. (Real>0.0; Default=0.1)</td></tr><tr><td rowspan="4">GAPTOLx</td><td>GAPTOL1 Absolute tolerance for extrusion with respect to CTYPE. (Real>0.0; Default=0.01)</td></tr><tr><td>GAPTOL2 Second absolute tolerance for extrusion with respect to CTYPE. (Real>0.0; Default=GAPTOL1)</td></tr><tr><td>GAPTOL3 Third absolute tolerance for extrusion with respect to CTYPE. (Real>0.0; Default=GAPTOL2)</td></tr><tr><td>GAPTOL4 Fourth tolerance for extrusion with respect to CTYPE. (Real>0.0; Default=GAPTOL3)</td></tr></table></body></html>  

Remarks:  

1. For each interface coupling type, CTYPE, this entry is used to compute the interface matrix with incongruent meshes at the interface.   
2. For the meanings of values on CTYPE,please see Bulk Data entry,ACPEMCP for the detailed descriptions.   
3. TRMCPL is not a required entry for any trim component referenced by TRIMGRP and should be placed in the main bulk data section or under 'BEGIN BULK'.   
4.GAPTOLx is the absolute tolerance for mapping surfaces of (structure, trim components) and (trim components, cavity). Grids on surfaces that are separated further than GAPTOLx will not be considered for coupling. GAPTOLx are utilized for successive projections. GAPTOL1 will be used for first projection. Then, GAPTOL2, GAPTOL3and GAPTOL4, if provided, will be used for subsequent projections for the remaining unprojected grids. GAPTOLx is in the same unit as the one used for length.  

5. PLTOL is relative tolerance for computing volume contributions. PLTOL is in percentage.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/e3d2ddcc416260745097f86bc7a3af927146e34ee26749836697a35b67672cca.jpg)  

Defines time step intervals at which a solution will be generated and output in transient analysis.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8 9</td><td>10</td></tr><tr><td>TSTEP</td><td> SID</td><td>N1</td><td>DT1</td><td>NO1</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>N2</td><td>DT2</td><td>NO2</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TSTEP 2</td><td>10</td><td>.001</td><td>5</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>9</td><td>0.01</td><td>１</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Set identification number. (Integer > 0)</td></tr><tr><td>Ni</td><td>Number of time steps of value DTi. (Integer ≥ 1)</td></tr><tr><td>DTi</td><td>Time increment. (Real > 0.0)</td></tr><tr><td>NOi</td><td>Skip factor for output. Every NOi-th step will be saved for output. (Integer > 0; Default = 1)</td></tr></table></body></html>  

Remarks:  

1. TSTEP entries must be selected with the Case Control command $\mathrm{TSTEP}=\mathrm{SID}$   
2.Note that the entry permits changes in the size of the time step during the course of the solution. Thus, in the example shown,there are 10 time steps of value .00l followed by 9 time steps of value .01. Also, the user has requested that output be recorded for ${\bf{t}}=0.0$ , .005,.01, .02, .03, etc.   
3.See Guidelines and Tools for Effctive Dynamic Analysis in MSC Nastran Dynamic Analysis Users Guide or a discussion of considerations leading to the selection of time steps.   
4.In modal frequency response analysis (SOLs 1ll and 146), this entry is required only when TLOADi is requested; i.e., when Fourier methods are selected.   
5. The maximum and minimum displacement at each time step and the SIL numbers of these variables can be printed by altering DIAGON(30) before the transient module TRD1 and by altering DIAGOFF(30) after the module. This is useful for runs that terminate due to overflow or excessive run times.   
6. For heat transfer analysis in SOL 159, use the entry.   
7. If Modules are present then this entry may only be specified in the main Bulk Data section.  

Defines parametric controls and data for nonlinear transient structural or heat transfer analysis.is intended for SOLs 129, 159, 600 and SOLs 400 and 700.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>TSTEPNL</td><td>ID</td><td>NDT</td><td>DT</td><td>NO</td><td>METHOD</td><td>KSTEP</td><td>MAXITER</td><td>CONV</td><td></td></tr><tr><td></td><td>EPSU</td><td>EPSP</td><td>EPSW</td><td>MAXDIV</td><td>MAXQN</td><td>MAXLS</td><td>FSTRESS</td><td></td><td></td></tr><tr><td></td><td>MAXBIS</td><td>ADJUST</td><td>MSTEP</td><td>RB</td><td>MAXR</td><td>UTOL</td><td>RTOLB</td><td>MINITER</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>TSTEPNL</td><td>250</td><td>100</td><td>.01</td><td>1</td><td>ADAPT</td><td>2</td><td>10</td><td>PW</td><td></td></tr><tr><td></td><td>1.E-2</td><td>1.E-3</td><td>1.E-6</td><td>2</td><td>10</td><td>2</td><td>.02</td><td></td><td></td></tr><tr><td></td><td>５</td><td>5</td><td>0</td><td>0.75</td><td>16.0</td><td>0.1</td><td>20.</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Identification number. (Integer > 0)</td></tr><tr><td>NDT</td><td>Number of time steps of value DT. See Remark 2. (Integer ≥ 3)</td></tr><tr><td>DT</td><td>Time increment. See Remark 2. (Real > 0.0)</td></tr><tr><td>NO</td><td>Time step interval for output. Every NO-th step willbe saved for output. See Remark 3. (Integer ≠ 0; Default = 1)</td></tr><tr><td>METHOD</td><td>Method for stiffness matrix update and the transient time integration schemes. For SOLs 129 and 159, only METHOD=ADAPT is allowed and it is also the default. For SOL 400, all options are allowed. The default is AUTO with non-contact analysis and FNT with contact analysis. See Remark 4.(Character:“AUTO”,“ITER",“ADAPT",“SEMI", “FNT”,or“PFNT")</td></tr><tr><td>KSTEP</td><td>KSTEP is the number of converged bisection solutions between stiffness updates for ADAPT method. (Default = 2). It is the number of iterations before stiffness updates for ITER method (Default = 10). See Remarks 18. and 19. (Integer > 0).</td></tr><tr><td>MAXITER</td><td>Limit on number of iterations for each time step. See Remarks 5., 6., and 18. (Integer ≠ 0; Default = 10 for ADAPT method and 25 for non-ADAPT methods)</td></tr><tr><td>CONV</td><td>Flags to select convergence criteria. See Remarks 7. and 21. (Character; Default = “PW" for SOLs 129 and 159,“UPW" for SOL 400 with non-contact analysis, and “PV" for SOL 400 with contact analysis.)</td></tr><tr><td>EPSU</td><td>Error tolerance for displacement (U) criterion. See Remark 20. (Real + 0.0; Default = 1.0E-2 for all methods except PFTN. For PFTN, Default = -1.0E-2)</td></tr><tr><td>EPSP</td><td>Error tolerance for load (P) criterion. (Real > 0.0; Default = 1.0E-3 for SOLs 129 and 159,1.0E-2 for SOL 400)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>EPSW</td><td>Error tolerance for work (W) or energy criterion. See Remark 20. (Real > 0.0; Default = 1.0E-6 for SOLs 129 and 159, 1.0E-2 for SOL 400 and non-PFNT methods, -1.0E-2 for SOL 400 and PFNT method)</td></tr><tr><td>MAXDIV</td><td>Limit on the number of diverging conditions for a time step before the solution is assumed to diverge. See Remark 8. (Integer ≠ O; Default = 2)</td></tr><tr><td>MAXQN</td><td>Maximum number of quasi-Newton correction vectors to be saved on the database. See Remark 9. (Integer ≥ O; Default = 10 for all methods except PFNT. For PFNT, Default = 0)</td></tr><tr><td>MAXLS</td><td>Maximum number of line searches allowed per iteration. See Remark 9. (Integer ≥ 0; Default = 2 for all methods except PFNT. For PFNT, Default = 0)</td></tr><tr><td>FSTRESS</td><td>Fraction of effective stress (） used to limit the subincrement size in the material routines. See Remark 10. (0.0 < Real < 1.0; Default = 0.2)</td></tr><tr><td>MAXBIS</td><td>Maximum number of bisections allowed for each time step. See Remark 11.and 12. (-9 ≤ Integer ≤ 9; Default = 5 except for MAXITER < 0 and SOL 400. For MAXITER <0 and SOL 400, Default = 0)</td></tr><tr><td>ADJUST</td><td>Time step skip factor for automatic time step adjustment. See Remark 13. (Integer ≥ 0; Default = 5)</td></tr><tr><td>MSTEP</td><td>Number of steps to obtain the dominant period response. See Remark 14. (10≤ Integer ≤ 200; Default = variable between 20 and 40 for SOL 129 and between 10 and 20 for SOL 400.)</td></tr><tr><td>RB</td><td>Define bounds for maintaining the same time step for the stepping function during the adaptive process. See Remark 14. (0.1 ≤ Real ≤ 1.0; Default = 0.6)</td></tr><tr><td>MAXR</td><td>Maximum ratio for the adjusted incremental time relative to DT allowed for time step adjustment. See Remark 15. (Real ≥ 1.0; Default = 32.0)</td></tr><tr><td>UTOL</td><td>Tolerance on displacement or temperature increment below which a special provision is made for numerical stability. See Remark 16. (0.001 < Real ≤ 1.0; Default = 0.1)</td></tr><tr><td>RTOLB</td><td>Maximum value of incremental rotation (in degrees) allowed per iteration to activate bisection. See Remark 17. (Real > 2.0; Default = 20.0)</td></tr><tr><td>MINITER</td><td>Minimum number of iterations for a load increment, SOL 400 only.(Default = 1 except for the contact analysis. For contact analysis, Default = 2) It is recommended to set MINITER = 2 when high accuracy is expected)</td></tr></table></body></html>  

Remarks:  

1. For SOL 129 and SOL 159, the Bulk Data entry is selected by the Case Control command $=\mathrm{ID}$ Each residual structure subcase requires a entry and either applied loads via TLOADi data or initial values from a previous subcase. Multiple subcases are assumed to occur sequentially in time with the initial values of time and displacement conditions of each subcase defined by the end conditions of the previous subcase.  

For SOL 400, the is selected in the STEP ID's listed within a SUBCASE ID. For SOL 400 each SUBCASE is independent of the previous statement.   
2. NDT is used to define the total duration for analysis, which is NDT \* DT. Since DT is adjusted during the analysis, the actual number of time steps, in general, will not be equal to NDT). Also, DT is used only as an initial value for the time increment. For printing and ploting the solution with SOLs 129 and 159, data recovery is performed at time 0, $\mathrm{_{NO^{*}D T}}$ 。 $2^{\ast}\mathrm{NO^{\ast}D T}$ ，..., and the last converged step, where DT is internally computed time increment and may change at every time step.For SOL 400 and $\mathrm{NO}>0$ , data recovery is performed at time 0, $\mathrm{NO^{*}D T I}$ $2^{*}\mathrm{NO^{*}D T I}$ . ...,and the last converged step, where DTI is the user input initial time increment and it is a constant. For SOL 400 thermal analysis and $\mathrm{NO}<0$ , the SOL 159 scheme is used. For SOL 400 structural analysis and $\mathrm{NO}<0$ , the SOL 129 scheme is used for SOL 400, i.e., data recovery is performed at time 0, $|\mathrm{NO}|{^{*}\mathrm{D}\mathrm{T}}$ 。 $2^{*}|\mathrm{NO}|^{*}\mathrm{DT}$ ...., and the converged step. See Remark 13. on how DT is changed. The stiffness update strategy as wellas the transient integration method is selected in the METHOD field. a. METHOD $\mid=$ “ADAPT": The program automatically adjusts the incremental time and uses bisection. During the bisection process, the stiffness matrix is updated every KSTEPth converged bisection solution. This is the only method available for SOLs 129 and 159 and is also their default. b． METHOD $\mid=$ “AUTO": The stiffness matrix is automatically updated to improve the convergence. Also, the program automatically adjusts the incremental time and uses bisection. The automatic time adjustment can be deselected by using ADJUST $\scriptstyle-0$ . KSTEP value is ignored during iteration. This is the default method for SOL 400. c. METHOD $\mathbf{\Sigma}=\mathbf{\Sigma}$ "ITER": The stiffness is updated at every KSTEPth iterations. Also, the program automaticaly adjusts the incremental time and uses bisection. The automatic time adjustment can be deselected by using ADJUST $\scriptstyle\mathbf{\bar{\rho}}=0$ ， d. METHOD $\vDash$ “SEMI": Same as the AUTO method except that the stiffness updated at the first iteration, and then starts the AUTO iteration scheme. e. METHOD $)={}^{\mathfrak{c}}]$ FNT": This is the Full Newton iteration method; the stiffnessis updated at every iteration. In comparison with the PFNT method, the defaults for FNT are $\mathrm{EPSU}=0.01$ ， $\mathrm{EPSW}=0.01$ and $\mathrm{MAXLS}=2$ . See Remark 19. f.1 $\mathrm{\sfMETHOD}=\mathrm{^{\infty}P F N T^{\gg}}.$ : This is the Pure Full Newton iteration method. The PFNT method is the same as the FNT method except that the defaults for PFNT method are $\mathrm{EPSU}=-0.01$ ,EPSW $\mathbf{\Sigma}=\mathbf{\Sigma}$ -0.01, and $\mathrm{MAXLS}=0$ . See Remark 19.   
5. This remark applies to SOLs 129 or 159 only. The number of iterations for a time step is limited to  

MAXITER. If MAXITER is negative, the analysis is terminated when the divergence condition is encountered twice during the same time step or the solution diverges for five consecutive time steps. If MAXITER is positive, the program computes the best solution and continues the analysis until divergence occurs again. If the solution does not converge in MAXITER iterations, the process is treated as a divergent process. See Remark 8.  

6. This remark applies to SOL 400 only. The number of iterations for a load increment is limited to [MAXITERl .Ifthe solution does not converge in |MAXITER| iterations,the load increment is bisected and the analysis is repeated. If the load increment cannot be bisected (i.e., MAXBIS is attained or $\mathrm{MAXBIS}=0.$ ） and MAXDIV is positive, the best attainable solution is computed and the analysis is continued to the next time step. Best solutions for 4 time steps are computed. The analysis is terminated if the solution still diverges. If MAXDIV is negative, the analysis is terminated immediately.  

If MAXITER is negative, the solution is continued to the end of the current step, even if the solution is divergent. In this case, the best attainable solution is computed for each time step. The default for $\mathrm{MAXBIS}=1$ , if MAXITER $<0$ . Also for SOL 400, the value of MAXITER for the AUTO method is an approximation. The program willtry to obtain a converged solution if it senses the solution can converge.  

7. The convergence test flags $\mathrm{{~U~}}=$ displacement error test, ${\mathrm{~P~}}=$ load equilibrium error test, $\mathbb{W}=$ work error test, ${\mathrm{V}}=$ vector component method, $\Nu=$ Length method) and the error tolerances (EPSU, EPSP,and EPSW) define the convergence criteria. All requested criteria (combination of U, P, W, V, and/or N) are satisfied upon convergence. Note that at least two iterations are necessary to check the displacement convergence criterion. For SOL 400, if the U criterion is selected together with $\mathrm{\DeltaP}$ or W, then for the first iteration of a load increment, the U criterion will not be checked. For V and N, see Remark 21.  

8. MAXDIV provides control over diverging solutions. Depending on the rate of divergence, the number of diverging solutions (NDIV) is incremented by l or 2. The solution is assumed to diverge when NDIV reaches MAXDIV during the iteration. If the bisection option is used (allowed MAXBIS times) the time step is bisected upon divergence. Otherwise, the solution for the time step is repeated with a new stiffness based on the converged state at the beginning of the time step. If NDIV reaches MAXDIV again within the same time step, the analysis is terminated for SOLs 129 and 159. For SOL 400, the termination of analysis is dependent on the sign of MAXDIV. If MAXDIV is positive, the best attainable solution is computed and the analysis is continued to the next time step.Best solutions for 4 time steps are computed.The analysis is terminated if the solution is still diverges. If MAXDIV is negative, the analysis is terminated immediately. See Remark 6.  

9. Nonzero values of MAXQN and MAXLS will activate the quasi-Newton update and the line search process, respectively.  

10.The number of subincrements in the material routines is determined such that the subincrement size is approximately FSTRESS .. FSTRESS is also used to establish a tolerance for error correction in elastoplastic material, i.e.,error in yield function <FSTRESS $\cdot$ yield stress  

If the limit is exceeded at the converging state, the program will terminate with a fatal error message. Otherwise, the stress state is adjusted to the current yield surface, resulting in $\delta=0$  

11. The remark applies to SOLs 129 or 159 only.The bisection process is activated when divergence occurs and MAXBIS $\neq\begin{array}{r l}{0}\end{array}$ . The number of bisections for a time increment is limited to |MAXBIS]. If MAXBIS is positive and the solution does not converge after MAXBIS bisections, the best solution is computed and the analysis is continued to the next time step. If MAXBIS is negative and the solution does not converge in |MAXBISl bisection, the analysis is terminated.  

12.This remark applies to SOL 400 only. The bisection process is activated when divergence occurs and $\mathrm{MAXBIS}\neq0.$ The number of bisections for a time step is limited to the absolute value of MAXBIS. Different actions are taken when the solution diverges depending on the sign of MAXBIS. If MAXBIS is positive, the stiffness is updated on the first divergence, and the load is bisected on the second divergence. If MAXBIS is negative, the load is bisected every time the solution diverges until the limit on bisection is reached. If the solution does not converge after |MAXBIs| bisections, the analysis is continued or terminated depended on the sign of MAXDIV. See Remark 8.  

13. ADJUST controls the automatic time stepping. Since the automatic time step adjustment is based on the mode of response and not on the loading pattern, it may be necessary to limit the adjustable step size when the period of the forcing function is much shorter than the period of dominant response frequency of the structure. It is the user's responsibility to ensure that the loading history is properly traced with the ADJUST option. The ADJUST option should be suppressed for the duration of short pulse loading. In particular,for impact problems in SOL 400, it is recommended that the ADJUST option be suppressed since the short duration pulses during the impact may not be tracked well by the frequency-based algorithm. It should also be noted that the TZEROMAX process (where the step is repeated with the same/smaler time step after thefirst 2 increments) is not currently available for contact problems.Ifunsure, start with a value for DT that is much smaller than the pulse duration in order to properly represent the loading pattern.  

· $\mathrm{If}\mathrm{ADJUST}=0$ then the automatic adjustment is deactivated. This is recommended when the loading consists of short duration pulses.   
· $\mathrm{IfADJUST}>0$ , the time increment is continually adjusted for the first few steps until a good value of $\Delta t$ is obtained. After this initial adjustment, the time increment is adjusted every ADJUST-th time step only.   
·For SOL 400, if $\mathrm{ADJUST}>0$ and $\mathrm{NO}>0$ (see Remark 3.),the analysis time step can reduce without limit, but it cannot increase more than $\mathrm{DT^{*}N O}$ . This means that, if $\mathrm{NO}=1$ , the analysis time step can only reduce, but cannot increase. The user should use $\mathrm{NO}>1$ to take the advantage of the range of automatic time stepping. If $\mathrm{NO}<0$ , the time step can both increase and decrease without limit. But in this case, the user will not know the exact output locations.   
If ADJUST is one order greater than NDT, then automatic adjustment is deactivated after the initial adjustment.  

14.MSTEP and RB are used to adjust the time increment during analysis. The recommended value of MSTEP is 10 to 40. A larger value (e.g., 40) is required for highly nonlinear problems. By default, the program automatically computes the value of MSTEP based on the changes in the stiffness.  

The time increment adjustment is based on the number of time steps desired to capture the dominant frequency response accurately. The time increment is adjusted as follows:  

$$
\Delta t_{n+1}=f(r)\Delta t_{n}
$$  

where  

$$
r\ =\ {\frac{1}{\mathrm{MSTEP}}}\Big({\frac{2\pi}{\upomega_{n}}}\Big)\Big({\frac{1}{\Delta t_{n}}}\Big)
$$  

where:  

<html><body><table><tr><td>f=</td><td>0.25</td><td>for</td><td>r < 0.5 · RB</td></tr><tr><td>f=</td><td>0.5</td><td>for </td><td>0.5 · RB ≤ r < RB</td></tr><tr><td>f=</td><td>1.0</td><td>for </td><td>RB ≤r < 2.0</td></tr><tr><td>f=</td><td>2.0</td><td>for </td><td>2.0 ≤ r <3.0/RB</td></tr><tr><td>f=</td><td>4.0</td><td>for </td><td>r ≥ 3.0/RB</td></tr></table></body></html>  

15. MAXR is used to define the upper and lower bounds for adjusted time step size, i.e., ${\mathrm{MIN}}\bigg(\frac{\mathrm{DT}}{2^{\mathrm{MAXBIS}}},\frac{\mathrm{DT}}{\mathrm{MAXR}}\bigg)\leq\Delta t\leq{\mathrm{MIN}}(\mathrm{MAXR}\cdot\mathrm{DT},\mathrm{NO}\cdot\mathrm{DT})$  

16. UTOL is a tolerance used to filter undesirable time step adjustments; i.e.,  

$$
\frac{\left\Vert\dot{U}_{n}\right\Vert}{\left\Vert\dot{U}\right\Vert_{m a x}}<\mathrm{UTOL}
$$  

Under this condition no time step adjustment is performed in a structural analysis (SOL 129). In a heat transfer analysis (SOL 159) the time step is doubled.  

17. The bisection is activated if the incremental rotation for any degree-of-freedom $(\Delta\theta_{x},\Delta\theta_{y},\Delta\theta_{z})$ exceeds the value specified by RTOLB. This bisection strategy is based on the incremental rotation and controlled by MAXBIS.  

18.For non-ADAPT (except FNT and PFNT) methods, the stiffness willbe updated at convergence if the number of iterations since last iteration is equal or greater than KSTEP.In addition,for SOL 400 and ADAPT method, the stiffness will be updated if $3^{*}$ MAXITER iterations are performed. For SOL 400 and non-ADAPT methods, the stiffness will be updated if MAXITER iterations are performed.  

19.For FNT and PFNT methods, whether the stiffness matrix will be updated between the convergence of a load increment and the start of the next load increment depends on the value of KSTEP. In this case, $\mathrm{KSTEP}=-1$ ,‘BLANK', or 1. A user fatal error will be issued if other value is input. If KSTEP $\mathbf{\tau}=1$ , the stiffness matrix will not be updated. If $\mathrm{KSTEP}=\mathrm{\mathop{BLANK}^{\prime}}$ , the program will decide whether to update depending element type. If ${\mathrm{KSTEP}}=-1$ , the stiffness matrix will be forced to be updated.  

20.If $\mathrm{EPSU}>0.0$ the displacement error is computed file with respect to the total displacements. If $\mathrm{EPSU}<0.0$ , the displacement error is computed with respect to the delta displacements of a load increment. If $\mathrm{EPSW}>0.0$ ,the energy error is computed with respect to the total energy.If EPSW $\mathbf{\bar{\rho}}_{<}$ 0.0,the energy error is computed respect to the delta energy of a load increment. The options EPSU $<0.0$ and $\mathrm{EPSW}<0.0$ are available for SOL 400 only.  

21.Vand $_\mathrm{N}$ are additional methods for convergence checking using the displacement (U) and/or load (P) criteria. V stands for vector component checking. In this method, convergence checking is performed on the maximum vector component of all components in the model. N stands for length checking.In this method, the length ofa vector at a grid point is first computed by the SRSS (square root of the sum of the squares) method. Then convergence checking is performed on the maximum length of allgrid points in the model. For example, if CONV=UV, then V checking method will be performed with the U criteria, i.e., the maximum displacement component of all displacement components in the model is used for convergence checking. For V and N, the EPSU is always  

negative, i.e., the error is computed with respect to the delta displacements of a load increment, even if positive value is requested by users. $\mathrm{CONV=V}$ is the same as CONV $\c=$ UPV and $\mathrm{CONV=D}$ is the same as CONV $\dot{\bf\Phi}=\dot{\bf\Phi}$ UPD. If both V and N are specified; V will take precedence over N. For example, $\mathrm{CONV=VN}$ is the same as $\mathrm{CONV=V}$  

By default, for UPV or UPN, separate checks are made over force and moment vectors, and translation and rotation vectors.While the force/translation check is valid always, the moment or rotation check is only valid for 6 DOF elements (beams, shell, etc.). In certain cases (i.e.,simply supported or hinged structures where moments are numerically small, small rotation problems), it may be beneficial to turn of the additional convergence testing done for moments and/or rotations.  

22. For SOL 700, only fields ID, NDT, and DTare used.  

23. In NLTRAN analysis, the output is also influenced by NLPACK. Please refer to NLPACK for an example.  

Defines a time-dependent temperature distribution for the nonlinear transient analysis in SOL 400.  

$$
\{T(t)\}~=~\{A(T(x))\cdot F(t)\}
$$  

where $A(T(x))$ defines a spatial temperature distribution and $F(t)$ a time function. $T(t)$ is the time dependent temperature distribution for use in the nonlinear elements in nonlinear transient analysis.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>TTEMP</td><td>SID</td><td>GROUP_ID</td><td>TID</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:  

<html><body><table><tr><td>TTEMP</td><td>11</td><td>101</td><td>31</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Temperature set identification number. (Integer > 0)</td></tr><tr><td>GROUP_ID</td><td>Temperature group identification number (Integer > O or =-1)</td></tr><tr><td>TID</td><td>Identification number of TABLEDi entry that gives F(t). (Integer > 0)</td></tr></table></body></html>  

Remarks:  

1. The temperature distribution TTEMP must be selected by a Case Control command TEMP(LOAD) $\mid=$ SID in order to be used in the nonlinear transient analysis.   
2. This command is used in SOL 400 only when ANALYSIS $\c=$ NLTRAN (nonlinear transient analysis) and the temperature load is applied. It only applies to the nonlinear elements in the Residual $\mathrm{(SEID{=}0)}$ . There should be only one temperature set for each STEP.   
3. GROUP_ID determines the distribution of temperatures. It references the TMPSET Bulk Data entry to define allgrid points, which reference the same TABLEDi entry. Each grid point can have its own GROUP_ID if necessary. GROUP_ID $\mathbf{\sigma}=\mathbf{\sigma}$ -1 means all grid points are in one group and reference the same TTEMP Bulk Data entry.   
4. If the TEMP(INIT) Case Control command references a TTEMP entry, then only the spatial distribution of the TTEMP willbe used as the initial temperature distribution for the TEMP(INIT) command.   
5. TTEMP may be used in nonlinear transient analysis in SOL 400. For pure linear analysis in SOL 400, DLOAD/TLOADi has to be used to define a time-dependent temperature distribution.  

Provides the name of a file that can be referenced from other bulk data entries such as FTGLOAD, TABLRPC, and MATDIGI.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>UDNAME</td><td>UDID</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>NAME</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>UDNAME</td><td>10</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>myfile.dat</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>UDID</td><td>Unique UDID (Integer>0). See Remark 1.</td></tr><tr><td>NAME</td><td>Name of a file (with or without path) such as the external loading time history in DAC, RPC, or S3T format or DIGIMAT material file (Character).</td></tr></table></body></html>  

Remarks:  

1. The UDID is referenced by FTGLOAD, TABLRPC, or MATDIGI entries   
2. The NAME is limited to a maximum of 256 characters (corresponding to 4 lines of data in fields 2- 9).For Fatigue analysis using .rsp (RPC) files, there is a l28 character limit (corresponding to 2lines of data in fields 2-9). Embedded blanks are not supported.   
3.If only a NAME with no path (e.g., sineOl.dac) is supplied, the file is assumed to be located in the same directory as the Nastran input file. Ifan absolute or relative path is supplied (eg, /local/user/fatigue/sineO1.dac), it will be used.  

UDSESV  

## Define the number and names of user state variables for material user subroutines (SOL 400 only)  

Define the number and names of the user state variables.Each state variable has default nominal name if a user name is not given. This is a global entry.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>UDSESV</td><td></td><td>NSTATS</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>SV2</td><td>SV2_NAME</td><td>SV3</td><td>SV3_NAME</td><td>SV4</td><td>SV4_NAME SV5</td><td>SV5_NAME</td><td></td></tr><tr><td></td><td>SV6</td><td>SV6_NAME</td><td>.ETC</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>UDSESV</td><td>3</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>SV2 VAR2</td><td>SV3</td><td>VAR3</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td> Describer</td><td>Meaning</td></tr><tr><td>NSTATS</td><td>The number of user defined state variables. (Integer >= 1)</td></tr><tr><td>SVi</td><td>The default nominal name of state variable (CHARACTER, i >= 1, where i is the index number of the state variable)</td></tr><tr><td>SVi_NAME</td><td>The state variable name defined by user (CHARACTER, Default = SVi, where i is the index number of the state variable)</td></tr></table></body></html>  

Remarks:  

1. This is a global entry that defines user state variables for material user subroutines. The temperature will always be passed to material use subroutine as the first state variable; its name should not be redefined in this entry.   
2.Ifa state variable is not given a name, SVi willbe used as its name.The numberi is the index number of the state variable.   
3. For output, either state variables names given in UDSESV or default SVi names can be used in NLOUT entry in case control. The state variables names will be used as keywords for output selection.   
4.The lst state variable is always temperature.The remaining user defined state variables are defined and used only by user, Nastran will not use them.   
5. This entry only supports UMAT and UCOHES user subroutines, see UNAME in MATUDS   
6. This entry is required when MATDIGI is defined to define the number of state variables.   
7. The number of state variables is limited to l0O state variables (including temperature)for SOL400.  

Used in rotordynamic analyses to specify a rotating unbalance load in terms of a cylindrical system with the rotor rotation as the $\mathbf{z}$ -axis.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>UNBALNC</td><td>SID</td><td>MASS</td><td>GRID</td><td>X1</td><td>X2</td><td>X3</td><td></td><td></td><td></td></tr><tr><td></td><td>ROFFSET</td><td>THETA</td><td>ZOFFSET</td><td>T/Fon</td><td>T/FOFF</td><td>CFLAG</td><td></td><td></td><td></td></tr><tr><td></td><td>UFT1</td><td>UFT2</td><td>UFT3</td><td>UFR1</td><td>UFR2</td><td>UFR3</td><td></td><td></td><td></td></tr><tr><td></td><td>MCT1</td><td>MCT2</td><td>MCT3</td><td>MCR1</td><td>MCR2</td><td>MCR3</td><td></td><td></td><td></td></tr><tr><td></td><td>SCR1</td><td>SCR2</td><td>SCR3</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>UNBALNC</td><td>100</td><td>0.1</td><td>1001</td><td>0.0</td><td>1.0</td><td>0.0</td></tr><tr><td></td><td>0.02</td><td>30.0</td><td>0.5</td><td></td><td></td><td>MASS</td></tr><tr><td></td><td>1001</td><td>1002</td><td>1003</td><td>1004</td><td>1005</td><td>1006</td></tr><tr><td></td><td>2001</td><td>2002</td><td>2003</td><td>2004</td><td>2005</td><td>2006</td></tr><tr><td></td><td>3001</td><td>3003</td><td>3004</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SID</td><td>Set identification number. (Integer; Required; no Default)</td></tr><tr><td>MASS</td><td>Mass of imbalance. See Remark 4. (Real or Integer; if integer must be > O; Required; no Default)</td></tr><tr><td>GRID</td><td> Grid identification number of applying imbalance. (Integer; Required; no Default)</td></tr><tr><td>X1,X2,X3</td><td>Components of the vector, from GRID,in the displacement coordinate system of GRID, which is used to define a cylindrical coordinate system centered at GRID; see Remark 5. (Real; Required; no Default)</td></tr><tr><td>ROFFSET</td><td>Offset of mass in the radial direction of the unbalance coordinate system. See Remark 4. (Real or Integer; if integer, must be > O; Default = 1.0)</td></tr><tr><td>THETA</td><td>Angular position, in degrees, of the mass in the unbalance coordinate system. (Real; Default = 0.0)</td></tr><tr><td>ZOFFSET</td><td>Offset of mass in the z-direction of the unbalance coordinate system. See Remark 4. (Real or Integer; if integer, must be > O; Default = 0.0)</td></tr><tr><td>T/FON</td><td>Start time or frequency for applying imbalance load. See Remark 6. (Real ≥ 0.0; Default = 0.0)</td></tr><tr><td>T/F OFF</td><td>Stop time or frequency for terminating imbalance load. See Remark 6. (Real > 0.0; Default = 999999.0)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>UFT1-3</td><td>EPOINTs to output the unbalanced forces in the T1, T2, and T3 directions. See Remark 6. (Integer > 0)</td></tr><tr><td>UFR1-3</td><td>EPOINTs to output the unbalanced forces in the R1, R2, and R3 directions. See Remark 6. (Integer > 0)</td></tr><tr><td>MCT1-3</td><td>EPOINTs to output the mass-correction forces in the T1, T2, and T3 directions. See Remark 6. (Integer > 0)</td></tr><tr><td>MCR1-3</td><td>EPOINTs to output the mass-correction forces in the R1, T2, and R3 directions. See Remark 6. (Integer > 0)</td></tr><tr><td>SCR1-3</td><td>EPOINTs to output the speed-correction forces in the R1, R2, and R3 directions. (Integer >0)</td></tr><tr><td>CFLAG</td><td>Correct flag to specify whether 1) the mass will be used to modify the total mass in the transient response calculations, 2) the effect of the rotor spin rate change will be included in the transient response calculation, or 3) both; see Remark 7. (Character: NONE, MASS, SPEED, or BOTH,Default = NONE).</td></tr></table></body></html>  

Remarks:  

1. Multiple UNBALNC entries with the same SID value are allowed.   
2. For transient response, UNBALNC is specified by the RGYRO Case Control command. For frequency response, it is specified by the DLOAD Case Control command.   
3.The imbalanceload will be generated based on the mass value,offset values, and the rotor spin speed.   
4.If the entry isa real number, the value is considered constant. If the entry is an integer number, the value references a TABLEDi entry that specifies the value asa function of time for transient response or frequency for frequency response.   
5.A cylindrical coordinate system is used to determine the initial position and rotation direction of the mass unbalance. Theta is measured from the plane defined by the $\mathbf{z}$ -axis and the user specified vector (X1, X2, X3). Theta $=0.0$ is in the direction of the user-specified vector (X1, X2, X3). Unbalance rotation is in the positive $\mathbf{z}$ -direction.   
6. For frequency response analysis, the EPOINTs and the continuation cards are ignored.   
7. Ifthe mass loss (increase) is relatively small, the correction may safely be ignored. $(\mathrm{CFLAG}=\mathrm{NONE})$ · These error corrections terms are applied for analysis in fixed reference frame only.   
8. The mass specified on UNBALNC is scaled with PARAM, WTMASS factor for both transient and frequency response analysis.  

Equations in fixed reference frame:  

a. For Frequency response analysis  

$$
\Big\{{\cal F}_{x}({\bf\omega})\Big\}\ =\ W T M A S S\cdot\left\{\begin{array}{c}{{m r{\bf\omega}^{2}\big(c o s\theta_{k}+i s i n{\theta_{k}}\big)}}\\ {{m r{\bf\omega}^{2}\big(s i n{\theta_{k}}+i c o s{\theta_{k}}\big)\ }}\end{array}\right\}
$$  

b. For transient analysis  

$$
\left\{{\cal F}_{x}(\omega)\atop{\cal F}_{y}(\omega)\right\}={\it W T M A S S}\cdot\left\{{m(t)r(t)}(\Omega_{j}^{2}(t)c o s\Theta_{j k}(t)+\dot{\Omega_{j}}(t)s i n\Theta_{j k}(t))\right\}\nonumber
$$  

where,  

$m(t)$ Specified by the user (MASS field in UNBALNC)   
$r(t)$ Specified by the user (ROFFSET field in UNBALNC)   
$\Omega_{j}(t)$ Specified by the user through RSINT/RSPINR entry   
$\dot{\Omega}_{j}(t)$ Derived from $\Omega_{j}(t)$   
$\uptheta_{j k}(t)$ Instantaneous angular location, measured from axis 1 to axis $2{\bf\Gamma}\left(=\int_{0}{\bf W}{\bf\Gamma}_{j}(t)d t+{\bf\Gamma}{\mathcal{G}}_{k}{\bf\Gamma}\right)$ $\uptheta_{k}$ Specified by the user (THETA field in UNBALNC) j Rotor on which the grid is located  

This entry may be used in SOLs 101 or $400$ but is only necessary if glued contact has been specified and some of the grids should use standard contact instead of glued contact.This option is normally used for crack analysis where the grids along the crack are not glued but allother gridsonacontact body have glued contact.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>UNGLUE</td><td>ID</td><td>BID</td><td>ID1</td><td>THRU</td><td>ID2</td><td>BY</td><td>Ｎ</td><td></td><td></td></tr><tr><td></td><td>ID3</td><td>THRU</td><td>ID4</td><td>ID5</td><td>ID6</td><td>-etc.-</td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>UNGLUE</td><td>10</td><td>101 3457</td><td>20 8456</td><td>THRU 4712</td><td>300 1000</td><td>BY THRU</td><td>2 2000</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Identification number referenced by a SUBCASE or STEP Case Control BCONTACT or UNGLUE command. See Remark 1. (Integer; no Default)</td></tr><tr><td>BID</td><td>Identification of the specified BCBODY. (Integer > O; no Default).</td></tr><tr><td>IDi</td><td>ID list of grids. (Integer > O; no Default).</td></tr><tr><td>THRU</td><td>Enter THRU if a range of grids is required. (Character)</td></tr><tr><td>BY</td><td>Enter BY if the range of grids is not consecutive. (Character)</td></tr><tr><td>N</td><td>BY increment. (Integer > 0).</td></tr></table></body></html>  

Remarks:  

1. To place an entry in loadcase O, set $\scriptstyle\mathrm{ID=0}$ ， which does not need any corresponding Case Control command BCONTACT $_{=0}$ or UNGLUE $_{.=0}$ and is always automatically executed. To place an entry in any physical loadcase (SUBCASE or STEP), ID must be selected by the Case Control command BCONTACT $\mathrm{\dot{\bar{\rho}}_{\mathrm{=}}I D}$ or UNGLUE $\v{S}_{\v{r}}=$ ID. Note that UNGLUE Case Control will take precedence over the BCONTACT Case Control for this entry with same ID. UNGLUE is ignored by Permanent contact.   
2.This entry may be repeated as many times as necessary to define all subcases and bodies with grids that should not have glued contact.  

This entry is only necessary if glued contact has been specified and some of the grids should use standard contact instead of glued contact.This option is normall used for crack analysis where the grids along the crack are not glued but all other grids on a contact body have glued contact. SOL 600 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>UNGLUE</td><td>IDBC</td><td>IBOD</td><td>D1</td><td>THRU</td><td>D2</td><td>BY</td><td>N3</td><td></td><td></td></tr><tr><td></td><td></td><td></td><td>D4</td><td>THRU</td><td>D5</td><td>BY</td><td>N6</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>UNGLUE</td><td>1</td><td>1</td><td>1</td><td>THRU</td><td>100</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>IDBC</td><td>Identification number of a Case Control BCONTACT command defining the subcase to which these items should be available. Enter O if this entry should apply to Marc's increment zero. Enter -9999 if it should</td></tr><tr><td>IBOD</td><td>apply to all subcases. (Integer; no Default) Identification number of a matching BCBODY Bulk Data entry of a flexible surface defining the body with GRIDS to be removed from glued contact. The BCBODY may include additional grids (not included in this entry) that remain glued. (Integer; Default</td></tr><tr><td>IDi</td><td>= 1） See Remarks 4. and 5. (3,1) ID list of grids. (Integer > O; no Default).</td></tr><tr><td>THRU</td><td>Enter THRU if a range of grids is required. (Character)</td></tr><tr><td>BY</td><td>Enter BY if the range of grids is not consecutive. (Character)</td></tr><tr><td>N</td><td>BY increment. (Integer > 0).</td></tr></table></body></html>  

Remarks:  

1. Repeat the continuation entry until all grids for the particular body are described.   
2.This entry may be repeated as many times as necessary to define all subcases and bodies with grids that should not have glued contact.   
3. This entry corresponds to Marc's DEACT GLUE option. Items (i,j) indicate the corresponding data block and field.   
4.In certain models, there are no BCBODY entries (for example; self contact) because the entire model comprises one body. For such models IBOD may be left blank.  

5.If IBOD is a positive number, it willbe converted to the body number using the BCBODY entries. To override this conversion and use the body number directly, enter IBOD as a negative number whose magnitude is equal to the body number desired.  

6. Multiple UNGLUE entries with the same IDBC are not allowed.  

Defines a degree-of-freedom set.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>USET</td><td>SNAME</td><td>ID1</td><td>C1</td><td>ID2</td><td>C2</td><td>ID3</td><td>C3</td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>USET</td><td>U4</td><td>333</td><td>26</td><td>17</td><td>0</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SNAME</td><td> Set name. (One to four characters, or the string“ZERO" followed by the set name.)</td></tr><tr><td>IDi</td><td>Grid or scalar point identification number. (Integer > 0)</td></tr><tr><td>Ci</td><td>Component number. (Integer zero or blank for scalar points, or any unique combinations of the Integers 1 through 6 for grid points with no embedded blanks.)</td></tr></table></body></html>  

Remarks:  

1. SNAME may refer to any of the set names given in Degree-of-Freedom Sets,1111 or their new names on the DEFUSET entry. However, it is recommended that SNAME refer only to the set names U1 through U6 or their new names on the DEFUSET entry. If set names a through vare used then the degrees-of-freedom may also have to be defined in the applicable super sets on other USETi entries.  

2.If $\mathrm{SNAME}=^{\mathrm{\infty}}\mathrm{ZEROi^{\mathrm{\infty}}}$ , where i is a set name, then the degrees-of-freedom are omitted from set i.  

3. A maximum of 18 degrees-of-freedom may be designated on a single entry.  

4.If degrees-of-freedom defined by USET entries are found to be singular and AUTOSPC is requested for a degree-of-freedom that is also in a set that AUTOSPC may change, then the set defined by the USET entry will be removed by the AUTOSPC operation. An avoidance is to use PARAM,AUTOSPC,NO.  

5. The USET entry is processed by the GP4 module with its effect appearing in the USET table. User-written DMAPs must therefore include the GPl and GP4 modules if USET entries are usec  

6.Ifa USETi Bulk Data entry lists a standard degree-of-freedom set, such as S or M, the program may fail in the PARTN module with the message“SYSTEM FATAL MESSAGE 3007, ILLEGAL INPUT TO SUBROUTINE". This entry should only reference new sets defined on DEFUSET Bulk Data entries.  

Defines a degrees-of-freedom set.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>USET1</td><td>SNAME</td><td>C</td><td>ID1</td><td>ID2</td><td>ID3</td><td>ID4</td><td>ID5</td><td>ID6</td><td></td></tr><tr><td></td><td>ID7</td><td>ID8</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>USET1</td><td>SB</td><td>345</td><td>2</td><td>1</td><td>36</td><td>5</td><td>9</td><td>7</td><td></td></tr><tr><td></td><td>40</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Alternate Format and Example:  

<html><body><table><tr><td>USET1</td><td>SNAME</td><td>C</td><td>ID1</td><td>“THRU" ID2</td><td></td><td></td><td></td><td></td></tr><tr><td>USET1</td><td>SB</td><td>123</td><td>170</td><td>THRU 180</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>SNAME</td><td>Set name. (One to four characters or the word “ZERO" followed by the set name.)</td></tr><tr><td>C</td><td>Component numbers. (Integer zero or blank for scalar points or any unique combinations of the Integers 1 through 6 for grid points with no embedded blanks.)</td></tr><tr><td>IDi</td><td>Grid or scalar point identification number. (Integer > O; for “THRU" option, ID1 < ID2.)</td></tr></table></body></html>  

Remarks:  

1. SNAME may refer to any of the set names given in Degreeof-Freedom Sets,1111 or their new names on the DEFUSET entry. However, it is recommended that SNAME refer only to the set names U1 through U6 or their new names on the DEFUSET entry. If set names a through v are used then the degrees-of-freedom may also have to be defined in the applicable super sets on other USETi entries.  

2.If SNAME $\c=$ “ZEROi", where i is a set name, then the degrees-of-freedom are omitted from set i.  

3. If the alternate format is used, all of the points ID1 through ID2 are assigned to the set.  

4.If degrees-of-freedom defined by USET entries are found to be singular and AUTOSPC is requested for a degree-of-freedom that is also in a set that AUTOSPC may change, then the set defined by the USET entry will be removed by the AUTOSPC operation. An avoidance is to use PARAM,AUTOSPC,NO.  

5. The USET1 entry is processed by the GP4 module with its efect appearing in the USET table. User-written DMAPs must therefore include the GPl and GP4 modules if USET entries are used  

6. Ifa USETi Bulk Data entry lists a standard degree-of-freedom set, such as S or M, the program may fail in the PARTN module with the message“SYSTEM FATAL MESSAGE 3007, ILLEGAL INPUT TO SUBROUTINE". This entry should only reference new sets defined on DEFUSET Bulk Data entries.  

Defines user subroutines used in SOL 600 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>USRSUB6</td><td>U1</td><td>U2</td><td>U3</td><td>U4</td><td>U5 U6</td><td>U7</td><td>U8</td><td></td></tr><tr><td></td><td>U9</td><td>U10</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

## Examples:  

<html><body><table><tr><td>USRSUB6</td><td>UDAMAG</td><td>uvoid</td><td>TENSOF</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>USRSUB6*</td><td>SEPFORBB C</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>Ui</td><td>Name of user subroutine(s) to be included. See Marc Volume D for list of available user subroutines. Do not include the .f extension on this entry, however, the actual file on the disk must have the .f extension. If any user subroutine exceeds 8 characters, use the wide field format for the primary line and all continuation lines. (Character; no Default)</td></tr></table></body></html>  

Notes:  

1. All user subroutines must reside in the directory where the Nastran input file resides.   
2. All user subroutines on disk must be in lower case and have an extension of.f.The names entered in the bulk data entry may be in upper or lower case. They will be converted to lower case.   
3. SOL 600 combines alluser subroutines into one large subroutine named u600.fand u600.f is passed to the Marc command line when spawned from Nastran.   
4. If only one user subroutine is required, an alternate is to use PARAM,MARCUSUB,name.  

Specification of a vector of aerodynamic control point (extra point) values.These data define the control positions corresponding to user defined nonlinear control forces that have been defined by AEDW, AEPRESS and AEFORCE entries. Only nonzero values need to be defined.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>UXVEC</td><td>ID</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>LABEL1</td><td>UX1</td><td>LABEL2</td><td>UX2</td><td>-etc.-</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>UXVEC 1001 THRUST</td><td>1.E4</td><td>ANGLEA</td><td>.015</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Control vector identification number, see Remark 1. (Integer > 0)</td></tr><tr><td>LABELi</td><td>Controller name. This must correspond to an existing AESURF, AESTAT or AEPARM label or INTERCPT (Character). See Remark 4.</td></tr><tr><td>UXi</td><td>The magnitude of the aerodynamic extra point degree-of-freedom (Real)</td></tr></table></body></html>  

Remarks:  

1. The ID is referenced by the AEUXREF Case Control command and/or by AEDW, AEPRESS, and/or AEFORCE entries.   
2. The units of the user defined AEPARM controllers are implied by their use on this entry and the corresponding values on the force vector definition.The user must be self-consistent in all uses of the same controller. AESURF controllers are expressed in radians as are the rigid body angles ANGLEA and BETA. The rigid body rates, ROLL, PITCH and YAW are nondimensional rates pb/2V, qc/2V, rb/2V; respectively. V is the velocity and b and c are the reference span and chord lengths, respectively.   
3.LABELs that are part of the UX vector that are omitted in the UXVEC specification are assigned a value of 0.0.   
4.INTERCPT $=1.0$ is implied on all UXVEC input. INTERCPT $=0.0$ indicates that associated load is a perturbation.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>VCCT</td><td>ID</td><td>IDCR</td><td>ITYPE</td><td>IGROW</td><td>INCM</td><td>METHOD</td><td></td><td></td><td></td></tr><tr><td></td><td>CGI</td><td>GC</td><td></td><td></td><td></td><td></td><td>GC-II </td><td>GC-III</td><td></td></tr><tr><td></td><td>TABCGI</td><td>TABGC</td><td></td><td></td><td></td><td></td><td>TABGC-II</td><td>TABGC-III</td><td></td></tr><tr><td></td><td>G1</td><td>G2</td><td>G3</td><td>G4</td><td>G5</td><td>etc.</td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>VCCT 101</td><td>1 2</td><td>2</td><td>2 1</td><td></td><td>1</td></tr><tr><td></td><td>2000.</td><td></td><td></td><td></td><td></td></tr><tr><td>51</td><td>0 52</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Identification of a matching Case Control VCCT entry. See Remark 2. (Integer; no Default)</td></tr><tr><td>IDCR</td><td>Identification of this particular crack. IDCR must be unique among all VCCT cracks with the same ID but can replace a crack with the same IDCR. (Integer > 0; Default = 1)</td></tr><tr><td rowspan="2">ITYPE</td><td>Type of crack propagation. (Integer; Default = 0)</td></tr><tr><td> No crack propagation</td></tr><tr><td rowspan="3">IGROW</td><td>2 Direct crack propagation</td></tr><tr><td>Specifies how the crack grows. (Integer; Default = 2)</td></tr><tr><td>Uses remeshing (not presently available) Release user tyings or glued contact</td></tr><tr><td rowspan="2">INCM</td><td>2 Specifies the crack growth increment (Integer; Default = 1)</td></tr><tr><td>Uses a fixed increment or a user subroutine</td></tr><tr><td rowspan="2">METHOD</td><td> Specifies the method used for the estimated crack growth direction (Integer; Default=1)</td></tr><tr><td> Maximum hoop stress criterion (Default)</td></tr><tr><td>CGI</td><td>Crack growth increment (Real; Default = 0.0). If the option of releasing tyings or glued contact is used, the length of the released element edge is used. Leave blank for fatigue growth defined by the Paris law. (Not presently used)</td></tr><tr><td>GC</td><td>Crack growth resistance. (Real; Default = O.0)Ignored for fatigue growth. If different crack growth resistance values are needed from modes I, II, III, this is the mode I value and modes II and II are entered in fields 8 and 9. For SOL 6O0, if it is desired that the mode I crack resistance be zero, enter GC as a negative value.</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>GC-II</td><td>Crack growth resistance, Mode II (Real; Default = O.0) Ignored for fatigue growth.</td></tr><tr><td>GC-III</td><td>Crack growth resistance, Mode III (Real; Default = 0.0) Ignored for fatigue growth.</td></tr><tr><td>TABCGI</td><td> TABLEMi or TABL3Di for CGI (crack growth increment). (Integer; Default = 0)</td></tr><tr><td>TABGC</td><td> TABLEMi or TABL3Di for scaling GC (crack growth resistance). (Integer; Default = 0)</td></tr><tr><td>TABGC-II</td><td> TABLEMi or TABL3Di for scaling GC-II (Integer; Default = 0)</td></tr><tr><td>TABGC-III</td><td>TABLEMi or TABL3Di for scaling GC-III (Integer; Default = 0)</td></tr><tr><td>Gi</td><td>Grids along the crack front - for a shell there is only one node. See Remark 6. (Integer or "THRU" or “BY"; no Default; at least one value, G1, must be provided.)</td></tr></table></body></html>  

Remarks:  

1. The grids entered on this entry MUST be associated with SOL40O elements that have had their capabilities extended by use of either a PSNLN1, PSNLN2, PSLDN1, PLCOMP or PCOMPLS or a combination of these entries.   
2. ID corresponds to a Case Control VCCT entry.   
3.If tables are not required, enter at least one field with a zero value. Do not enter a blank line.   
4.This entry may be repeated as many times as necessary to describe allthe cracks in the model.   
5.The $4^{\mathrm{th}}$ line may be repeated as many times as necessary to describe allgrids on the crackfront   
6.If Gl is negative, the absolute value ofG1 isused as theID ofa SET3 entry providing thelist ofgrids. For this case, G2, G3, etc. must be blank (only one SET3 ID per VCCT entry is allowed).   
7.The values of the entries on the second line that are not needed should be set to O.0 or blank. If no tables are required to specify the variation with time, temperature or some other variable, one or all of the table entries on the third line can be set to zero or blank.   
8.If TABLEMl is used, accumulated crack growth will be used for the X coordinates instead of the usual value of temperature.  

Provides data to simulate crack growth using virtual crack closure technology methods in SOL 600.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>VCCT</td><td>ID</td><td>IDCR</td><td>ITYPE</td><td>IGROW</td><td>INCM</td><td>METHOD</td><td>TIME</td><td>IACT</td></tr><tr><td></td><td>CGI</td><td>GC</td><td>GTH</td><td>C</td><td>M</td><td>GMIN</td><td>GC-II</td><td>GC-III</td></tr><tr><td></td><td>TABCGI</td><td>TABGC</td><td>TABGTH</td><td>TABC</td><td>TABM</td><td>TABGMIN</td><td>TABGC-II</td><td>TABGC-III</td></tr><tr><td></td><td>G1</td><td>G2</td><td>G3</td><td>G4</td><td>G5</td><td>etc.</td><td></td><td></td></tr></table></body></html>  

Alternate Format:   


<html><body><table><tr><td>VCCT</td><td>ID</td><td>IDCR</td><td>ITYPE</td><td>IGROW</td><td>INCM</td><td>METHOD</td><td>TIME</td><td>IACT</td><td></td></tr><tr><td></td><td>CGI</td><td>GC</td><td>GTH</td><td>C</td><td>M</td><td>GMIN</td><td>GC-II</td><td>GC-III</td><td></td></tr><tr><td></td><td>TABCGI</td><td>TABGC</td><td>TABGTH</td><td>TABC</td><td>TABM</td><td>TABGMIN</td><td>TABGC-II</td><td>TABGC-III</td><td></td></tr><tr><td></td><td>G1</td><td>THRU</td><td>G2</td><td>BY</td><td>G3</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>VCCT</td><td>101</td><td>1 2000.</td><td>2</td><td>2</td><td>2</td><td>1</td><td></td><td>1</td></tr><tr><td></td><td></td><td>0</td><td>12. 0</td><td>4. 0</td><td>2.0 0</td><td></td><td></td><td></td></tr><tr><td></td><td>51</td><td>52</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ID</td><td>Identification of a matching Case Control VCCT entry. See Remark 2. (Integer; no Default)</td></tr><tr><td>IDCR</td><td>Identification of this particular crack. IDCR must be unique among all VCCT cracks with the same ID but can replace a crack with the same IDCR and a different ID using the IACT field. (Integer > 0; Default = 1)</td></tr><tr><td>ITYPE (6-1)</td><td>Type of crack propagation. (Integer; Default = 2)</td></tr><tr><td></td><td> No crack propagation</td></tr><tr><td></td><td>Fatigue type crack propagation</td></tr><tr><td></td><td>Direct crack propagation</td></tr><tr><td>IGROW (6-2)</td><td>How crack grows (Integer; Default = 2)</td></tr><tr><td></td><td>Uses remeshing (not presently available)</td></tr></table></body></html>  

<html><body><table><tr><td colspan="2"></td></tr><tr><td>Describer</td><td>Meaning Release user tyings or glued contact</td></tr><tr><td>INCM</td><td>2 Specifies the crack growth increment (Integer; Default = 2)</td></tr><tr><td>(6-3)</td><td></td></tr><tr><td></td><td>1 Uses a fixed increment or a user subroutine 2 Uses Paris law</td></tr><tr><td>METHOD</td><td> Specifies the method used for the estimated crack growth direction (Integer; Default=1)</td></tr><tr><td>(6-4)</td><td></td></tr><tr><td>TIME</td><td>Maximum hoop stress criterion (Default) Time period for fatigue load sequence. (Real; no Default) Only enter if ITYPE=1 <</td></tr><tr><td>(6-5) IACT</td><td> Flag for activating or deactivating an existing crack (Integer; Default = 0)</td></tr><tr><td>(3-1)</td><td>0</td></tr><tr><td></td><td>Leave as is</td></tr><tr><td></td><td>Activate Deactivate</td></tr><tr><td>CGI (7-1)</td><td>2 Crack growth increment (Real; Default = 0.0). If the option of releasing tyings or glued contact is used, the length of the released element edge is used. Leave blank for fatigue</td></tr><tr><td>GC</td><td>growth defined by the Paris law. Crack growth resistance. (Real; Default = 0.0)Ignored for fatigue growth. If different crack growth resistance values are needed from modes I, II, II, this is the mode I value</td></tr><tr><td>(7-2) GTH</td><td>and modes II and III are entered in fields 8 and 9. Paris law energy release rate threshold. (Real; Default = 0.0)</td></tr><tr><td>(7-3) C</td><td> Paris law parameter C. (Real; Default = 0.0) Only enter if INCM=2</td></tr><tr><td>(7-4) M</td><td>Paris law parameter m. (Real; Default = 0.0) Only enter if INCM=2</td></tr><tr><td>(7-5) GMIN</td><td> Minimum growth increment. (Real; Default = 0.0) Only enter if INCM=2</td></tr><tr><td>(7-6) GC-II (7-4)</td><td>Crack growth resistance, Mode II (Real; Default = 0.0) Ignored for fatigue growth.</td></tr><tr><td>GC-III</td><td>Crack growth resistance, Mode II (Real; Default = O.0) Ignored for fatigue growth.</td></tr><tr><td>TABCGI (8-1)</td><td> TABLEMi or TABL3Di for CGI (crack growth increment). (Integer; Default = 0)</td></tr><tr><td>TABGC (8-2)</td><td> TABLEMi or TABL3Di for scaling CG (fracture toughness). (Integer; Default = 0)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>TABGTH (8-3)</td><td>TABLEMi or TABL3Di for scaling GTH (Paris law energy release rate) (Integer; Default = 0)</td></tr><tr><td>TABC (8-4)</td><td> TABLEMi or TABL3Di for scaling C (Paris law parameter C). (Integer; Default = 0)</td></tr><tr><td>TABM (8-5)</td><td> TABLEMi or TABL3Di for scaling M (Paris law parameter m). (Integer; Default = 0)</td></tr><tr><td>TABGMIN (8-6)</td><td>TABLEMi or TABL3Di for scaling GMIN (Minimum growth increment). (Integer; Default = 0)</td></tr><tr><td>TABGC-II</td><td> TABLEMi or TABL3Di for scaling GC-II (Integer; Default = 0)</td></tr><tr><td>TABGC-III</td><td> TABLEMi or TABL3Di for scaling GC-III (Integer; Default = 0)</td></tr><tr><td>Gi (5-i)</td><td>Grids along the crack front -for a shell there is only one node. (Integer; no Default; at least one value, G1, must be provided. See Remark 6.)</td></tr></table></body></html>  

Remarks:  

1. This entry corresponds to Marc's VCCT model definition and history definition options.   
2. (i,j) corresponds to Marc Vol C VCCT entry ith datablock jth field   
3. ID corresponds to a Case Control VCCT command. Set $\scriptstyle\mathrm{ID=0}$ to enter VCCT entries into Marc's model definition.   
4.If tables are not required, enter at least one field with a zero value. Do not enter a blank line.   
5. This entry may be repeated as many times as necessary to describe all the cracks in the model.   
6.The $4^{\mathrm{th}}$ line may be repeated as many times as necessary to describe allgrids on thecrack front   
7.If the Alternate Format is used, entries may only be made in the fields indicated, however this line may be repeated as many times as necessary to describe all grids on the crack front.   
8.IfG1 is negative, the absolute value ofG1 isused as the ID ofa SET3entry providing thelist of grids. For this case, G2, G3, etc. must be blank (only one SET3 ID per VCCT entry is allowed). 9.Most analyses do not use allof the entries on the second line, however a meaningful analysis will specify one or more of these values. Those not needed should be set to O.O or blank. If no tables are required to specify the variation with time, temperature or some other variable, one or allof the table entries on the third line can be set to zero or blank.   
10. If TABLEMl is used, accumulated crack growth will be used for the X coordinates instead of the usual value of temperature.  

Defines radiation cavity and shadowing for radiation view factor calculations.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>VIEW</td><td>IVIEW</td><td>ICAVITY</td><td>SHADE</td><td>NB</td><td>NG</td><td>DISLIN</td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>VIEW</td><td>1</td><td>1</td><td>BOTH</td><td>2</td><td>3</td><td>0.25</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>IVIEW</td><td>Identification number. (Integer > 0)</td></tr><tr><td>ICAVITY</td><td>Cavity identification number for grouping the radiant exchange faces of CHBDYi elements. (Integer > 0)</td></tr><tr><td rowspan="4">SHADE</td><td> Shadowing flag for the face of CHBDYi element. (Character; Default = “BOTH")</td></tr><tr><td>NONE means the face can neither shade nor be shaded by other faces.</td></tr><tr><td>KSHD means the face can shade other faces.</td></tr><tr><td>KBSHD means the face can be shaded by other faces. BOTH means the face can both shade and be shaded by other faces. (Default)</td></tr><tr><td>NB</td><td>Subelement mesh size in the beta direction. (Integer > O; Default = 1)</td></tr><tr><td>NG</td><td> Subelement mesh size in the gamma direction. (Integer > O; Default = 1)</td></tr><tr><td>DISLIN</td><td>The displacement of a surface perpendicular to the surface. See Figure 9-168. (Real; Default = 0.0)</td></tr></table></body></html>  

Remarks:  

1. VIEW must be referenced by CHBDYE, CHBDYG, or CHBDYP elements to be used.   
2.ICAVITY references the cavity to which the face of the CHBDYi element belongs; a zero or blank value indicates this face does not participate in a cavity.   
3. NB, NG, and DISLIN are used in the calculation of view factors by finite difference or contour integration techniques. They are not used with the VIEW3D entry.   
4. A summary of the shadowing conditions can be requested by the PARAM,MESH,YES Bulk Data entry.   
5. SHADE references shadowing for CHBDYi elements participating in a radiation cavity, the VIEW calculation can involve shadowing.  

6. DISLIN should only be used with LINE type CHBDYE and CHBDYP surface elements. DISLIN $>0.0$ means into the cavity. See Figure 9-168.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/6841a28e59d62536f472b703af9dec5091a4ace2606a1c92e05e75682b30b98f.jpg)  
Figure 9-168 DISLIN Convention  

7. NB and NG define the subelement mesh refinement when using the VIEW module (as opposed to the VIEW3D module) for the calculation of view factors.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/d7c1be41312ef04b47b1b2c27ae8edd27cd6f7a416501f779f394ef5201dcf85.jpg)  
Figure 9-169 Typical AREA4 surface element where $N B=2$ and $N G=4$  

8. For RC network solver in thermal analysis, the SHADE, NB, NG and DISLIN are ignored.  

Defines parameters to controland/or request the Gaussan Integration method of view factor calculation for a specified cavity.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>VIEW3D</td><td>ICAVITY</td><td>GITB</td><td>GIPS</td><td>CIER</td><td>ETOL</td><td>ZTOL</td><td>WTOL</td><td>RADCHK</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>VIEW3D</td><td>1</td><td>2</td><td>2</td><td>4</td><td></td><td>1.0E-6</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ICAVITY</td><td>Radiant cavity identification number on RADCAV entry. (Integer > 0)</td></tr><tr><td>GITB</td><td>Gaussian integration order to be implemented in calculating net effective view factors in the presence of third-body shadowing. (Integer 2, 3, 4, 5, 6 or 10; Default = 4)</td></tr><tr><td>GIPS</td><td>Gaussian integration order to be implemented in calculating net effective view factors in the presence of self-shadowing. (Integer 2, 3, 4, 5, 6 or 10; Default = 4)</td></tr><tr><td>CIER</td><td>Discretization level used in the semi-analytic contour integration method. (1 ≤ Integer ≤ 20; Default = 4)</td></tr><tr><td>ETOL</td><td>Error estimate above which a corrected view factor is calculated using the semi-analytic contour integration method. (Real ≥ 0.O; Default = 0.1)</td></tr><tr><td>ZTOL</td><td>Assumed level of calculation below which the numbers are considered to be zero. (Real ≥ 0.0; Default = 1.E-10)</td></tr><tr><td>WTOL</td><td>Assumed degree of warpage above which the actual value of Fi; will be calculated. (0.0 ≤ Real ≤ 1.0; Default = 0.01)</td></tr><tr><td>RADCHK</td><td>Type of diagnostic output desired for the radiation exchange surfaces. (Integer; Default = 3)</td></tr><tr><td></td><td>-1 No diagnostic output requested</td></tr><tr><td>1 2</td><td>Grid table and element connectivity</td></tr><tr><td></td><td>Surface Diagnostics - Surface type, area, skewnes, taper, warpage, grid point sequencing, aspect ratio, and shading flags.</td></tr><tr><td>3</td><td>Area, view factor, area-view factor product with error estimate, existence flags for partial self-shadowing, third-body shadowing with error estimate, and enclosure summations for view factor. (Default)</td></tr><tr><td>0</td><td>Same as RADCHK = 1,2, and 3</td></tr><tr><td>12</td><td>Same as RADCHK = 1 and 2</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td><td></td></tr><tr><td></td><td>13</td><td>Same as RADCHK = 1 and 3</td></tr><tr><td></td><td>23</td><td>Same as RADCHK = 2 and 3</td></tr></table></body></html>  

## Remarks:  

1. For ETOL, when the error estimate exceeds the value input for the ETOL entry,the contour methoc is employed to develop an improved view factor.   
2. For ZTOL, the use of a geometry scale that results in small numerical values of $A_{i}F_{i j}$ should be avoided.   
3. When WTOL is exceeded, the actual value of $F_{i i}$ will be calculated when using the adaptive view module.Warpagewillnot be considered inthecalculationof $\boldsymbol{F}_{i j}$ ，   
4. For axisymmetric analysis, ${\mathrm{RADCHK}}=-1$ or 3 only. Defines the radiation solver and corelating solver parameters for radiation calculations in RC heat transfer.   
Note: You must have a copy of the external radiation code to use it.  

Format: (NEVADA)  

Example:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>５</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>VIEWEX</td><td>ICAVITY</td><td>Run Interactively</td><td>RADK Distro Method</td><td>Orbital</td><td>Re-use existing results</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“NEVADA”</td><td>RENO Reflection</td><td>Restart</td><td>Reno Ray count</td><td>Vegas Ray count</td><td>Cutoff Energy</td><td>Confidence</td><td>GRID closure</td><td></td></tr><tr><td></td><td></td><td>GRID iterations</td><td>Time Scale</td><td>RADK cutoff</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>VIEWEX 2</td><td>T</td><td>FULL</td><td>T</td><td>F</td><td></td><td></td></tr><tr><td>NEVADA</td><td>T</td><td>T</td><td>5000</td><td>5000</td><td>-3 99.</td><td>0.001</td></tr><tr><td></td><td>300</td><td>1.0</td><td>1.0-8</td><td></td><td></td><td></td></tr></table></body></html>  

Format: (TSS)  

Example:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>VIEWEX</td><td>ICAVITY</td><td>Run Interactively</td><td>RADK Distro Method</td><td>Orbital</td><td>Re-use existing results</td><td></td><td></td><td></td></tr><tr><td></td><td>“TSS"</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>VIEWEX</td><td>3 TSS</td><td>T</td><td>FULL</td><td>T</td><td>F</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Format: (THERMICA)  

Example:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>９</td><td>10</td></tr><tr><td>VIEWEX</td><td>ICAVITY</td><td>Run Interactively</td><td>RADK Distro Method</td><td>Orbital</td><td>Re-use existing results</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>"THERMIC A”</td><td>Solar Flux</td><td>Planet Albedo</td><td>Planet BlackBody</td><td>Restart</td><td>Suppress VF Articulation</td><td>Radiation ray count</td><td>Orbital flux ray count</td><td></td></tr><tr><td></td><td></td><td>Confidence</td><td>Time scale</td><td>RADK cutoff</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>VIEWEX</td><td>4</td><td>T</td><td>FULL</td><td>T</td><td>F</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td></td><td>THERMICA</td><td>1380.0</td><td>0.3</td><td>-19.0</td><td>T</td><td>F</td><td>5000</td><td>5000</td></tr><tr><td></td><td></td><td>99.0</td><td>1.0</td><td>1.0-8</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Format: (TRASYS)  

Example:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>５</td><td>6</td><td>7</td><td>8 9</td><td>10</td></tr><tr><td>VIEWEX</td><td>ICAVITY</td><td>Run Interactively</td><td>RADK Distro Method</td><td>Orbital</td><td>Re-use existing results</td><td></td><td></td><td></td></tr><tr><td></td><td>“TRASYS”</td><td>Axi Radial mesh</td><td>Axi Axial mesh</td><td>Axi Angular mesh</td><td>Time scale</td><td>RADK cutoff</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>VIEWEX</td><td>5 TRASYS</td><td>T 1</td><td>FULL 1</td><td>T 4</td><td>F 1.0</td><td>1.0-8</td><td></td><td></td></tr></table></body></html>  

Format: (SRR)  

Example:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8 9</td><td></td><td>10</td></tr><tr><td>VIEWEX</td><td>ICAVITY</td><td>Run Interactively</td><td>RADK Distro Method</td><td>Orbital</td><td>existing results Re-use</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>“SRR”</td><td>Gebhart Solver</td><td>Convergence Tol</td><td>Max Iter</td><td>Fij smoothing method</td><td>Fij Filter cutoff</td><td>Fij Smothing Tol</td><td>Fij Smooth Iter</td><td></td></tr><tr><td></td><td></td><td>Bij smoothing method</td><td>Bij Filter cutoff</td><td>Bij Tol Smoothing</td><td>Bij Max Iter</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td rowspan="2">VIEWEX</td><td>6</td><td>T</td><td>FULL</td><td>T</td><td>F</td><td></td><td></td></tr><tr><td>SRR</td><td>GS</td><td>1.0-5</td><td>50</td><td>CROP 1.0-8</td><td>1.0-4 50</td><td></td></tr><tr><td></td><td></td><td>CROP</td><td>1.0-8</td><td>1.0-4</td><td>50</td><td></td><td></td></tr></table></body></html>  

Format: (SRQ)  

Example:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>VIEWEX</td><td>ICAVITY</td><td>Run Interactively</td><td>RADK Distro Method</td><td>Orbital</td><td>Re-use existing results</td><td></td><td></td><td></td></tr><tr><td></td><td>“SRQ”</td><td>Flux solver</td><td>Convergence Tol</td><td>Max Iter</td><td>Fij smoothing method</td><td>Filter cutoff</td><td>Fij Smoothing Tol</td><td>Fij Smooth Iter</td></tr></table></body></html>  

<html><body><table><tr><td>VIEWEX</td><td>7</td><td>T</td><td>FULL</td><td>T</td><td>F</td><td></td><td></td><td></td></tr><tr><td></td><td>SRQ</td><td>GS</td><td>1.0-5</td><td>50</td><td>CROP</td><td>1.0-8</td><td>1.0-4</td><td>50</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>ICAVITY</td><td>Cavity identification number (Integer > O; Required)</td></tr><tr><td>Run Interactively</td><td>Run the radiation code interactively (Character; “T” or “F", Default “F") Do not currently have batch mode for Thermica or TSS Do not have interactive mode for TRASYS</td></tr><tr><td></td><td>RADK Distro Method How to redistribute RADK onto elements.(Character; “FULL",“AREA",or "DIRECT"; Default “FULL")</td></tr><tr><td>Orbital</td><td>Use orbital analysis for radiation (Character; “T" or “F"; Default “F") Not supported in SindaRad</td></tr><tr><td>Re-use existing results</td><td> Re-use previous radiation results (Character; “T" or“F"; Default “F")</td></tr><tr><td>“NEVADA"</td><td>Identification that NEVADA will be used (Character)</td></tr><tr><td>RENO Reflection</td><td>Use reflection method of ray tracing for RADK (Character; “T" or “F"; Default “T")</td></tr><tr><td>Restart</td><td>Use Restart (Character; “T” or“F"; Default “F")</td></tr><tr><td> Reno Ray count</td><td> Number or rays cast for Reno module (Integer > O; Default 5000)</td></tr><tr><td>Vegas Ray count</td><td>Number or rays cast for Vegas module (Integer > 0; Default 5000)</td></tr><tr><td>Energy Cutoff</td><td>Energy cutoff level (Integer; Default -3)</td></tr><tr><td>Confidence</td><td>Confidence Level % (Real > 0.0; Default 99.0)</td></tr><tr><td>GRID closure</td><td>GRID closure tolerance (Real > 0.0; Default 0.001)</td></tr><tr><td>GRID iterations</td><td> Maximum GRID iterations (Integer > O; Default 300)</td></tr><tr><td>Time Scale</td><td>Orbital time scale factor, number of time units in an hour. Ex. If using seconds, value would be 3600.0. (Real > 0.0; Default 1.0)</td></tr><tr><td>RADK cutoff</td><td>RADK filter smallest element (Real ≥ 0.0; Default 1.0e-8)</td></tr><tr><td>“TSS"</td><td>Identification that TSS will be used (Character)</td></tr><tr><td>“THERMICA"</td><td>Identification that THERMICA will be used (Character)</td></tr><tr><td>Solar Flux</td><td>Quantity of solar flux (Real > 0.0; Default 1380.0 W/m2)</td></tr><tr><td>Planet Albedo</td><td>Planetary Albedo (Real; Default 0.3; assumes Earth orbit)</td></tr><tr><td>Planet BlackBody</td><td>Planet Blackbody (Real; Default -19.0; assumes Earth orbit)</td></tr><tr><td>Restart</td><td>Use Restart option (Character, “T" or“F"; Default“F")</td></tr><tr><td>Suppress VF Articulation</td><td> Suppress view factor articulation (Character; “T” or “F"; Default “T")</td></tr><tr><td>Radiation ray count</td><td> Number or rays cast for radiation calculation (Integer > O; Default 5000)</td></tr><tr><td>Orbital flux ray count</td><td> Number or rays cast for orbital flux (Integer > O; Default 5000)</td></tr><tr><td>Confidence</td><td>Confidence Level % (Real > 0.0; Default 99.0)</td></tr><tr><td>Time Scale</td><td>Orbital time scale factor, number of time units in an hour. Ex.If using seconds, value would be 3600.0. (Real > 0.0; Default 1.0)</td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>RADK cutoff</td><td>RADK filter smallest element (Real ≥ 0.0; Default 1.0e-8)</td></tr><tr><td>“TRASYS"</td><td>Identification that TRASYS will be used (Character)</td></tr><tr><td>Axi Radial mesh</td><td>Axisymmetric element mesh in radial direction (Integer > O; Default 1)</td></tr><tr><td>Axi Axial mesh</td><td>Axisymmetric element mesh in axial direction (Integer > O; Default 1)</td></tr><tr><td>Axi Angular mesh</td><td>Axisymmetric element mesh in angular direction (Integer > O; Default 4)</td></tr><tr><td>Time Scale</td><td>Orbital time scale factor, number of time units in an hour. Ex. If using seconds, value would be 3600.0. (Real > 0.0; Default 1.0)</td></tr><tr><td>RADK cutoff</td><td>RADK filter smallest element (Real ≥ 0.0; Default 1.0e-8)</td></tr><tr><td>“SRR”</td><td>Identification that the SindaRad RADK method will be used (Character)</td></tr><tr><td>Gebhart Solver</td><td>Which RADK solver to use (Character; “GS” or “FGS"; Default “GS")</td></tr><tr><td>Convergence Tol</td><td> Tolerance for convergence of RADK calculation (Real ≥ 0.0; Default 1.0e-5)</td></tr><tr><td>Max Iter</td><td>Maximum allowable iterations to converge (Integer > O; Default 50)</td></tr><tr><td>Fij smoothing method</td><td> How to filter view factors (Character; “CROP" or “HIGH"; Default “CROP")</td></tr><tr><td>Fij Filter cutoff</td><td>Parameter for filter (Real > 0.0; Default 1.0e-8)</td></tr><tr><td>Fij Smoothing Tol</td><td>Tolerance for smoothing (Real ≥ 0; Default 1.0e-4)</td></tr><tr><td>Fij Smooth Iter</td><td> Maximum allowable iterations to smoothing (Integer > O; Default 50)</td></tr><tr><td></td><td>Bij smoothing methodHow to filter conductors (Character; “CROP" or“HIGH"; Default “CROP")</td></tr><tr><td>Bij Filter cutoff</td><td>Parameter for filter (Real > 0.0; Default 1.0e-8)</td></tr><tr><td>Bij Smoothing Tol</td><td>Tolerance for smoothing (Real ≥ 0; Default 1.0e-4)</td></tr><tr><td>Bij Max Iter</td><td> Maximum allowable iterations to smoothing (Integer > 0; Default 50)</td></tr><tr><td>“SRQ”</td><td>Identification that the SindaRad QRad method will be used (Character)</td></tr><tr><td>Flux Solver</td><td>Which QRad solver to use (Character, “GS” or “CG"; Default “GS")</td></tr><tr><td>Convergence Tol</td><td>Tolerance for convergence of QRad calculation (Real ≥ 0.0; Default 1.0e-5)</td></tr><tr><td>Max Iter</td><td> Maximum allowable iterations to converge (Integer > 0; Default 50)</td></tr><tr><td>Fij smoothing method</td><td> How to filter view factors (Character, “CROP” or “HIGH"; Default “CROP")</td></tr><tr><td>Fij Filter cutoff</td><td> Parameter for filter (Real > 0.0; Default 1.0e-8)</td></tr><tr><td>Fij Smoothing Tol</td><td>Tolerance for smoothing (Real ≥ 0; Default 1.0e-4)</td></tr><tr><td>Fij Smooth Iter</td><td> Maximum allowable iterations to smoothing (Integer > 0; Default 50)</td></tr></table></body></html>  

Remarks:  

1. This entry is for RC Network solver only   
2. Each entry type is designed for one specific radiation solver, except the very lasttwo types, which are for SindaRad's two options.  

NEVADA TSS THERMICA TRASYS SINDARad RADK method SINDARad Q method 3.For more details about the parameters in the entry,please reference SINDA for Patran User's Guide and the SINDARad User's Guide. 4. MSC provides these radiation programs on Windows only.  

Defines arigid plane through which specified Lagrangian grid points cannot penetrate. Finite or infinite size (FINITE), Orthotropic friction (ORTHO) a mass and an initial velocity (MOVING) and Force output option (FORCES) can be defined. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>WALL</td><td>ID</td><td>XP</td><td>YP</td><td>ZP</td><td>NX NY</td><td>NZ</td><td>BCGRID</td><td></td></tr><tr><td></td><td>METHOD</td><td>FS</td><td>FK</td><td>EXP</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>WALL 17 PENALTY</td><td>0.2</td><td></td><td></td><td></td><td></td><td>1.0</td><td>21</td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td colspan="2">Meaning</td></tr><tr><td>ID</td><td colspan="2">Unique rigid-wall number. (Integer > O; Required)</td></tr><tr><td>XP, YP, ZP</td><td colspan="2">Coordinates of the origin of the wall. (Real; Default = 0.0)</td></tr><tr><td>NX,NY, NZ</td><td colspan="2"> A vector normal to the wall pointing towards the model. (Real; Default = 0.0)</td></tr><tr><td>BCGRID</td><td colspan="2"> Number of a BCGRID entry listing the points that cannot penetrate the wall. (Integer</td></tr><tr><td rowspan="3">METHOD</td><td colspan="2">> O; Required) Algorithm for contact processing. (Character; Default = PENALTY)</td></tr><tr><td>PENALTY and output.</td><td> Penalty method, allowing for extra boundary conditions, friction</td></tr><tr><td>KINMATIC</td><td>Kinematic method, only included for compatibility reasons with older Dytran versions. This method allows no extra boundary</td></tr><tr><td>FS</td><td colspan="2">conditions, no friction and no output. Static coefficient of friction. See Remark 5. (Real ≥ 0; Default = 0.0)</td></tr><tr><td>FK</td><td colspan="2">Kinetic coefficient of friction. See Remark 5. (Real ≥ O; Default = 0.0)</td></tr><tr><td>EXP</td><td colspan="2">Exponential decay coefficient. See Remark 5. (Real ≥ 0; Default = 0.0)</td></tr></table></body></html>  

## Remarks  

1.A rigid plane of infinite size is generated that the grid points cannot penetrate. The plane is fixed in space.   
2. The grid points can slide on the wall and separate from it.   
3.A (moving) rigid plane of finite size can be modeled by using a rigid surface and a master-slave contact.  

4. For the walldefinition using penalty method, output can be requested by referencing it in a SET command in the Case Control Section. The keywords for output are WALLS and WALLOUT. Please check $\$5700$ ·  

5. The coefficient of friction is given by:  

$$
\upmu\ =\ \upmu_{k}+(\upmu_{s}-\upmu_{k})e^{-\upbeta\nu}
$$  

where  

$\begin{array}{r l}{\upmu_{s}}&{{}=}\end{array}$ Static coefficient of friction FS.   
${\upmu_{k}}\mathrm{~=~}$ Kinetic coefficient of friction FK.   
$\begin{array}{r l}{\upbeta}&{{}=}\end{array}$ Exponential decay coefficient EXP.   
$\begin{array}{r l}{\mathbf{\nabla}\nu}&{{}=}\end{array}$ Relative sliding velocity at the point of contact.  

Specifies values for modeling mechanical wear in deformable contact bodies for SOL 600 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>WEAR</td><td>BID</td><td>Model</td><td>IUPD</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>COEF</td><td>HARD</td><td>SEXP</td><td>VEXP</td><td>B</td><td>SFGU</td><td></td><td></td><td></td></tr><tr><td></td><td>T(COEF)</td><td>T(HARD)</td><td>T(SEXP)</td><td>T(VEXP)</td><td>T(B)</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>WEAR</td><td>3</td><td>2</td><td>1</td><td></td><td></td><td></td></tr><tr><td></td><td>3.6</td><td>200.</td><td>1.1</td><td>1.2 .087</td><td>1.0</td><td></td></tr><tr><td></td><td>22</td><td>23</td><td>24</td><td>25 26</td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>BID</td><td rowspan="2">BCBODY ID for which this wear entry applies. (Integer > O; no Default; see Remark 2) Wear model. (Integer > 0; Default = 1, see Remark 1)</td></tr><tr><td>MODEL</td></tr><tr><td>IUPD</td><td>Geometry update due to wear flag. (Integer; Default = 0)</td></tr><tr><td>0</td><td>Do not update the geometry</td></tr><tr><td></td><td>1 Update the geometry</td></tr><tr><td>COEF</td><td>Wear coefficient. (Real; no Default)</td></tr><tr><td>HARD</td><td>Material hardness. (Real; no Default)</td></tr><tr><td>SEXP</td><td>Stress exponent. (Real; Default = 1.0)</td></tr><tr><td>VEXP</td><td>Velocity exponent. (Real; Default = 1.0)</td></tr><tr><td>B</td><td>Thermal activation constant. (Real; Default = 1.0)</td></tr><tr><td>SFGU</td><td>Scale factor for geometry update. (Real; Default = 1.0)</td></tr><tr><td>T(COEF)</td><td> TABL3D ID for the wear coefficient. (Integer; Default = O, meaning no table variation)</td></tr><tr><td>T(HARD)</td><td> TABL3D ID for the material hardness. (Integer; Default = 0, meaning no table variation)</td></tr><tr><td>T(SEXP)</td><td> TABL3D ID for the stress exponent. (Integer; Default = O; meaning no table variation)</td></tr><tr><td>T(VEXP)</td><td> TABL3D ID for the velocity exponent. (Integer; Default = 0, meaning no table variation)</td></tr><tr><td>T(B)</td><td>TABL3D ID for the thermal activation constant. (Integer; Default = 0, meaning no table variation)</td></tr></table></body></html>  

## Remarks:  

The following wear models are available   
$\dot{w}=\frac{K}{H}\upsigma\upnu_{r e l}\qquad\mathrm{Archard~base~model}$   
$\dot{w}=\frac{K}{H}\upsigma^{m}\upnu_{r e l}^{n}$ Archard model; Bayer exponential form -B K n T Archard model; exponential form with thermal activation   
w F9 Vrele  

2. BID may also point the ID in field 2 of BCPROP, BCMATL or BCBOX.  

Defines a wetted element used in OpenFSI fluid structure interaction simulations in SOL 400 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>WETELME</td><td>WEID</td><td>EID</td><td>SIDE</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>WETELME</td><td>10001</td><td>34</td><td>3</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>WEID</td><td>Wetted element identification number. (Integer > O; no Default)</td></tr><tr><td>EID</td><td>Structural element identification number, which corresponds to a surface element</td></tr><tr><td></td><td>CQUAD4, CQUAD8, CQUADR, CTRIA3, CTRIA6, CTRIAR; or a solid element CTETRA, CPENTA, or CHEXA. (Integer > O; no Default)</td></tr><tr><td></td><td></td></tr><tr><td>SIDE</td><td>Side identification number of element EID. (1 ≤ Integer ≤ 6; no Default)</td></tr></table></body></html>  

Defines a wetted element used in OpenFSI fluid structure interaction simulations in SOL 400 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>WETELMG</td><td>WEID</td><td>TYPE</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>G1</td><td>G2</td><td>G3</td><td>G4</td><td>G5</td><td>G6</td><td>G7</td><td>G8</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>WETELMG</td><td>10001</td><td>QUAD4</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>23</td><td>35</td><td>124</td><td>28</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>WEID</td><td>Wetted element identification number. (Integer > 0; no Default)</td></tr><tr><td>TYPE</td><td>Wetted element type, which can be any of TRIA3, TRIA6, QUAD4, QUAD8, LINE2 or LINE3. (Character; no Default)</td></tr><tr><td>G1, ..., G8</td><td>Grid point identification numbers for the wetted surface element WEID. (Integer > 0; no Default)</td></tr></table></body></html>  

## WETLOAD  

Defines theload set and associated wetted surface for OpenFSI fluid structure interaction simulations in SOL 400 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6 7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>WETLOAD</td><td>WLID</td><td>WSID</td><td>SERV_ID</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:  

<html><body><table><tr><td>WETLOAD</td><td>1</td><td>1001</td><td>scafsi</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>WLID</td><td>Load set ID, referenced by the EXCITEID field in the TLOAD entry. (Integer > 0; no Default)</td></tr><tr><td>WSID</td><td>Wetted surface identification number. The wetted surface must be defined in the WETSURF Bulk Data entry. (Integer > O; no Default)</td></tr><tr><td>SERV_ID</td><td>OpenFSI SCA service name associated with the wetted surface loads. The OpenFSI SCA service is defined using the CONNECT SERVICE FMS entry. (Character; no Default)</td></tr></table></body></html>  

Remarks:  

1. To activate WETLOAD, the following entries must be present and referenced:  

a. The load set ID WLID must be referenced by a TLOADl entry.   
b. The TLOAD1 entry must be referenced by a DLOAD Case Control command or a DLOAD Bulk Data entry, which in turn is referenced by a DLOAD Case Control command.   
c. The TLOAD1 entry must reference a TABLED1 entry.   
d. The TABLED1 entry must have constant values and be the same for all TLOAD1 entries referenced by the WETLOAD entries used within the same service.  

Procedures a - d are required in the Nastran load generator processes. Their values do not really influence theload calculation of WETLOAD in OpenFSI. Please refer to the remarks below to apply WETLOAD(s) to OpenFSI.  

2. The SERV_ID string must be 8 characters or less  

3. For multiple WETLOAD entries with same SERV_ID,the wet surfaces in WSID will be merged together for the service and the WLID in the first WETLOAD entry willreplace other entries WLID.  

4. In the current implementation, all OpenFSI services in a model are active and participate in the calculation. The TLOAD1 and DLOAD selection in case control are not applied on OpenFSI services.  

5. For OpenFSI services, the scale factors in DLOAD are always taken to be constant 1.0.  

Defines a wetted surface used in OpenFSI fluid structure interaction simulations in SOL 400 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>WETSURF</td><td>WSID</td><td>WTAG</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>WEID1</td><td>WEID2</td><td>WEID3</td><td>WEID4</td><td>WEID5</td><td>WEID6</td><td>WEID7</td><td>WEID8</td><td></td></tr><tr><td></td><td>WEID9</td><td>WEID10</td><td>-etc.-</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Alternate Format:  

Example:   


<html><body><table><tr><td>WETSURF</td><td>WSID</td><td>WTAG</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>WEID1</td><td>“THRU”</td><td>WEID2</td><td>“BY”</td><td>INC</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>WETSURF</td><td>10001 5</td><td>wall1 THRU</td><td>21</td><td>BY</td><td>4</td><td></td><td></td><td></td></tr><tr><td></td><td>27</td><td>30</td><td>33</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>35</td><td>THRU</td><td>44</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>67</td><td>68</td><td>70</td><td>72</td><td>77</td><td>82</td><td>86</td><td>79</td></tr><tr><td></td><td>89</td><td>THRU</td><td>110</td><td>BY</td><td>3</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>WSID</td><td>Wetted surface identification number. (Integer > O; no Default)</td></tr><tr><td>WTAG</td><td>Wetted surface tag name exported to an external code using the OpenFSI SCA interface. (Character; no Default)</td></tr><tr><td>WEID1,</td><td>Wetted element identification numbers defined using the WETELMG or WETELME</td></tr><tr><td>WEID2,... THRU,BY</td><td>Bulk Data entries. (Integer > 0; no Default) Keywords to specify a range of wetted elements. (Character; no Default)</td></tr><tr><td>INC</td><td>Increment to use with the “THRU" and “BY" keywords. (Integer; Default = 1)</td></tr></table></body></html>  

Defines a yield model with zero yield stress. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>YLDHY</td><td>YID</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>YLDHY 200</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>YID</td><td>Unique yield-model number referenced from a MATDEUL entry. (Integer > 0; Required)</td></tr></table></body></html>  

Remark:  

1. This yield model should be used for fluids that have no shear strength.   
2. YID must unique among all YLDxx entries in one model.  

## YLDJC  

Defines a Johnson-Cook yield model where the yield stressis a function of effective plastic strain, strain rate, and temperature. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>YLDJC</td><td>YID</td><td>A</td><td>B</td><td>ｎ</td><td>C</td><td>m</td><td>EPSO</td><td>CP</td><td></td></tr><tr><td></td><td>100</td><td>200E6</td><td>50.E6</td><td>0.1</td><td>.15</td><td>.95</td><td>1.</td><td>285.</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>YLDJC</td><td>TMELT</td><td>TROOM</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>1500.</td><td>273.</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>YID</td><td>Unique yield-model number referenced from a MATDEUL entry. (Integer > 0; Required)</td></tr><tr><td>A</td><td>Static yield stress. (Real ≥ 0.0; Required)</td></tr><tr><td>B</td><td>Hardening parameter. (Real; Default = 0.0)</td></tr><tr><td>n</td><td>Hardening exponent. (Real; Default = 1.0)</td></tr><tr><td>C</td><td>Strain-rate parameter. (Real; Default = 0.0)</td></tr><tr><td>m</td><td>Temperature exponent. (Real; Default = 1.0)</td></tr><tr><td>EPSO</td><td>Reference strain rate. (Real > 0.0; Default = 1.0)</td></tr><tr><td>CP</td><td>Specific heat. (Real > 0.0; Default = 1.E20)</td></tr><tr><td>TMELT</td><td>Melt temperature. (Real; Default = 1.E20)</td></tr><tr><td>TROOM</td><td>Room temperature. (Real; Default = 293.0)</td></tr></table></body></html>  

Remark:  

1. The yield stress is computed from  

$$
\upsigma_{y}=(A+B\upvarepsilon_{p}^{n})\bigg(1+C l n\bigg(\frac{\dot{\upvarepsilon}}{\dot{\upvarepsilon}_{0}}\bigg)(1-T^{\ast^{m}})\bigg)
$$  

where  

$$
\begin{array}{r l r l}{\varepsilon_{p}}&{}&{=}&{{\mathrm{effective~plastic~strain}}}\\ &{}&&{}\\ {T^{*}}&{}&{=}&{{\frac{(T-T_{r})}{(T_{m}-T_{r})}}}\end{array}
$$  

$$
{\begin{array}{r l r l}{\dot{\mathbf{c}}}&{}&&{=}&{{\mathrm{effective~strain~rate}}}\\ {\dot{\mathbf{c}}_{0}}&{}&&{=}&{{\mathrm{referenced~strain~rate}}}\\ {T}&{}&&{=}&{{\mathrm{temperature}}}\\ {T_{r}}&{}&&{=}&{{\mathrm{room~temperature}}}\\ {T_{m}}&{}&&{=}&{{\mathrm{melt~temperature}}}\end{array}}
$$  

and $A,B,n,C,$ and m are constants.  

2. The reference strain rate is per unit time.   
3. YID must unique among all YLDxx entries in one model  

Defines a Mohr-Coulomb yield model. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>YLDMC</td><td>YID</td><td>Y1</td><td>Y2</td><td>Y3</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:  

<html><body><table><tr><td>YLDMC</td><td>1</td><td>10.E5</td><td>20.E5</td><td>1.E4</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>YID</td><td>Unique yield-model number referenced from MATDEUL for Eulerian elements with shear strength. (Integer > O; Required)</td></tr><tr><td>Y1</td><td>Cap yield stress. (Real; Required)</td></tr><tr><td>Y2</td><td>Cohesion. (Real; Required)</td></tr><tr><td>Y3</td><td>Internal friction angle. (Real; Required)</td></tr></table></body></html>  

## Remarks:  

1. The yield stress depends on the pressure as ${\upsigma}_{y}={M I N}({\mathrm{Y}}1,({\mathrm{Y}}2+{\mathrm{Y}}3\cdot P))$ where Y1, Y2, Y3 are constants and $P$ is the pressure.  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/e9a4cceb8c4b67045e07b4bef1be78c09c6d3a0d2d0d9778f22313f9b0411061.jpg)  

2. This yield model is applicable only for Eulerian materials with shear strength.   
3. YID must unique among all YLDxx entries in one model.  

Defines the yield model for snow material.This entry must be used in combination with MATDEUL, EOSPOL and SHREL. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>YLDMSS</td><td>YID</td><td>KC</td><td>T</td><td>CC</td><td>AC</td><td>BC</td><td>FC</td><td>FTU</td><td></td></tr><tr><td></td><td>7</td><td>0.149</td><td>82</td><td>1E-5</td><td>0.09</td><td>0.2</td><td>0.99</td><td>82</td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>YLDMSS</td><td>ALPO DS</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>-0.37</td><td>0.0</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>YID</td><td>Unique yield model number referenced from a MATDEUL entry. (Integer > 0; Required)</td></tr><tr><td>KC</td><td>Parameter related to the angle of friction. (Real > O; Required)</td></tr><tr><td>T</td><td>Equivalent value of the snow cohesion. see Remark 5. (Real > 0; Required)</td></tr><tr><td>CC</td><td>Shape of the yield surface. See Remark 4. (Real > 0; Required)</td></tr><tr><td>AC</td><td> Hardening parameter for compression. See Remark 4. (Real > O; Required)</td></tr><tr><td>BC</td><td>Hardening parameter for compression. See Remark 4. (Real > O; Required)</td></tr><tr><td>FC</td><td>Factor to avoid singularity. See Remark 4. (0 < Real < 1; Default = 0.99)</td></tr><tr><td>FTU</td><td>Hydrostatic tensile strength. See Remark 6. (Real > 0; Default = T/3)</td></tr><tr><td>ALPO</td><td>Initial compressive volumetric plasticity strain. See Remark 4. (Real < 0; Required)</td></tr><tr><td>DS</td><td>Softening modulus. See Remark. (Real ≥ 0; Default = 0.0)</td></tr></table></body></html>  

Remarks:  

1. This material model can be used to model Snow material.   
2.In addition to deviatoric plastic strain there is also volumetric plastic strain. This volumetric strain is stored in the output variable VOLPLS. The deviatoric strain is stored in the variable EFFPLS.   
3.For detail description of each parameter in this model,the user should refer to the Theory Manual in which the mechanical properties of snow are described.   
4.If CC is set to zero then the material behaves as a Drucker-Prager model. Ac, Bc, Fcand ALPO will be ignored.  

5. The T value must be consistently converted from the cohesion data, ${C}_{D P}$ , of the Drucker-Prager model as follows:  

$$
T=C_{D P}/K_{C}
$$  

6.FTU, hydrostatic tensile strength, may not be greater than T divided by 3.Otherwise it will be set to that value.   
7. The softening modulus is used to update the hardening parameter $\boldsymbol{q}_{t}$ , see Theory Manual. It can be requested as output using FTU variable. The corresponding accumulated-plastic-volumetric-tensilestrain variable is SOFTE.   
8. This material model is valid for the Euler with Strength solver and the Multi-material Euler with Strength solver.   
9. YID must unique among all YLDxx entries in one model.  

Defines a polynomial yield model where the yield stress is a function of effective plastic strain. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>YLDPOL</td><td>YID</td><td>A</td><td>B</td><td>C</td><td>D</td><td>E</td><td>F</td><td>SMAX</td><td></td></tr></table></body></html>  

Example:  

<html><body><table><tr><td>YLDPOL</td><td>7</td><td>180.E6</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>YID</td><td>Unique yield model number referenced from MATDEUL. (Integer > 0; Required)</td></tr><tr><td>A</td><td>Initial yield parameters. (Real > 0; Required)</td></tr><tr><td>B</td><td>Coefficient B. (Real; Default = 0.0)</td></tr><tr><td>C</td><td>Coefficient C. (Real; Default = 0.0)</td></tr><tr><td>D</td><td>Coefficient D. (Real; Default = 0.0)</td></tr><tr><td>E</td><td>Coefficient E. (Real; Default = 0.0)</td></tr><tr><td>F</td><td>Coefficient F. (Real; Default = 0.0)</td></tr><tr><td>SMAX</td><td>Maximum yield stress. (Real; Default = 1.E20)</td></tr></table></body></html>  

Remarks:  

1. The yield stress is computed from $\upsigma_{y}=M I N(\upsigma_{\mathrm{max}},A+B\upvarepsilon_{p}+C\upvarepsilon_{p}^{2}+D\upvarepsilon_{p}^{3}+E\upvarepsilon_{p}^{4}+F\upvarepsilon_{p}^{5})$ where $\begin{array}{r l}{\varepsilon_{p}\ }&{=\ {\mathrm{effective~plastic~strain}}}\\ {\upsigma_{\operatorname*{max}}}&{=\ {\mathrm{maximum~yield~stress}}}\end{array}$  

and $A,B,C,D,E$ and $F$ are constants.  

2. YID must unique among all YLDxx entries in one model.  

Defines arate power law yield model where the yield stress is afunction of effctive plastic strain and strain rate. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9 10</td></tr><tr><td>YLDRPL</td><td>YID</td><td>A</td><td>B</td><td></td><td>m</td><td>C</td><td></td><td></td></tr></table></body></html>  

Example:  

<html><body><table><tr><td>YLDRPL</td><td>7</td><td>180.E6</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>YID</td><td>Unique yield model number referenced from MATDEUL. (Integer > 0; Required)</td></tr><tr><td>A</td><td>Initial yield parameters. (Real > 0; Required)</td></tr><tr><td>B</td><td>Hardening parameter. (Real; Default = 0.0)</td></tr><tr><td>N</td><td>Hardening exponent. (Real; Default = 1.0)</td></tr><tr><td>M</td><td>Strain rate exponent. (Real; Default = 1.0)</td></tr><tr><td>C</td><td> Minimum yield stress. (Real; Default = 1.E20)</td></tr></table></body></html>  

Remarks:  

1. The yield stress is computed from $\upsigma_{y}\ =\ M A X(C,A+B\mathfrak{E}_{p}^{n\cdot m})$ where $\begin{array}{r l r}{\varepsilon_{p}}&{{}=}&{{\mathrm{effective~plastic~strain}}}\\ {\dot{\varepsilon}}&{{}=}&{{\mathrm{effective~strain~rate}}}\end{array}$ and $A,B,n,m$ and $C$ are constants.  

2. YID must unique among all YLDxx entries in one model.  

Define the Steinberg-Guinan yield model where the yield stress is a function of efective plastic strain, pressure and temperature. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>YLDSG</td><td>YID</td><td>A1</td><td>A2</td><td>A3</td><td>A4</td><td>H</td><td>B</td><td>CP</td><td></td></tr><tr><td></td><td>TMELT</td><td>TROOM</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>YLDSG</td><td>7</td><td>8E+6</td><td>100E+6</td><td>110</td><td>0.5</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>1500</td><td>273</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>YID</td><td>Unique yield model number referenced from a MATDEUL entry. (Integer > 0; Required)</td></tr><tr><td>A1-A4</td><td>Yield parameters. (Real > 0; Required)</td></tr><tr><td>H, B</td><td>Yield parameters. See Remark 4. (Real; Default = 0.0)</td></tr><tr><td>CP</td><td>Specific heat. (Real > 0; Default = 1.E20)</td></tr><tr><td>TMELT</td><td>Melt temperature. (Real; Default = 1.E20)</td></tr><tr><td>TROOM</td><td>Room temperature. (Real; Default = 293.0)</td></tr></table></body></html>  

Remarks:  

1. This material model can be used to model metals for a wide range of strain rates.   
2. The yield stress is computed from  

$$
{\begin{array}{r l r l}&{A_{T}=\ A_{1}{\left(1+A_{3}\varepsilon_{p}\right)}^{d}}\\ &{\qquad\operatorname{\mathbb{C}}_{y}=\ \operatorname*{min}(A_{2},A_{T}){\Biggl[}1-H(T-T_{r})+B p{\left({\frac{\ p}{\rho_{r e f}}}\right)}^{\frac{1}{3}}{\Biggl]}}&&{T<T_{m}}\\ &{\qquad\operatorname{\mathbb{C}}_{y}=\ 0,\ T\geq T_{m}}\end{array}}
$$  

And $A_{1},...,A_{4},H$ and $B$ are constants.  

3. The reference and quasi-static strain rate are per unit time.   
4. YID must unique among all YLDxx entries in one model.  

Defines theTanimura-Mimura yield model where the yield stressis a function of effective plastic strain, strain rate and temperature. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>YLDTM</td><td>YID</td><td>A</td><td>B</td><td>C</td><td>D</td><td>M</td><td>EPSM</td><td>CP</td><td></td></tr><tr><td></td><td>TMELT</td><td>TROOM</td><td>SCR</td><td>E</td><td>K</td><td>EPSO</td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>YLDTM</td><td>7</td><td>45.6E6</td><td>19.5E6</td><td></td><td>1.0</td><td>0.001</td><td></td><td></td></tr><tr><td></td><td></td><td></td><td>4000.e6 2100.</td><td>0.5</td><td>1.0</td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>YID</td><td>Unique yield model number referenced from MATDEUL. (Integer > 0; Required)</td></tr><tr><td>A</td><td>Static yield parameter. (Real > 0; Required)</td></tr><tr><td>B</td><td>Hardening parameter. (Real; Default = 0.0)</td></tr><tr><td>C</td><td>Strain rate parameter C. (Real; Default = 0.0)</td></tr><tr><td>D</td><td>Strain rate parameter D. (Real; Default = 0.0)</td></tr><tr><td>M</td><td>Temperature exponent. (Real; Default = 0.0)</td></tr><tr><td>EPSM</td><td>Quasi-static strain rate. (Real > 0; Default = 1.0)</td></tr><tr><td>CP</td><td>Specific heat. (Real > 0; Default = 1.E20)</td></tr><tr><td>TMELT</td><td>Melt temperature. (Real; Default = 1.E20)</td></tr><tr><td>TROOM</td><td>Room temperature. (Real; Default = 293.0)</td></tr><tr><td>SCR</td><td>Critical yield stress. (Real > 0; Default = 1.0)</td></tr><tr><td>E</td><td>Strain rate parameter E. (Real; Default = 0.0)</td></tr><tr><td>K</td><td>Strain rate exponent. (Real; Default = 1.0)</td></tr><tr><td>EPSO</td><td>Reference strain rate. (Real > 0; Default = 1.0)</td></tr></table></body></html>  

Remarks:  

1. This material model can be used to model metals for a wide range of strain rates.   
2. The yield stress is computed from  

$$
\upsigma_{Y}=\bigg[A+B\upvarepsilon_{P}+\big(C+D\upvarepsilon_{P}\big)\bigg(1-\frac{A+B\upvarepsilon_{P}}{\upsigma_{c r}}\bigg)\mathrm{ln}\bigg(\frac{\dot{\upvarepsilon}}{\upvarepsilon_{s}}\bigg)\bigg]\big(1-T^{\ast}\big)+E\bigg(\frac{\dot{\upvarepsilon}}{\upvarepsilon_{0}}\bigg)^{k}
$$  

where  

$$
\begin{array}{r l r l}{\varepsilon_{p}}&{{}=}&{{\mathrm{effective~plasitic~stut}}}\\ {\sigma_{x r}}&{{}=}&{{\mathrm{cunical~yitid~strss}}}\\ {\dot{z}}&{{}-}&{{\mathrm{effective~strain~rat}}}\\ {\dot{v}_{x}}&{{}=}&{{\mathrm{qualsi.staitic~strain}}}\\ {\dot{\varepsilon}_{0}}&{{}=}&{{\mathrm{refectnces~strain~na}}}\\ {T^{n}}&{{}=}&{{\mathrm{(f-}}T,\gamma/\left(T_{n}-T_{r}\right)}\\ {\Gamma}&{{}=}&{{\mathrm{~ermperaunce)}}}\\ {T_{r}}&{{}=}&{{\mathrm{recomencunce}}}\\ {T_{m}}&{{}=}&{{\mathrm{model~ramperaturc}}}\end{array}
$$  

and $A,B,C,D;$ m, $E$ and $k$ are constants.  

3. The reference and quasi-static strain rate are per unit time.  

4. YID must unique among all YLDxx entries in one model.  

Specifies that a user subroutine is being used to define a simple yield model. Use in SOL700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>YLDUDS</td><td>YLD</td><td>GROUP</td><td>UNAME</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example: In FMS Section of the MSC Nastran input stream:  

CONNECT SERVICE myyld ‘SCA.MDSolver.Obj.Uds.Dytran.Materials' In Bulk Data:  

<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>YLDUDS</td><td>12</td><td>myyld</td><td>EXYLD</td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>YLD</td><td>Unique yield model ID. (Integer > 0; Required)</td></tr><tr><td>GROUP</td><td>The group name used for the FMS section CONNECT SERVICE statement. (Character; no Default)</td></tr><tr><td>UNAME</td><td>User subroutine name associated with the entry. (Character; default=EXYLD)</td></tr></table></body></html>  

Remarks:  

1. Only can be used for SOL 700.   
2. The YLD must be referenced by a MATDEUL or MAT1 entry.   
3. This yield model is applicable only for Euler elements with shear strength  

4. UNAME can be:  

<html><body><table><tr><td> Subroutine Name</td><td> Function</td></tr><tr><td>EXYLD</td><td>Standard user defined yield model</td></tr></table></body></html>  

5.The yield strength can depend on the amount of failure or damage of the Euler element and on the VOLPLS and SOFTE element variables. This amount of damage can be either specified by the damage variable of the FAILJC entry or by a more general failure estimate by using the FAILUDS entry with UNAME $,=$ EXFAIL2. The VOLPLS and SOFTE variables can also be filled by the YLDUDS entry and FAILUDS entry with UNAME $\L_{*}$ EXFAIL2.  

6. The damage variable is determined by either FAILJC or FAILUDS entry with UNAME $\v{x}_{\v{x}}=$ EXFAIL2 In UNAME $\v{r}_{\cdot}=$ EXYLD, the yield stress can be reduced depending on the magnitude of the damage variable. In that case the NOFAIL option should be set on the FAILJC or FAILUDS entry with UNAME $\L_{*}$ EXFAIL2.  

Defines a bilinear or piecewise-linear yield model with isotropic hardening, using the von Mises yield criterion. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>YLDVM</td><td>YID</td><td>YIELD</td><td>EH</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>TABLE</td><td>TYPE</td><td>TABY</td><td>D</td><td>P</td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>YLDVM</td><td>32</td><td>250.E6</td><td>2000.E6</td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td> Meaning</td></tr><tr><td>YID</td><td>Unique yield-model number referenced from MATDEUL. (Integer > 0; Required)</td></tr><tr><td>YIELD</td><td>Yield stress. (Real; Required)</td></tr><tr><td>EH</td><td>Hardening modulus. (Real; Default = 0.0)</td></tr><tr><td>TABLE</td><td>Number of a TABLED1 entry giving the variation of effective stress (y-value) with effective strain (x-value). See Remark 4. (Integer > 0)</td></tr><tr><td>TYPE</td><td>The type of stress and strain defined in TABLED1. (Character; Default = TRUE)</td></tr><tr><td rowspan="4"></td><td>ENG Engineering stress and strain.</td></tr><tr><td>TRUE True stress and strain.</td></tr><tr><td>PLAST True stress and plastic strain.</td></tr><tr><td>PMOD Plastic modulus and true stress.</td></tr><tr><td>TABY</td><td colspan="2">Number ofTABLEDl entry giving the variation of the scale factor for the yield stress (y- value) with the strain rate (x-value). Strain-rate effects are also specified using the Cowper- Symonds relation (see input parameters D and P). See Remark 6. (Integer > 0)</td></tr><tr><td>D</td><td colspan="2">Factor D in the Cowper-Symonds rate enhancement equation. See Remark 6. (Real ≥ 0)</td></tr><tr><td>P</td><td colspan="2">Factor P in the Cowper-Symonds rate enhancement equation. See Remark 6. (Real ≥ 0)</td></tr></table></body></html>  

Remarks:  

1. A bilinear stress-strain characteristic is used by specifying YIELD and EH:  

![](https://cdn-mineru.openxlab.org.cn/extract/7e2638f1-0573-4dde-84e4-95b224c7d60d/bb0716f87b85da686046c6dd8b39c90f218d409aed4312e892482c7e3978ba17.jpg)  

where the yield stress $\upsigma_{y}$ is given by  

$$
\upsigma_{y}=\upsigma_{0}+\frac{E E_{h}}{E-E_{h}}\upvarepsilon_{p}
$$  

where  

$\begin{array}{r l}{\upsigma_{0}}&{{}={\mathrm{\yield~stress~specified~in~the~YIELD~field}}}\\ {E}&{{}={\mathrm{\Young's~modulus}}}\\ {E_{h}}&{{}={\mathrm{\hardening~modulus~specified~in~the~EH~field}}}\\ {\upvarepsilon_{p}}&{{}={\mathrm{\equivalent~plastic~strain}}}\\ {\upsigma_{y}}&{{}={\mathrm{\yield~stress}}}\end{array}$  

2. A piecewise linear, stress-strain characteristic is used by specifying TABLE and TYPE (beams and shells only)  

$$
\upsigma_{i j}=[(\upsigma_{i}-\upsigma_{i-1})(\upvarepsilon-\upvarepsilon_{i-1})/(\upvarepsilon_{i}-\upvarepsilon_{i-1})]+\upsigma_{i+1}
$$  

The stress-strain characteristic used internally in the solver is in terms of true stress and equivalent plastic strain. However,for convenience, the stressstrain characteristic can be input in any of the following ways:  

True stress/true strain $(\mathrm{TYPE}=\mathrm{TRUE})$ Engineering stress/engineering strain $(\mathrm{TYPE}=\mathrm{ENG})$ True stress/plastic strain $(\mathrm{TYPE}=\mathrm{PLAST})$ Plastic modulus/true stress $(\mathrm{TYPE}=\mathrm{PMOD})$  

3.With Lagrangian and Eulerian solid elements, only an elastic perfectly plastic yield model is currently used. Only the YIELD field is used.   
4.If TABLE is blank or zero,a bilinear stress-strain curve is assumed. If TABLE has a value, it refers to a TABLEDl entry giving the stress-strain curve for the material.   
5.If TABLE is defined, the value of YIELD is left blank, since it is determined from the stressstrain curve.   
6. If TABY is blank or zero and $D$ and $P$ are blank or zero, the yield stress does not vary with strain rate. IfTABY has a value, then it referencesa TABLEDl entry, which gives the variation of the scale factor applied to the yield stress with strain rate.( $D$ and $P$ must be blank or zero.) If TABY is blank or zero and $D$ and $P$ are defined, the enhancement of the yield stress with strain rate is calculated as  

$$
\frac{\upsigma_{d}}{\upsigma_{y}}=1+\bigg(\frac{\dot{\upvarepsilon}_{p}}{D}\bigg)^{1/p}
$$  

Where $\upsigma_{d}$ is the dynamic stress, $\upsigma_{y}$ is the static yield stress (YIELD), and $\dot{\mathfrak{c}}_{p}$ is the equivalent plastic strain rate.  

7. If TYPE is PLAST or PMOD, Young's modulus must be defined. If TYPE is ENG or TRUE and Young's modulus is defined it will override the value calculated from the stress-strain curve.  

8. Note that for values exceeding the maximum x-value of either of the TABLEDl entries (see TABLE and TABY fields), linear extrapolation is used based upon the last two points specified in the TABLED1.  

9. YID must unique among all YLDxx entries in one model.  

Defines the Zerilli-Armstrong yield model where the yield stress isa function ofeffctive plasticstrain, strain rate and temperature. Used in SOL 700 only.  

Format:   


<html><body><table><tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td>YLDZA</td><td>YID</td><td>A</td><td>B</td><td></td><td>C</td><td>m</td><td>EPSO</td><td></td><td></td></tr><tr><td></td><td>D</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

Example:   


<html><body><table><tr><td>YLDZA 7</td><td>200.E6</td><td>50.E6</td><td>0.1</td><td></td><td></td></tr><tr><td>0.0</td><td></td><td></td><td></td><td></td><td></td></tr></table></body></html>  

<html><body><table><tr><td>Describer</td><td>Meaning</td></tr><tr><td>YID</td><td>Unique yield model number referenced from a MATDEUL entry. (Integer > 0; Required)</td></tr><tr><td>A</td><td>Static yield parameters. (Real > O; Required)</td></tr><tr><td>B</td><td>Hardening parameters. (Real ≥ O; Default = 0.0)</td></tr><tr><td>n</td><td>Hardening exponent. (Real; Default = 0.0)</td></tr><tr><td>C</td><td>Strain rate parameter. (Real; Default = 1.0)</td></tr><tr><td>m</td><td>Temperature exponent. (Real; Default = 1.0)</td></tr><tr><td>EPSO</td><td>Reference strain rate. (Real > 0; Default = 1.0)</td></tr><tr><td>CP</td><td>Specific heat. (Real > 0; Default = 1.E20)</td></tr><tr><td>D</td><td>Bcc parameter. See Remark 4. (Real; Default = blank)</td></tr></table></body></html>  

## Remarks:  

1. This material model can be used to model to model Fcc (iron and steels) and Bcc (aluminum and alloys) metals.   
2. The yield stress is computed from for Fcc metals:  

$\begin{array}{r}{\upsigma_{y}\ =\ (A+B\upvarepsilon_{p}^{n})\upvarepsilon^{\left\lfloor-m T+C T\mathrm{ln}\left(\frac{\dot{\varepsilon}}{\hat{\varepsilon}_{0}}\right)\right\rfloor}\ \mathrm{for~Fcc~metals}}\end{array}$ $\upsigma_{y}\ =\ (A+B\upvarepsilon_{p}^{n})+D e^{\left\lfloor-m T+C T\mathrm{ln}\left(\frac{\dot{\varepsilon}}{\upvarepsilon_{0}}\right)\right\rfloor}\ \mathrm{for~Bcc~metals}$  

## where  

$\mathfrak{E}_{p}$ $\mathbf{\Sigma}=$ effective plastic strain ·ε $\mathbf{\Sigma}=\mathbf{\Sigma}$ effective strain rate &0 $\mathbf{\Sigma}=$ reference strain rate $T$ $\mathbf{\tau}=\mathbf{\tau}$ temperature $A,B,n,C,m$ and $D$ are constants.  

3. The reference strain rate are per unit time.   
4. In case the Bcc parameter $D$ is not supplied, it is assumed that a Fcc metal is defined.  

A  

# Configuring the Runtime Environment  

Specifying Parameters User-Defined Keywords   
$\mathbf{\deltam}$ Resolving Duplicate Parameter Specifications   
$\mathbf{\delta}\mathbf{\boxed{\equiv}}\mathbf{\delta}$ Customizing Command Initialization and Runtime Configuration Files Symbolic Substitution  

## Specifying Parameters  

MSC Nastran execution is controlled by a variety of parameters, either keywords or special Nastran statements, both required and optional. The purpose of this section is to describe how and where these parameters may be specified, not to describe these parameters in detail. This is done in subsequent sections. The MSC Nastran parameters may be specified on the command line, in a command initialization (INI) file, in runtime configuration (RC) files and,for some parameters,from environment variables.The information from these sources is consolidated at execution time into a single set of values.Much of this information is passed to analysis processing ina"control file",built using the templates (Customizing the Templates,51).The records in this control file are echoed to the .log file.)Examples of INI and RCfiles are given in the UserDefined Keywords,3355 and Customizing Command Initialization and Runtime Configuration Files,3363.  

## Command Initialization and Runtime Configuration Files  

Although the purposes of the INI and RC files are somewhat diferent, the format of each file is the same. All INI and RC files are processed twice,once (the"first" pass to extract parameters (keywords and other information) that are to be used forall MSCNastran jobs, and once (the"second" pass)toextract parameters specific to a particular job.This is accomplished by separating the INI and RCfiles into a series of"sections" identified bya"section header"and "subsections"within sections,identified by asubsection"header."There are two types of sections: "unconditional" and "conditional." Subsections are always "conditional."  

An unconditional section is one that starts with the name of the section enclosed in square brackets ("[", "]"). Section names may not contain any embedded blanks but may be separated from the square brackets by any number of blanks. As currently implemented, there are three valid unconditional names: "General", "Solver" and "Nastran". (These section names are caseinsensitive.) In addition, there is an implicit"unnamed" section that consists of all parameters in the INI or RC file that appear before the first named section or subsection.There is no special meaning assigned to any of the unconditional sections.Their use is optional; the section names are intended to be used for descriptive purposes.  

■ A conditional section or subsection is one that starts with an expression in the form:  

<keyword><operator><value>  

enclosed in section header identification characters. For a conditional section,the section header identification characters are square brackets $("[","]")$ , just as for unconditional sections. For a subsection, the section header identification characters are "less than" and "greater than" $("<"$ $">",$ characters. Keywords and values may not contain any embedded blanks but may be separated from each other and from the enclosing section header identification characters (the square brackets or "less than"-"greater than" characters) by any number of blanks. In the expression:  

<html><body><table><tr><td><keyword></td><td>represents any valid internal keyword (see Keywords, 182) or user-defined keyword (see User-Defined Keywords, 3355).</td></tr><tr><td><operator></td><td> specifies the comparison to be performed between <keyword> and</td></tr><tr><td></td><td><value> as follows: = equal (either string or numeric)</td></tr></table></body></html>  

<html><body><table><tr><td></td><td>！</td><td>not equal (either string or numeric)</td></tr><tr><td></td><td>!=</td><td> not equal (either string or numeric)</td></tr><tr><td></td><td><</td><td>numerically less than</td></tr><tr><td></td><td><=</td><td> numerically less than or equal</td></tr><tr><td></td><td>V</td><td>numerically greater than</td></tr><tr><td></td><td>>=</td><td> numerically greater than or equal</td></tr><tr><td><value></td><td colspan="2">specifies the appropriate keyword value to be used in the comparison.</td></tr></table></body></html>  

Keywords and values may be specified in any case.  

Parameters in unconditional sections, but not in subsections (which are always conditional) within unconditional sections, are processed on the first pass through an INIor RC file.On the second pass, these parameters are ignored (they are not reprocessd). Parameters in conditional sections and subsections are ignored on the first pass. Parameters in conditional sections and subsections whose expressions evaluate to "true" are processed on the second pass through an INI or RC file, thus allowing conditional expressions to reference allof the valid keywords. Note that for subsections within conditional sections, both the conditional expression for the section andthe conditional expression for the subsection must evaluate to "true" before parameters in the subsection are processed.  

Parameter specifications in,either unconditional or conditional sections, may be continued, if necessary, by specifying a backslash $(^{\mathfrak{a}}\backslash^{\mathfrak{v}})$ character as the last non-blank character of the line. Note for Windows users, if the parameter value itself ends with a backslash, the statement must have additional characters, such as a comment, after the value specification. For example, a specification such as:  

will not work properly. Instead, write the statement as:  

sdir $\mathrel{\mathop:}=\Theta$ :\ \$ Specify the scratch directory [n addition to parameters, INI and RC files may contain“comment" records. There are two types of comment records: ignored and printed.  

Ignored comments are records that start with a semi-colon $(";")$ or pound sign ${\binom{"\dagger}{\dagger}}^{\mathfrak{n}}\big)$ . These records are completely ignored. When running in Windows, there is a special form of ignored comments that may be specified in an INI file (but not in RC files). These are records that start with "REM", short for "REMARK". The test for "REM" is case-insensitive.   
Printed comments are records that start with the currency symbol $("\boldsymbol{\varsigma}^{\boldsymbol{"}})$ . These records are passed on as part of the analysis information but are otherwise ignored.  

Note: Although sectioning within INI and RC files was first introduced in MSC Nastran 2004, valid INI and RC files from prior versions of MSC Nastran are fully compatible with this new format. Since sections were not supported in previous versions (except for INI files on Windows, which allowed unconditional sections), all parameters will be in the "unnamed" implicit section (or, on Windows, in named unconditional sections) and willbe processed on the first pass through the file. No information willbe extracted from these files on the second pass.  

The list below specifies the INI and RC files that MSC Nastran uses.Any or allof these files may be ommitted.Table1-1 lists the keywords that are generally set in the unconditional sections of the command initialization file. Table 1-2 lists the keywords that are generally set in RC files.  

Command Initialization (INI) File  

This file is used to define keywords that are to be set whenever the nastran command is executed. Typical keywords in the unconditional sections include the instalation base directory and the version of MSC Nastran. Conditional sections and subsections might include keywords such as "rcmd" and "rsdirectory" in sections that are conditional upon the value of the "node" keyword.  

LINUX: install_dirlprod_verlarch/nastran.ini Windows: install_dir\prod_ver\arch\nastran.ini  

Starting with MSC Nastran 201l, there are two possible RC files that may be defined in each of the locations that are searched for RCfiles.The first name is a version independent name and the second name is a version dependent name, where the version number is indicated by<vernum> in the file name and the version number for MSC Nastran is 20200.  

System RC Files  

These files are used to define parameters that are applied to all MSC Nastran jobs using this installation structure. Many of the parameters that might be specified in the INI file could, alternatively, be specified in this file.  

LINUX: install_dir/conf/nastranrc and install_dir/conf/nast<vernum>rc   
Windows: install_dir\conf\nastran.rcf and install_dir\conf\nast<vernum>.rcf  

Architecture RC Files  

This files are used to define parameters that are applied to MSC Nastran jobs using this architecture.  

LINUX: install_dir/conf/arch/nastranrc and install_dir/conf/arch/nast<vernum>rc  

Windows: install_dir\conf\arch\nastran.rcf and install_dir\conf\arch\nast<vernum>.rcf  

Node RC Files  

These files are used to define parameters that are applied to MSC Nastran jobs running on this node. Alternatively, the parameters in this file could be specified in a conditional section in one of the previous files, using nodename as the value of the "s.hostname" keyword in the conditional expression.  

LINUX: install_dir/conf/net/nodename/nastranrc and install_dir/conf/net/nodename/nast<vernum>rc   
Windows: install_dir\conf\net\nodename\nastran.rcf and install_dir\conf\net\nodename\nast<vernum>.rcf  

User RC Files  

These files are used to define parameters that are applied to MSC Nastran jobs run by an individual user.  

LINUX: $\$100$ .nastranrc and \$HOME/.nast<vernum>rc   
Windows: %HOMEDRIVE%%HOMEPATH%\nastran.rcf and %HOMEDRIVE%%HOMEPATH%\nast<vernum>.rcf  

Local RC Files  

These files should be used to define parameters that are applied to MSC Nastran jobs that reside in the input data file's directory. This RC file is in the same directory as the input data file. If the "rcf" keyword (page 214) is used, this local file is ignored.  

LINUX: .nastranrc and .nast<vernum>rc   
Windows: nastran.rcf and nast<vernum>.rcf  

Please note that the LINUX shorthand "-",to refer to your oranother user's home directory, cannot be used in an RC file.In addition,environment variables are only recognized within the context of alogical symbol definition.  

Also, note that, on LINUX systems, the leading period (".") on the User RC Files and Local RC Files file names cannot be deleted even ifalternate names are specified using the“a.urc"and “a.urcb"keywords as described below.  

The file names listed above may be changed by the user using the“a.rc",“a.rcb",“a.urc"and“a.urcb" keywords, noting that the directories in which the files are located may not be changed.  

The“a.rc"keyword can be used to change the names of the version dependent RC file names for the System RC Files, the Architecture RC Files and the Note RC File. The default for this keyword is "nast<vernum>rc” for LINUX and “nast<vernum>.rcf" for Windows.   
The“a.rcb" keyword can be used to change the names of the version-independent RC file names for the System RC Files, the Architecture RC Files and the Node RC Files. The default for this keyword   
is“nastranrc" for LINUX and “nastran.rcf" for Windows.   
The“a.urc" keyword can be used to change the names of the version dependent RC file names for the User RC Files and the Local RC Files. For LINUX, the default for this keyword is the value of the“a.rc" keyword with a leading period (".")added. For Windows, the default for this keyword is the value of the “a.rc" keyword.   
The“a.urcb" keyword can be used to change the names of the version-independent RC file names for the User RC Files and the Local RC Files.For LINUX, the default for this keyword is the value   
of the“a.rcb" keyword with the leading period (".") added. For Windows, the default for this keyword is the value of the“a.rcb" keyword.  

In addition to keyword specifications, the folowing MSC Nastran statements (from the NASTRAN and FMS Sections) may appear in RC files and conditional sections in an INI file: NASTRAN, ACQUIRE, ASSIGN, CONNECT, DBCLEAN, DBDICT, DBFIX, DBLOAD, DBLOCATE, DBSETDEL, DBUNLOAD, DBUPDATE, DEFINE, ECHOOFF, ECHOON, ENDJOB, EXPAND, INCLUDE, INIT, PROJ, RESTART and RFINCLUDE. Except for minimal checking of the NASTRAN and PARAM statements, the syntax of these statements is not validated.These records are simply passed on foruse in MSC Nastran analysis processing.  

INI files and RC files also may contain PARAM statements that specify values that affect MSC Nastran analysis processing. The values associated with PARAM names may be specified using PARAM statements in INI files and RC files or by using PARAM keywords, defined using the PARAM keywords feature as described in User-Defined Keywords, 3355.PARAM statements must be specified in "free-field format",ie.,in the Case Control PARAM format (PARAM,name,value), not in Bulk Data fixed-field format. Please see Parameters (Ch.6) in the MSC Nastran Quick Reference Guide for more information on PARAM names and statements and their usage.  

## Environment Variables  

Several keywords may have their values set from associated environment variables.When this is the case, the environment variable takes precedence over any INI or RC file keyword specification.A command-line specification will over-ride the environment variable specified value.This same precedence rule applies to user-defined keywords that may have their initial values taken from environment variables, as described in the next section.A list of the keywords and their associated environment variables, along witha description of each keyword, may be obtained by using the following command:  

## User-Defined Keywords  

[n addition to the internally defined keywords (seeKeywords,182),MSC Nastran allows users to define their own keywords. There are two classes of user-defined keywords:  

General keywords. These are intended for use in INI file or RC file conditional section clauses, in user modifications to the run template files (nastran.dmp, nastran.lcl, nastran.rmt or nastran.srv) and, for LINUX, in customized queue commands ("submit" keyword).   
PARAM keywords. These are keywords associated with a PARAM name. Using descriptive keywords to set a PARAM value may be more convenient than specifying the PARAM statement in an RC file. Also, keywords are not limited to a maximum of eight characters, as PARAM names are, and may be more descriptive of the action being affected or requested.  

User-defined keywords are supported by the “help” and “whence" functions.  

## General Keywords  

These keywords are defined in the file specified by the"O.kwds"keyword. While the file is not delivered, an administrator could create the file. The default file names are:  

LINUX: install_dir/prod_ver/arch/nastran.kwds   
Windows: install_dir\prod_ver\arch\nastran.kwds or installdir\bin\nast20200.kwds The file used is the first one found.  

The records in this file consist of:  

Comment records. These are records that start with a comment character (hash, '#',semi-colon, or currency symbol, $'5"$ ) and are completely ignored. $\blacktriangledown$ Blank or null records. These records are ignored. Keyword records. These records consist of the keyword name along with an optional value descriptor and comment in the form: keyword_name[,attributes] : value_descriptor comment  

where:  

<html><body><table><tr><td>keyword_name</td><td>is the name to be assigned to the user keyword. This name may not contain any embedded blanks and may not be the same as any internal keyword or previously specified user-defined keyword. It is also case- insensitive except in the case when its initial value may be set from an environment variable with the same name.</td></tr><tr><td>attributes</td><td>specifies optional attributes to be assigned to the keyword defined by keyword-name. Currently, the only defined attribute is: argv keyword and its value is to be added to the “r.argv" keyword value Any number of blanks may separate keyword_name, the separating</td></tr><tr><td></td><td>command and the attributes specification. value_descr iptoris optional. If specified, it should be as described in Value Descriptors, 3357 and may not contain any embedded blanks. If this field is not present, the separating colon may be omitted.. The default value descriptor is</td></tr><tr><td>comment</td><td>"string". This field may also specify that the initial value of this keyword be taken from an environment variable with the same name. is an optional comment field. If present, it must be separated from value_descriptor or keyword_name by blanks or must begin</td></tr></table></body></html>  

There may be any number of leading blanks in the record and before and after the separating colon.  

General keywords and the values assigned to them only affect MSC Nastran processing if:  

there are customized INI and RC files that have conditional sections, using these keywords in expressions, that specify other keywords and statements (e.g., NASTRAN and PARAM statements) that modify MSC Nastran processing to meet the requirements of a user's site and installation. they are used in customized templates (Customizing the Templates, 51).   
for LINUX systems, they are used in customized queue commands defined using the "submit" keyword (Customizing Queue Commands (LINUX), 49).  

## PARAM Keywords  

These keywords are defined in the file specified by the "O.params"keyword The default file names are:  

LINUX: install_dir/prod_ver/arch/nastran.params Windows: install_dir\prod_ver\arch\nastran.params  

The records in this file consist of:  

Comment records. These are records that start with a comment character (hash,'#',semi-colon, '', or currency symbol, $"\$1$ ) and are completely ignored.   
$\mathbf{\delta}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{\overline{\mathbf{\Pi}}}}\mathbf{\Pi}_{\overline{\overline{\mathbf{\Pi}}}}\mathbf_{\overline{\overline{\Pi}}}\mathbf{\Pi}_{\overline{\overline{\mathbf{\Pi\Pi}}}\mathbf_{\overline{\overline{\Pi}}}\mathbf_{\overline{\overline\Pi}}\mathbf{\Pi}_{\overline\Pi}\mathbf_{\overline{\Pi\Pi}}\mathbf_{\overline\Pi}\mathbf{\Pi}_\mathbf{\Pi\Pi}_\mathbf{\Pi\Pi}_\mathbf{\Pi\Pi}\mathbf_{\Pi\Pi\Pi}\mathbf_\Pi\Pi\Pi\mathbf{\Pi}\mathbf\Pi_\Pi\Pi\Pi\Pi\Pi}_\mathbf\mathbf{\Pi\Pi\Pi\Pi\Pi\Pi\Pi\mathbf}_\mathbf\mathbf\mathbf{\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi $ Blank or null records. These records are ignored.   
Keyword-name records. These records consist of the keyword name, the associated PARAM name, along with an optional value descriptor and comment in the form: keyword_name $\because$ param_name : value_descriptor comment  

where:  

<html><body><table><tr><td>keyword_name</td><td>is the name to be assigned to the PARAM keyword. This name is case- insensitive, may not contain any embedded blanks and may not be the same as any internal keyword, general user-defined keyword or previously specified PARAM keyword.</td></tr><tr><td>param_name</td><td>is the PARAM name to be associated with keyword_name. This name is case-insensitive, may be a maximum of eight characters, must begin with an alphabetic character and may not contain any embedded blanks. Also, it may not be the same as any previously specified PARAM name.</td></tr><tr><td>value_descriptor</td><td>is optional. If specified, it should be as described in Value Descriptors and may not contain any embedded blanks. If this field is not present, the separating colon may be omitted. The default value descriptor is "string".</td></tr><tr><td>comment</td><td>is an optional comment field. If present, it must be separated from value_descriptor or param_name by blanks or must begin with a comment character.</td></tr></table></body></html>  

There may be any number of leading blanks in the record and before and after the separating colons.  

Keyword names that are the same as PARAM names are allowed, as long as the keyword name is not an internal or general user-defined keyword name.  

Values asociated with PARAM names, whether set using PARAM keywords or set using PARAM statement: (statements having the form PARAM,name,value), directly affect MSC Nastran analysis processing.  

## Value Descriptors  

Value descriptors enable limited syntax checking for values assigned to general and PARAM user-defined keywords.For general keywords, they may also specify that theinitial value of thekeyword be setfrom the value associated with the environment variable having the same name as thekeyword.There are two types of syntaxchecking available:value must be one of alist of entries or value must be numeric. Also, the two forms can be combined. These are specified as follows:  

That is,the acceptable values are enclosed in double quotes (")and separated from each other by commas. The specification,including the various acceptable values, may not contain any embedded blanks.Value are case-insensitive andany partial specification is acceptable and willbe replaced by the fullvalue.For example, if a keyword may onlyhave the values"preliminary","check" and "final",the value descriptor would be:  

{"Preliminary","Check","final"}  

and a value specification of "Ch" would be accepted and replaced by "check".  

Numeric: number  

Values willbe checked to seeif they are valid numbers, either integer or floating point.For example, valid keyword value specifications could be: "1","-3.247","4.e-5". "3.75.4","4.24x"and "-4-5" are invalid specifications.  

Note: This checking does not support the NASTRAN "nnn seee" numeric format, where the 'e' between the number and the signed exponent ("seee") is missing.  

Complex value: number, number  

This format is only supported for PARAMkeyword value descriptors. Values will be checked to see if they consist of two valid numeric values, separated by a comma.  

Combined:{"val1","val2"， ,"valn",number}  

Note: This "combined" format does not support complex numbers.  

In addition,forgeneral keywords,ifthevaluedescriptorstarts orends with the string"env",specified inany case and separated from the rest of the value descriptor with a comma (unlessthe value descriptor is only "env"),the keyword value willbe set using the value associated with the environment variable having the same name as thekeyword. The environment value willbe subjected to the same syntax-checking rules that an INI file, RC file or command line specification would be, with a warning messge generated if syntax checking fails. This occurs even if the keyword is specified on the command line. Note that,for LINUX systems,since environment variable names are case-sensitive,the keyword name must be specified exactly the same as the environment variable name. This is the only time that the keyword name is case-sensitive. For Windows systems, since environment variable names are not case-sensitive, this restriction does not apply. Keyword values set from environment variables over-ride keyword values set in INI or RC files but do not over-ride keyword values set on the command line.  

If a value descriptor is omitted or is not one of these formats, no syntax checking willbe performed.  

## Examples:  

1. The following value descriptor would accept a value of "test", "final" or a number:  

{"Test","Final",Number}  

Acceptable values would be: te (replaced by test), FIN (replaced by final), 7, 14.5, 3 .e-4, -5 2. The following value descriptor would accept only the strings "abc", "def", "ghi" and "glm":  

Acceptable values would be: g (replaced by ghi), aB (replaced by abc), gl (replaced by glm), D (replaced by de f)  

3. The following value descriptor, only valid for a PARAM keyword, would only accept a complex number specification:  

number,number  

Acceptable values would be: 1, 2， 7.5 4,3.14  

4.The following value descriptors, only valid for ageneral keyword, would acceptonly the strings"qrs", "test",and "xyz". In addition, the value descriptor requests that the keyword value be set from the environment.  

or  

Acceptable values would be: q (replaced by qrs), $\mathbf{\boldsymbol{x}}\mathbf{\boldsymbol{Y}}$ (replaced by xyz), T (replaced by test)  

## Resolving Duplicate Parameter Specifications  

MSC Nastran processing information is obtained by scanning the various INI and RC files, the system environment, and the Nastran command line in the following order:   
1. Nastran command line,first pass.Only"program options", ie.,"-x"options, are processed during this command line scan. For example, this is when the "-i ini_file_name" program option is processed.   
2.Environment variables,first pass.During this pass, the only keywords whose values are set are those that may only be specified as environment variables. This includes keywords such as HOME (for LINUX), HOMEDRIVE and HOMEPATH (for WINDOWS) and PWD.   
3.INI file,firstpass,ifthis fileexists.During this pass,onlyunconditional sections are processed. Generally, the only keywords processed in this pass are: O.kwds, 0.params, accmd, acvalid, rcmd, rsdirectory, sysmsg and version (although rcmd and rsdirectory probably should be in conditional sections scanned during the second pass).   
4.Environment variables, second pass During this pass,only those keywords that may only be set in global sections of the INI file or as environment variables are processed. This includes keywords such as MSC_ARCH, MSC_BASE and MSC_VERSD.   
5.Nastran command line, second pass. The only general use keywords processed during this command line scan are: dmparalel, jid, jidpath, jidtype, node, pause, rcf, username, version and whence. The processing of other command line keywords is deferred until later command line scans. Thi is the time that the user-defined keyword definition files (for both general use and PARAM keywords), if any, are procesed and the keyword specifications defined by these files are added to the keywords tables. The keywords defined in these files may be used just asinternalkeywords are used.(SeeUser-Defined Keywords,   
3355.)   
6.System RCfiles,first pass,if these files exist.During this pass, only unconditionalsections are processed.   
7. Architecture RC files,first pass,if these files exist.During this pass, only unconditional sections are processed.   
8.Node RCfiles,first pass, if these files exist.During this pas, only unconditional sections are processed.   
9.User RC files,first passif these files exist.During this pass, only unconditional sections are processed.   
10.Local RC files,first pass, if these files exist.During this pass only unconditional sections are processed.   
11.Environment variables, third pass.During this pass, only "general" user-defined keywords that have been flagged to be set from environment variablesare processed.(This pass will beskipped if there are no "general" user-defined keywords.)   
12. Nastran command line, third pass. Only "general" user-defined keywords are processed during this command line scan. (This pass willbe skipped if there are no"general" user-defined keywords.) At this point, all keyword values that can be used in conditional section expressions are known.   
13. INI file, second pass, if this file exists and has conditional sections. During this pass, only the conditional sections are processed.   
14.System RCfiles, second pass,if these files exist and have conditional sections.During this pass, only the conditional sections are processed.   
15.Architecture RCfiles, second pass, if these files existand have conditional sections.During this pass, only the conditional sections are processed.   
16.Node RCfiles, second passif these files exist and have conditional sections. During this pass,only the conditional sections are processed.   
17.User RC files,second pass, if these files exists and have conditional sections.During this pass, only the conditional sections are processed.   
18.Local RC files, second passif these files exist and have conditional sections and if they are not ignored. During this pass, only the conditional sections are processed.   
19.Environment variables,fourth passDuring this pass, allkeywords that may be set from environment variables and that have not been processed previously are now processed.   
20. Nastran command line, fourth pass. All keywords not processed during the previous passes are now processed. For example, this is when user-defined PARAM keyword specifications are processed. At this point, all information necessary to generate the "control file" has been collected. This file is generated when the "script templates" (see Customizing the Templates, 51) are processed.  

21. NASTRAN, FMS and PARAM statements in the input file.  

If duplicate keywords are encountered,the last specification found is the one used.That is,the above list specifies the precedence order,from lowest precedence (number 1) to highest (number 21).The only case in which the last keyword specification is not used is whenkeywords are"locked", i.e.when a specification of the form  

lock $\c=$ keyword  

is processed.After this"lock"request is processed, any requests to set keyword, whetherfrom INIfiles, RC files, environment variables or command line arguments, are quietly ignored.That is,processing proceeds as if any keyword specifications specified after the "lock $\c=$ keyword" request do not exist. Once a keyword has been"locked,"there is no way to"unlock" it.(Note that it is valid to"lock"thelock keyword itself.)  

If duplicate NASTRAN and FMS statements are encountered, they are simply passed on for use in MSC Nastran analysis processing in the order in which they were encountered.  

Thus, the general rule for resolution is:  

$\left|\begin{array}{l l}{\mathbf{\overline{{u}}}}\end{array}\right.$ Information specified in NASTRAN input data files always takes precedence over any other value.   
$\mathbf{\delta}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf\overline{{\Pi}}}\mathbf{\Pi}_{\overline{\overline{{\Pi}}}}\mathbf_{\overline{\overline{{\Pi\Pi}}}\mathbf{\Pi}_{\overline\overline{{\Pi\Pi}}}\mathbf_{\overline{\overline{\Pi}}}\mathbf_{\overline{\overline{\Pi\Pi}}}\mathbf_{\Pi\Pi}_{\overline\overline{\overline}}\mathbf{\Pi\Pi}_\mathbf{\Pi\Pi}_\mathbf{\Pi\Pi}_\mathbf{\Pi\Pi}_\mathbf{\Pi\Pi\Pi}_\mathbf{\Pi\Pi\Pi}_\mathbf\mathbf{\Pi\Pi}\mathbf\mathbf\Pi\Pi\Pi_{\Pi\Pi}\mathbf\mathbf\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi}_\mathbf\mathbf\mathbf{\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\mathbf\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi\Pi $ Command line parameters have the next highest precedence.   
$\blacktriangledown$ Environment variables associated with keywords and that have non-null values are next.   
$\mathbf{\delta}_{\mathbf{\overline{{\Pi}}}}\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\left(\mathbf{\Pi}_{\mathbf{\overline{{\Pi}}}}\right)$ RC file parameter specifications are next.   
INI file parameter specifications are last.  

Generally, the only exceptions to this precedence ordering are"general" user-defined keyword specifications. The commandline values take precedence over values specified in unconditional INIfile and RCfile sections but have lower precedence than values specified in conditional INI file and RC file sections. Because the primary purpose for general user-defined keywords is for conditional section selection, changing a general user-defined keyword in a conditional section maylead to unexpected results.Such specifications should be used with care. Also,because user-defined PARAM keywords on the command line are not processed until the last command line scan, PARAM keywords should not be used in INI file and RC file conditional section expressions since command line specified values will not be in effect when these expressions are evaluated.  

Because PARAM values may be specified either using PARAM statements or using PARAM keywords, they require further explanation. PARAM statements and PARAM keywords referring to the same PARAM name are considered equivalent definitions for the PARAM name. As such, the last specification, regardless of whether it was a PARAM statement or a PARAM keyword, is the one that is used to establish the value associated with the PARAM name.  

## Customizing Command Initialization and Runtime Configuration Files  

Table 1-1lists the keywords that are generally set in theunconditional sections of the command initialization file.  

Table 1-1 Command Initialization File Keywords   


<html><body><table><tr><td>Keyword</td><td>Purpose</td></tr><tr><td>0.kwds</td><td>Alternate name for user-defined keywords definition file.</td></tr><tr><td>0.params</td><td>Alternate name for PARAM keywords definition file</td></tr><tr><td>acct</td><td>Enables job accounting, see Enabling Account ID and Accounting Data, 39.</td></tr><tr><td> acvalid</td><td>Activates account ID validation, see Enabling Account ID Validation, 39.</td></tr><tr><td>MSC_BASE</td><td>Defines the installation base directory. Normally this is defined as an environment variable by the prod_ver command.</td></tr><tr><td>version</td><td>Specifies the default version of MSC Nastran to be run.</td></tr></table></body></html>  

Most of the command line keywords can be set in any of the RC files. Table 1-2 lists keywords that are generally set in the system, architecture, or node RC files:  

Table 1-2 RC File Keywords   


<html><body><table><tr><td>Keyword</td><td>Preferred RC File</td><td>Purpose</td></tr><tr><td> accmd</td><td>System</td><td>Command line to invoke accounting logger program.</td></tr><tr><td>acct</td><td> System</td><td>Enables job accounting.</td></tr><tr><td> acvalid</td><td>System</td><td>Enables account ID (acid) validation.</td></tr><tr><td>authorize</td><td>System</td><td>Specifies the licensing method.</td></tr><tr><td>buffsize</td><td>System</td><td>Set the default buffsize. Suggested values are in Table 4-5.</td></tr><tr><td>lock</td><td>Any</td><td>Prevent further changes to a keyword's value.</td></tr><tr><td> memory</td><td>Node</td><td>Specifies a default memory allocation</td></tr><tr><td>memorymaximum</td><td>Node</td><td>Specifies a maximum "memory" request. May be specified as a percentage of RAM e.g.</td></tr><tr><td> ncmd</td><td>Architecture</td><td>memorymax=0.5xPhysical Specifies the notify command when "notify=yes" is set.</td></tr><tr><td>news</td><td>System</td><td>Controls the display of the news file at the beginning of the .f06 file.</td></tr></table></body></html>  

Table 1-2 RC File Keywords (continued)   


<html><body><table><tr><td>Keyword</td><td>Preferred RC File</td><td>Purpose</td></tr><tr><td> post</td><td>Architecture</td><td>LINUX: Specifies commands to be run after each job is completed.</td></tr><tr><td> ppcdelta</td><td>Architecture</td><td>LINUX: Specifies the value that is subtracted from the "CPU" keyword value to determine the NQS per-process CPU time limit.</td></tr><tr><td> ppmdelta</td><td>Architecture</td><td>LINUX: Specifies the value that is added to the "memory" keyword value to determine the NQS per-process memory limit.</td></tr><tr><td> pre</td><td>Architecture</td><td>LINUX: Specifies commands to be run before each job begins.</td></tr><tr><td> prmdelta</td><td>Architecture</td><td>LINUX: Specifies the value that is added to the ppm" value to determine the NQS per-request (per-job) memory limit.</td></tr><tr><td>qoption</td><td>Architecture</td><td>LINUX: Specifies a string of additional queuing options to be set in the queue submittal command.</td></tr><tr><td> rcmd</td><td>Any</td><td>Specifies the remote Nastran command to be used when "node" is specified. Should be in a conditional section using "node" in the</td></tr><tr><td> real</td><td>Node</td><td>conditional expression. Specifies the "REAL" parameter to limit virtual memory usage.</td></tr><tr><td> rsdirectory</td><td>Any</td><td>Specifies the scratch directory to be used when "node" is specified. Should be in a conditional section using "node" in the conditional</td></tr><tr><td> scratch</td><td>Any</td><td>expression. Specifies the default job status as scratch or permanent.</td></tr><tr><td>sdirectory</td><td>Node</td><td>Specifies a default scratch directory.</td></tr><tr><td> submit</td><td>Architecture</td><td>LINUX: Defines queues and their associated submittal commands.</td></tr><tr><td> sysn</td><td>Any</td><td>Specifies system cells. Can also be specified using the synonym keywords, e.g., buffsize is equivalent to sysl.</td></tr></table></body></html>  

## Examples  

The following(relatively simplistic)examples illustrate how unconditional and conditional sections could b used.  

### Example 1:  

Assumptions: There are three computer nodes, sysnodel, sysnode2 and sysnode3, that may be accessed.  

On sysnode1:  

MSC Nastran 2014 and MSC Nastran 2020 are installed: MSC Nastran 2014 is accessed using "/local/msc/bin/nast2014" MSC Nastran 2020 is accessed using "/local/msc/bin/nast20200" The scratch directory is /local/temp  

On sysnode2:  

Only MSC Nastran 2014 is installed and is accessed using "/locall/msc/bin/nast2014" The scratch directory is /locall/temp  

On sysnode3:  

MSC Nastran 2014 and MSC Nastran 2020 are installed: MSC Nastran 2014 is accessed using "/local2/msc/bin/nast2014" MSC Nastran 2020 is accessed using "/local2/msc/bin/nast20200"  

The scratch directory is /local2/temp  

All of this information could be specified in an INI file, identical on all three nodes, as follows: ；   
; This is the MSC Nastran Command Initialization File   
；The default version is to be set to 2020.0   
；   
version $=2020$ .0   
; Define conditional sections giving the appropriate sdir ; values when MsC Nastran is run locally.   
[ s.hostname $\mathbf{\Sigma}=\mathbf{\Sigma}$ sysnodel ]   
sdir $\c=$ /local/temp   
[ s.hostname $\mathbf{\tau}=\mathbf{\tau}$ sysnode2   
sdir $\c=$ /local1/temp   
[ s.hostname $\mathbf{\tau}=\mathbf{\tau}$ sysnode3 ]   
sdir $\c=$ /local2/temp   
： Define conditional sections giving the appropriate   
remote access keywords when a "node" value,   
； requesting remote execution, is specified.   
；   
[ node $\mathbf{\tau}=\mathbf{\tau}$ sysnodel l   
rsdir=/local/temp   
$\prec$ version $\mathbf{\Sigma}=\mathbf{\Sigma}$ 2014.0> rcmd $\c=$ /local/msc/bin/nast2014   
< version $\mathbf{\tau}=\mathbf{\tau}$ 2020.0>   
rcmd $\c=$ /local/msc/bin/nast20200   
[ node $\mathbf{\tau}=\mathbf{\tau}$ sysnode2 ]   
rsdir=/local1/temp   
< version $\mathbf{\tau}=\mathbf{\tau}$ 2014.0>   
rcmd $\c=$ /local1/msc/bin/nast20140   
[ node $\mathbf{\tau}=\mathbf{\tau}$ sysnode3 ]   
rsdir $\c=$ /local2/temp   
< version $\mathbf{\tau}=\mathbf{\tau}$ 2014.0>   
rcmd $\mathbf{\Sigma}=\mathbf{\Sigma}$ /local2/msc/bin/nast2014   
$\prec$ version $=2020.0>$   
rcmd $\c=$ /local2/msc/bin/nast20200   
；   
; This is the end of the Command Initialization file ；  

Alternatively, the information could be split between an INI file and a system RC file, identical on allthree nodes, as follows:  

In the INI file:  

；   
二 This is the MSC Nastran Command Initialization File ； The default version is to be set to 2020.0   
；   
version=2020.0   
; Define conditional sections giving the appropriate ; remote access keywords when a "node" value,   
; requesting remote execution, is specified.   
;   
[ node $\mathbf{\tau}=\mathbf{\tau}$ sysnodel ]   
rsdir=/local/temp   
< version $\mathbf{\Sigma}=\mathbf{\Sigma}$ 2014.0>   
rcmd $\c=$ /local/msc/bin/nast2014   
< version = 2020.0 >   
rcmd $\c=$ /local/msc/bin/nast20200   
[ node $\mathbf{\tau}=\mathbf{\tau}$ sysnode2 l   
rsdir $\c=$ /local1/temp   
< version $\mathbf{\tau}=\mathbf{\tau}$ 2014.0>   
rcmd $\c=$ /locall/msc/bin/nast20140   
[ node $\mathbf{\tau}=\mathbf{\tau}$ sysnode3 ]   
rsdir $\c=$ /local2/temp   
< version $\mathbf{\Psi}=\mathbf{\Psi}$ 2014.0>   
rcmd $\mathbf{\tau}=\mathbf{\tau}$ /local2/msc/bin/nast2014   
$<$ version = 2020.0 >   
rcmd $\c=$ /local2/msc/bin/nast20200 二   
; This is the end of the Command Initialization file; In the system RC file, identical on all three nodes:   
；   
； This is the MSC Nastran system RC file.   
；   
Define conditional sections giving the appropriate sdir ； values when MsC Nastran is run locally.   
[ s.hostname $\mathbf{\Sigma}=\mathbf{\Sigma}$ sysnodel ]   
sdir $\c=$ /local/temp   
[ s.hostname $\mathbf{\tau}=\mathbf{\tau}$ sysnode2 ]   
sdir $\c=$ /local1/temp   
[ s.hostname $\mathbf{\tau}=\mathbf{\tau}$ sysnode3 l   
sdir $\c=$ /local2/temp   
；   
;This is the end of the system RC file   
；  

### Example 2:  

Assumptions: User keywords defining "run type" and "data complexity" are needed and AUTOSPC, AUTOSPCR, BAILOUT and ERROR PARAM values are to be set based on these keywords.  

The nastran.kwds file could be:  

:User Keywords   
Runtype:{"prelim","development","final"};Analysis stage Level : number # Data complexity level ；  

The nastran.params file could be:  

; PARAM keywords  

Set AutoSPC : AutoSPC ：{"Yes","No"}Set AutoSP CR ： AUTOSPCR :{"yes","no"}Bailout Value ： bailout ： numberSet Error : Error : number  

Then, the system RC file could contain:  

；RC file   
[ runtype $\mathbf{\tau}=\mathbf{\tau}$ prelim ]   
set_autospc $\mathbf{\tau}=\mathbf{\tau}$ yes   
bailout_value $\mathbf{\Sigma}=\mathbf{\Sigma}-1$   
set error $\mathit{\Theta}=\mathit{\Theta}0$   
set_autosp_cr = yes   
[ runtype $\mathbf{\tau}=\mathbf{\tau}$ development ]   
set_autospc=yes   
bailout value $=0$  

set error=-1 [runtype $\c=$ final] set_autospo $\O=$ no param,bailout,0 param,error,-1 param,autospcr,no  

[level < 3]   
; basic data complexity parameters   
[leve] $\scriptstyle>=3{\mathrm{~}}$ 1   
<leve $1>8>$   
; advanced data complexity parameters   
<level $\angle=8>$   
; intermediate data complexity parameters   
；End of RC file  

## Symbolic Substitution  

### Introduction  

SymbolicSubstitution is a capability added to MSCNastran that allows a user to effectively modify a Nastran data file using command line and RC file keyword specifications without actually editing the file. This capability is very similar to“environment variable" expansion that happens in various command prompt shell such as the Linux Bourne, Korn and C shel and the Windows Command Prompt shell when scripts are processd. It is also analogous in some ways to the capabilities provided by programming language preprocessors, for example, the CPP preprocessor used by the various $\mathrm{C/C}_{}++$ compilers. The key feature of symbolic substitution is that these modifications do not affect the actual data file but present the data read from the data file to the processing program as if it was the modified data that was being processed.  

Generally, symbolic substitution means that a data record is scanned to seeif it contains special data strings (that identify the“symbolic"variables)thatspecify"symbolic substitution"requests.Ifsuch strings are found, the record is modified to replace the special data strings with user-defined substitution (replacement) strings (thevaluescurrentlyassociatedwith the“symbolic"variables,i.e.,thevariable"values"）andit is this modified record that is actually processed.This symbolic substitution happens before any other processing of the record occurs, thus making it transparent to the rest ofthe program processing the data record. In the case of MSC Nastran, this symbolic substitution processing willhappen immediately after a record is read from the Nastran data file and before any other processing (with the possible exception of special processing required to satisfy licensing requirements) is performed.  

### Simple Examples  

Two very simple examples illustrate how this capability could be used in Nastran data files. Note that the details of the syntax are completely described in the following sections and may be ignored for now.Alsonote that the examples do not deal with things such as managing the output from multiple Nastran runs. These issues, involving, among other techniques, using command line or RC file keywords such as "out $\mathbf{\Psi}=\mathbf{\"}$ ，， "append $\circleddash$ " and $\"\mathrm{\circ}\mathrm{1d}\mathrm{=}\mathrm{yes}\mathrm{"}$ , are beyond the scope of this document.  

### Example 1:  

Suppose you want to make several tests where the thicknessofa PSHELL element is to be varied. You could do this bydefining the thicknessofthe PSHELL elementasa"symbolic variable"(identified using the string "%thickness%"), setting a default value (using the "%def repsym" statement) and specifying the desired thickness on the command line (using the "REPSYM $\because$ keyword). A very simple data file (sym.dat) could be (where most of the BULK entries are in an include file named "model .bdf", not shown here):  

%defrepsym thicknes $\mathtt{S}=5$ .0   
SOL 103   
CEND   
TITLE $\mathbf{\Sigma}=\mathbf{\Sigma}\mathbf{1}$ st perturbation,t $\mathbf{\tau}=\mathbf{\tau}$ %thickness%   
ECHO $\mathbf{\tau}=\mathbf{\tau}$ NONE   
SUBCASE 1 METHOD $\mathit{\Theta}=\ 100$  

$\mathrm{\SPC}\ =\ 1$ $\Delta I S P=\Delta\mathrm{LL}$ BEGIN BULK EIGRL,100,,,6 PARAM,POST,0 PARAM,GRDPNT,0 \$PBEAML Properties PBEAML 2 1 I 70.0 60.0 60.0 3.3 5. 5. \$ \$PSHELL Properties $\$5$ pshell,1,1,%thickness%,l,,1 $\$5$ include 'model.bdf' enddata  

If the test is run using the following command line:  

the test will run as if the "TITLE" and "pshell" records are:  

and  

$$
\mathtt{p s h e l l,1,1,1,1,0,1,1}
$$  

If the test is run using the following command line:  

the test will run as if the "TITLE" and "pshell" records are:  

and  

$$
\mathtt{p s h e l l},1,1,1,3.5,1,.1
$$  

If the test is run without specifying any REPSYM setting for "thickness", e.g.,using the following command line:  

$$
\mathrm{nast}20200\ldots
$$  

the test will run as if the "TITLE" and "pshell" records are:  

and  

### Example 2:  

Suppose you havea test that contains two superelements, where the only difference between the data for each superelement is the area ofa PBAR element. Instead of having two diferent definitions, you could have a single definition of thedata in an include file, where the area of the PBAR is specified as asymbolic variable. The include file (called "bar .bdf") could be:  

%defrepsym area $=1$   
grid,2,,1.0,0.0,0.0   
grid,3,,2.0,0.0,0.0   
grid,4,,3.0,0.0,0.0,,123456 cbar,2,2,2,3,0.,1.,0.   
cbar,3,2,3,4,0.,1.,0.   
pbar,2,2,%area%,1.,1.,1.   
mat1,2,1.e7,,.3  

and the actual input file could be:  

sol 101   
cend   
title $\c=$ simple part se echo $\c=$ both   
subcase 1   
load ${}=1$   
disp $\c=$ all   
elforce $\c=$ all   
begin bulk   
grid,1,,0.0,0.0,0.0   
grid,2,,1.0,0.0,0.0   
cbar,1,1,1,2,0.,1.,0. pbar,1,1,1.,1.,1.,1. matl,1,1.e7,,.3   
force,l,1,,l.,1.,1.,1. \$   
begin super ${}=1$   
%setrepsym area $\Rightarrow1$ ·   
include 'bar.bdf'   
$\$5$   
begin super $^{=2}$   
%setrepsym area $^{\underline{{{\O}}}}=2$ ·   
include 'bar.bdf'   
enddata   
The first "include 'bar .bdf'" statement will be processed as if the pbar record is pbar,2,2,1.,1.,1.,1.   
and the second "include 'bar .bdf '" statement willbe processed as if the pbar record is pbar,2,2,2.,1.,1.,1.  

## Detailed Specifications  

The use of the Symbolic Substitution capability is defined by a number of"rules".These“rules"are given in the following sections and provide the complete specification. Following the rules,there is information about requesting report information and about error handling. Finally, there are some (again simple) examples showing usage.  

### Symbolic Substitution Rules  

The following rules define the symbolic substitution user interface.The descriptions start with the rules for variable naming,followed by the rules for defining the replacement width information, followed by the various keywords and statements used to control symbolic substitution.  

### Variable Naming  

The rules for naming symbolic substitution variables are:  

Symbolic variable names are not case-sensitive, are a maximum of 32 characters long and may not contain leading, trailing or embedded blanks or special characters including ${\binom{\ast}{-}}^{\ast})$ . Variable names must start with an alphabetic character followed by zero or more alphabetic or numeric characters. For example:  

$\cdot$ The variable name "VaRiaBLel" is the same as "VARIABLE1" and "variablel" The following variable names are valid:  

abcdef abc123 Name1  

The following variable names are not valid:  

123abc Does not start with an alphabetic character a bcd Contains an embedded blank abc& Contains an invalid character $(^{\prime}\&^{\prime})$ /def Does not start with an alphabetic character _abc123 Uses an underscore in the name.  

Unless symbolic variable values are quoted, they are not case-sensitive and may not contain leading, trailing or embedded blanks or percent $(""\%")$ characters. The quoting rules are given below.  

### Substitution Field Width Specification  

The ability to control the appearance of any symbolic substitution is an important requirement when generating data for a program such as MSC Nastran. The result of a symbolic substitution request is identified asafield.Substitution field width informationcan be taken by default,specified in the data file or specified using command line and/or RC file keywords. These methods are explained below.  

The rules for defining substitution field width information are:  

Symbolic variable substitution is, by default, exact.That is,the number of characters occupied by the symbolic symbol replacement is exactly the same as the replacement value. However, this default replacement processing can be controlled by specifying the substituted field width, the field precision and the justification within the field. This information is specified using the syntax -w.p  

where the '-′,'w' and $\mathrm{^{\circ}p}^{\mathrm{,}}$ are all optional and have the following meanings. ·The field width specification (w) defines the minimum number of characters the field is to have as a decimal integer value. If the replacement value has fewer characters than the field width, it will be padded with spaces on the left (by default)or on the right (if the left justification flag is specified).If the replacement value has more characters than the field width and if no precision value was specified, the entire replacement string will be used.A field width value of O (zero) is equivalent to omitting the width specification.Note that a negative width value willbe processed as if the“left-justification"flag was specified (see below) sincea negative field width is meaningless. The field precision specification $\left(\mathtt{p}\right)$ defines the maximum number of characters the field is to have. The format is a period (.） followed by a decimal integer value. If the replacement value length exceeds the precision value,only the last p (bydefault) or the first p (if the left justification flag is set) characters of the replacement value will be used.A field precision value of O (zero) (or a negative value) is equivalent to omitting the precision specification. Ifboth field width and field precision are specified and are positive, the precision value cannot be less than the width value. If it is, it will be reset to the field width. The‘- character is the“left-justification" flag and specifies that the replacement value is to be left-justified within the field. If this character is omitted, the replacement value will be rightjustified within the field. For example, the width, precision and justification of a typical field in the Bulk Data portion of a Nastran data file is: 18.8 meaning that the field is exactly eight characters wide and that data is to be left-justified within the field. For a wide-format Bulk Data record, this specification would be: -16.16 The specification for an exact replacement, ie., where the replaced field is exactly the sizeof the replacement value, is: 0.0 To simplify width specification for Nastran widths, the folowing (case-insensitive) synonyms for common widths are available and may be used wherever a width specification can be used: exact is equivalent to 0 . 0 bulk is equivalent to -8 . 8 wide is equivalent to -16 .16  

It is very important to note that there are two distinct portions to a Nastran data file,that part that is before the firstBEGIN statement and that has“freeformat",and that part that is after the first BEGIN statement (the Bulk Data Section)and often has fixed format fields.Because of this,two diffrent sets of field width information are maintained for use when field width information is not explicitly specified as part of a symbolic substitution request, one for use before the first BEGIN statement and one for use after the first BEGIN statement.  

### Defining Variable Values and Width Information  

Symbol names and associated values and symbol width specifications may be set using keywords on the command line or in RC files and may be set using special statements in the Nastran data file itself. Each keyword and statement is explained in detail.  

Using Command Line or RC File Keywords  

Setting Variable Value Using REPSYM  

Symbolic variables and associated values may be set on the Nastran command line or in RC files using the keyword  

where <varname $>$ specifies the name of the symbolic variable and <varval ue> specifies the value to be associated with the variable name. For example,  

$$
\mathtt{r e p s y m=a b c=1}.23\mathtt{e}-5
$$  

### Setting Variable Width Information Using REPWIDTH  

Symbolic variable substitution default width information may be set on the Nastran command line or in RC files using the keyword  

where<widthinfol $>$ specifies the default width information for the portion of the Nastran data file before the BEGIN statement and <widthinf $\phantom{-})2>$ specifies the default width information for the portion of the Nastran data file after the BEGIN statement. Each is specified using a $-w\cdot\mathrm{p}$ specification or as one of the synonyms, as described previously.Ifeither width specification is omitted, the current default for that section is not changed. Note that the separating comma is required if the Bulk Data Section width value is to be set, i.e., if <witdhinfo2> is specified. For example,  

repwidth $=12$ ,bulk  

specifies that symbolic substitution default width is to be12 .0 before the BEGIN statement is encounterec and -8 .8 after the BEGIN statement is encountered and  

repwidth $\c=$ ,bulk  

specifies that symbolic substitution default width is to be EXACT (or O.0,the default) before the BEGIN statement is encountered and -8 .8 after the BEGIN statement is encountered.  

Just as with other Nastran command line or RC file keywords, the REPSYM and REPWIDTH keywords ar not case-sensitive.  

Using Special Statements in a Nastran Data File  

Setting Values Using setrepsym  

Symbolic variables and associated values may be set in a Nastran data file using the following statement:  

%setrepsym <varname> $\c=$ <varvalue> where the '%' character must be in column l and nothing else may appear in the record except for optional comments folowing <varvalue>, where the start of the comment is indicated by a' $\boldsymbol{\varsigma}^{\prime}$ (blank currency symbol). The setrepsym string is not case-sensitive and at least one blank must separate this string from the <varname $>$ specification. For example,  

%setrepsym abc $\c=$ 1.23e-5  

### Clearing ("Unsetting") Values Using unsetrepsym  

A symbolic variable value set using the $\frac{0}{0}$ setreps ym statement may cleared ("unset") in a Nastran data file using the following statement:  

%unsetrepsym <varname>  

where the $1\%$ character must be in column l and nothing else may appear in the record except for optional comments following <varname>, where the start of the comment is indicated by a' $\varsigma^{\prime}$ .The unsetrepsym string is not case-sensitive and at least one blank must separate this string from the <varname> specification. For example, to clear the variable abc,use  

%unsetrepsym abc  

### Setting Default Values Using defrepsym  

Default variable values can be set in a Nastran data file using the following statement:  

%defrepsym <varname> $\c=$ <varvalue>  

where the $1\%$ character must be in column l and nothing else may appear in the record except for optional comments following <varvalue>,where the start of the comment is indicated by a′ $\$1$ .The defrepsym string is not case-sensitive and at least one blank must separate this string from the <varname> specification. The specified value will be used only if a value for <varname $>$ was not previously set, i.e., by a repsym keyword on the command line or in an RC file or by a %setrepsym statement previously specified in the data file that has not been unset by a $\frac{0}{0}$ unset rep sym statement. For example,  

%defrepsym abc=2.46e+2  

### Clearing ("Unsetting") Default Values Using undefrepsym  

The default value for a symbolic variable may cleared ("unset") in a Nastran data file using the following statement:  

%undefrepsym <varname>  

where the $1\%$ character must be in column l and nothing else may appear in the record except for optional comments following <varname>, where the start of the comment is indicated by a' $\$1$ .The undefrepsym string is not case-sensitive and at least one blank must separate this string from the <varname $>$ specification. For example,to clear the default value associated with variable abc, use  

%undefrepsym abc  

### Setting Width Information Using setrepwidth  

Symbolic variable substitution defaultwidth information may beset inaNastran data file using the following statement:  

%setrepwidth <widthinfol>,<widthinfo2> where the $1\%^{\prime}$ character must be in column l and nothing else may appear in the record except for optional comments following <widthinfo2>, where the start of the comment is indicated by a ′ $\varsigma^{\prime}$ .The setrepwidth string is not case-sensitive and at least one blank must separate this string from the width specifications. There may not beany blanks within the width specifications.<widthinfo1> specifies the width information for the portion of the Nastran data file before the BEGIN statement and <widthinfo $2>$ specifies the width information for the portion of the Nastran data file after the BEGIN statement. Each is specified using a $-w\cdot\mathrm{p}$ specification or as one of the synonyms, as described above. If either width specification is omitted, the current width information for that section is not changed. Note that the separating comma is required if the Bulk Data Section width value is to be set, i.e., if <widthinfo $2>$ is specified. For example,  

osetrepwidth 0.0,wide  

specifies that the symbolic substitution width specification is to be O.O before the BEGIN statement and i to be -16 .16 after the BEGIN statement.  

### Clearing ("Unsetting") Width Information Using unsetrepwidth  

Symbolic variable substitution width information set using the %setrepwidth statement may be cleared in a Nastran data file using the following statement:  

%unsetrepwidth  

where the'%' character must be in column 1 and nothing else may appear in the record except for optional comments folowing the unsetrepwidth string, where the start of the comment is indicated by a‘ $\boldsymbol{\varsigma}^{\prime}$ · The unsetrepwidth string is not case-sensitive and must be follwed by at least one blank. This statement does not have any arguments and clears both width specifications.  

### Setting Default Width Information Using defrepwidth  

Default symbolic variable substitution width informationmay be set inaNastran datafile using the following statement:  

where the'%' character must be in column l and nothing else may appear in the record (except for optional comments following <widthinfo2>, where the start of the comment is indicated by a ' $\varsigma^{\prime}$ .The defrepwidth string is not case-sensitive and at least one blank must separate this string from the width specifications. There may not be any blanks within the width specifications. <wi dthinfo1 $>$ specifies the default width information for the portion of the Nastran data file before the BEGIN statement and <widthinfo $2>$ specifies the default width information for the portion of the Nastran data file after the BEGIN statement. Each is specified using a $-w\cdot\mathrm{p}$ specification or as one of the synonyms, as described above.Ifeither width specification is omitted,the current width information for that section is not changed. Note that the separating comma is required if the Bulk Data Section width value is to be set, i.e., if <widthinfo $2>$ is specified. For example,  

%defrepwidth 0.0,wide  

specifies that default symbolic substitution is to be O.O before the BEGIN statement and is to be-16.16 after the BEGIN statement.  

Clearing ("Unsetting") Default Width Information Using undefrepwidth  

Default symbolic variable substitution width information may be cleared in a Nastran data file using the following statement:  

%undefrepwidth  

where the $1\%$ character must be in column l and nothing else may appear in the record except for optional comments following the undefrepwidth string, where the start of the comment is indicated by a‘ $\boldsymbol{\varsigma}^{\prime}$ The undefrepwidth string is not case-sensitive and must be followed by at least one blank. This statement does not have any arguments and clears both default width specifications.  

## General Information For Special Statements  

The %setrepsym, %unsetrepsym, %defrepsym, %undefrepsym, %setrepwidth, %unsetrepwidth,%defrepwidth and %undefrepwidth statements are deleted,logically, from the data file and willnever be processed bythe rest ofNastran unlessan error is encountered while they are being processed. This is discussed in the Error Handling, 3380.  

### Requesting Symbolic Substitution  

Symbolic variable substitution will occur when a string having the form %<varname>,<widthinfo>:<varvalue>%  

is found anywhere within a Nastran data file, except that this string may not span records, i.e., the substitution request must be on a single record (line). The leading and trailing $1\%^{\prime}$ characters are required as is the<varname> field. The <widthinfo>field is optional. If it is omitted, the comma $(,)$ separating it from the <varname>field may be omitted and the rules for determining what width specification will be used are discussed below. The<varvalue>field is optional and provides a way of specifying a default value, ie.,the“local default value",as described below.If it is omitted,the colon(:）separatingit from the <varname> (or <widthinfo>) field may be omitted. The rules for determining what symbolic value will be used as the substitution value are discused below.For example, if the symbolic variable abc is to be replaced by its current value with no special processing (or if default width processing is to be used), the substitution request would be:  

%abc%  

If the symbolic variable is to be replaced by its current value, with the minimum field width to be 12 characters and with the value always to be left-justified, the substitution request would be:  

%abc,-12%  

### Quoting Rules For Symbolic Variable Values  

If a symbolic variable value is case-sensitive,if it contains leading,trailing or embedded blanks or if it contains percent characters,tab characters or other special characters, it must be quoted. (Note that"escape" sequences such as'\t'or'\n'are not given any special treatment; that is,they are left as is.)  

If the value is part of a reps ym keyword command-line specification, the quoting rules of the command shell being used apply.   
●If the value is part of a repsym keyword specified in an RC file, it must be enclosed in single quotes (').  

●If the value is part of a %setrepsym or %def repsym record or if it specified as the “local default value" in a symbolic substitution request, quoting a symbolic variable value means enclosing the value in one of the following pairs of characters:  

<html><body><table><tr><td>Starting Quote Character</td><td>Ending Quote Character</td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td>/</td><td>/</td></tr><tr><td>一</td><td>一</td></tr><tr><td>[</td><td></td></tr><tr><td>{</td><td>}</td></tr><tr><td>（</td><td>）</td></tr></table></body></html>  

If the first non-blank character encountered in a variable value specification is one of the starting quote characters, the variable value must be ended by the associated ending quote character. The actual variable value willbe the (possibly null) string between (but not including) the starting and ending quote characters. If the variable value starts with one of the starting quote characters, it must be quoted using an alternate quote character.  

### General Rules For Symbolic Variable Substitution  

Nested symbolic substitution is not supported. Even if the value associated with a symbolic variable name is,itself, in the format of a symbolic variable substitution request, that request willbe ignored. That is, after symbolic variable substitution has occurred, the substituted string is not re-scanned. Determining what symbolic variable value will be used when a variable substitution request is encountered depends on where the variable value associated with the specified variable name was set. The first value encountered in the following hierarchy is the value that will be used:  

·A value specified in the Nastran data file using the %setrepsym statement, if there is one active, i.e., if it has not been deactivated by a %unset repsym statement.   
$\cdot\cdot$ A value specified on the Nastran command line or in RC files using the reps ym keyword.   
·As part of the variable symbol substitution request, using the local default value, if there is one.   
·A value specified in the Nastran data file using the %defreps ymstatement, ifthere is one active, i.e., if it has not been deactivated by a %unde f reps ym statement.  

This precedence follows normal MSC Nastran ordering, i.e., "the data file wins," while still providing great flexibility.Also,the ordering of thelast two items in this hierarchy allows a user to set all defaults except for special cases and follows the idea that the specification "closest" to the use is the one used. If no replacement value is found, the substitution request will be ignored and the record will be unchanged.  

Determining what symbolic width specification willbe used when a variable substitution request is encountered depends on where the width information has been specified and on the part of the Nastran data file that is being processed, i.e.,is the variable substitution request before or after the first BEGIN statement. The first width specification value encountered in the following hierarchy is the specification that will be used:  

·A value specified in the symbolic substitution request itself, i.e., if a<widthinfo> entry was specified as part of the symbolic substitution request.   
●A value specified on a %setrepwidth statement corresponding to the current section in the Nastran data file, if there is one active, i.e., if it has not been deactivated by an %unsetrepwidth statement.   
A value specified on the Nastran command line or in RC files using the repwidth keyword corresponding to the current section in the Nastran data file.   
·A value specified in the Nastran data file using the %de frepwidth statement corresponding to the current section in the Nastran data file, if there is one active, i.e., if it has not been deactivated by a %unde f repwi dth statement.   
The program default value of exact (O . 0).  

This precedence also follows normal Nastran ordering,i.e.,"the record wins followed by the data file wins," while still providing great flexibility.  

+ When running in licensing "Interlock" mode, i.e.,in CRC validation mode, the following restrictions will be in effect. If a restriction is violated, Nastran processing will be terminated. ·The %setrepsym, %unsetrepsym, %defrepsym and %undefrepsym statements are not allowed. Also, specifying a default value within the symbolic substitution request is not allowed. That is, symbolic variable values may only be set using the repsym keyword on the command line or in an RC file. Note that the %setrepwidth, %unsetrepwidth, %defrepwidth and %undefrepwidth statements are allowed. A maximum of two symbolic substitution specifications are allowed per record and a maximum of ten symbolic substitution requests are allowed in the entire input data file. Interlock CRC calculations will be made on the input record before symbolic substitution occurs. Note that any alterations to the record made as part of the CRC calculation processing will not affect symbolic substitution processing.  

### Requesting Symbolic Substitution Replacement Information Using REPINFO  

A report of what symbolicsubstitutions were made is generated at the end of Nastran processing, with the level of detail in the report controlled by an "information level" flag set using the repinfo $\scriptstyle\cdot=n$ keyword, where $n$ is an integer number that specifies the level of detail desired.The meaning the various values for n are as follows:   
0 suppress the report altogether   
1 report the various values assigned using the reps ym keyword  

2 same as l except add the various values assigned using the setreps ym statement   
3 same as 2 except add the various values assigned using the defprepsym statement   
4 same as 3 except add the various values assigned as local default values   
5 same as 1 except add all locations where the specified repsym value was used   
6 same as 2 and 5 except add all locations where the specified set repsym value was used   
7 same as 3 and 6 except add all locations where the specified def repsym value was used   
8 same as 4 and 7 except add all locations where local default values were used.  

The report is written to the .f06 file.If there is not enough dynamic memory available to save the report information, the repinfo level may be reduced. When running in MSC Nastran, the default is repinfo ${}=1$ . Otherwise,repinfo $_{\cdot=0}$ will be forced.  

Just as with other Nastran command line or RC file keywords, the REPINFO keyword is not casesensitive.  

## Error Handling  

If an error is encountered processing a setrepsym, unset repsym, defrepsym, undefrepsym, setrepwidth, unsetrewidth, def repwidth or undefrepwidth statement,acomment string will be added to the record giving the error information and the record willbe passed to Nastran (or the application reading the datafile)as if the record wasanormal Nastran data record.Ifan error is encountered in a record containinga symbolic substitution request, the symbolic substitution request willnotbe processed and, if repinfo ${}=1$ or greater is in effect, a message giving information about the error will be written to the .log file.It is expected that the statements in error willnot be valid Nastran statements and so will be flagged as an error.  

## Examples  

1. The value on an“OPTION" statement is to be settable using the command line, taking a default value of"OPTlval" (case-sensitive) ifno command line value is set. The OPTION statement could be OPTION $=\%$ Option:'OPTlval'% and the command line parameter that would be used to set OPTION to a different value, OP2VAL (not case-sensitive), would be RepSym $\circleddash$ Option $\c=$ op2val   
2. An INCLUDE file contains records that are to be used four times in the Bulk Data Section of a Nastran data file,with the only difference being the value in Field 3ofone record. The first time the file is used,this field must contain the value 1.234, the second time this field must contain the value 4.567 and the last two times this field must contain the value -12.578. In allcases, the replacement field must be eight characters wide and the data must be left-justified in the field. Assuming that the symbolic variable is DATFL3 and that the include file name is incl.data,this could be done as follows:  

In the include file, specify the following statements before the record to be modified:  

%DefRepSym datfl3 $\c=$ -12.578 then the record to be modified could be specified as follows:  

FL1 FL2 %datfl3%FL4 FL5 FL6 and, for completeness, specify the following record after the record to be modified:  

%Undefrepsym datfl3 Then the data file would contain:  

%setrepsym DATFL $3{=}1$ .234 %DefRepWidth,bulk include 'incl.data' %setrepsym DATFL3=4.567 include 'incl.data' %Unsetrepsym datfl3 include 'incl.data' include 'incl.data'  