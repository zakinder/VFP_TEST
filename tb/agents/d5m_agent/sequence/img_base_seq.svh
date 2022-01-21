// Class: img_base_seq
class img_base_seq extends uvm_sequence #(d5m_trans);
    `uvm_object_utils(img_base_seq)
    
    
    rgb_set_frame           frame_pkts_h;
    vfp_config              vfp_pkts_h;
    cell_set                choices;
    d5m_trans               item;
    vfp_regs                vpkts;
    config_axi4_seq         axi_cnf_seq_h;
   
    int number_frames;
    int lval_lines;
    int lval_offset;
    int image_width;
    int incre;
    int outter_ar_size;
    int inner_ar_size;
    bit enable_pattern;
    bit [31:0] max_num_video_select;
    bit [31:0] fifo_read_enable;
    bit [7:0]  pReg_fifoReadAddress;
    bit [31:0] max_fifo_read_address;
    bit [7:0]  aBusSelect;
    bit [7:0]  addr;
    bit [31:0] data;
    
    
    // Function: new
    function new(string name="img_base_seq");
        super.new(name);
        axi_cnf_seq_h 	= config_axi4_seq::type_id::create("axi_cnf_seq_h");
    endfunction: new
    
    // Method: body 
    virtual task body();
        axi_cnf_seq_h.rgb_sharp           = reg_00_rgb_sharp;
        axi_cnf_seq_h.edge_type           = reg_01_edge_type;
        axi_cnf_seq_h.config_threshold    = reg_04_config_threshold;
        axi_cnf_seq_h.video_channel       = reg_05_video_channel;
        axi_cnf_seq_h.c_channel           = reg_07_c_channel;
        axi_cnf_seq_h.en_ycbcr_or_rgb     = reg_06_en_ycbcr_or_rgb;
        axi_cnf_seq_h.point_interest      = reg_31_point_interest;
        axi_cnf_seq_h.delta_config        = reg_32_delta_config;
        axi_cnf_seq_h.cpu_ack_go_again    = reg_33_cpu_ack_go_again;
        axi_cnf_seq_h.cpu_wgrid_lock      = reg_34_cpu_wgrid_lock;
        axi_cnf_seq_h.cpu_ack_off_frame   = reg_35_cpu_ack_off_frame;
        axi_cnf_seq_h.fifo_read_address   = reg_36_fifo_read_address;
        axi_cnf_seq_h.clear_fifo_data     = reg_37_clear_fifo_data;
        axi_cnf_seq_h.rgb_cord_rl         = reg_50_rgb_cord_rl;
        axi_cnf_seq_h.rgb_cord_rh         = reg_51_rgb_cord_rh;
        axi_cnf_seq_h.rgb_cord_gl         = reg_52_rgb_cord_gl;
        axi_cnf_seq_h.rgb_cord_gh         = reg_53_rgb_cord_gh;
        axi_cnf_seq_h.rgb_cord_bl         = reg_54_rgb_cord_bl;
        axi_cnf_seq_h.rgb_cord_bh         = reg_55_rgb_cord_bh;
        axi_cnf_seq_h.lum_th              = reg_56_lum_th;
        axi_cnf_seq_h.hsv_per_ch          = reg_57_hsv_per_ch;
        axi_cnf_seq_h.ycc_per_ch          = reg_58_ycc_per_ch;
    endtask: body


    // Method: axi_write_channel_test 
    virtual protected task init_axi_write_channel(d5m_trans item);
        `uvm_create(item)
        item.d5p.rgb           = 0;
        item.d5p.lvalid        = 1'b0;
        item.d5p.fvalid        = 1'b0;
        item.d5m_txn           = D5M_WRITE;
        `uvm_send(item);
    endtask: init_axi_write_channel

    // Method: axi_write_channel_test 
    virtual protected task axi_write_channel_test();
        d5m_trans item;
        bit[7:0] addr;
        bit[31:0] data;
        for(addr = 0; addr  <255; addr++) begin
            data++;
            `uvm_create(item)
            item.axi4_lite.addr = {14'h0,addr[7:0]};
            item.d5m_txn        = AXI4_WRITE;
            item.axi4_lite.data = data;
            `uvm_send(item);
        end
    endtask: axi_write_channel_test
    
    // Method: axi_read_channel_test 
    virtual protected task axi_read_channel_test();
        d5m_trans item;
        bit[7:0] addr;
        bit[31:0] data;
        for(addr = 0; addr <255; addr++) begin
            data++;
            `uvm_create(item)
            item.axi4_lite.addr           = {14'h0,addr[7:0]};
            item.d5m_txn                  = AXI4_READ;
            item.axi4_lite.data           = 0;
            `uvm_send(item);
        end
    endtask: axi_read_channel_test
    
    // Method: axi_multi_writes_to_address 
    virtual protected task axi_multi_writes_to_address (bit[7:0] waddr,bit[31:0] max_value);
        bit[31:0] data;
        for(data = 0; data  <= max_value; data++) begin
           axi_write_channel(waddr,data);
        end
    endtask: axi_multi_writes_to_address
    
    // Method: axi_write_channel 
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
        d5m_trans item;
        `uvm_create(item)
        item.axi4_lite.addr           = {7'h0,addr};
        item.axi4_lite.data           = data;
        item.d5m_txn                  = AXI4_WRITE;
        `uvm_send(item);
    endtask: axi_write_channel
    
    // Method: axi_read_channel 
    virtual protected task axi_read_channel();
        d5m_trans item;
        bit[7:0] addr;
        for(addr = 0; addr < 256; addr+=4) begin
            `uvm_create(item)
            item.axi4_lite.addr           = {14'h0,addr[7:0]};
            item.d5m_txn        = AXI4_READ;
            `uvm_send(item);
        end
    endtask: axi_read_channel
    
    // Method: d5m_write_pre_set_ifval 
    virtual protected task d5m_write_pre_set_ifval();
        d5m_trans item;
        int preset_cycles;
        //init d5m clear
        for(preset_cycles = 0; preset_cycles <= 10; preset_cycles++) begin
            `uvm_create(item)
            item.d5p.iImageTypeTest = 1'b1;
            item.d5p.rgb        = 0;
            item.d5p.lvalid        = 1'b0;
            item.d5p.fvalid        = 1'b1;
            item.d5m_txn        = D5M_WRITE;
            if (preset_cycles > 9 )begin //>200
                item.d5p.fvalid      = 1'b1;//init default sof valid line high
            end
            `uvm_send(item);
        end
    endtask: d5m_write_pre_set_ifval
    
    // Method: create_rgb_frames 
    virtual protected task create_rgb_frames(d5m_trans item,int nframes,int l_lines,int l_offset,int image_width);

        bit[7:0] rgb_red_data;
        bit[7:0] rgb_gre_data;
        bit[7:0] rgb_blu_data;
        bit ImTyTest  = ImTyTest_en_patten;
        bit rImage    = rImage_disable; 
        bit fval      = fval_l;
        bit lval      = lval_l;
        bit[23:0] rgb = 24'h111;
        write_per_pixel(item,ImTyTest,rImage,fval,lval,rgb);
        for(int n_frames = 0; n_frames <= nframes; n_frames++) begin
        for(int y = 0; y  < l_lines; y++) begin
            if(y == (l_lines-1)) begin
                fval  = fval_h;
                lval  = lval_h;// sol[start of line]
                for(int x = 0; x <image_width; x++) begin
                    rgb_red_data = frame_pkts_h.c_blocker.c_rows[y].c_block[x].red;
                    rgb_gre_data = frame_pkts_h.c_blocker.c_rows[y].c_block[x].gre;
                    rgb_blu_data = frame_pkts_h.c_blocker.c_rows[y].c_block[x].blu;
                    rgb          = {rgb_red_data,rgb_gre_data,rgb_blu_data};
                    write_per_pixel(item,ImTyTest,rImage,fval,lval,rgb);
                end
                fval  = fval_l;
                lval  = lval_l;// eol[end of line] with after eof
                rgb   = 24'h111;
                for(int x = 0; x  <l_offset; x++) begin
                    write_per_pixel(item,ImTyTest,rImage,fval,lval,rgb);
                end
                write_per_pixel(item,ImTyTest,rImage,fval,lval,rgb);
            end else begin
                fval  = fval_h;
                lval  = lval_h;// sol[start of line]
                for(int x = 0; x <image_width; x++) begin
                    rgb_red_data = frame_pkts_h.c_blocker.c_rows[y].c_block[x].red;
                    rgb_gre_data = frame_pkts_h.c_blocker.c_rows[y].c_block[x].gre;
                    rgb_blu_data = frame_pkts_h.c_blocker.c_rows[y].c_block[x].blu;
                    rgb          = {rgb_red_data,rgb_gre_data,rgb_blu_data};
                    write_per_pixel(item,ImTyTest,rImage,fval,lval,rgb);
                end
                fval  = fval_h;
                lval  = lval_l;// eol[end of line]
                rgb   = 24'h111;
                for(int x = 0; x  <l_offset; x++) begin
                    write_per_pixel(item,ImTyTest,rImage,fval,lval,rgb);
                end
            end
        end
        end
    endtask: create_rgb_frames
    // Method: write_per_pixel 
    virtual protected task write_per_pixel(d5m_trans item,bit ImTyTest,bit rImage,bit fval,bit lval, bit[23:0] rgb);
        `uvm_create(item)
            item.d5p.iImageTypeTest = ImTyTest;
            item.d5p.iReadyToRead   = rImage;
            item.d5p.fvalid         = fval;
            item.d5p.lvalid         = lval;
            item.d5p.rgb            = rgb;
            item.d5m_txn            = D5M_WRITE;
        `uvm_send(item);
    endtask: write_per_pixel
    
    // Method: axi_write_aBusSelect_channel 
    virtual protected task axi_write_aBusSelect_channel (bit[7:0] addr,bit[31:0] data);
        d5m_trans item;
        `uvm_create(item)
        item.axi4_lite.addr   = {7'h0,addr};
        item.axi4_lite.data   = data;
        item.d5m_txn          = AXI4_WRITE;
        `uvm_send(item);
    endtask: axi_write_aBusSelect_channel
    
endclass: img_base_seq