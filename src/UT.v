module accu_register
  (input  clk,
   input  ce,
   input  rst,
   input  load_accu,
   input  [15:0] data_in,
   output [15:0] data_out);
  wire n100_o;
  wire [15:0] n105_o;
  reg [15:0] n106_q;
  assign data_out = n106_q;
  /* Accu_register.vhd:42:13  */
  assign n100_o = load_accu & ce;
  /* Accu_register.vhd:41:9  */
  assign n105_o = n100_o ? data_in : n106_q;
  /* Accu_register.vhd:41:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n106_q <= 16'b0000000000000000;
    else
      n106_q <= n105_o;
endmodule

module carry_register
  (input  clk,
   input  rst,
   input  ce,
   input  load_carry,
   input  clear_carry,
   input  carry_in,
   output carry_out);
  wire n86_o;
  wire n87_o;
  wire n93_o;
  reg n94_q;
  assign carry_out = n94_q;
  /* Carry_register.vhd:53:17  */
  assign n86_o = clear_carry ? 1'b0 : n94_q;
  /* Carry_register.vhd:51:17  */
  assign n87_o = load_carry ? carry_in : n86_o;
  /* Carry_register.vhd:49:9  */
  assign n93_o = ce ? n87_o : n94_q;
  /* Carry_register.vhd:49:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n94_q <= 1'b0;
    else
      n94_q <= n93_o;
endmodule

module ual
  (input  ce,
   input  [2:0] sel_ual,
   input  [15:0] data_r1,
   input  [15:0] data_accu,
   output [15:0] data_out,
   output carry);
  wire [16:0] r1;
  wire [16:0] accu;
  wire [16:0] s_out;
  wire n39_o;
  wire [15:0] n40_o;
  wire [15:0] n41_o;
  wire [15:0] n42_o;
  wire n47_o;
  wire n49_o;
  wire n50_o;
  wire n52_o;
  wire n53_o;
  wire n56_o;
  wire n58_o;
  wire n59_o;
  wire n61_o;
  wire n66_o;
  wire n68_o;
  wire [16:0] n69_o;
  wire n71_o;
  wire [16:0] n72_o;
  wire [16:0] n74_o;
  wire [16:0] n75_o;
  wire [16:0] n77_o;
  wire [16:0] n79_o;
  wire [16:0] n80_o;
  assign data_out = n42_o;
  assign carry = n61_o;
  /* UAL.vhd:36:12  */
  assign r1 = n79_o; // (signal)
  /* UAL.vhd:36:15  */
  assign accu = n80_o; // (signal)
  /* UAL.vhd:37:12  */
  assign s_out = n77_o; // (signal)
  /* UAL.vhd:48:20  */
  assign n39_o = sel_ual == 3'b000;
  /* UAL.vhd:49:33  */
  assign n40_o = ~(data_r1 | data_accu);
  /* UAL.vhd:51:47  */
  assign n41_o = s_out[15:0];
  /* UAL.vhd:48:9  */
  assign n42_o = n39_o ? n40_o : n41_o;
  /* UAL.vhd:57:21  */
  assign n47_o = sel_ual == 3'b000;
  /* UAL.vhd:59:24  */
  assign n49_o = sel_ual == 3'b010;
  /* UAL.vhd:60:27  */
  assign n50_o = s_out[16];
  /* UAL.vhd:61:23  */
  assign n52_o = sel_ual == 3'b011;
  /* UAL.vhd:62:21  */
  assign n53_o = $signed(accu) < $signed(r1);
  /* UAL.vhd:62:13  */
  assign n56_o = n53_o ? 1'b1 : 1'b0;
  /* UAL.vhd:61:9  */
  assign n58_o = n52_o ? n56_o : 1'b0;
  /* UAL.vhd:59:9  */
  assign n59_o = n49_o ? n50_o : n58_o;
  /* UAL.vhd:57:9  */
  assign n61_o = n47_o ? 1'b0 : n59_o;
  /* UAL.vhd:71:20  */
  assign n66_o = sel_ual == 3'b000;
  /* UAL.vhd:73:23  */
  assign n68_o = sel_ual == 3'b010;
  /* UAL.vhd:74:25  */
  assign n69_o = r1 + accu;
  /* UAL.vhd:75:23  */
  assign n71_o = sel_ual == 3'b011;
  /* UAL.vhd:76:27  */
  assign n72_o = accu - r1;
  /* UAL.vhd:75:9  */
  assign n74_o = n71_o ? n72_o : 17'b00000000000000000;
  /* UAL.vhd:73:9  */
  assign n75_o = n68_o ? n69_o : n74_o;
  /* UAL.vhd:71:9  */
  assign n77_o = n66_o ? 17'b00000000000000000 : n75_o;
  assign n79_o = {1'b0, data_r1};
  assign n80_o = {1'b0, data_accu};
endmodule

module r1_register
  (input  clk,
   input  rst,
   input  ce,
   input  load_r1,
   input  [15:0] data_mem,
   output [15:0] data_ual);
  wire n25_o;
  wire [15:0] n30_o;
  reg [15:0] n31_q;
  assign data_ual = n31_q;
  /* R1_register.vhd:42:13  */
  assign n25_o = load_r1 & ce;
  /* R1_register.vhd:41:9  */
  assign n30_o = n25_o ? data_mem : n31_q;
  /* R1_register.vhd:41:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n31_q <= 16'b0000000000000000;
    else
      n31_q <= n30_o;
endmodule

module UT
  (input  clk,
   input  rst,
   input  ce,
   input  [2:0] sel_UAL,
   input  [15:0] data_in,
   input  load_R1,
   input  load_ACCU,
   input  load_carry,
   input  init_carry,
   output carry,
   output [15:0] data_out);
  wire [15:0] r1_out;
  wire [15:0] ual_out;
  wire [15:0] accu_out;
  wire carry_in;
  wire [15:0] uut3_n2;
  wire [15:0] uut3_data_ual;
  wire [15:0] uut2_n5;
  wire uut2_n6;
  wire [15:0] uut2_data_out;
  wire uut2_carry;
  wire uut1_n11;
  wire uut1_carry_out;
  wire [15:0] uut0_n14;
  wire [15:0] uut0_data_out;
  assign carry = uut1_n11;
  assign data_out = accu_out;
  /* UT.vhd:57:8  */
  assign r1_out = uut3_n2; // (signal)
  /* UT.vhd:57:16  */
  assign ual_out = uut2_n5; // (signal)
  /* UT.vhd:57:25  */
  assign accu_out = uut0_n14; // (signal)
  /* UT.vhd:58:8  */
  assign carry_in = uut2_n6; // (signal)
  /* UT.vhd:67:28  */
  assign uut3_n2 = uut3_data_ual; // (signal)
  /* UT.vhd:62:5  */
  r1_register uut3 (
    .clk(clk),
    .rst(rst),
    .ce(ce),
    .load_r1(load_R1),
    .data_mem(data_in),
    .data_ual(uut3_data_ual));
  /* UT.vhd:73:28  */
  assign uut2_n5 = uut2_data_out; // (signal)
  /* UT.vhd:74:25  */
  assign uut2_n6 = uut2_carry; // (signal)
  /* UT.vhd:69:5  */
  ual uut2 (
    .ce(ce),
    .sel_ual(sel_UAL),
    .data_r1(r1_out),
    .data_accu(accu_out),
    .data_out(uut2_data_out),
    .carry(uut2_carry));
  /* UT.vhd:81:29  */
  assign uut1_n11 = uut1_carry_out; // (signal)
  /* UT.vhd:75:5  */
  carry_register uut1 (
    .clk(clk),
    .rst(rst),
    .ce(ce),
    .load_carry(load_carry),
    .clear_carry(init_carry),
    .carry_in(carry_in),
    .carry_out(uut1_carry_out));
  /* UT.vhd:89:29  */
  assign uut0_n14 = uut0_data_out; // (signal)
  /* UT.vhd:84:5  */
  accu_register uut0 (
    .clk(clk),
    .ce(ce),
    .rst(rst),
    .load_accu(load_ACCU),
    .data_in(ual_out),
    .data_out(uut0_data_out));
endmodule

