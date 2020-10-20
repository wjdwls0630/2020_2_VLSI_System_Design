* stimulus.sp

* Parameters and models
*--------------------------------------------------------------------------------------------------
.TITLE TTSS
.LIB '../../corner.lib' TTSS

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
vin0 input 0 0 pulse 0 vdd 10n 0.02n 0.02n 10n 20.04n

.TRAN 100e-12 50e-9 START=0.0

* Measure
*---------------------------------------------------------------------------------------------------
.measure tran tpdf TRIG v(input) VAL='vdd/2' TD=0 RISE=1  *falling propagation delay
+	TARG v(output) VAL='vdd/2' FALL=1
.measure tran tpdr TRIG v(input) VAL='vdd/2' TD=0 FALL=1  *rising propagation delay
+	TARG v(output) VAL='vdd/2' RISE=1
.measure tran tpd param='(tpdf+tpdr)/2' * average prop delay
.measure tran tr trig v(output) VAL='vdd*0.2', RISE=1 *rise time
+	targ v(output) VAL='vdd*0.8', RISE=1
.measure tran tf trig v(output) VAL='vdd*0.8', FALL=1 *fall time
+	targ v(output) VAL='vdd*0.2', FALL=1
.measure tran avgpower AVG power FROM=1n TO=50n
.measure tran peakpower MAX power FROM=1n TO=50n

.ALTER TTTT
.DEL LIB '../../corner.lib' TTSS
.LIB '../../corner.lib' TTTT

.ALTER TTFF
.DEL LIB '../../corner.lib' TTTT
.LIB '../../corner.lib' TTFF

.END
