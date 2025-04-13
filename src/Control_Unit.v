module fsm
  (input  clk,
   input  ce,
   input  rst,
   input  [2:0] code_op,
   input  carry,
   input  boot,
   output clear_pc,
   output enable_pc,
   output load_pc,
   output load_ri,
   output sel_adr,
   output load_r1,
   output load_accu,
   output [2:0] sel_ual,
   output clear_carry,
   output load_carry,
   output enable_mem,
   output w_mem);
  wire [3:0] current_state;
  wire [3:0] next_state;
  wire n100_o;
  wire [3:0] n102_o;
  wire [3:0] n103_o;
  wire [3:0] n112_o;
  wire n114_o;
  wire n116_o;
  wire n118_o;
  wire n120_o;
  wire n122_o;
  wire n124_o;
  wire n126_o;
  wire n127_o;
  wire n129_o;
  wire n130_o;
  wire [3:0] n132_o;
  wire [3:0] n134_o;
  wire [3:0] n136_o;
  wire n138_o;
  wire n140_o;
  wire n142_o;
  wire n144_o;
  wire n146_o;
  wire n148_o;
  wire n150_o;
  wire [9:0] n151_o;
  reg [3:0] n161_o;
  wire n165_o;
  wire n167_o;
  wire n169_o;
  wire n171_o;
  wire n173_o;
  wire n175_o;
  wire n176_o;
  wire n178_o;
  wire n179_o;
  wire n181_o;
  wire n183_o;
  wire n185_o;
  wire [9:0] n186_o;
  reg n198_o;
  reg n209_o;
  reg n220_o;
  reg n232_o;
  reg n244_o;
  reg n256_o;
  reg n268_o;
  reg [2:0] n279_o;
  reg n290_o;
  reg n301_o;
  reg n313_o;
  reg n325_o;
  wire [3:0] n327_o;
  reg [3:0] n328_q;
  assign clear_pc = n198_o;
  assign enable_pc = n209_o;
  assign load_pc = n220_o;
  assign load_ri = n232_o;
  assign sel_adr = n244_o;
  assign load_r1 = n256_o;
  assign load_accu = n268_o;
  assign sel_ual = n279_o;
  assign clear_carry = n290_o;
  assign load_carry = n301_o;
  assign enable_mem = n313_o;
  assign w_mem = n325_o;
  /* fsm.vhd:48:12  */
  assign current_state = n328_q; // (signal)
  /* fsm.vhd:49:12  */
  assign next_state = n161_o; // (signal)
  /* fsm.vhd:59:25  */
  assign n100_o = ~boot;
  /* fsm.vhd:61:17  */
  assign n102_o = boot ? 4'b0000 : current_state;
  /* fsm.vhd:59:17  */
  assign n103_o = n100_o ? next_state : n102_o;
  /* fsm.vhd:72:21  */
  assign n112_o = boot ? 4'b0000 : 4'b0001;
  /* fsm.vhd:71:17  */
  assign n114_o = current_state == 4'b0000;
  /* fsm.vhd:78:17  */
  assign n116_o = current_state == 4'b0001;
  /* fsm.vhd:81:17  */
  assign n118_o = current_state == 4'b0010;
  /* fsm.vhd:85:33  */
  assign n120_o = code_op == 3'b100;
  /* fsm.vhd:87:36  */
  assign n122_o = code_op == 3'b110;
  /* fsm.vhd:89:36  */
  assign n124_o = code_op == 3'b000;
  /* fsm.vhd:89:55  */
  assign n126_o = code_op == 3'b010;
  /* fsm.vhd:89:44  */
  assign n127_o = n124_o | n126_o;
  /* fsm.vhd:89:74  */
  assign n129_o = code_op == 3'b011;
  /* fsm.vhd:89:63  */
  assign n130_o = n127_o | n129_o;
  /* fsm.vhd:89:21  */
  assign n132_o = n130_o ? 4'b0100 : next_state;
  /* fsm.vhd:87:21  */
  assign n134_o = n122_o ? 4'b0111 : n132_o;
  /* fsm.vhd:85:21  */
  assign n136_o = n120_o ? 4'b1000 : n134_o;
  /* fsm.vhd:84:17  */
  assign n138_o = current_state == 4'b0011;
  /* fsm.vhd:93:17  */
  assign n140_o = current_state == 4'b1000;
  /* fsm.vhd:96:17  */
  assign n142_o = current_state == 4'b1001;
  /* fsm.vhd:99:17  */
  assign n144_o = current_state == 4'b0111;
  /* fsm.vhd:102:17  */
  assign n146_o = current_state == 4'b0100;
  /* fsm.vhd:105:17  */
  assign n148_o = current_state == 4'b0101;
  /* fsm.vhd:108:17  */
  assign n150_o = current_state == 4'b0110;
  assign n151_o = {n150_o, n148_o, n146_o, n144_o, n142_o, n140_o, n138_o, n118_o, n116_o, n114_o};
  /* fsm.vhd:70:13  */
  always @*
    case (n151_o)
      10'b1000000000: n161_o = 4'b0001;
      10'b0100000000: n161_o = 4'b0110;
      10'b0010000000: n161_o = 4'b0101;
      10'b0001000000: n161_o = 4'b0001;
      10'b0000100000: n161_o = 4'b0001;
      10'b0000010000: n161_o = 4'b1001;
      10'b0000001000: n161_o = n136_o;
      10'b0000000100: n161_o = 4'b0011;
      10'b0000000010: n161_o = 4'b0010;
      10'b0000000001: n161_o = n112_o;
      default: n161_o = 4'bX;
    endcase
  /* fsm.vhd:118:17  */
  assign n165_o = current_state == 4'b0000;
  /* fsm.vhd:131:17  */
  assign n167_o = current_state == 4'b0001;
  /* fsm.vhd:144:17  */
  assign n169_o = current_state == 4'b0010;
  /* fsm.vhd:157:17  */
  assign n171_o = current_state == 4'b0011;
  /* fsm.vhd:170:17  */
  assign n173_o = current_state == 4'b0100;
  /* fsm.vhd:183:17  */
  assign n175_o = current_state == 4'b0101;
  /* fsm.vhd:205:59  */
  assign n176_o = code_op[1];
  /* fsm.vhd:196:17  */
  assign n178_o = current_state == 4'b0110;
  /* fsm.vhd:211:48  */
  assign n179_o = ~carry;
  /* fsm.vhd:209:17  */
  assign n181_o = current_state == 4'b0111;
  /* fsm.vhd:222:17  */
  assign n183_o = current_state == 4'b1000;
  /* fsm.vhd:235:17  */
  assign n185_o = current_state == 4'b1001;
  assign n186_o = {n185_o, n183_o, n181_o, n178_o, n175_o, n173_o, n171_o, n169_o, n167_o, n165_o};
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n198_o = 1'b0;
      10'b0100000000: n198_o = 1'b0;
      10'b0010000000: n198_o = 1'b0;
      10'b0001000000: n198_o = 1'b0;
      10'b0000100000: n198_o = 1'b0;
      10'b0000010000: n198_o = 1'b0;
      10'b0000001000: n198_o = 1'b0;
      10'b0000000100: n198_o = 1'b0;
      10'b0000000010: n198_o = 1'b0;
      10'b0000000001: n198_o = 1'b1;
      default: n198_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n209_o = 1'b1;
      10'b0100000000: n209_o = 1'b0;
      10'b0010000000: n209_o = carry;
      10'b0001000000: n209_o = 1'b1;
      10'b0000100000: n209_o = 1'b0;
      10'b0000010000: n209_o = 1'b0;
      10'b0000001000: n209_o = 1'b0;
      10'b0000000100: n209_o = 1'b0;
      10'b0000000010: n209_o = 1'b0;
      10'b0000000001: n209_o = 1'b0;
      default: n209_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n220_o = 1'b0;
      10'b0100000000: n220_o = 1'b0;
      10'b0010000000: n220_o = n179_o;
      10'b0001000000: n220_o = 1'b0;
      10'b0000100000: n220_o = 1'b0;
      10'b0000010000: n220_o = 1'b0;
      10'b0000001000: n220_o = 1'b0;
      10'b0000000100: n220_o = 1'b0;
      10'b0000000010: n220_o = 1'b0;
      10'b0000000001: n220_o = 1'b0;
      default: n220_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n232_o = 1'b0;
      10'b0100000000: n232_o = 1'b0;
      10'b0010000000: n232_o = 1'b1;
      10'b0001000000: n232_o = 1'b0;
      10'b0000100000: n232_o = 1'b0;
      10'b0000010000: n232_o = 1'b0;
      10'b0000001000: n232_o = 1'b0;
      10'b0000000100: n232_o = 1'b1;
      10'b0000000010: n232_o = 1'b0;
      10'b0000000001: n232_o = 1'b0;
      default: n232_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n244_o = 1'b1;
      10'b0100000000: n244_o = 1'b1;
      10'b0010000000: n244_o = 1'b1;
      10'b0001000000: n244_o = 1'b1;
      10'b0000100000: n244_o = 1'b1;
      10'b0000010000: n244_o = 1'b1;
      10'b0000001000: n244_o = 1'b1;
      10'b0000000100: n244_o = 1'b0;
      10'b0000000010: n244_o = 1'b0;
      10'b0000000001: n244_o = 1'b0;
      default: n244_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n256_o = 1'b0;
      10'b0100000000: n256_o = 1'b0;
      10'b0010000000: n256_o = 1'b0;
      10'b0001000000: n256_o = 1'b0;
      10'b0000100000: n256_o = 1'b1;
      10'b0000010000: n256_o = 1'b1;
      10'b0000001000: n256_o = 1'b0;
      10'b0000000100: n256_o = 1'b0;
      10'b0000000010: n256_o = 1'b0;
      10'b0000000001: n256_o = 1'b0;
      default: n256_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n268_o = 1'b0;
      10'b0100000000: n268_o = 1'b0;
      10'b0010000000: n268_o = 1'b0;
      10'b0001000000: n268_o = 1'b1;
      10'b0000100000: n268_o = 1'b0;
      10'b0000010000: n268_o = 1'b0;
      10'b0000001000: n268_o = 1'b0;
      10'b0000000100: n268_o = 1'b0;
      10'b0000000010: n268_o = 1'b0;
      10'b0000000001: n268_o = 1'b0;
      default: n268_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n279_o = 3'b111;
      10'b0100000000: n279_o = 3'b111;
      10'b0010000000: n279_o = 3'b111;
      10'b0001000000: n279_o = code_op;
      10'b0000100000: n279_o = 3'b111;
      10'b0000010000: n279_o = 3'b111;
      10'b0000001000: n279_o = 3'b111;
      10'b0000000100: n279_o = 3'b111;
      10'b0000000010: n279_o = 3'b111;
      10'b0000000001: n279_o = 3'b111;
      default: n279_o = 3'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n290_o = 1'b0;
      10'b0100000000: n290_o = 1'b0;
      10'b0010000000: n290_o = carry;
      10'b0001000000: n290_o = 1'b0;
      10'b0000100000: n290_o = 1'b0;
      10'b0000010000: n290_o = 1'b0;
      10'b0000001000: n290_o = 1'b0;
      10'b0000000100: n290_o = 1'b0;
      10'b0000000010: n290_o = 1'b0;
      10'b0000000001: n290_o = 1'b1;
      default: n290_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n301_o = 1'b0;
      10'b0100000000: n301_o = 1'b0;
      10'b0010000000: n301_o = 1'b0;
      10'b0001000000: n301_o = n176_o;
      10'b0000100000: n301_o = 1'b0;
      10'b0000010000: n301_o = 1'b0;
      10'b0000001000: n301_o = 1'b0;
      10'b0000000100: n301_o = 1'b0;
      10'b0000000010: n301_o = 1'b0;
      10'b0000000001: n301_o = 1'b0;
      default: n301_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n313_o = 1'b1;
      10'b0100000000: n313_o = 1'b1;
      10'b0010000000: n313_o = 1'b0;
      10'b0001000000: n313_o = 1'b0;
      10'b0000100000: n313_o = 1'b0;
      10'b0000010000: n313_o = 1'b1;
      10'b0000001000: n313_o = 1'b0;
      10'b0000000100: n313_o = 1'b1;
      10'b0000000010: n313_o = 1'b1;
      10'b0000000001: n313_o = 1'b0;
      default: n313_o = 1'bX;
    endcase
  /* fsm.vhd:117:13  */
  always @*
    case (n186_o)
      10'b1000000000: n325_o = 1'b0;
      10'b0100000000: n325_o = 1'b1;
      10'b0010000000: n325_o = 1'b0;
      10'b0001000000: n325_o = 1'b0;
      10'b0000100000: n325_o = 1'b0;
      10'b0000010000: n325_o = 1'b0;
      10'b0000001000: n325_o = 1'b0;
      10'b0000000100: n325_o = 1'b0;
      10'b0000000010: n325_o = 1'b0;
      10'b0000000001: n325_o = 1'b0;
      default: n325_o = 1'bX;
    endcase
  /* fsm.vhd:57:9  */
  assign n327_o = ce ? n103_o : current_state;
  /* fsm.vhd:57:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n328_q <= 4'b0000;
    else
      n328_q <= n327_o;
endmodule

module prog_counter
  (input  [5:0] adr_in,
   input  clk,
   input  ce,
   input  carry,
   input  rst,
   input  clear_pc,
   input  load_pc,
   input  enable_pc,
   output [5:0] adr_out);
  wire [5:0] s_adr_in;
  wire [5:0] n74_o;
  wire [5:0] n76_o;
  wire [5:0] n77_o;
  wire [5:0] n78_o;
  wire [5:0] n84_o;
  reg [5:0] n85_q;
  assign adr_out = s_adr_in;
  /* Prog_counter.vhd:38:8  */
  assign s_adr_in = n85_q; // (signal)
  /* Prog_counter.vhd:53:50  */
  assign n74_o = s_adr_in + 6'b000001;
  /* Prog_counter.vhd:49:25  */
  assign n76_o = clear_pc ? 6'b000000 : n74_o;
  /* Prog_counter.vhd:55:21  */
  assign n77_o = load_pc ? adr_in : s_adr_in;
  /* Prog_counter.vhd:48:21  */
  assign n78_o = enable_pc ? n76_o : n77_o;
  /* Prog_counter.vhd:46:13  */
  assign n84_o = ce ? n78_o : s_adr_in;
  /* Prog_counter.vhd:46:13  */
  always @(posedge clk or posedge rst)
    if (rst)
      n85_q <= 6'b000000;
    else
      n85_q <= n84_o;
