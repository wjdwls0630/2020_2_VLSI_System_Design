
* stimulus.sp

* Parameters and models
*--------------------------------------------------------------------------------------------------
.TITLE TTTT_VTC_DC_FORWARD
.LIB '../../corner.lib' TTTT
.OPTION
+    DELMAX=1e-9
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2

* Subcircuits
*---------------------------------------------------------------------------------------------------
.include 'inverter.sp'

* Simulation netlist
*---------------------------------------------------------------------------------------------------
x1 output input vdd gnd inverter
* Stimulus
*---------------------------------------------------------------------------------------------------
VDD vdd gnd vdd
vin0 input gnd vdd


.DC vin0 0 vdd 0.001

.END
