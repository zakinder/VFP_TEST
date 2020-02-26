// Class: vfp_registers
class vfp_registers extends uvm_object;
  `uvm_object_utils(vfp_registers)
  rand vfp_regs reg_field;
  vfp_regs regs_packet;
  static  int write_unused        = 0;
  static  int rgb_sharp           = 10;
  static  int edge_type           = 11;
  static  int bus_select          = 0;//for video stream
  static  int config_threshold    = 20;
  static  int video_channel       = selected_video_channel;
  static  int en_ycbcr_or_rgb     = en_rgb;
  static  int c_channel           = 15;
  static  int kls_k1              = 0;
  static  int kls_k2              = 0;
  static  int kls_k3              = 0;
  static  int kls_k4              = 0;
  static  int kls_k5              = 0;
  static  int kls_k6              = 0;
  static  int kls_k7              = 0;
  static  int kls_k8              = 0;
  static  int kls_k9              = 0;
  static  int kls_config          = 0;
  static  int als_k1              = 0;
  static  int als_k2              = 0;
  static  int als_k3              = 0;
  static  int als_k4              = 0;
  static  int als_k5              = 0;
  static  int als_k6              = 0;
  static  int als_k7              = 0;
  static  int als_k8              = 0;
  static  int als_k9              = 0;
  static  int als_config          = 0;
  static  int point_interest      = 10;
  static  int delta_config        = 5;
  static  int cpu_ack_go_again    = 1;
  static  int cpu_wgrid_lock      = 1;
  static  int cpu_ack_off_frame   = 6;
  static  int fifo_read_address   = 6;
  static  int clear_fifo_data     = 5;
  static  int rgb_cord_rl         = 0;
  static  int rgb_cord_rh         = 255;
  static  int rgb_cord_gl         = 0;
  static  int rgb_cord_gh         = 255;
  static  int rgb_cord_bl         = 0;
  static  int rgb_cord_bh         = 255;
  static  int lum_th              = 36;
  static  int hsv_per_ch          = 0;
  static  int ycc_per_ch          = 0;
  constraint c_fixed_REG_00 { reg_field.REG_00 == rgb_sharp; }
  constraint c_fixed_REG_01 { reg_field.REG_01 == edge_type; }
  constraint c_fixed_REG_02 { reg_field.REG_02 == write_unused; }
  constraint c_fixed_REG_03 { reg_field.REG_03 == bus_select; }
  constraint c_fixed_REG_04 { reg_field.REG_04 == config_threshold; }
  constraint c_fixed_REG_05 { reg_field.REG_05 == video_channel; }
  constraint c_fixed_REG_06 { reg_field.REG_06 == en_ycbcr_or_rgb; }
  constraint c_fixed_REG_07 { reg_field.REG_07 == c_channel; }
  constraint c_fixed_REG_08 { reg_field.REG_08 == kls_k1; }
  constraint c_fixed_REG_09 { reg_field.REG_09 == kls_k2; }
  constraint c_fixed_REG_10 { reg_field.REG_10 == kls_k3; }
  constraint c_fixed_REG_11 { reg_field.REG_11 == kls_k4; }
  constraint c_fixed_REG_12 { reg_field.REG_12 == kls_k5; }
  constraint c_fixed_REG_13 { reg_field.REG_13 == kls_k6; }
  constraint c_fixed_REG_14 { reg_field.REG_14 == kls_k7; }
  constraint c_fixed_REG_15 { reg_field.REG_15 == kls_k8; }
  constraint c_fixed_REG_16 { reg_field.REG_16 == kls_k9; }
  constraint c_fixed_REG_17 { reg_field.REG_17 == kCoefDisabIndex; }
  constraint c_fixed_REG_18 { reg_field.REG_18 == write_unused; }
  constraint c_fixed_REG_19 { reg_field.REG_19 == write_unused; }
  constraint c_fixed_REG_20 { reg_field.REG_20 == write_unused; }
  constraint c_fixed_REG_21 { reg_field.REG_21 == als_k1; }
  constraint c_fixed_REG_22 { reg_field.REG_22 == als_k2; }
  constraint c_fixed_REG_23 { reg_field.REG_23 == als_k3; }
  constraint c_fixed_REG_24 { reg_field.REG_24 == als_k4; }
  constraint c_fixed_REG_25 { reg_field.REG_25 == als_k5; }
  constraint c_fixed_REG_26 { reg_field.REG_26 == als_k6; }
  constraint c_fixed_REG_27 { reg_field.REG_27 == als_k7; }
  constraint c_fixed_REG_28 { reg_field.REG_28 == als_k8; }
  constraint c_fixed_REG_29 { reg_field.REG_29 == als_k9; }
  constraint c_fixed_REG_30 { reg_field.REG_30 == als_config; }
  constraint c_fixed_REG_31 { reg_field.REG_31 == point_interest; }
  constraint c_fixed_REG_32 { reg_field.REG_32 == delta_config; }
  constraint c_fixed_REG_33 { reg_field.REG_33 == cpu_ack_go_again; }
  constraint c_fixed_REG_34 { reg_field.REG_34 == cpu_wgrid_lock; }
  constraint c_fixed_REG_35 { reg_field.REG_35 == cpu_ack_off_frame; }
  constraint c_fixed_REG_36 { reg_field.REG_36 == fifo_read_address; }
  constraint c_fixed_REG_37 { reg_field.REG_37 == clear_fifo_data; }
  constraint c_fixed_REG_38 { reg_field.REG_38 == write_unused; }
  constraint c_fixed_REG_39 { reg_field.REG_39 == write_unused; }
  constraint c_fixed_REG_40 { reg_field.REG_40 == write_unused; }
  constraint c_fixed_REG_41 { reg_field.REG_41 == write_unused; }
  constraint c_fixed_REG_42 { reg_field.REG_42 == write_unused; }
  constraint c_fixed_REG_43 { reg_field.REG_43 == write_unused; }
  constraint c_fixed_REG_44 { reg_field.REG_44 == write_unused; }
  constraint c_fixed_REG_45 { reg_field.REG_45 == write_unused; }
  constraint c_fixed_REG_46 { reg_field.REG_46 == write_unused; }
  constraint c_fixed_REG_47 { reg_field.REG_47 == write_unused; }
  constraint c_fixed_REG_48 { reg_field.REG_48 == write_unused; }
  constraint c_fixed_REG_49 { reg_field.REG_49 == write_unused; }
  constraint c_fixed_REG_50 { reg_field.REG_50 == rgb_cord_rl; }
  constraint c_fixed_REG_51 { reg_field.REG_51 == rgb_cord_rh; }
  constraint c_fixed_REG_52 { reg_field.REG_52 == rgb_cord_gl; }
  constraint c_fixed_REG_53 { reg_field.REG_53 == rgb_cord_gh; }
  constraint c_fixed_REG_54 { reg_field.REG_54 == rgb_cord_bl; }
  constraint c_fixed_REG_55 { reg_field.REG_55 == rgb_cord_bh; }
  constraint c_fixed_REG_56 { reg_field.REG_56 == lum_th; }
  constraint c_fixed_REG_57 { reg_field.REG_57 == hsv_per_ch; }
  constraint c_fixed_REG_58 { reg_field.REG_58 == ycc_per_ch; }
  constraint c_fixed_REG_59 { reg_field.REG_59 == write_unused; }
  constraint c_fixed_REG_60 { reg_field.REG_60 == write_unused; }
  constraint c_fixed_REG_61 { reg_field.REG_61 == write_unused; }
  constraint c_fixed_REG_62 { reg_field.REG_62 == write_unused; }
  constraint c_fixed_REG_63 { reg_field.REG_63 == write_unused; }
  // Function: new
  function new(string name = "vfp_registers");
    super.new(name);
  endfunction: new
  // Function: post_randomize
  function void post_randomize();
  { <<  {regs_packet}} = reg_field;
  endfunction : post_randomize
endclass : vfp_registers