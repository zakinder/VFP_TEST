

class d5m_camera_image_sobel_mask_rgb_sequence extends uvm_sequence #(uvm_sequence_item);

   `uvm_object_utils(d5m_camera_image_sobel_mask_rgb_sequence);
   
   
   d5m_image_generator_sequence             d5m_image_seq;
   axi_config_image_frame_sequence          axi_config_seq;
   protected d5m_camera_sequencer           aL_sqr;
   uvm_component                            uvm_component_h;


 function new(string name = "d5m_camera_image_sobel_mask_rgb_sequence");
    super.new(name);
    uvm_component_h   =  uvm_top.find("*aL_sqr");
    if (uvm_component_h == null)
        `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
    if (!$cast(aL_sqr, uvm_component_h))
        `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 

 
 task body();
    //-------------------------------------------
    // Override axi config data
    //-------------------------------------------
    axi_config_seq.rgb_sharp           = 10;
    axi_config_seq.edge_type           = 11;
    axi_config_seq.config_threshold    = config_data_threshold;
    axi_config_seq.video_channel       = selected_video_channel;
    axi_config_seq.c_channel           = 15;
    axi_config_seq.en_ycbcr_or_rgb     = en_rgb;
    axi_config_seq.point_interest      = 10;
    axi_config_seq.delta_config        = 5;
    axi_config_seq.cpu_ack_go_again    = 1;
    axi_config_seq.cpu_wgrid_lock      = 1;
    axi_config_seq.cpu_ack_off_frame   = 6;
    axi_config_seq.fifo_read_address   = 6;
    axi_config_seq.clear_fifo_data     = 5;
    axi_config_seq.rgb_cord_rl         = 0;
    axi_config_seq.rgb_cord_rh         = 255;
    axi_config_seq.rgb_cord_gl         = 0;
    axi_config_seq.rgb_cord_gh         = 255;
    axi_config_seq.rgb_cord_bl         = 0;
    axi_config_seq.rgb_cord_bh         = 255;
    axi_config_seq.lum_th              = 36;
    axi_config_seq.hsv_per_ch          = 0;
    axi_config_seq.ycc_per_ch          = 0;
    //-------------------------------------------
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
 
 
endclass : d5m_camera_image_sobel_mask_rgb_sequence