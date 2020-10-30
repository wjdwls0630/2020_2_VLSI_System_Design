************************************************************************
* auCdl Netlist:
* 
* Library Name:  Library_Jin
* Top Cell Name: fan_in_6_comb
* View Name:     schematic
* Netlisted on:  Oct 19 21:40:01 2020
************************************************************************

*.EQUATION
*.SCALE METER
*.MEGA
.PARAM



************************************************************************
* Library Name: Library_Jin
* Cell Name:    inverter
* View Name:    schematic
************************************************************************

.SUBCKT inverter GND Input Output VDD
*.PININFO GND:I Input:I VDD:I Output:O
MM0 Output Input GND GND NMOS_VTL W=90n L=50n m=1
MM1 Output Input VDD VDD PMOS_VTL W=180.0n L=50n m=1
.ENDS

************************************************************************
* Library Name: Library_Jin
* Cell Name:    fan_in_6_comb
* View Name:    schematic
************************************************************************

.SUBCKT fan_in_6_comb Y Y_b A B C D E F VDD GND 
*.PININFO A:I B:I C:I D:I E:I F:I GND:I VDD:I Y:O
MM11 net19 B VDD VDD PMOS_VTL W=540.0n L=50n m=1
MM10 net19 A VDD VDD PMOS_VTL W=540.0n L=50n m=1
MM9 net15 C net19 VDD PMOS_VTL W=540.0n L=50n m=1
MM8 net15 E net19 VDD PMOS_VTL W=540.0n L=50n m=1
MM7 net15 D net19 VDD PMOS_VTL W=540.0n L=50n m=1
MM0 Y_b F net15 VDD PMOS_VTL W=540.0n L=50n m=1
MM6 Y_b F net13 GND NMOS_VTL W=360.0n L=50n m=1
MM5 net32 A GND GND NMOS_VTL W=240.0n L=50n m=1
MM4 net30 C GND GND NMOS_VTL W=360.0n L=50n m=1
MM3 net31 D net30 GND NMOS_VTL W=360.0n L=50n m=1
MM2 net13 B net32 GND NMOS_VTL W=240.0n L=50n m=1
MM1 net13 E net31 GND NMOS_VTL W=360.0n L=50n m=1
XI0 GND Y_b Y VDD / inverter
.ENDS

