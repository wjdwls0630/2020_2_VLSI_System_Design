* stimulus.sp



* Parameters and models
* DFF Setup and hold time analysis
* Bisection Methodology
*--------------------------------------------------------------------------------------------------
.TITLE DFF_CASE11 
.LIB '../corner.lib' TTTT

.OPTION
+    DELMAX=1e-9
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
+    Post Brief NoMod

* Parameter
* Specify DelayTime as the search parameter and provide the lower and upper limits.
.PARAM DelayTime = Opt1 (0.0n, 0.0n, 5n)

.PARAM first_volt='vdd' 
.PARAM second_volt=0
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
+ 0s 'first_volt' 
+ 4.0n 'first_volt'
+ 4.7n 'second_volt'
+ TD = 'DelayTime' 
* rising edge clock
* 500MHz, propose 10% transition time of clock period time
* D-FF's initialization is needed, since D-FF is unknown-state at first.
vin1 ck gnd PWL
+ 0s 0
+ 1n 0
+ 1.7n vdd
+ 2.7n vdd
+ 3.4n 0
+ 5.4n 0
+ 6.1n vdd

* Optimization Model
.MODEL OptMod Opt
+ Method = Bisection

.TRAN 3.4n 11n SWEEP OPTIMIZE = Opt1
+                 RESULT = Vout  
+                 MODEL  = OptMod
* Measure
*---------------------------------------------------------------------------------------------------
* finds the transition if it exists
.if ('first_volt'=='vdd')
* Setup Time 
.MEASURE TRAN Vout AVG v(q) Goal=0.4468 FROM=5.4n TO=6.4n
.MEASURE tran setup11 TRIG v(d) VAL='vdd/2' TD=3.4n FALL=1 $ when d changes 0 to 1, see q change 
+	TARG v(ck) VAL='vdd/2' RISE=1
.else
.MEASURE TRAN Vout MIN v(q) Goal=1u FROM=3.4n TO=7.2n
.MEASURE tran setup00 TRIG v(d) VAL='vdd/2' TD=3.4n RISE=1 $ when d changes 1 to 0, see q change 
+	TARG v(ck) VAL='vdd/2' RISE=1
.endif
.MEASURE tran avgpower AVG power FROM=3.4n TO=11n
.MEASURE tran peakpower MAX power FROM=3.4n TO=11n

.ALTER DFF_CASE00
.PARAM first_volt=0 
.PARAM second_volt='vdd'

.END
