***********************************************************************
* Parameters and models
***********************************************************************

.param SUPPLY=1.8
.param H=4
.option scale = 200n
.temp 25
.option post 


***********************************************************************
* Subcircuits - Inverter
***********************************************************************


.subckt inv a y N=4 P=8
MP0 y	a	gnd	gnd	TSMC20P	W='N'	L=2 
+ AS='N*5' PS='2*N+10' AD='N*5' PD='2*N+10'
MN0 y a	vdd	vdd	TSMC20N	W='P'	L=2
+ AS='P*5' PS='2*P+10' AD='P*5' PD='2*P+10'
.ends

***********************************************************************
* Library Path
***********************************************************************

.lib "/Tools/Library/ncsu-cdk-1.5.1/models/hspice/public/publicModel/tsmc20P" PMOS
.lib "/Tools/Library/ncsu-cdk-1.5.1/models/hspice/public/publicModel/tsmc20N" NMOS



***********************************************************************
* Simulation netlist
***********************************************************************
Vdd	vdd	gnd	'SUPPLY'
Vin	a	gnd	PULSE	0 'SUPPLY' 0ps 100ps 100ps 500ps 1000ps

X1	a	b	inv		 * shape input waveform
X2	b	c	inv	M='H'	 * reshape input waveform
X3	c	d	inv	M='H**2' * device under test
X4	d	e	inv	M='H**3' * load
X5  	e	f	inv	M='H**4' * load on load



***********************************************************************
* Stimulus
***********************************************************************
.tran 1ps 1000ps

.measure tpdr3				* rising propagation delay
+     TRIG v(b)	VAL='SUPPLY/2' FALL=1 
+     TARG v(c)  	VAL='SUPPLY/2' RISE=1
.measure tpdr				* rising propagation delay
+     TRIG v(c)	VAL='SUPPLY/2' FALL=1 
+     TARG v(d)  	VAL='SUPPLY/2' RISE=1
.measure tpdf				* falling propagation delay
+     TRIG v(c)  	VAL='SUPPLY/2' RISE=1
+     TARG v(d)  	VAL='SUPPLY/2' FALL=1 
.measure tpdr2				* rising propagation delay
+     TRIG v(d)	VAL='SUPPLY/2' FALL=1 
+     TARG v(e)  	VAL='SUPPLY/2' RISE=1
.measure tpdf2				* falling propagation delay
+     TRIG v(d)  	VAL='SUPPLY/2' RISE=1
+     TARG v(e)  	VAL='SUPPLY/2' FALL=1 
.measure tpd param='(tpdr+tpdf)/2'	* average propagation delay
.measure trise					* rise time
+	TRIG v(d)	VAL='0.1*SUPPLY' RISE=1
+	TARG v(d)	VAL='0.9*SUPPLY' RISE=1
.measure tfall					* fall time
+	TRIG v(d)	VAL='0.9*SUPPLY' FALL=1
+	TARG v(d)	VAL='0.1*SUPPLY' FALL=1

.option INGOLD=2 ARTIST=2 PSF=2
+ PROBE=0
+ DELMAX = 1.00E-09 
.end