endmodule

module ins_register
  (input  clk,
   input  rst,
   input  ce,
   input  [15:0] data,
   input  load_ri,
   output [2:0] code_op,
   output [5:0] adr_ri);
  wire [15:0] s_data_out;
  wire n60_o;
  wire [2:0] n65_o;
  wire [5:0] n66_o;
  wire [15:0] n67_o;
  reg [15:0] n68_q;
  assign code_op = n65_o;
  assign adr_ri = n66_o;
  /* Ins_register.vhd:38:8  */
  assign s_data_out = n68_q; // (signal)
  /* Ins_register.vhd:49:13  */
  assign n60_o = load_ri & ce;
  /* Ins_register.vhd:58:22  */
  assign n65_o = s_data_out[15:13];
  /* Ins_register.vhd:59:21  */
  assign n66_o = s_data_out[5:0];
  /* Ins_register.vhd:48:9  */
  assign n67_o = n60_o ? data : s_data_out;
  /* Ins_register.vhd:48:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n68_q <= 16'b0000000000000000;
    else
      n68_q <= n67_o;
endmodule

module Control_Unit
  (input  clk,
   input  ce,
   input  rst,
   input  carry,
   input  boot,
   input  [15:0] data_in,
   output [5:0] adr,
   output clear_carry,
   output enable_mem,
   output load_R1,
   output load_accu,
   output load_carry,
   output [2:0] sel_UAL,
   output w_mem);
  wire [2:0] code_op;
  wire clear_pc;
  wire enable_pc;
  wire load_pc;
  wire load_ri;
  wire sel_adr;
  wire [5:0] adr_ri;
  wire [5:0] adr_out;
  wire [5:0] sig_adr;
  wire [2:0] ri_n8;
  wire [5:0] ri_n9;
  wire [2:0] ri_code_op;
  wire [5:0] ri_adr_ri;
  wire [5:0] pc_n14;
  wire [5:0] pc_adr_out;
  wire p_fsm_n17;
  wire p_fsm_n18;
  wire p_fsm_n19;
  wire p_fsm_n20;
  wire p_fsm_n21;
  wire p_fsm_n22;
  wire p_fsm_n23;
  wire [2:0] p_fsm_n24;
  wire p_fsm_n25;
  wire p_fsm_n26;
  wire p_fsm_n27;
  wire p_fsm_n28;
  wire p_fsm_clear_pc;
  wire p_fsm_enable_pc;
  wire p_fsm_load_pc;
  wire p_fsm_load_ri;
  wire p_fsm_sel_adr;
  wire p_fsm_load_r1;
  wire p_fsm_load_accu;
  wire [2:0] p_fsm_sel_ual;
  wire p_fsm_clear_carry;
  wire p_fsm_load_carry;
  wire p_fsm_enable_mem;
  wire p_fsm_w_mem;
  wire [5:0] n53_o;
  assign adr = sig_adr;
  assign clear_carry = p_fsm_n25;
  assign enable_mem = p_fsm_n27;
  assign load_R1 = p_fsm_n22;
  assign load_accu = p_fsm_n23;
  assign load_carry = p_fsm_n26;
  assign sel_UAL = p_fsm_n24;
  assign w_mem = p_fsm_n28;
  /* Control_Unit.vhd:91:8  */
  assign code_op = ri_n8; // (signal)
  /* Control_Unit.vhd:92:8  */
  assign clear_pc = p_fsm_n17; // (signal)
  /* Control_Unit.vhd:93:8  */
  assign enable_pc = p_fsm_n18; // (signal)
  /* Control_Unit.vhd:94:8  */
  assign load_pc = p_fsm_n19; // (signal)
  /* Control_Unit.vhd:95:8  */
  assign load_ri = p_fsm_n20; // (signal)
  /* Control_Unit.vhd:96:8  */
  assign sel_adr = p_fsm_n21; // (signal)
  /* Control_Unit.vhd:97:8  */
  assign adr_ri = ri_n9; // (signal)
  /* Control_Unit.vhd:98:8  */
  assign adr_out = pc_n14; // (signal)
  /* Control_Unit.vhd:99:8  */
  assign sig_adr = n53_o; // (signal)
  /* Control_Unit.vhd:110:28  */
  assign ri_n8 = ri_code_op; // (signal)
  /* Control_Unit.vhd:111:27  */
  assign ri_n9 = ri_adr_ri; // (signal)
  /* Control_Unit.vhd:104:5  */
  ins_register ri (
    .clk(clk),
    .rst(rst),
    .ce(ce),
    .data(data_in),
    .load_ri(load_ri),
    .code_op(ri_code_op),
    .adr_ri(ri_adr_ri));
  /* Control_Unit.vhd:115:28  */
  assign pc_n14 = pc_adr_out; // (signal)
  /* Control_Unit.vhd:113:5  */
  prog_counter pc (
    .adr_in(adr_ri),
    .clk(clk),
    .ce(ce),
    .carry(carry),
    .rst(rst),
    .clear_pc(clear_pc),
    .load_pc(load_pc),
    .enable_pc(enable_pc),
    .adr_out(pc_adr_out));
  /* Control_Unit.vhd:130:29  */
  assign p_fsm_n17 = p_fsm_clear_pc; // (signal)
  /* Control_Unit.vhd:132:30  */
  assign p_fsm_n18 = p_fsm_enable_pc; // (signal)
  /* Control_Unit.vhd:133:28  */
  assign p_fsm_n19 = p_fsm_load_pc; // (signal)
  /* Control_Unit.vhd:134:28  */
  assign p_fsm_n20 = p_fsm_load_ri; // (signal)
  /* Control_Unit.vhd:135:28  */
  assign p_fsm_n21 = p_fsm_sel_adr; // (signal)
  /* Control_Unit.vhd:136:28  */
  assign p_fsm_n22 = p_fsm_load_r1; // (signal)
  /* Control_Unit.vhd:137:30  */
  assign p_fsm_n23 = p_fsm_load_accu; // (signal)
  /* Control_Unit.vhd:138:28  */
  assign p_fsm_n24 = p_fsm_sel_ual; // (signal)
  /* Control_Unit.vhd:139:32  */
  assign p_fsm_n25 = p_fsm_clear_carry; // (signal)
  /* Control_Unit.vhd:140:32  */
  assign p_fsm_n26 = p_fsm_load_carry; // (signal)
  /* Control_Unit.vhd:141:31  */
  assign p_fsm_n27 = p_fsm_enable_mem; // (signal)
  /* Control_Unit.vhd:142:26  */
  assign p_fsm_n28 = p_fsm_w_mem; // (signal)
  /* Control_Unit.vhd:124:5  */
  fsm p_fsm (
    .clk(clk),
    .ce(ce),
    .rst(rst),
    .code_op(code_op),
    .carry(carry),
    .boot(boot),
    .clear_pc(p_fsm_clear_pc),
    .enable_pc(p_fsm_enable_pc),
    .load_pc(p_fsm_load_pc),
    .load_ri(p_fsm_load_ri),
    .sel_adr(p_fsm_sel_adr),
    .load_r1(p_fsm_load_r1),
    .load_accu(p_fsm_load_accu),
    .sel_ual(p_fsm_sel_ual),
    .clear_carry(p_fsm_clear_carry),
    .load_carry(p_fsm_load_carry),
    .enable_mem(p_fsm_enable_mem),
    .w_mem(p_fsm_w_mem));
  /* Control_Unit.vhd:144:19  */
  assign n53_o = sel_adr ? adr_ri : adr_out;
endmodule

