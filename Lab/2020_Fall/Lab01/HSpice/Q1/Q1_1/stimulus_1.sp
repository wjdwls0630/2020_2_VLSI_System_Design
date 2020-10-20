** Generated for: hspiceD

* Parameters and models
*--------------------------------------------------------------------------------------------------
.TITLE TTTT_nMOS_I-V_Curve
.LIB '../../corner.lib' TTTT 

.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
+    DELMAX=1e-9
+    IVTH=100n
+    BYPASS=0 
* Subcircuits
*---------------------------------------------------------------------------------------------------
* Simulation netlist
*---------------------------------------------------------------------------------------------------
m0 vds vgs gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
* Simulation netlist
*---------------------------------------------------------------------------------------------------
* Stimulus
*---------------------------------------------------------------------------------------------------
vdd vdd gnd vdd
vgs vgs gnd 0 
vds vds gnd 0

.DC vds 0 vdd 0.001 SWEEP vgs 0 vdd 0.1
.PROBE DC i1(m0)
.END 
