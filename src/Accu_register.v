module Accu_register
  (input  clk,
   input  ce,
   input  rst,
   input  load_ACCU,
   input  [15:0] DATA_IN,
   output [15:0] DATA_OUT);
  wire n5_o;
  wire [15:0] n10_o;
  reg [15:0] n11_q;
  assign DATA_OUT = n11_q;
  /* Accu_register.vhd:42:13  */
  assign n5_o = load_ACCU & ce;
  /* Accu_register.vhd:41:9  */
  assign n10_o = n5_o ? DATA_IN : n11_q;
  /* Accu_register.vhd:41:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n11_q <= 16'b0000000000000000;
    else
      n11_q <= n10_o;
endmodule

