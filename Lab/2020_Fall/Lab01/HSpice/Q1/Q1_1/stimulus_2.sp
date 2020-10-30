** Generated for: hspiceD

* Parameters and models
*--------------------------------------------------------------------------------------------------
.TITLE TTTT_pMOS_I-V_Curve
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
m1 vdd vsg vsd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
* Simulation netlist
*---------------------------------------------------------------------------------------------------
* Stimulus
*---------------------------------------------------------------------------------------------------
vdd vdd gnd vdd
vsg vsg gnd 0 
vsd vsd gnd 0

.DC vsd 0 vdd 0.001 SWEEP vsg 0 vdd 0.1
.PROBE DC i3(m1)
.END 
