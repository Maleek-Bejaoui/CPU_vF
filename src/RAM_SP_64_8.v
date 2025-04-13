module RAM_SP_64_8
  (input  [5:0] add,
   input  [15:0] data_in,
   input  r_w,
   input  enable,
   input  clk,
   input  ce,
   output [15:0] data_out);
  wire n4_o;
  wire n17_o;
  wire n19_o;
  wire n20_o;
  wire n24_o;
  wire n25_o;
  reg [15:0] n30_data; // mem_rd
  assign data_out = n30_data;
  /* RAM_SP_64_8.vhd:54:24  */
  assign n4_o = ~r_w;
  /* RAM_SP_64_8.vhd:53:13  */
  assign n17_o = n4_o & enable;
  /* RAM_SP_64_8.vhd:52:9  */
  assign n19_o = n17_o & ce;
  /* RAM_SP_64_8.vhd:52:9  */
  assign n20_o = enable & ce;
  /* RAM_SP_64_8.vhd:54:17  */
  assign n24_o = ~n4_o;
  /* RAM_SP_64_8.vhd:52:9  */
  assign n25_o = n20_o & n24_o;
  /* RAM_SP_64_8.vhd:55:40  */
  reg [15:0] memory[63:0] ; // memory
  always @(posedge clk)
    if (n19_o)
      n30_data <= memory[add];
  always @(posedge clk)
    if (n25_o)
      memory[add] <= data_in;
  /* RAM_SP_64_8.vhd:51:5  */
  /* RAM_SP_64_8.vhd:57:28  */
endmodule

