* stimulus.sp

* Parameters and models
* Fan_in_6_comb Pre-Simulation 
*--------------------------------------------------------------------------------------------------
.TITLE FAN_IN_6_COMB_TIMING 
.LIB '../../corner.lib' TTTT

.OPTION
+    DELMAX=1e-9
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2

* Subcircuits
*---------------------------------------------------------------------------------------------------
.include 'fan_in_6_comb.pex.netlist'

* Simulation netlist
*---------------------------------------------------------------------------------------------------
x1 y N_Y_B_MM6_d a b c d e f vdd gnd fan_in_6_comb 

* Stimulus
*---------------------------------------------------------------------------------------------------
VDD vdd gnd vdd

* a
vina a gnd PWL
+ 0s 0 
+ 2n 0
+ 2.1n vdd
+ 4.1n vdd
+ 4.2n 0
+ 6.2n 0
+ 6.3n 0
+ 8.3n 0
+ 8.4n vdd
+ 10.4n vdd
+ 10.5n 0 

* b
vinb b gnd PWL
+ 0s 0 
+ 2n 0
+ 2.1n vdd
+ 4.1n vdd
+ 4.2n 0
+ 6.2n 0
+ 6.3n 0
+ 8.3n 0
+ 8.4n vdd
+ 10.4n vdd
+ 10.5n vdd 

* c
vinc c gnd PWL
+ 0s 0 
+ 2n 0
+ 2.1n vdd
+ 4.1n vdd
+ 4.2n 0
+ 6.2n 0
+ 6.3n vdd
+ 8.3n vdd
+ 8.4n vdd
+ 10.4n vdd
+ 10.5n 0 

* d
vind d gnd PWL
+ 0s 0 
+ 2n 0
+ 2.1n vdd
+ 4.1n vdd
+ 4.2n 0
+ 6.2n 0
+ 6.3n vdd
+ 8.3n vdd
+ 8.4n vdd
+ 10.4n vdd
+ 10.5n vdd

* e
vine e gnd PWL
+ 0s 0 
+ 2n 0
+ 2.1n vdd
+ 4.1n vdd
+ 4.2n 0
+ 6.2n 0
+ 6.3n vdd
+ 8.3n vdd
+ 8.4n vdd
+ 10.4n vdd
+ 10.5n vdd

* f
vinf f gnd PWL
+ 0s 0 
+ 2n 0
+ 2.1n vdd
+ 4.1n vdd
+ 4.2n 0
+ 6.2n 0
+ 6.3n vdd
+ 8.3n vdd
+ 8.4n vdd
+ 10.4n vdd
+ 10.5n 0 

.TRAN 0.001n 12n START=0.0n
* Measure
*---------------------------------------------------------------------------------------------------
.MEASURE tran tcdf TRIG v(a) VAL='vdd/2' RISE=1  
+	TARG v(N_Y_B_MM6_d) VAL='vdd/2' FALL=1 FROM=0n TO=3n
.MEASURE tran tcdr TRIG v(a) VAL='vdd/2' FALL=1  
+	TARG v(N_Y_B_MM6_d) VAL='vdd/2' RISE=1 FROM=3.1n TO=5.1n
.MEASURE tran tpdf TRIG v(c) VAL='vdd/2' RISE=1  
+	TARG v(N_Y_B_MM6_d) VAL='vdd/2' FALL=1 FROM=5.2n TO=7.2n
.MEASURE tran tpdr TRIG v(c) VAL='vdd/2' FALL=1  
+	TARG v(N_Y_B_MM6_d) VAL='vdd/2' RISE=1 FROM=9.3n TO=11.3n
.MEASURE tran avgpower AVG power FROM=1n TO=12n
.MEASURE tran peakpower MAX power FROM=1n TO=12n

.END
