module UAL
  (input  CE,
   input  [2:0] sel_UAL,
   input  [15:0] DATA_R1,
   input  [15:0] DATA_ACCU,
   output [15:0] DATA_OUT,
   output carry);
  wire [16:0] r1;
  wire [16:0] accu;
  wire [16:0] s_out;
  wire n7_o;
  wire [15:0] n8_o;
  wire [15:0] n9_o;
  wire [15:0] n10_o;
  wire n15_o;
  wire n17_o;
  wire n18_o;
  wire n20_o;
  wire n21_o;
  wire n24_o;
  wire n26_o;
  wire n27_o;
  wire n29_o;
  wire n34_o;
  wire n36_o;
  wire [16:0] n37_o;
  wire n39_o;
  wire [16:0] n40_o;
  wire [16:0] n42_o;
  wire [16:0] n43_o;
  wire [16:0] n45_o;
  wire [16:0] n47_o;
  wire [16:0] n48_o;
  assign DATA_OUT = n10_o;
  assign carry = n29_o;
  /* UAL.vhd:36:12  */
  assign r1 = n47_o; // (signal)
  /* UAL.vhd:36:15  */
  assign accu = n48_o; // (signal)
  /* UAL.vhd:37:12  */
  assign s_out = n45_o; // (signal)
  /* UAL.vhd:48:20  */
  assign n7_o = sel_UAL == 3'b000;
  /* UAL.vhd:49:33  */
  assign n8_o = ~(DATA_R1 | DATA_ACCU);
  /* UAL.vhd:51:47  */
  assign n9_o = s_out[15:0];
  /* UAL.vhd:48:9  */
  assign n10_o = n7_o ? n8_o : n9_o;
  /* UAL.vhd:57:21  */
  assign n15_o = sel_UAL == 3'b000;
  /* UAL.vhd:59:24  */
  assign n17_o = sel_UAL == 3'b010;
  /* UAL.vhd:60:27  */
  assign n18_o = s_out[16];
  /* UAL.vhd:61:23  */
  assign n20_o = sel_UAL == 3'b011;
  /* UAL.vhd:62:21  */
  assign n21_o = $signed(accu) < $signed(r1);
  /* UAL.vhd:62:13  */
  assign n24_o = n21_o ? 1'b1 : 1'b0;
  /* UAL.vhd:61:9  */
  assign n26_o = n20_o ? n24_o : 1'b0;
  /* UAL.vhd:59:9  */
  assign n27_o = n17_o ? n18_o : n26_o;
  /* UAL.vhd:57:9  */
  assign n29_o = n15_o ? 1'b0 : n27_o;
  /* UAL.vhd:71:20  */
  assign n34_o = sel_UAL == 3'b000;
  /* UAL.vhd:73:23  */
  assign n36_o = sel_UAL == 3'b010;
  /* UAL.vhd:74:25  */
  assign n37_o = r1 + accu;
  /* UAL.vhd:75:23  */
  assign n39_o = sel_UAL == 3'b011;
  /* UAL.vhd:76:27  */
  assign n40_o = accu - r1;
  /* UAL.vhd:75:9  */
  assign n42_o = n39_o ? n40_o : 17'b00000000000000000;
  /* UAL.vhd:73:9  */
  assign n43_o = n36_o ? n37_o : n42_o;
  /* UAL.vhd:71:9  */
  assign n45_o = n34_o ? 17'b00000000000000000 : n43_o;
  assign n47_o = {1'b0, DATA_R1};
  assign n48_o = {1'b0, DATA_ACCU};
endmodule

