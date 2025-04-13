module Carry_register
  (input  clk,
   input  rst,
   input  ce,
   input  load_carry,
   input  clear_carry,
   input  carry_in,
   output carry_out);
  wire n5_o;
  wire n6_o;
  wire n12_o;
  reg n13_q;
  assign carry_out = n13_q;
  /* Carry_register.vhd:53:17  */
  assign n5_o = clear_carry ? 1'b0 : n13_q;
  /* Carry_register.vhd:51:17  */
  assign n6_o = load_carry ? carry_in : n5_o;
  /* Carry_register.vhd:49:9  */
  assign n12_o = ce ? n6_o : n13_q;
  /* Carry_register.vhd:49:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n13_q <= 1'b0;
    else
      n13_q <= n12_o;
endmodule

