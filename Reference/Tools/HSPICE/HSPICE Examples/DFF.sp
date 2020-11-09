
.lib "/Tools/Library/ncsu-cdk-1.5.1/models/hspice/public/publicModel/tsmc20P" PMOS
.lib "/Tools/Library/ncsu-cdk-1.5.1/models/hspice/public/publicModel/tsmc20N" NMOS

.option post
.option scale = 200n

***** voltage ******

.param vd = 1.8

*********** sizing parameter *************

.param inv_l = 2
.param inv_W_n = 2
.param inv_W_p = 6

************************* DFF***************************

.SUBCKT LATCH_TNP_G3 CLK CLKB D GND Q QB VDD 
MP3 N_1 CLKB QB VDD TSMC20P  W=inv_W_p  L=inv_l 
+AS='inv_W_p*5' PS='2*inv_W_p+10' AD='inv_W_p*5' PD='2*inv_W_p+10' 
MP2 VDD Q QB VDD TSMC20P  W=inv_W_p  L=inv_l 
+AS='inv_W_p*5' PS='2*inv_W_p+10' AD='inv_W_p*5' PD='2*inv_W_p+10'
MP1 D CLK N_1 VDD TSMC20P   W=inv_W_p  L=inv_l 
+AS='inv_W_p*5' PS='2*inv_W_p+10' AD='inv_W_p*5' PD='2*inv_W_p+10'
MP0 Q N_1 VDD VDD TSMC20P   W=inv_W_p  L=inv_l 
+AS='inv_W_p*5' PS='2*inv_W_p+10' AD='inv_W_p*5' PD='2*inv_W_p+10'
MN1 D CLKB N_1 GND  TSMC20N  W=inv_W_n  L=inv_l 
+AS='inv_W_n*5' PS='2*inv_W_n+10' AD='inv_W_n*5' PD='2*inv_W_n+10'
MN3 N_1 CLK QB GND  TSMC20N W=inv_W_n  L=inv_l 
+AS='inv_W_n*5' PS='2*inv_W_n+10' AD='inv_W_n*5' PD='2*inv_W_n+10'
MN2 GND Q QB GND  TSMC20N  W=inv_W_n  L=inv_l 
+AS='inv_W_n*5' PS='2*inv_W_n+10' AD='inv_W_n*5' PD='2*inv_W_n+10'
MN0 Q N_1 GND GND  TSMC20N  W=inv_W_n  L=inv_l 
+AS='inv_W_n*5' PS='2*inv_W_n+10' AD='inv_W_n*5' PD='2*inv_W_n+10'
* END OF SUBCIRCUIT DEFINITION.
.ENDS LATCH_TNP_G3

.SUBCKT LATCH_TPP_G2 CLK CLKB D GND Q QB VDD 
MN0 Q N_1 GND GND  TSMC20N  W=inv_W_n  L=inv_l 
+AS='inv_W_n*5' PS='2*inv_W_n+10' AD='inv_W_n*5' PD='2*inv_W_n+10'
MN2 GND Q QB GND TSMC20N   W=inv_W_n  L=inv_l 
+AS='inv_W_n*5' PS='2*inv_W_n+10' AD='inv_W_n*5' PD='2*inv_W_n+10'
MN3 N_1 CLKB QB GND TSMC20N   W=inv_W_n  L=inv_l 
+AS='inv_W_n*5' PS='2*inv_W_n+10' AD='inv_W_n*5' PD='2*inv_W_n+10' 
MN1 D CLK N_1 GND TSMC20N   W=inv_W_n  L=inv_l 
+AS='inv_W_n*5' PS='2*inv_W_n+10' AD='inv_W_n*5' PD='2*inv_W_n+10'
MP0 Q N_1 VDD VDD TSMC20P   W=inv_W_p  L=inv_l 
+AS='inv_W_p*5' PS='2*inv_W_p+10' AD='inv_W_p*5' PD='2*inv_W_p+10'
MP1 D CLKB N_1 VDD TSMC20P  W=inv_W_p  L=inv_l 
+AS='inv_W_p*5' PS='2*inv_W_p+10' AD='inv_W_p*5' PD='2*inv_W_p+10'
MP2 VDD Q QB VDD TSMC20P   W=inv_W_p  L=inv_l 
+AS='inv_W_p*5' PS='2*inv_W_p+10' AD='inv_W_p*5' PD='2*inv_W_p+10'
MP3 N_1 CLK QB VDD TSMC20P   W=inv_W_p  L=inv_l 
+AS='inv_W_p*5' PS='2*inv_W_p+10' AD='inv_W_p*5' PD='2*inv_W_p+10'
* END OF SUBCIRCUIT DEFINITION.
.ENDS LATCH_TPP_G2

 
XI1 CLK CLKB NET17 GND Q QB VDD LATCH_TPP_G2
XI0 CLK CLKB D GND NET17 NET21 VDD LATCH_TNP_G3


******************************** END OF DFF *****************

cload q gnd 1f

***** signal (d, clk, clkb ) ******
vdd vdd gnd vd

*d input vector 
vin d 0 pwl 2.91n 0 3.01n vd 
+4.3n vd 4.4n 0 
+7n 0 7.1n vd 
+12.9n vd 13.0n 0 

*clk input vector - 500MHz concerned
vclk clk gnd pulse 0 vd 1n 0.1n 0.1n 0.9n 2n
vclkb clkb gnd pulse vd 0 1n 0.1n 0.1n 0.9n 2n

**** measure ****
   
.measure tpdr				* rising propagation delay
+       TRIG v(clk)	VAL='vd/2' rise=1   td = 2n
+       TARG v(q)  	VAL='vd/2' rise=1   td =2n
.measure tpdf				* rising propagation delay
+       TRIG v(clk)	VAL='vd/2' rise=1   td =4n
+       TARG v(q)  	VAL='vd/2' fall=1   td =4n
.measure tpdrError				* rising propagation delay
+       TRIG v(clk)	VAL='vd/2' rise=1   td = 8n
+       TARG v(q)  	VAL='vd/2' rise=1   td = 8n
.measure tpdfError				* rising propagation delay
+       TRIG v(clk)	VAL='vd/2' rise=1   td = 12n
+       TARG v(q)  	VAL='vd/2' fall=1   td = 12n

.measure tpd param='(tpdr+tpdf)/2'
.measure tpdError param='(tpdrError+tpdfError)/2'

.measure setuptime 
+ trig v(d) VAL='vd/2' rise=1 td=2.5n
+ targ v(clk) VAL='vd/2' rise=1 td =2.5n

.meas pwr AVG POWER from=1ns to=14ns

* END OF NETLIST

.option INGOLD=2 ARTIST=2 PSF=2
+ PROBE=0
+ DELMAX = 1.00E-09

.tran 1p 14n 
.TEMP 25
.op  
.END
