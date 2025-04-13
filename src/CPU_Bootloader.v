module CPU_Bootloader
  (input  clk,
   input  rst,
   input  ce,
   input  scan_memory,
   input  rx,
   output tx);
  wire [15:0] ut_data_out;
  wire [5:0] sig_adr;
  wire carry;
  wire clear_carry;
  wire enable_mem;
  wire load_r1;
  wire load_accu;
  wire load_carry;
  wire [2:0] sel_ual_ut;
  wire [2:0] sel_ual_uc;
  wire w_mem;
  wire [15:0] ram_data_out;
  wire sig_rw;
  wire sig_ram_enable;
  wire [5:0] sig_ram_adr;
  wire [15:0] sig_ram_in;
  wire boot;
  wire [5:0] boot_ram_adr;
  wire [15:0] boot_ram_in;
  wire boot_ram_rw;
  wire boot_ram_enable;
  wire [5:0] uc_adr;
  wire uc_clear_carry;
  wire uc_enable_mem;
  wire uc_load_R1;
  wire uc_load_accu;
  wire uc_load_carry;
  wire [2:0] uc_sel_UAL;
  wire uc_w_mem;
  wire [15:0] ut1_data_out;
  wire ut1_carry;
  wire bl_tx;
  wire bl_boot;
  wire bl_ram_rw;
  wire bl_ram_enable;
  wire [5:0] bl_ram_adr;
  wire [15:0] bl_ram_in;
  wire n17_o;
  wire n18_o;
  wire [5:0] n19_o;
  wire [15:0] n20_o;
  wire [15:0] um_data_out;
  assign tx = bl_tx;
  /* CPU_Bootloader.vhd:175:12  */
  assign ut_data_out = ut1_data_out; // (signal)
  /* CPU_Bootloader.vhd:177:12  */
  assign sig_adr = uc_adr; // (signal)
  /* CPU_Bootloader.vhd:179:12  */
  assign carry = ut1_carry; // (signal)
  /* CPU_Bootloader.vhd:181:12  */
  assign clear_carry = uc_clear_carry; // (signal)
  /* CPU_Bootloader.vhd:183:12  */
  assign enable_mem = uc_enable_mem; // (signal)
  /* CPU_Bootloader.vhd:185:12  */
  assign load_r1 = uc_load_R1; // (signal)
  /* CPU_Bootloader.vhd:187:12  */
  assign load_accu = uc_load_accu; // (signal)
  /* CPU_Bootloader.vhd:189:12  */
  assign load_carry = uc_load_carry; // (signal)
  /* CPU_Bootloader.vhd:191:12  */
  assign sel_ual_ut = sel_ual_uc; // (signal)
  /* CPU_Bootloader.vhd:193:12  */
  assign sel_ual_uc = uc_sel_UAL; // (signal)
  /* CPU_Bootloader.vhd:195:12  */
  assign w_mem = uc_w_mem; // (signal)
  /* CPU_Bootloader.vhd:199:25  */
  assign ram_data_out = um_data_out; // (signal)
  /* CPU_Bootloader.vhd:205:12  */
  assign sig_rw = n17_o; // (signal)
  /* CPU_Bootloader.vhd:207:12  */
  assign sig_ram_enable = n18_o; // (signal)
  /* CPU_Bootloader.vhd:209:12  */
  assign sig_ram_adr = n19_o; // (signal)
  /* CPU_Bootloader.vhd:211:12  */
  assign sig_ram_in = n20_o; // (signal)
  /* CPU_Bootloader.vhd:215:12  */
  assign boot = bl_boot; // (signal)
  /* CPU_Bootloader.vhd:217:12  */
  assign boot_ram_adr = bl_ram_adr; // (signal)
  /* CPU_Bootloader.vhd:219:12  */
  assign boot_ram_in = bl_ram_in; // (signal)
  /* CPU_Bootloader.vhd:223:12  */
  assign boot_ram_rw = bl_ram_rw; // (signal)
  /* CPU_Bootloader.vhd:225:12  */
  assign boot_ram_enable = bl_ram_enable; // (signal)
  /* CPU_Bootloader.vhd:231:5  */
  Control_Unit 
    uc (
    .clk(clk),
    .ce(ce),
    .rst(rst),
    .carry(carry),
    .boot(boot),
    .data_in(ram_data_out),
    .adr(uc_adr),
    .clear_carry(uc_clear_carry),
    .enable_mem(uc_enable_mem),
    .load_R1(uc_load_R1),
    .load_accu(uc_load_accu),
    .load_carry(uc_load_carry),
    .sel_UAL(uc_sel_UAL),
    .w_mem(uc_w_mem));
  /* CPU_Bootloader.vhd:271:5  */
  UT UT (
    .data_in(ram_data_out),
    .clk(clk),
    .ce(ce),
    .rst(rst),
    .load_R1(load_r1),
    .load_ACCU(load_accu),
    .load_carry(load_carry),
    .init_carry(clear_carry),
    .sel_UAL(sel_ual_ut),
    .data_out(ut1_data_out),
    .carry(ut1_carry));
  /* CPU_Bootloader.vhd:297:5  */
  boot_loader
    bl (
    .rst(rst),
    .clk(clk),
    .ce(ce),
    .rx(rx),
    .scan_memory(scan_memory),
    .ram_out(ram_data_out),
    .tx(bl_tx),
    .boot(bl_boot),
    .ram_rw(bl_ram_rw),
    .ram_enable(bl_ram_enable),
    .ram_adr(bl_ram_adr),
    .ram_in(bl_ram_in));
  /* CPU_Bootloader.vhd:333:27  */
  assign n17_o = boot ? boot_ram_rw : w_mem;
  /* CPU_Bootloader.vhd:337:39  */
  assign n18_o = boot ? boot_ram_enable : enable_mem;
  /* CPU_Bootloader.vhd:341:33  */
  assign n19_o = boot ? boot_ram_adr : sig_adr;
  /* CPU_Bootloader.vhd:345:31  */
  assign n20_o = boot ? boot_ram_in : ut_data_out;
  /* CPU_Bootloader.vhd:351:5  */
  RAM_SP_64_8 
    um (
    .add(sig_ram_adr),
    .data_in(sig_ram_in),
    .r_w(sig_rw),
    .enable(sig_ram_enable),
    .clk(clk),
    .ce(ce),
    .data_out(um_data_out));
endmodule
