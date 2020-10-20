** Generated for: hspiceD
** Generated on: Apr 13 21:44:59 2020
** Design library name: Library_Jin
** Design cell name: inverter
** Design view name: schematic

** Library name: Library_Jin
** Cell name: inverter
** View name: schematic
.subckt inverter output input vdd gnd
m0 output input gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 output input vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends

.print TARN i(m0)
