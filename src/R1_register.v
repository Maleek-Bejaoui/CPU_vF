module R1_register
  (input  clk,
   input  rst,
   input  ce,
   input  load_R1,
   input  [15:0] data_mem,
   output [15:0] data_UAL);
  wire n5_o;
  wire [15:0] n10_o;
  reg [15:0] n11_q;
  assign data_UAL = n11_q;
  /* R1_register.vhd:42:13  */
  assign n5_o = load_R1 & ce;
  /* R1_register.vhd:41:9  */
  assign n10_o = n5_o ? data_mem : n11_q;
  /* R1_register.vhd:41:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n11_q <= 16'b0000000000000000;
    else
      n11_q <= n10_o;
endmodule

