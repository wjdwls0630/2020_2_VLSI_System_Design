* stimulus.sp

* Parameters and models
* DFF Simulation 
*--------------------------------------------------------------------------------------------------
.TITLE DFF_TIMING 
.LIB '../corner.lib' TTTT

.OPTION
+    DELMAX=1e-9
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2

* Subcircuits
*---------------------------------------------------------------------------------------------------
.include 'D#2dFF.sp'

* Simulation netlist
*---------------------------------------------------------------------------------------------------
x1 q d ck vdd gnd dff 

* Stimulus
*---------------------------------------------------------------------------------------------------
VDD vdd gnd vdd

vin0 d gnd PWL
+ 0s vdd $ q: unknow -> 1 
+ 15.7n vdd 
+ 16.4n 0 $ q: 1 -> 0 (tclk_qf)
+ 52.66n 0 $ setup violation
+ 53.36n vdd
+ 95.5345n vdd $ (negative) hold violation
+ 96.2345n 0
+ 133.0n 0 $ q: 0 -> 1 (tclk_qr)
+ 133.7n vdd 
+ 141.0n vdd
+ 141.7n 0

vin1 ck 0 0 pulse 0 vdd 10n 0.7n 0.7n 10n 21.4n

.TRAN 0.001n 148n START=0.0n
* Measure
*---------------------------------------------------------------------------------------------------
.MEASURE tran tclk_qf TRIG v(ck) VAL='vdd/2' RISE=1  
+	TARG v(q) VAL='vdd/2' FALL=1 FROM=25n TO=38n
.MEASURE tran tclk_qr TRIG v(ck) VAL='vdd/2' RISE=1  
+	TARG v(q) VAL='vdd/2' RISE=1 FROM=135n TO=148n
.MEASURE tran tclk-q param='(tclk_qf+tclk_qr)/2' $average delay
.MEASURE tran avgpower AVG power FROM=1n TO=148n
.MEASURE tran peakpower MAX power FROM=1n TO=148n

.END
