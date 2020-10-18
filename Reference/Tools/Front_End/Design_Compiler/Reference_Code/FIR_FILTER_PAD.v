module FIR_FILTER_PAD ( RESET, CLK, WR, iDATA, oDATA );
  input [15:0] iDATA;
  output [38:0] oDATA;
  input RESET, CLK, WR;
  wire   wRESET, wCLK, wWR;
  wire   [15:0] wiDATA;
  wire   [38:0] woDATA;

  FIR_FILTER FIR1 ( .RESET(wRESET), .CLK(wCLK), .WR(wWR), .iDATA(wiDATA), 
        .oDATA(woDATA) );
        
        
        	vssoh   	pad1();
			vssoh	pad2();
			vssoh	pad3();
			vssoh	pad4();
			vdd33oph	pad5();
			vdd33oph	pad6();
			vdd33oph	pad7();
			vssoh	pad8();
			vssoh	pad9();
			vssoh	pad10();
			
			vssiph	pad11();
			vssiph	pad12(); 
			vdd12ih_core 	pad13(); 
			vdd12ih_core 	pad14();
			vssiph	pad15();
			vssiph	pad16();
			vssiph	pad17();

			vssiph	pad18();
			vssiph	pad19();
			vdd12ih 	pad20();
			vdd12ih	    pad21();
			vssiph	pad22();
			vssiph	pad23();
			vssiph	pad24();
			vssiph	pad25();
			
			vssiph	pad26();
			vssiph	pad27();
			vssiph	pad28();
			vssiph	pad29();
			vssiph	pad30();
			vssiph	pad31();
			vssiph	pad32();
        
        
  phic pad33 ( .PAD(iDATA[0]), .PI(1'b0),	.PO(), .Y(wiDATA[0]) );
  phic pad34 ( .PAD(iDATA[1]), .PI(1'b0),	.PO(), .Y(wiDATA[1]) );
  phic pad35 ( .PAD(iDATA[2]), .PI(1'b0),	.PO(), .Y(wiDATA[2]) );
  phic pad36 ( .PAD(iDATA[3]), .PI(1'b0),	.PO(), .Y(wiDATA[3]) );
  phic pad37 ( .PAD(iDATA[4]), .PI(1'b0),	.PO(), .Y(wiDATA[4]) );
  phic pad38 ( .PAD(iDATA[5]), .PI(1'b0),	.PO(), .Y(wiDATA[5]) );
  phic pad39 ( .PAD(iDATA[6]), .PI(1'b0),	.PO(), .Y(wiDATA[6]) );
  phic pad40 ( .PAD(iDATA[7]), .PI(1'b0),	.PO(), .Y(wiDATA[7]) );
  phic pad41 ( .PAD(iDATA[8]), .PI(1'b0),	.PO(), .Y(wiDATA[8]) );
  phic pad42 ( .PAD(iDATA[9]), .PI(1'b0),	.PO(), .Y(wiDATA[9]) );
  phic pad43 ( .PAD(iDATA[10]), .PI(1'b0),	.PO(), .Y(wiDATA[10]) );
  phic pad44 ( .PAD(iDATA[11]), .PI(1'b0),	.PO(), .Y(wiDATA[11]) );
  phic pad45 ( .PAD(iDATA[12]), .PI(1'b0),	.PO(), .Y(wiDATA[12]) );
  phic pad46 ( .PAD(iDATA[13]), .PI(1'b0),	.PO(), .Y(wiDATA[13]) );
  phic pad47 ( .PAD(iDATA[14]), .PI(1'b0),	.PO(), .Y(wiDATA[14]) );
  phic pad48 ( .PAD(iDATA[15]), .PI(1'b0),	.PO(), .Y(wiDATA[15]) );
  
        	vssoh   	pad49();
			vssoh	pad50();
			vssoh	pad51();
			vssoh	pad52();
			vdd33oph	pad53();
			vdd33oph	pad54();
			vdd33oph	pad55();
			vssoh	pad56();
			vssoh	pad57();
			vssoh	pad58();
			
			vssiph	pad59();
			vssiph	pad60(); 
			vdd12ih_core 	pad61(); 
			vdd12ih_core 	pad62();
			vssiph	pad63();
			vssiph	pad64();
			vssiph	pad65();

			vssiph	pad66();
			vssiph	pad67();
			vdd12ih 	pad68();
			vdd12ih	    pad69();
			vssiph	pad70();
			vssiph	pad71();
			vssiph	pad72();
			vssiph	pad73();
			
			vssiph	pad74();
			vssiph	pad75();
			vssiph	pad76();
			vssiph	pad77();
			vssiph	pad78();
			vssiph	pad79();
			vssiph	pad80();
			
					vssiph		pad81();
			vssiph		pad82();
			vssiph		pad83();   
			vssiph		pad84();
			vdd12ih 	pad85();
			vdd12ih 	pad86();
			vdd12ih	    pad87();
			vssiph		pad88();
			vssiph		pad89();
			vssiph		pad90();
			
	///////////////////////////////////////////////////

			vssoh		pad91();
			vssoh		pad92();
			vdd33oph		pad93();			
			vdd33oph		pad94();
			vssoh		pad95();
			vssoh		pad96();
  
  phob8 pad97 ( .PAD(oDATA[0]), .A(woDATA[0]) );
  phob8 pad98 ( .PAD(oDATA[1]), .A(woDATA[1]) );
  phob8 pad99 ( .PAD(oDATA[2]), .A(woDATA[2]) );
  phob8 pad100 ( .PAD(oDATA[3]), .A(woDATA[3]) );
  phob8 pad101 ( .PAD(oDATA[4]), .A(woDATA[4]) );
  phob8 pad102 ( .PAD(oDATA[5]), .A(woDATA[5]) );
  phob8 pad103 ( .PAD(oDATA[6]), .A(woDATA[6]) );
  phob8 pad104 ( .PAD(oDATA[7]), .A(woDATA[7]) );
  phob8 pad105 ( .PAD(oDATA[8]), .A(woDATA[8]) );
  phob8 pad106 ( .PAD(oDATA[9]), .A(woDATA[9]) );
  phob8 pad107 ( .PAD(oDATA[10]), .A(woDATA[10]) );
  phob8 pad108 ( .PAD(oDATA[11]), .A(woDATA[11]) );
  phob8 pad109 ( .PAD(oDATA[12]), .A(woDATA[12]) );
  phob8 pad110 ( .PAD(oDATA[13]), .A(woDATA[13]) );
  phob8 pad111 ( .PAD(oDATA[14]), .A(woDATA[14]) );
  phob8 pad112 ( .PAD(oDATA[15]), .A(woDATA[15]) );
  phob8 pad113 ( .PAD(oDATA[16]), .A(woDATA[16]) );
  phob8 pad114 ( .PAD(oDATA[17]), .A(woDATA[17]) );
  phob8 pad115 ( .PAD(oDATA[18]), .A(woDATA[18]) );
  phob8 pad116 ( .PAD(oDATA[19]), .A(woDATA[19]) );
  phob8 pad117 ( .PAD(oDATA[20]), .A(woDATA[20]) );
  phob8 pad118 ( .PAD(oDATA[21]), .A(woDATA[21]) );
  phob8 pad119 ( .PAD(oDATA[22]), .A(woDATA[22]) );
  phob8 pad120 ( .PAD(oDATA[23]), .A(woDATA[23]) );
  phob8 pad121 ( .PAD(oDATA[24]), .A(woDATA[24]) );
  phob8 pad122 ( .PAD(oDATA[25]), .A(woDATA[25]) );
  phob8 pad123 ( .PAD(oDATA[26]), .A(woDATA[26]) );
  phob8 pad124 ( .PAD(oDATA[27]), .A(woDATA[27]) );
  phob8 pad125 ( .PAD(oDATA[28]), .A(woDATA[28]) );
  phob8 pad126 ( .PAD(oDATA[29]), .A(woDATA[29]) );
  phob8 pad127 ( .PAD(oDATA[30]), .A(woDATA[30]) );
  phob8 pad128 ( .PAD(oDATA[31]), .A(woDATA[31]) );
  phob8 pad129 ( .PAD(oDATA[32]), .A(woDATA[32]) );
  phob8 pad130 ( .PAD(oDATA[33]), .A(woDATA[33]) );
  phob8 pad131 ( .PAD(oDATA[34]), .A(woDATA[34]) );
  phob8 pad132 ( .PAD(oDATA[35]), .A(woDATA[35]) );
  phob8 pad133 ( .PAD(oDATA[36]), .A(woDATA[36]) );
  phob8 pad134 ( .PAD(oDATA[37]), .A(woDATA[37]) );
  phob8 pad135 ( .PAD(oDATA[38]), .A(woDATA[38]) );
  
           vssoh  pad136();
			vssoh	pad137();
			vssoh	pad138();
			vssoh	pad139();
			vdd33oph	pad140();
			vdd33oph	pad141();
			vdd33oph	pad142();
			vssoh	pad143();
			vssoh	pad144();
			vssoh	pad145();
			
			vssiph	pad146();
			vssiph	pad147(); 
			vdd12ih_core 	pad148(); 
			vdd12ih_core 	pad149();
			vssiph	pad150();
			vssiph	pad151();
			vssiph	pad152();

			vssiph	pad153();
			vssiph	pad154();
			vdd12ih 	pad155();
			vdd12ih	    pad156();
			vssiph	pad157();
			vssiph	pad158();
			vssiph	pad159();
			vssiph	pad160();
			
			vssiph	pad161();
			vssiph	pad162();
			vssiph	pad163();
			vssiph	pad164();
			vssiph	pad165();
			vssiph	pad166();
			vssiph	pad167();
			
					vssiph		pad168();
			vssiph		pad169();
			vssiph		pad170();   
			vssiph		pad171();
			vdd12ih 	pad172();
			vdd12ih 	pad173();
			vdd12ih	    pad174();
			vssiph		pad175();
			vssiph		pad176();
			vssiph		pad177();
			
	///////////////////////////////////////////////////

			vssoh		pad178();
			vssoh		pad179();
			vdd33oph		pad180();			
			vdd33oph		pad181();
			vssoh		pad182();
			vssoh		pad183();
			
			
  phic pad184 ( .PAD(RESET),  .PI(1'b0),	.PO(), .Y(wRESET) );
  phic pad185 ( .PAD(WR),  .PI(1'b0),	.PO(), .Y(wWR) );
  
  phic pad186 (.PAD(CLK), .PI(1'b0), .PO(), .Y(wCLK));
  
  	vssiph	pad187();
			vssiph	pad188();
			vssiph	pad189();
			vssiph	pad190();
			vssiph	pad191();
			vssiph	pad192();
			vssiph	pad193();
			
					vssiph		pad194();
			vssiph		pad195();
			vssiph		pad196();   
			vssiph		pad197();
			vdd12ih 	pad198();
			vdd12ih 	pad199();
			vdd12ih	    pad200();
			vssiph		pad201();
			vssiph		pad202();
			vssiph		pad203();
			
	///////////////////////////////////////////////////

			vssoh		pad204();
			vssoh		pad205();
			vdd33oph		pad206();			
			vdd33oph		pad207();
			vssoh		pad208();
			
  

endmodule

