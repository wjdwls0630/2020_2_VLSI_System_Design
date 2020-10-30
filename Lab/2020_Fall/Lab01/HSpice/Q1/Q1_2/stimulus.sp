
* stimulus.sp

* Parameters and models
*--------------------------------------------------------------------------------------------------
.TITLE TTTT_DC_Noise_Margin
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

* Noise Margin
.MEASURE DC VIL FIND V(input) WHEN DERIV('V(output)')=-1 FALL=LAST
.MEASURE DC VOH FIND V(output) WHEN DERIV('V(output)')=-1 FALL=LAST
.MEASURE DC VIH FIND V(input) WHEN DERIV('V(output)')=-1 RISE=LAST
.MEASURE DC VOL FIND V(output) WHEN DERIV('V(output)')=-1 RISE=LAST
.MEASURE NML PARAM='VIL-VOL'
.MEASURE NMH PARAM='VOH-VIH'
.MEASURE DC VM FIND V(input) WHEN V(input)=V(output)
.END
