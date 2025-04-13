module FSM
  (input  clk,
   input  ce,
   input  rst,
   input  [2:0] code_op,
   input  carry,
   input  boot,
   output clear_PC,
   output enable_PC,
   output load_PC,
   output load_RI,
   output sel_ADR,
   output load_R1,
   output load_ACCU,
   output [2:0] sel_UAL,
   output clear_carry,
   output load_carry,
   output enable_mem,
   output W_mem);
  wire [3:0] current_state;
  wire [3:0] next_state;
  wire n14_o;
  wire [3:0] n16_o;
  wire [3:0] n17_o;
  wire [3:0] n26_o;
  wire n28_o;
  wire n30_o;
  wire n32_o;
  wire n34_o;
  wire n36_o;
  wire n38_o;
  wire n40_o;
  wire n41_o;
  wire n43_o;
  wire n44_o;
  wire [3:0] n46_o;
  wire [3:0] n48_o;
  wire [3:0] n50_o;
  wire n52_o;
  wire n54_o;
  wire n56_o;
  wire n58_o;
  wire n60_o;
  wire n62_o;
  wire n64_o;
  wire [9:0] n65_o;
  reg [3:0] n75_o;
  wire n79_o;
  wire n81_o;
  wire n83_o;
  wire n85_o;
  wire n87_o;
  wire n89_o;
  wire n90_o;
  wire n92_o;
  wire n93_o;
  wire n95_o;
  wire n97_o;
  wire n99_o;
  wire [9:0] n100_o;
  reg n112_o;
  reg n123_o;
  reg n134_o;
  reg n146_o;
  reg n158_o;
  reg n170_o;
  reg n182_o;
  reg [2:0] n193_o;
  reg n204_o;
  reg n215_o;
  reg n227_o;
  reg n239_o;
  wire [3:0] n241_o;
  reg [3:0] n242_q;
  assign clear_PC = n112_o;
  assign enable_PC = n123_o;
  assign load_PC = n134_o;
  assign load_RI = n146_o;
  assign sel_ADR = n158_o;
  assign load_R1 = n170_o;
  assign load_ACCU = n182_o;
  assign sel_UAL = n193_o;
  assign clear_carry = n204_o;
  assign load_carry = n215_o;
  assign enable_mem = n227_o;
  assign W_mem = n239_o;
  /* fsm.vhd:48:12  */
  assign current_state = n242_q; // (signal)
  /* fsm.vhd:49:12  */
  assign next_state = n75_o; // (signal)
  /* fsm.vhd:59:25  */
  assign n14_o = ~boot;
  /* fsm.vhd:61:17  */
  assign n16_o = boot ? 4'b0000 : current_state;
  /* fsm.vhd:59:17  */
  assign n17_o = n14_o ? next_state : n16_o;
  /* fsm.vhd:72:21  */
  assign n26_o = boot ? 4'b0000 : 4'b0001;
  /* fsm.vhd:71:17  */
  assign n28_o = current_state == 4'b0000;
  /* fsm.vhd:78:17  */
  assign n30_o = current_state == 4'b0001;
  /* fsm.vhd:81:17  */
  assign n32_o = current_state == 4'b0010;
  /* fsm.vhd:85:33  */
  assign n34_o = code_op == 3'b100;
  /* fsm.vhd:87:36  */
  assign n36_o = code_op == 3'b110;
  /* fsm.vhd:89:36  */
  assign n38_o = code_op == 3'b000;
  /* fsm.vhd:89:55  */
  assign n40_o = code_op == 3'b010;
  /* fsm.vhd:89:44  */
  assign n41_o = n38_o | n40_o;
  /* fsm.vhd:89:74  */
  assign n43_o = code_op == 3'b011;
  /* fsm.vhd:89:63  */
  assign n44_o = n41_o | n43_o;
  /* fsm.vhd:89:21  */
  assign n46_o = n44_o ? 4'b0100 : next_state;
  /* fsm.vhd:87:21  */
  assign n48_o = n36_o ? 4'b0111 : n46_o;
  /* fsm.vhd:85:21  */
  assign n50_o = n34_o ? 4'b1000 : n48_o;
  /* fsm.vhd:84:17  */
  assign n52_o = current_state == 4'b0011;
  /* fsm.vhd:93:17  */
  assign n54_o = current_state == 4'b1000;
  /* fsm.vhd:96:17  */
  assign n56_o = current_state == 4'b1001;
  /* fsm.vhd:99:17  */
  assign n58_o = current_state == 4'b0111;
  /* fsm.vhd:102:17  */
  assign n60_o = current_state == 4'b0100;
  /* fsm.vhd:105:17  */
  assign n62_o = current_state == 4'b0101;
  /* fsm.vhd:108:17  */
  assign n64_o = current_state == 4'b0110;
  assign n65_o = {n64_o, n62_o, n60_o, n58_o, n56_o, n54_o, n52_o, n32_o, n30_o, n28_o};
  /* fsm.vhd:70:13  */
  always @*
    case (n65_o)
      10'b1000000000: n75_o = 4'b0001;
      10'b0100000000: n75_o = 4'b0110;
      10'b0010000000: n75_o = 4'b0101;
      10'b0001000000: n75_o = 4'b0001;
      10'b0000100000: n75_o = 4'b0001;
      10'b0000010000: n75_o = 4'b1001;
      10'b0000001000: n75_o = n50_o;
      10'b0000000100: n75_o = 4'b0011;
      10'b0000000010: n75_o = 4'b0010;
      10'b0000000001: n75_o = n26_o;
      default: n75_o = 4'bX;
    endcase
  /* fsm.vhd:118:17  */
  assign n79_o = current_state == 4'b0000;
  /* fsm.vhd:131:17  */
  assign n81_o = current_state == 4'b0001;
  /* fsm.vhd:144:17  */
  assign n83_o = current_state == 4'b0010;
  /* fsm.vhd:157:17  */
  assign n85_o = current_state == 4'b0011;
  /* fsm.vhd:170:17  */
  assign n87_o = current_state == 4'b0100;
  /* fsm.vhd:183:17  */
  assign n89_o = current_state == 4'b0101;
  /* fsm.vhd:205:59  */
  assign n90_o = code_op[1];
  /* fsm.vhd:196:17  */
  assign n92_o = current_state == 4'b0110;
  /* fsm.vhd:211:48  */
  assign n93_o = ~carry;
  /* fsm.vhd:209:17  */
  assign n95_o = current_state == 4'b0111;
  /* fsm.vhd:222:17  */
  assign n97_o = current_state == 4'b1000;
  /* fsm.vhd:235:17  */
  assign n99_o = current_state == 4'b1001;
  assign n100_o = {n99_o, n97_o, n95_o, n92_o, n89_o, n87_o, n85_o, n83_o, n81_o, n79_o};
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n112_o = 1'b0;
      10'b0100000000: n112_o = 1'b0;
      10'b0010000000: n112_o = 1'b0;
      10'b0001000000: n112_o = 1'b0;
      10'b0000100000: n112_o = 1'b0;
      10'b0000010000: n112_o = 1'b0;
      10'b0000001000: n112_o = 1'b0;
      10'b0000000100: n112_o = 1'b0;
      10'b0000000010: n112_o = 1'b0;
      10'b0000000001: n112_o = 1'b1;
      default: n112_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n123_o = 1'b1;
      10'b0100000000: n123_o = 1'b0;
      10'b0010000000: n123_o = carry;
      10'b0001000000: n123_o = 1'b1;
      10'b0000100000: n123_o = 1'b0;
      10'b0000010000: n123_o = 1'b0;
      10'b0000001000: n123_o = 1'b0;
      10'b0000000100: n123_o = 1'b0;
      10'b0000000010: n123_o = 1'b0;
      10'b0000000001: n123_o = 1'b0;
      default: n123_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n134_o = 1'b0;
      10'b0100000000: n134_o = 1'b0;
      10'b0010000000: n134_o = n93_o;
      10'b0001000000: n134_o = 1'b0;
      10'b0000100000: n134_o = 1'b0;
      10'b0000010000: n134_o = 1'b0;
      10'b0000001000: n134_o = 1'b0;
      10'b0000000100: n134_o = 1'b0;
      10'b0000000010: n134_o = 1'b0;
      10'b0000000001: n134_o = 1'b0;
      default: n134_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n146_o = 1'b0;
      10'b0100000000: n146_o = 1'b0;
      10'b0010000000: n146_o = 1'b1;
      10'b0001000000: n146_o = 1'b0;
      10'b0000100000: n146_o = 1'b0;
      10'b0000010000: n146_o = 1'b0;
      10'b0000001000: n146_o = 1'b0;
      10'b0000000100: n146_o = 1'b1;
      10'b0000000010: n146_o = 1'b0;
      10'b0000000001: n146_o = 1'b0;
      default: n146_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n158_o = 1'b1;
      10'b0100000000: n158_o = 1'b1;
      10'b0010000000: n158_o = 1'b1;
      10'b0001000000: n158_o = 1'b1;
      10'b0000100000: n158_o = 1'b1;
      10'b0000010000: n158_o = 1'b1;
      10'b0000001000: n158_o = 1'b1;
      10'b0000000100: n158_o = 1'b0;
      10'b0000000010: n158_o = 1'b0;
      10'b0000000001: n158_o = 1'b0;
      default: n158_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n170_o = 1'b0;
      10'b0100000000: n170_o = 1'b0;
      10'b0010000000: n170_o = 1'b0;
      10'b0001000000: n170_o = 1'b0;
      10'b0000100000: n170_o = 1'b1;
      10'b0000010000: n170_o = 1'b1;
      10'b0000001000: n170_o = 1'b0;
      10'b0000000100: n170_o = 1'b0;
      10'b0000000010: n170_o = 1'b0;
      10'b0000000001: n170_o = 1'b0;
      default: n170_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n182_o = 1'b0;
      10'b0100000000: n182_o = 1'b0;
      10'b0010000000: n182_o = 1'b0;
      10'b0001000000: n182_o = 1'b1;
      10'b0000100000: n182_o = 1'b0;
      10'b0000010000: n182_o = 1'b0;
      10'b0000001000: n182_o = 1'b0;
      10'b0000000100: n182_o = 1'b0;
      10'b0000000010: n182_o = 1'b0;
      10'b0000000001: n182_o = 1'b0;
      default: n182_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n193_o = 3'b111;
      10'b0100000000: n193_o = 3'b111;
      10'b0010000000: n193_o = 3'b111;
      10'b0001000000: n193_o = code_op;
      10'b0000100000: n193_o = 3'b111;
      10'b0000010000: n193_o = 3'b111;
      10'b0000001000: n193_o = 3'b111;
      10'b0000000100: n193_o = 3'b111;
      10'b0000000010: n193_o = 3'b111;
      10'b0000000001: n193_o = 3'b111;
      default: n193_o = 3'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n204_o = 1'b0;
      10'b0100000000: n204_o = 1'b0;
      10'b0010000000: n204_o = carry;
      10'b0001000000: n204_o = 1'b0;
      10'b0000100000: n204_o = 1'b0;
      10'b0000010000: n204_o = 1'b0;
      10'b0000001000: n204_o = 1'b0;
      10'b0000000100: n204_o = 1'b0;
      10'b0000000010: n204_o = 1'b0;
      10'b0000000001: n204_o = 1'b1;
      default: n204_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n215_o = 1'b0;
      10'b0100000000: n215_o = 1'b0;
      10'b0010000000: n215_o = 1'b0;
      10'b0001000000: n215_o = n90_o;
      10'b0000100000: n215_o = 1'b0;
      10'b0000010000: n215_o = 1'b0;
      10'b0000001000: n215_o = 1'b0;
      10'b0000000100: n215_o = 1'b0;
      10'b0000000010: n215_o = 1'b0;
      10'b0000000001: n215_o = 1'b0;
      default: n215_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n227_o = 1'b1;
      10'b0100000000: n227_o = 1'b1;
      10'b0010000000: n227_o = 1'b0;
      10'b0001000000: n227_o = 1'b0;
      10'b0000100000: n227_o = 1'b0;
      10'b0000010000: n227_o = 1'b1;
      10'b0000001000: n227_o = 1'b0;
      10'b0000000100: n227_o = 1'b1;
      10'b0000000010: n227_o = 1'b1;
      10'b0000000001: n227_o = 1'b0;
      default: n227_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n100_o)
      10'b1000000000: n239_o = 1'b0;
      10'b0100000000: n239_o = 1'b1;
      10'b0010000000: n239_o = 1'b0;
      10'b0001000000: n239_o = 1'b0;
      10'b0000100000: n239_o = 1'b0;
      10'b0000010000: n239_o = 1'b0;
      10'b0000001000: n239_o = 1'b0;
      10'b0000000100: n239_o = 1'b0;
      10'b0000000010: n239_o = 1'b0;
      10'b0000000001: n239_o = 1'b0;
      default: n239_o = 1'bX;
    endcase
  /* fsm.vhd:57:9  */
  assign n241_o = ce ? n17_o : current_state;
  /* fsm.vhd:57:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n242_q <= 4'b0000;
    else
      n242_q <= n241_o;
endmodule

