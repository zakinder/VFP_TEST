// Class: axi_config_image_frame_sequence
class axi_config_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
   `uvm_object_utils(axi_config_image_frame_sequence)
    int rgb_sharp           = 10;
    int edge_type           = 11;
    int config_threshold    = 20;
    int video_channel       = selected_video_channel;
    int c_channel           = 15;
    int en_ycbcr_or_rgb     = en_rgb;
    int point_interest      = 10;
    int delta_config        = 5;
    int cpu_ack_go_again    = 1;
    int cpu_wgrid_lock      = 1;
    int cpu_ack_off_frame   = 6;
    int fifo_read_address   = 6;
    int clear_fifo_data     = 5;
    int rgb_cord_rl         = 0;
    int rgb_cord_rh         = 255;
    int rgb_cord_gl         = 0;
    int rgb_cord_gh         = 255;
    int rgb_cord_bl         = 0;
    int rgb_cord_bh         = 255;
    int lum_th              = 36;
    int hsv_per_ch          = 0;
    int ycc_per_ch          = 0;
    // Function: new
   function new(string name="axi_config_image_frame_sequence");
       super.new(name);
   endfunction: new
    // Function: SetStatus
   function void SetStatus(input int Y);
      en_ycbcr_or_rgb = Y;
   endfunction: SetStatus
    // Method:  body
   virtual task body();
       d5m_camera_transaction item;
       axi_write_channel(oRgbOsharp,rgb_sharp);
       axi_write_channel(oEdgeType,edge_type);
       axi_write_channel(threshold,config_threshold);
       axi_write_channel(videoChannel,video_channel);
       axi_write_channel(cChannel,c_channel);
       axi_write_channel(dChannel,en_ycbcr_or_rgb);
       axi_write_channel(pReg_pointInterest,point_interest);
       axi_write_channel(pReg_deltaConfig,delta_config);
       axi_write_channel(pReg_cpuAckGoAgain,cpu_ack_go_again);
       axi_write_channel(pReg_cpuWgridLock,cpu_wgrid_lock);
       axi_write_channel(pReg_cpuAckoffFrame,cpu_ack_off_frame);
       axi_write_channel(pReg_fifoReadAddress,fifo_read_address);
       axi_write_channel(pReg_clearFifoData,clear_fifo_data);
       axi_write_channel(rgbCoord_rl,rgb_cord_rl);
       axi_write_channel(rgbCoord_rh,rgb_cord_rh);
       axi_write_channel(rgbCoord_gl,rgb_cord_gl);
       axi_write_channel(rgbCoord_gh,rgb_cord_gh);
       axi_write_channel(rgbCoord_bl,rgb_cord_bl);
       axi_write_channel(rgbCoord_bh,rgb_cord_bh);
       axi_write_channel(oLumTh,lum_th);
       axi_write_channel(oHsvPerCh,hsv_per_ch);
       axi_write_channel(oYccPerCh,ycc_per_ch);
   endtask: body

    // Method:  axi_write_channel
    virtual task axi_write_channel (bit[7:0] addr,bit[31:0] data);
        d5m_camera_transaction item;
        `uvm_create(item)
        item.axi4_lite.addr           = {7'h0,addr};
        item.axi4_lite.data           = data;
        item.d5m_txn                  = AXI4_WRITE;
        `uvm_send(item);
   endtask: axi_write_channel
   
endclass: axi_config_image_frame_sequence