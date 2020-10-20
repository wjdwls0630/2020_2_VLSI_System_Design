* stimulus.sp

* Parameters and models
* FO4 Delay and Power
*--------------------------------------------------------------------------------------------------
.TITLE FO4 
.LIB '../corner.lib' TTTT

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
.PARAM H=4
x1 b a vdd gnd inverter M='H**1'
x2 c b vdd gnd inverter M='H**2'
x3 d c vdd gnd inverter M='H**3'
x4 e d vdd gnd inverter M='H**4'
x5 f e vdd gnd inverter M='H**5'
* Stimulus
*---------------------------------------------------------------------------------------------------
VDD vdd gnd vdd
vin0 a 0 0 pulse 0 vdd 10n 0.02n 0.02n 10n 20.04n

.TRAN 100e-12 50e-9 START=0.0

* Measure
*---------------------------------------------------------------------------------------------------
.measure tran tpdf TRIG v(c) VAL='vdd/2' TD=0 RISE=1  *falling propagation delay
+	TARG v(d) VAL='vdd/2' FALL=1
.measure tran tpdr TRIG v(c) VAL='vdd/2' TD=0 FALL=1  *rising propagation delay
+	TARG v(d) VAL='vdd/2' RISE=1
.measure tran tpd param='(tpdf+tpdr)/2' * average prop delay
.measure tran tr trig v(d) VAL='vdd*0.2', RISE=1 *rise time
+	targ v(d) VAL='vdd*0.8', RISE=1
.measure tran tf trig v(d) VAL='vdd*0.8', FALL=1 *fall time
+	targ v(d) VAL='vdd*0.2', FALL=1
.measure tran avgpower AVG power FROM=1n TO=50n
.measure tran peakpower MAX power FROM=1n TO=50n

.END
