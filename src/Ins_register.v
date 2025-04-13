module Ins_register
  (input  clk,
   input  rst,
   input  ce,
   input  [15:0] data,
   input  load_RI,
   output [2:0] code_op,
   output [5:0] ADR_RI);
  wire [15:0] s_data_out;
  wire n6_o;
  wire [2:0] n11_o;
  wire [5:0] n12_o;
  wire [15:0] n13_o;
  reg [15:0] n14_q;
  assign code_op = n11_o;
  assign ADR_RI = n12_o;
  /* Ins_register.vhd:38:8  */
  assign s_data_out = n14_q; // (signal)
  /* Ins_register.vhd:49:13  */
  assign n6_o = load_RI & ce;
  /* Ins_register.vhd:58:22  */
  assign n11_o = s_data_out[15:13];
  /* Ins_register.vhd:59:21  */
  assign n12_o = s_data_out[5:0];
  /* Ins_register.vhd:48:9  */
  assign n13_o = n6_o ? data : s_data_out;
  /* Ins_register.vhd:48:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n14_q <= 16'b0000000000000000;
    else
      n14_q <= n13_o;
endmodule

