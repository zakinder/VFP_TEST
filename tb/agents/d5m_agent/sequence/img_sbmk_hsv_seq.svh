// Class: img_sbmk_hsv_seq
class img_sbmk_hsv_seq extends uvm_sequence #(uvm_sequence_item);

   `uvm_object_utils(img_sbmk_hsv_seq);
   
   
   img_gen_seq             d5m_image_seq;
   config_axi4_seq          axi_config_seq;
   protected img_seqr           aL_sqr;
   uvm_component                            uvm_component_h;

    // Function: new
 function new(string name = "img_sbmk_hsv_seq");
    super.new(name);
    uvm_component_h   =  uvm_top.find("*aL_sqr");
    if (uvm_component_h == null)
        `uvm_fatal("RUNALL SEQUENCE", "Failed to get the img_seqr")
    if (!$cast(aL_sqr, uvm_component_h))
        `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= img_gen_seq::type_id::create("d5m_image_seq");
    axi_config_seq 	= config_axi4_seq::type_id::create("axi_config_seq");
 endfunction : new
 

 
 task body();
    //-------------------------------------------
    // Override axi config data
    //-------------------------------------------
    axi_config_seq.rgb_sharp           = reg_00_rgb_sharp;
    axi_config_seq.edge_type           = reg_01_edge_type;
    axi_config_seq.config_threshold    = reg_04_config_threshold;
    axi_config_seq.video_channel       = reg_05_video_channel;
    axi_config_seq.c_channel           = reg_07_c_channel;
    axi_config_seq.en_ycbcr_or_rgb     = reg_06_en_ycbcr_or_rgb;
    axi_config_seq.point_interest      = reg_31_point_interest;
    axi_config_seq.delta_config        = reg_32_delta_config;
    axi_config_seq.cpu_ack_go_again    = reg_33_cpu_ack_go_again;
    axi_config_seq.cpu_wgrid_lock      = reg_34_cpu_wgrid_lock;
    axi_config_seq.cpu_ack_off_frame   = reg_35_cpu_ack_off_frame;
    axi_config_seq.fifo_read_address   = reg_36_fifo_read_address;
    axi_config_seq.clear_fifo_data     = reg_37_clear_fifo_data;
    axi_config_seq.rgb_cord_rl         = reg_50_rgb_cord_rl;
    axi_config_seq.rgb_cord_rh         = reg_51_rgb_cord_rh;
    axi_config_seq.rgb_cord_gl         = reg_52_rgb_cord_gl;
    axi_config_seq.rgb_cord_gh         = reg_53_rgb_cord_gh;
    axi_config_seq.rgb_cord_bl         = reg_54_rgb_cord_bl;
    axi_config_seq.rgb_cord_bh         = reg_55_rgb_cord_bh;
    axi_config_seq.lum_th              = reg_56_lum_th;
    axi_config_seq.hsv_per_ch          = reg_57_hsv_per_ch;
    axi_config_seq.ycc_per_ch          = reg_58_ycc_per_ch;
    //-------------------------------------------
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
 
 
endclass : img_sbmk_hsv_seq