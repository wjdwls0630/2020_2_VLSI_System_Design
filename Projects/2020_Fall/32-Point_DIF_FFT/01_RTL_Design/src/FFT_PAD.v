//24 fixed point FFT. 32-8=24 W = round(float * 256/2^8/)
//Copyright (C) jasonlin316 github: https://github.com/jasonlin316/A-Single-Path-Delay-32-Point-FFT-Processor
//Design object: Understnand a Single-Path FFT implementation and its code.
// Also, experience chip design flow.
`include "./FFT.v"
module FFT_PAD (
  // System I/O
  input i_CLK, // Clock
  input i_RSTN, // Reset
  //output CLK_OUT,

  // FFT I/O
  input i_VALID, // A flag that in-data is valid.
  input [11:0] i_DATA_REAL, // In terms of complex, real in-data
  input [11:0] i_DATA_IMAG, // In terms of complex, imag in-data
  output o_VALID, // A flag that output data is valid - the FFT process is done.
  output [15:0] o_DATA_REAL,
  output [15:0] o_DATA_IMAG
  );

  /****************************************************************************
  *                           	   PAD Signal : _p			                      *
  *****************************************************************************/
  //=========================Internal Connection===============================
  // System I/O
  wire w_clk_p; // Clock
  //wire w_clk_out_p; // Clock Out
  wire w_rstn_p; // Reset

  // FFT I/O
  wire w_i_valid_p;
  wire [11:0] w_i_data_real_p;
  wire [11:0] w_i_data_imag_p;
  wire w_o_valid_p;
  wire [15:0] w_o_data_real_p;
  wire [15:0] w_o_data_imag_p;
  //============================================================================
  //============================================================================
  // Basic Function of I/O Pad
  // Interface between internal and external part of chip
  // Protect internal part of chip from external stress(ESD)
  // Supply power and ground to drive chip

  // Types of I/O

  // Normal I/O (GPIO)
  // Digital signal Buffering, Level Shifting, Current Driving, Tolerant, ESD protection
  // pvhbcudtart(Low Driver Stregth Output) pvhbcudtbrt(High Driver Strength Output)
  // CI: Input Enable
  // CPU: Pull up Control
  // CPD: Pull down Control
  // CD0: Driver Strength Control
  // CD1: Driver Strength Control
  // CE: Output Enable
  // A: Data Input
  // PI: Nandtree Input
  // CLTCH: Retention Control (Retention or Fail-safe IO have feature for reducing leakage power consumption.)
  // Y: Output data
  // PAD: In-Out data

  // Analog I/O
  // Analog signal bypassing, ESD protection
  // Not used

  // Power Cell
  // Supply Power, Ground, ESD protection

  // Power Ring (internal to external, in order)
  // VDDI: 1.2V I/O power ring
  // VSSIP: 1.2V I/O ground ring
  // VDDP: 1.8V/2.5V/3.3V I/O power ring
  // VDDO: 1.8V/2.5V/3.3V I/O power ring
  // VSSO: 1.8V/2.5V/3.3V I/O ground ring

  // vddtvh, vsstvh: vddtvh, vsstvh are total power-ground pair.
  // vddth supplies 1.8~3.3V power on VDDP, VDDO rings and VDDT internal port
  // vssth supplies ground on VSSO ring, VSST internal port

  // vddivh, vssipvh: vddivh, vssipvh are internal power power-ground pair.
  // vddivh supplies 1.2V power on VDDI ring and internal port.
  // vssipvh supplies ground on VSSIP ring and internal port.

  // I/O pad guide
  //It is the best way that 3.3V logic is located on the corner of chip,
  //owing to being deprived of connection with main(internal) module.
  // Setting a number of GND PAD as much as possible has advantageous for stabilizing supply voltage,
  // especially periphery of high frequency such as i_CLK.

  // Normal I/O
  // break - vsstv - N_I/O - vssipv - vddiv - vddtv - break

  // Analog I/O
  // break - A_I/O - vsstv - vddtv - A_I/O - break
  //============================================================================
  /****************************************************************************
  *                    LEFT (pad1() ~ pad52()) 		                         *
  *****************************************************************************/
  ec_breakv pad1();
  vsstvh pad2();
  pvhbcudtart pad3(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_CLK), .Y(w_clk_p));
  vssipvh pad4();
  vddivh pad5();
  vddtvh pad6();
  ec_breakv pad7();
  vsstvh pad8 ();
  vsstvh pad9 ();
  pvhbcudtart pad10(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_VALID), .Y(w_i_valid_p));
  vssipvh pad11();
  vddivh pad12();
  vddtvh pad13();
  ec_breakv pad14();
  vsstvh pad15 ();
  pvhbcudtbrt pad16(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[11]), .Y(w_i_data_real_p[11]));
  pvhbcudtbrt pad17(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[10]), .Y(w_i_data_real_p[10]));
  vssipvh pad18();
  vddivh pad19();
  ec_breakv pad20();
  vsstvh pad21 ();
  pvhbcudtbrt pad22(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[9]), .Y(w_i_data_real_p[9]));
  pvhbcudtbrt pad23(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[8]), .Y(w_i_data_real_p[8]));
  vssipvh pad24();
  vddivh pad25();
  ec_breakv pad26();
  vsstvh pad27 ();
  pvhbcudtbrt pad28(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[7]), .Y(w_i_data_real_p[7]));
  pvhbcudtbrt pad29(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[6]), .Y(w_i_data_real_p[6]));
  vssipvh pad30();
  vddivh pad31();
  ec_breakv pad32();
  vsstvh pad34 ();
  pvhbcudtbrt pad35(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[5]), .Y(w_i_data_real_p[5]));
  pvhbcudtbrt pad36(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[4]), .Y(w_i_data_real_p[4]));
  vssipvh pad37();
  vddivh pad38();
  ec_breakv pad39();
  vsstvh pad40 ();
  pvhbcudtbrt pad41(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[3]), .Y(w_i_data_real_p[3]));
  pvhbcudtbrt pad42(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[2]), .Y(w_i_data_real_p[2]));
  vssipvh pad43();
  vddivh pad44();
  ec_breakv pad45();
  vsstvh pad46 ();
  pvhbcudtbrt pad47(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[1]), .Y(w_i_data_real_p[1]));
  pvhbcudtbrt pad48(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_REAL[0]), .Y(w_i_data_real_p[0]));
  vssipvh pad49();
  vddivh pad50();
  vddtvh pad51();
  ec_breakv pad52();
  //============================================================================
  /****************************************************************************
  *                    Bottom (pad53() ~ pad104())          	                 *
  *****************************************************************************/
  //============================================================================
  ec_breakv pad53();
  vsstvh pad54 ();
  pvhbcudtbrt pad55(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[11]), .Y(w_i_data_imag_p[11]));
  pvhbcudtbrt pad56(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[10]), .Y(w_i_data_imag_p[10]));
  vssipvh pad57();
  vddivh pad58();
  ec_breakv pad59();
  vsstvh pad60 ();
  pvhbcudtbrt pad61(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[9]), .Y(w_i_data_imag_p[9]));
  pvhbcudtbrt pad62(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[8]), .Y(w_i_data_imag_p[8]));
  vssipvh pad63();
  vddivh pad64();
  ec_breakv pad65();
  vsstvh pad66 ();
  pvhbcudtbrt pad67(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[7]), .Y(w_i_data_imag_p[7]));
  pvhbcudtbrt pad68(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[6]), .Y(w_i_data_imag_p[6]));
  vssipvh pad69();
  vddivh pad70();
  ec_breakv pad71();
  vsstvh pad72 ();
  pvhbcudtbrt pad73(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[5]), .Y(w_i_data_imag_p[5]));
  pvhbcudtbrt pad74(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[4]), .Y(w_i_data_imag_p[4]));
  vssipvh pad75();
  vddivh pad76();
  ec_breakv pad77();
  vsstvh pad78 ();
  pvhbcudtbrt pad79(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[3]), .Y(w_i_data_imag_p[3]));
  pvhbcudtbrt pad80(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[2]), .Y(w_i_data_imag_p[2]));
  vssipvh pad81();
  vddivh pad82();
  ec_breakv pad83();
  vsstvh pad84 ();
  pvhbcudtbrt pad85(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[1]), .Y(w_i_data_imag_p[1]));
  pvhbcudtbrt pad86(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_DATA_IMAG[0]), .Y(w_i_data_imag_p[0]));
  vssipvh pad87();
  vddivh pad88();
  vddtvh pad89();
  ec_breakv pad90();
  vsstvh pad91();
  vssipvh pad92();
  vddivh pad93();
  vddtvh pad94();
  ec_breakv pad95();
  vsstvh pad96();
  vssipvh pad97();
  vddivh pad98();
  vddtvh pad99();
  ec_breakv pad100();
  vsstvh pad101();
  vssipvh pad102();
  vddtvh pad103();
  ec_breakv pad104();


  //============================================================================
  /****************************************************************************
  *                    Right (pad105() ~ pad156())           	                 *
  *****************************************************************************/
  //============================================================================
  vssipvh pad105();
  ec_breakv pad106();
  vsstvh pad107();
  pvhbcudtbrt pad108(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[15]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[15]));
  pvhbcudtbrt pad109(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[14]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[14]));
  vssipvh pad110();
  vddivh pad111();
  vddtvh pad112();
  ec_breakv pad113();
  vsstvh pad114();
  pvhbcudtbrt pad115(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[13]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[13]));
  pvhbcudtbrt pad116(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[12]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[12]));
  vssipvh pad117();
  vddtvh pad118();
  ec_breakv pad119();
  vsstvh pad120 ();
  pvhbcudtbrt pad121(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[11]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[11]));
  pvhbcudtbrt pad122(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[10]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[10]));
  vssipvh pad123();
  vddivh pad124();
  ec_breakv pad125();
  vsstvh pad126 ();
  pvhbcudtbrt pad127(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[9]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[9]));
  pvhbcudtbrt pad128(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[8]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[8]));
  vssipvh pad129();
  vddivh pad130();
  ec_breakv pad131();
  vsstvh pad132 ();
  pvhbcudtbrt pad133(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[7]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[7]));
  pvhbcudtbrt pad134(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[6]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[6]));
  vssipvh pad135();
  vddivh pad136();
  ec_breakv pad137();
  vsstvh pad138 ();
  pvhbcudtbrt pad139(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[5]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[5]));
  pvhbcudtbrt pad140(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[4]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[4]));
  vssipvh pad141();
  vddivh pad142();
  ec_breakv pad143();
  vsstvh pad144 ();
  pvhbcudtbrt pad145(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[3]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[3]));
  pvhbcudtbrt pad146(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[2]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[2]));
  vssipvh pad147();
  vddivh pad148();
  ec_breakv pad149();
  vsstvh pad150 ();
  pvhbcudtbrt pad151(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[1]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[1]));
  pvhbcudtbrt pad152(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_real_p[0]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_REAL[0]));
  vssipvh pad153();
  vddivh pad154();
  vddtvh pad155();
  ec_breakv pad156();
  //============================================================================
  /****************************************************************************
  *                    TOP (pad157() ~ pad208())                                *
  *****************************************************************************/
  //============================================================================
  ec_breakv pad157();
  vsstvh pad158 ();
  pvhbcudtbrt pad159(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[11]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[11]));
  pvhbcudtbrt pad160(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[10]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[10]));
  vssipvh pad161();
  vddivh pad162();
  ec_breakv pad163();
  vsstvh pad164 ();
  pvhbcudtbrt pad165(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[11]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[11]));
  pvhbcudtbrt pad166(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[10]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[10]));
  vssipvh pad167();
  vddivh pad168();
  ec_breakv pad169();
  vsstvh pad170 ();
  pvhbcudtbrt pad171(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[11]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[11]));
  pvhbcudtbrt pad172(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[10]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[10]));
  vssipvh pad173();
  vddivh pad174();
  ec_breakv pad175();
  vsstvh pad176 ();
  pvhbcudtbrt pad177(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[9]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[9]));
  pvhbcudtbrt pad178(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[8]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[8]));
  vssipvh pad179();
  vddivh pad180();
  ec_breakv pad181();
  vsstvh pad182 ();
  pvhbcudtbrt pad183(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[7]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[7]));
  pvhbcudtbrt pad184(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[6]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[6]));
  vssipvh pad185();
  vddivh pad186();
  ec_breakv pad187();
  vsstvh pad188 ();
  pvhbcudtbrt pad189(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[5]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[5]));
  pvhbcudtbrt pad190(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[4]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[4]));
  vssipvh pad191();
  vddivh pad192();
  ec_breakv pad193();
  vsstvh pad194 ();
  pvhbcudtbrt pad195(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[3]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[3]));
  pvhbcudtbrt pad196(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[2]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[2]));
  vssipvh pad197();
  vddivh pad198();
  ec_breakv pad199();
  vsstvh pad200 ();
  pvhbcudtbrt pad201(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[1]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[1]));
  pvhbcudtbrt pad202(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_data_imag_p[0]), .PI(1'b0), .CLTCH(), .PAD(o_DATA_IMAG[0]));
  vssipvh pad203();
  ec_breakv pad204();
  pvhbcudtart pad205(.CI(1'b0), .CPU(1'b0), .CPD(1'b0), .CD0(1'b1), .CD1(1'b1), .CE(1'b1), .A(w_o_valid_p), .PI(1'b0), .CLTCH(), .PAD(o_VALID));
  ec_breakv pad206();
  // schmitt trigger for global reset
  pvhbsudtbrt pad207(.CI(1'b1), .CPU(1'b0), .CPD(1'b0), .CD0(1'b0), .CD1(1'b0), .CE(1'b0), .A(1'b0), .PI(1'b0), .CLTCH(), .PAD(i_RSTN), .Y(w_rstn_p));
  ec_breakv pad208();
  //============================================================================
  FFT FFT(
    .clk(w_clk_p),
    .rst_n(w_rstn_p),
    .in_valid(w_i_valid_p),
    .din_r(w_i_data_real_p),
    .din_i(w_i_data_imag_p),
    .out_valid(w_o_valid_p),
    .dout_r(w_o_data_real_p),
    .dout_i(w_o_data_imag_p)
  );
endmodule //FFT_PAD
