// Class: d5m_rgb_seq
class d5m_rgb_seq extends uvm_sequence #(d5m_trans);
    `uvm_object_utils(d5m_rgb_seq)
    
    rgb_set_frame                cell_box_pkts;
    vfp_config       vfp_pkts;
    // Function: new
    function new(string name="d5m_rgb_seq");
        super.new(name);
        cell_box_pkts = rgb_set_frame::type_id::create("cell_box_pkts");
        vfp_pkts = vfp_config::type_id::create("vfp_pkts");
    endfunction
    // Method: body 
    virtual task body();
        //----------------------------------------------------
        d5m_trans item;
        vfp_regs vpkts;
        int number_frames;
        int lval_lines;
        int lval_offset;
        int image_width;
        bit [31:0] max_num_video_select  = 50;
        bit [31:0] fifo_read_enable      = 32'h10000;
        bit [7:0] pReg_fifoReadAddress   = 8'h90;
        bit [31:0] max_fifo_read_address = 32'h400f;
        bit [7:0] aBusSelect             = 8'h0C;
        bit enable_pattern               = 1'b0;
        int incre=0;


        int outter_ar_size;
        int inner_ar_size;

        cell_set choices;



        vfp_pkts.randomize();
        vfp_pkts.unpack_packets();
        vfp_pkts.check_packets();
        vfp_pkts.pack_packets();

        vpkts = {<<{vfp_pkts.reg_vpkts}};
        `uvm_info("SEQ", $sformatf("vfp_modev vpkts REG_00=%0d", vpkts.REG_00), UVM_LOW)
        `uvm_info("SEQ", $sformatf("vfp_modev vpkts REG_01=%0d", vpkts.REG_01), UVM_LOW)
        axi_write_channel(oRgbOsharp,vpkts.REG_00);
        axi_write_channel(oEdgeType,vpkts.REG_01);
        axi_write_channel(threshold,vpkts.REG_04);
        axi_write_channel(videoChannel,vpkts.REG_05);
        axi_write_channel(dChannel,vpkts.REG_06);
        axi_write_channel(cChannel,vpkts.REG_07);

        //axi_write_channel(pReg_pointInterest,vpkts.REG_31);
        //axi_write_channel(pReg_deltaConfig,vpkts.REG_32);
        //axi_write_channel(pReg_cpuAckGoAgain,vpkts.REG_33);
        //axi_write_channel(pReg_cpuWgridLock,vpkts.REG_34);
        //axi_write_channel(pReg_cpuAckoffFrame,vpkts.REG_35);
        //axi_write_channel(pReg_fifoReadAddress,vpkts.REG_36);
        //axi_write_channel(pReg_clearFifoData,vpkts.REG_37);
        //axi_write_channel(rgbCoord_rl,vpkts.REG_50);
        //axi_write_channel(rgbCoord_rh,vpkts.REG_51);
        //axi_write_channel(rgbCoord_gl,vpkts.REG_52);
        //axi_write_channel(rgbCoord_gh,vpkts.REG_53);
        //axi_write_channel(rgbCoord_bl,vpkts.REG_54);
        //axi_write_channel(rgbCoord_bh,vpkts.REG_55);
        //axi_write_channel(oLumTh,vpkts.REG_56);
        //axi_write_channel(oHsvPerCh,vpkts.REG_57);
        //axi_write_channel(oYccPerCh,vpkts.REG_58);

        `uvm_create(item)
        item.d5p.rgb           = 0;
        item.d5p.lvalid        = 1'b0;
        item.d5p.fvalid        = 1'b0;
        item.d5m_txn           = D5M_WRITE;
        `uvm_send(item);
        //----------------------------------------------------
        //axi_write_channel_test();
        //axi_read_channel_test();
        //axi_multi_writes_to_address(videoChannel,max_num_video_select);
        //----------------------------------------------------
       // d5m_write_pre_set_ifval();
        number_frames  = 1;
        lval_offset    = img_width_bmp+30;
        lval_lines     = img_height_bmp;
        image_width    = img_width_bmp;
        choices        = rgb_incrementer;
        cell_box_pkts.re_gen_cell_box(lval_lines,image_width,set_cell_red_value,set_cell_gre_value,set_cell_blu_value,set_increment_value,choices);
        create_rgb_frames(number_frames,lval_lines,lval_offset,image_width);
        //----------------------------------------------------
    endtask: body
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
            item.d5m_txn        = AXI4_READ;
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
    virtual protected task create_rgb_frames(int nframes,int l_lines,int l_offset,int image_width);
        d5m_trans item;

        bit[7:0] rgb_red_data;
        bit[7:0] rgb_gre_data;
        bit[7:0] rgb_blu_data;
        bit ImTyTest  = ImTyTest_en_patten;
        bit rImage    = rImage_disable; 
        bit fval      = fval_l;
        bit lval      = lval_l;
        bit[23:0] rgb = 24'h111;

        write_per_pixel(ImTyTest,rImage,fval,lval,rgb);

        for(int n_frames = 0; n_frames <= nframes; n_frames++) begin

        for(int y = 0; y  < l_lines; y++) begin
        
            if(y == (l_lines-1)) begin
                fval  = fval_h;
                lval  = lval_h;// sol[start of line]

                for(int x = 0; x <image_width; x++) begin
                    rgb_red_data = cell_box_pkts.c_blocker.c_rows[y].c_block[x].red;
                    rgb_gre_data = cell_box_pkts.c_blocker.c_rows[y].c_block[x].gre;
                    rgb_blu_data = cell_box_pkts.c_blocker.c_rows[y].c_block[x].blu;
                    rgb = {rgb_red_data,rgb_gre_data,rgb_blu_data};
                    write_per_pixel(ImTyTest,rImage,fval,lval,rgb);
                end

                fval  = fval_l;
                lval  = lval_l;// eol[end of line] with after eof
                rgb   = 24'h111;

                for(int x = 0; x  <l_offset; x++) begin
                    write_per_pixel(ImTyTest,rImage,fval,lval,rgb);
                end

                write_per_pixel(ImTyTest,rImage,fval,lval,rgb);

            end else begin

                fval  = fval_h;
                lval  = lval_h;// sol[start of line]

                for(int x = 0; x <image_width; x++) begin
                    rgb_red_data = cell_box_pkts.c_blocker.c_rows[y].c_block[x].red;
                    rgb_gre_data = cell_box_pkts.c_blocker.c_rows[y].c_block[x].gre;
                    rgb_blu_data = cell_box_pkts.c_blocker.c_rows[y].c_block[x].blu;
                    rgb     = {rgb_red_data,rgb_gre_data,rgb_blu_data};
                    write_per_pixel(ImTyTest,rImage,fval,lval,rgb);
                end

                fval  = fval_h;
                lval  = lval_l;// eol[end of line]
                rgb   = 24'h111;

                for(int x = 0; x  <l_offset; x++) begin
                    write_per_pixel(ImTyTest,rImage,fval,lval,rgb);
                end
                
            end
        end
        end
    endtask: create_rgb_frames

    // Method: write_per_pixel 
    virtual protected task write_per_pixel(bit ImTyTest,bit rImage,bit fval,bit lval, bit[23:0] rgb);
        d5m_trans item;
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
    
endclass: d5m_rgb_seq