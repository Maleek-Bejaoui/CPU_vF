module Prog_counter
  (input  [5:0] ADR_IN,
   input  clk,
   input  ce,
   input  carry,
   input  rst,
   input  clear_PC,
   input  load_PC,
   input  enable_PC,
   output [5:0] ADR_OUT);
  wire [5:0] s_adr_in;
  wire [5:0] n5_o;
  wire [5:0] n7_o;
  wire [5:0] n8_o;
  wire [5:0] n9_o;
  wire [5:0] n15_o;
  reg [5:0] n16_q;
  assign ADR_OUT = s_adr_in;
  /* Prog_counter.vhd:38:8  */
  assign s_adr_in = n16_q; // (signal)
  /* Prog_counter.vhd:53:50  */
  assign n5_o = s_adr_in + 6'b000001;
  /* Prog_counter.vhd:49:25  */
  assign n7_o = clear_PC ? 6'b000000 : n5_o;
  /* Prog_counter.vhd:55:21  */
  assign n8_o = load_PC ? ADR_IN : s_adr_in;
  /* Prog_counter.vhd:48:21  */
  assign n9_o = enable_PC ? n7_o : n8_o;
  /* Prog_counter.vhd:46:13  */
  assign n15_o = ce ? n9_o : s_adr_in;
  /* Prog_counter.vhd:46:13  */
  always @(posedge clk or posedge rst)
    if (rst)
      n16_q <= 6'b000000;
    else
      n16_q <= n15_o;
endmodule

