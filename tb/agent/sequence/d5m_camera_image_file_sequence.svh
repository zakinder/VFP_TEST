// UVM_SEQUENCE : D5M_CAMERA_IMAGE_FILE_SEQUENCE [d5m_camera]
class d5m_image_random_sequence extends uvm_sequence #(d5m_camera_transaction);
   `uvm_object_utils(d5m_image_random_sequence);
   d5m_camera_transaction item,s2;
   function new(string name = "d5m_image_random_sequence");
      super.new(name);
   endfunction : new
   virtual task body();
      repeat (1) begin : random_loop
         //create method
         item = d5m_camera_transaction::type_id::create("item");
         s2 = d5m_camera_transaction::type_id::create("s2");
         start_item(item);
          //randomizing the seq_item
         assert(item.randomize());
         
        //`uvm_info(get_type_name(),$psprintf("convert_A %0x",item.convert_A), UVM_LOW)
        `uvm_info("convert_A", item.convert2string(), UVM_LOW);
        `uvm_info(get_type_name(),$psprintf("convert_axi4_lite %0d",item.axi4_lite.addr), UVM_LOW)

         finish_item(item);
         start_item(s2);
         assert(s2.randomize());
         s2.copy(item);
       // `uvm_info(get_type_name(),$psprintf("convert_B %0x",s2.convert_B), UVM_LOW)
        `uvm_info("convert_B", s2.convert2string(), UVM_LOW);
        `uvm_info(get_type_name(),$psprintf("s1==s2: ",item.compare(s2)), UVM_LOW)
        `uvm_info(get_type_name(),$psprintf("convert_axi4_lite %0d",s2.axi4_lite.addr), UVM_LOW)
         finish_item(s2);

      end : random_loop
    endtask: body
endclass : d5m_image_random_sequence
class d5m_image_generator_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(d5m_image_generator_sequence)
    function new(string name="d5m_image_generator_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        `uvm_create(item)
        item.d5p.iImageTypeTest = 1'b0;
        item.d5m_txn            = IMAGE_READ;
        `uvm_send(item);
    endtask: body
endclass: d5m_image_generator_sequence
class d5m_camera_image_file_sequence extends d5m_camera_base_seq;
    `uvm_object_utils(d5m_camera_image_file_sequence)
    function new(string name="d5m_camera_image_file_sequence");
        super.new(name);
    endfunction
    // body --------------------------------------------------
    virtual task body();
        d5m_camera_transaction item;
        int number_frames;
        int lval_lines;
        int lval_offset;
        int image_width;
        bit [31:0] fifo_read_enable      = 32'h10000;//180
        bit [7:0] pReg_fifoReadAddress   = 8'h90;//116 // pReg_fifoReadEnable --fifo read enable
        bit [31:0] max_fifo_read_address = 32'h400f;//180
        bit [7:0] aBusSelect             = 8'h0C;//12 
        bit enable_pattern  = 1'b0;
        typedef enum { pattern, random } type_idata;
        type_idata  data_type;
        //----------------------------------------------------
        `uvm_create(item)
        item.d5p.rgb            = 0;
        item.d5p.lvalid         = 1'b0;
        item.d5p.fvalid         = 1'b0;
        item.d5p.iImageTypeTest = 1'b0;
        item.d5m_txn            = D5M_WRITE;
        `uvm_send(item);
        //----------------------------------------------------
        axi_write_config_reg();
        d5m_read();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        bit [7:0] initAddr               = 8'h00;//0   [15]  
        bit [7:0] oRgbOsharp             = 8'h00;//0   [15]         
        bit [7:0] oEdgeType              = 8'h04;//4   [15]        
        bit [7:0] aBusSelect             = 8'h0C;//12  [15]           
        bit [7:0] threshold              = 8'h10;//16  [15]          
        bit [7:0] videoChannel           = 8'h14;//20  [15]         
        bit [7:0] dChannel               = 8'h18;//24  [15]        
        bit [7:0] cChannel               = 8'h1C;//28  [15]          
        bit [7:0] kls_k1                 = 8'h20;//32  [15]
        bit [7:0] kls_k2                 = 8'h24;//36  [15]
        bit [7:0] kls_k3                 = 8'h28;//40  [15]
        bit [7:0] kls_k4                 = 8'h2C;//44  [15]
        bit [7:0] kls_k5                 = 8'h30;//48  [15]
        bit [7:0] kls_k6                 = 8'h34;//52  [15]
        bit [7:0] kls_k7                 = 8'h38;//56  [15]
        bit [7:0] kls_k8                 = 8'h3C;//60  [15]
        bit [7:0] kls_k9                 = 8'h40;//64  [15]
        bit [7:0] kls_config             = 8'h44;//68  [15]
        bit [7:0] kCoefDisabIndex        = 8'h00;//84  [15]
        bit [7:0] kCoefYcbcrIndex        = 8'h01;//84  [15]
        bit [7:0] kCoefCgainIndex        = 8'h02;//84  [15]
        bit [7:0] kCoefSharpIndex        = 8'h03;//84  [15]
        bit [7:0] kCoefBlureIndex        = 8'h04;//84  [15]
        bit [7:0] kCoefSobeXIndex        = 8'h05;//84  [15]
        bit [7:0] kCoefSobeYIndex        = 8'h06;//84  [15]
        bit [7:0] kCoefEmbosIndex        = 8'h07;//84  [19]
        bit [7:0] kCoefCgai1Index        = 8'h08;//84  [20]
        bit [7:0] als_k1                 = 8'h54;//84  [21]
        bit [7:0] als_k2                 = 8'h58;//88  [22]
        bit [7:0] als_k3                 = 8'h5C;//92  [23]
        bit [7:0] als_k4                 = 8'h60;//96  [24]
        bit [7:0] als_k5                 = 8'h64;//100 [25]
        bit [7:0] als_k6                 = 8'h68;//104 [26]
        bit [7:0] als_k7                 = 8'h6C;//108 [27]
        bit [7:0] als_k8                 = 8'h70;//112 [28]
        bit [7:0] als_k9                 = 8'h74;//116 [29]
        bit [7:0] als_config             = 8'h78;//120 [30]
        bit [7:0] pReg_pointInterest     = 8'h7C;//124 [31]
        bit [7:0] pReg_deltaConfig       = 8'h80;//128 [32]
        bit [7:0] pReg_cpuAckGoAgain     = 8'h84;//132 [33]
        bit [7:0] pReg_cpuWgridLock      = 8'h88;//136 [34]
        bit [7:0] pReg_cpuAckoffFrame    = 8'h8C;//140 [35]
        bit [7:0] pReg_fifoReadAddress   = 8'h90;//144 [36] // pReg_fifoReadEnable --fifo read enable
        bit [7:0] pReg_clearFifoData     = 8'h94;//148 [37]
        bit [7:0] rgbCoord_rl            = 8'hC8;//84  [50]
        bit [7:0] rgbCoord_rh            = 8'hCC;//88  [51]
        bit [7:0] rgbCoord_gl            = 8'hD0;//156 [52]
        bit [7:0] rgbCoord_gh            = 8'hD4;//160 [53]
        bit [7:0] rgbCoord_bl            = 8'hD8;//164 [54]
        bit [7:0] rgbCoord_bh            = 8'hDC;//220 [55]
        bit [7:0] oLumTh                 = 8'hE0;//224 [56]
        bit [7:0] oHsvPerCh              = 8'hE4;//228 [57]
        bit [7:0] oYccPerCh              = 8'hE8;//232 [58]
        bit [31:0] select_ycbcr          = 32'h0;//180
        bit [31:0] select_rgb_not_ycbcr  = 32'h1;//180
        bit [31:0] select_rgb            = 32'h5;//180
        bit [31:0] select_cgain          = 32'h0;//180
        bit [31:0] select_sharp          = 32'h1;//180
        bit [31:0] select_hsv            = 32'h4;//180
        bit [31:0] select_hsl            = 32'h3;//180
        bit [31:0] select_sobel          = 32'h6;//180
        bit [31:0] select_emboss         = 32'h7;//180
        bit [31:0] select_rgbCorrect     = 32'h2d;//180
        bit [31:0] select_rgbRemix       = 32'h2e;//180
        bit [31:0] select_rgbDetect      = 32'h2f;//180
        bit [31:0] select_rgbPoi         = 32'h30;//180
        bit [31:0] max_num_video_select  = 32'h32;//180
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_hsv);
        axi_write_channel(cChannel,15);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
        axi_write_channel(pReg_pointInterest,10);
        axi_write_channel(pReg_deltaConfig,5);
        axi_write_channel(pReg_cpuAckGoAgain,1);
        axi_write_channel(pReg_cpuWgridLock,1);
        axi_write_channel(pReg_cpuAckoffFrame,6);
        axi_write_channel(pReg_fifoReadAddress,6);
        axi_write_channel(pReg_clearFifoData,5);
        axi_write_channel(rgbCoord_rl,0);
        axi_write_channel(rgbCoord_rh,255);
        axi_write_channel(rgbCoord_gl,0);
        axi_write_channel(rgbCoord_gh,255);
        axi_write_channel(rgbCoord_bl,0);
        axi_write_channel(rgbCoord_bh,255);
        axi_write_channel(oLumTh,36);
        axi_write_channel(oHsvPerCh,0);
        axi_write_channel(oYccPerCh,0);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn        = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
    virtual protected task d5m_read ();
            d5m_camera_transaction item;
            `uvm_create(item)
            item.d5p.iImageTypeTest = 1'b0;
            item.d5m_txn        = IMAGE_READ;
            `uvm_send(item);
    endtask: d5m_read
endclass: d5m_camera_image_file_sequence
// ----------------------------------------------------------------------------------------------
// TEST : [BLUR]
// ----------------------------------------------------------------------------------------------
class axi_config_blur_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_blur_image_frame_sequence)
    function new(string name="axi_config_blur_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_blur);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_blur_image_frame_sequence
class d5m_camera_image_blur_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_blur_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_blur_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_blur_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_blur_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_blur_sequence
// ----------------------------------------------------------------------------------------------
// TEST : [EMBOSS]
// ----------------------------------------------------------------------------------------------
class axi_config_emboss_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_emboss_image_frame_sequence)
    function new(string name="axi_config_emboss_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_emboss);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_emboss_image_frame_sequence
class d5m_camera_image_emboss_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_emboss_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_emboss_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_emboss_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_emboss_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_emboss_sequence
// ----------------------------------------------------------------------------------------------
// TEST : [RGB]
// ----------------------------------------------------------------------------------------------
class axi_config_rgb_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_rgb_image_frame_sequence)
    function new(string name="axi_config_rgb_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item, s2;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_rgb);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
        d5m_camera_transaction item;

            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_rgb_image_frame_sequence
class d5m_camera_image_rgb_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_rgb_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_rgb_image_frame_sequence axi_config_seq;
   //d5m_image_random_sequence image_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_rgb_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_rgb_image_frame_sequence::type_id::create("axi_config_seq");
    //image_seq 	= d5m_image_random_sequence::type_id::create("image_seq");
 endfunction : new
 task body();
 //image_seq.start(aL_sqr);
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_rgb_sequence
// ----------------------------------------------------------------------------------------------
// TEST : [SHARP]
// ----------------------------------------------------------------------------------------------
class axi_config_sharp_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_sharp_image_frame_sequence)
    function new(string name="axi_config_sharp_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_sharp);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_sharp_image_frame_sequence
class d5m_camera_image_sharp_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_sharp_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_sharp_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_sharp_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_sharp_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_sharp_sequence
// ----------------------------------------------------------------------------------------------
// TEST : [CGAIN]
// ----------------------------------------------------------------------------------------------
class axi_config_cgain_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_cgain_image_frame_sequence)
    function new(string name="axi_config_cgain_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_cgain);
        axi_write_channel(cChannel,15);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
        axi_write_channel(pReg_pointInterest,10);
        axi_write_channel(pReg_deltaConfig,5);
        axi_write_channel(pReg_cpuAckGoAgain,1);
        axi_write_channel(pReg_cpuWgridLock,1);
        axi_write_channel(pReg_cpuAckoffFrame,6);
        axi_write_channel(pReg_fifoReadAddress,6);
        axi_write_channel(pReg_clearFifoData,5);
        axi_write_channel(rgbCoord_rl,0);
        axi_write_channel(rgbCoord_rh,255);
        axi_write_channel(rgbCoord_gl,0);
        axi_write_channel(rgbCoord_gh,255);
        axi_write_channel(rgbCoord_bl,0);
        axi_write_channel(rgbCoord_bh,255);
        axi_write_channel(oLumTh,36);
        axi_write_channel(oHsvPerCh,0);
        axi_write_channel(oYccPerCh,0);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_cgain_image_frame_sequence
class d5m_camera_image_cgain_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_cgain_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_cgain_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_cgain_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_cgain_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_cgain_sequence
// ----------------------------------------------------------------------------------------------
// TEST : [CGAIN_HSL]
// ----------------------------------------------------------------------------------------------
class axi_config_cgain_hsl_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_cgain_hsl_image_frame_sequence)
    function new(string name="axi_config_cgain_hsl_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_cgainToHsl);
        axi_write_channel(cChannel,15);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
        axi_write_channel(pReg_pointInterest,10);
        axi_write_channel(pReg_deltaConfig,5);
        axi_write_channel(pReg_cpuAckGoAgain,1);
        axi_write_channel(pReg_cpuWgridLock,1);
        axi_write_channel(pReg_cpuAckoffFrame,6);
        axi_write_channel(pReg_fifoReadAddress,6);
        axi_write_channel(pReg_clearFifoData,5);
        axi_write_channel(rgbCoord_rl,0);
        axi_write_channel(rgbCoord_rh,255);
        axi_write_channel(rgbCoord_gl,0);
        axi_write_channel(rgbCoord_gh,255);
        axi_write_channel(rgbCoord_bl,0);
        axi_write_channel(rgbCoord_bh,255);
        axi_write_channel(oLumTh,36);
        axi_write_channel(oHsvPerCh,0);
        axi_write_channel(oYccPerCh,0);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_cgain_hsl_image_frame_sequence
class d5m_camera_image_cgain_hsl_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_cgain_hsl_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_cgain_hsl_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_cgain_hsl_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_cgain_hsl_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_cgain_hsl_sequence
// ----------------------------------------------------------------------------------------------
// TEST : [SHARPTOCGAIN]
// ----------------------------------------------------------------------------------------------
class axi_config_sharp_cgain_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_sharp_cgain_image_frame_sequence)
    function new(string name="axi_config_sharp_cgain_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_SharpToCgain);
        axi_write_channel(cChannel,15);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
        axi_write_channel(pReg_pointInterest,10);
        axi_write_channel(pReg_deltaConfig,5);
        axi_write_channel(pReg_cpuAckGoAgain,1);
        axi_write_channel(pReg_cpuWgridLock,1);
        axi_write_channel(pReg_cpuAckoffFrame,6);
        axi_write_channel(pReg_fifoReadAddress,6);
        axi_write_channel(pReg_clearFifoData,5);
        axi_write_channel(rgbCoord_rl,0);
        axi_write_channel(rgbCoord_rh,255);
        axi_write_channel(rgbCoord_gl,0);
        axi_write_channel(rgbCoord_gh,255);
        axi_write_channel(rgbCoord_bl,0);
        axi_write_channel(rgbCoord_bh,255);
        axi_write_channel(oLumTh,36);
        axi_write_channel(oHsvPerCh,0);
        axi_write_channel(oYccPerCh,0);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_sharp_cgain_image_frame_sequence
class d5m_camera_image_sharp_cgain_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_sharp_cgain_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_sharp_cgain_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_sharp_cgain_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_sharp_cgain_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_sharp_cgain_sequence
// ----------------------------------------------------------------------------------------------
// TEST : [CGAINTOCGAIN]
// ----------------------------------------------------------------------------------------------
class axi_config_cgain_cgain_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_cgain_cgain_image_frame_sequence)
    function new(string name="axi_config_cgain_cgain_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_cgainToCgain);
        axi_write_channel(cChannel,15);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
        axi_write_channel(pReg_pointInterest,10);
        axi_write_channel(pReg_deltaConfig,5);
        axi_write_channel(pReg_cpuAckGoAgain,1);
        axi_write_channel(pReg_cpuWgridLock,1);
        axi_write_channel(pReg_cpuAckoffFrame,6);
        axi_write_channel(pReg_fifoReadAddress,6);
        axi_write_channel(pReg_clearFifoData,5);
        axi_write_channel(rgbCoord_rl,0);
        axi_write_channel(rgbCoord_rh,255);
        axi_write_channel(rgbCoord_gl,0);
        axi_write_channel(rgbCoord_gh,255);
        axi_write_channel(rgbCoord_bl,0);
        axi_write_channel(rgbCoord_bh,255);
        axi_write_channel(oLumTh,36);
        axi_write_channel(oHsvPerCh,0);
        axi_write_channel(oYccPerCh,0);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_cgain_cgain_image_frame_sequence
class d5m_camera_image_cgain_cgain_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_cgain_cgain_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_cgain_cgain_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_cgain_cgain_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_cgain_cgain_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_cgain_cgain_sequence

// ----------------------------------------------------------------------------------------------
// TEST : [CGAIN_HSL]
// ----------------------------------------------------------------------------------------------
class axi_config_cgain_sharp_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_cgain_sharp_image_frame_sequence)
    function new(string name="axi_config_cgain_sharp_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_cgainToSharp);
        axi_write_channel(cChannel,15);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
        axi_write_channel(pReg_pointInterest,10);
        axi_write_channel(pReg_deltaConfig,5);
        axi_write_channel(pReg_cpuAckGoAgain,1);
        axi_write_channel(pReg_cpuWgridLock,1);
        axi_write_channel(pReg_cpuAckoffFrame,6);
        axi_write_channel(pReg_fifoReadAddress,6);
        axi_write_channel(pReg_clearFifoData,5);
        axi_write_channel(rgbCoord_rl,0);
        axi_write_channel(rgbCoord_rh,255);
        axi_write_channel(rgbCoord_gl,0);
        axi_write_channel(rgbCoord_gh,255);
        axi_write_channel(rgbCoord_bl,0);
        axi_write_channel(rgbCoord_bh,255);
        axi_write_channel(oLumTh,36);
        axi_write_channel(oHsvPerCh,0);
        axi_write_channel(oYccPerCh,0);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_cgain_sharp_image_frame_sequence
class d5m_camera_image_cgain_sharp_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_cgain_sharp_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_cgain_sharp_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_cgain_sharp_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_cgain_sharp_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_cgain_sharp_sequence
// ----------------------------------------------------------------------------------------------
// TEST : [SOBEL]
// ----------------------------------------------------------------------------------------------
class axi_config_sobel_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_sobel_image_frame_sequence)
    function new(string name="axi_config_sobel_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_sobel);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_sobel_image_frame_sequence
class d5m_camera_image_sobel_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_sobel_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_sobel_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_sobel_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_sobel_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_sobel_sequence


// ----------------------------------------------------------------------------------------------
// TEST : [SOBEL_MASK_HSL]
// ----------------------------------------------------------------------------------------------
class axi_config_sobel_mask_hsl_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_sobel_mask_hsl_image_frame_sequence)
    function new(string name="axi_config_sobel_mask_hsl_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_sobel_mask_hsl);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_sobel_mask_hsl_image_frame_sequence
class d5m_camera_image_sobel_mask_hsl_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_sobel_mask_hsl_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_sobel_mask_hsl_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_sobel_mask_hsl_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_sobel_mask_hsl_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_sobel_mask_hsl_sequence



// ----------------------------------------------------------------------------------------------
// TEST : [SOBEL_MASK_RGB]
// ----------------------------------------------------------------------------------------------
class axi_config_sobel_mask_rgb_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_sobel_mask_rgb_image_frame_sequence)
    function new(string name="axi_config_sobel_mask_rgb_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_sobel_mask_rgb);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_sobel_mask_rgb_image_frame_sequence
class d5m_camera_image_sobel_mask_rgb_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_sobel_mask_rgb_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_sobel_mask_rgb_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_sobel_mask_rgb_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_sobel_mask_rgb_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_sobel_mask_rgb_sequence




// ----------------------------------------------------------------------------------------------
// TEST : [SOBEL_MASK_SHP]
// ----------------------------------------------------------------------------------------------
class axi_config_sobel_mask_shp_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_sobel_mask_shp_image_frame_sequence)
    function new(string name="axi_config_sobel_mask_shp_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_sobel_mask_shp);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_sobel_mask_shp_image_frame_sequence
class d5m_camera_image_sobel_mask_shp_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_sobel_mask_shp_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_sobel_mask_shp_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_sobel_mask_shp_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_sobel_mask_shp_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_sobel_mask_shp_sequence

// ----------------------------------------------------------------------------------------------
// TEST : [SOBEL_MASK_HSV]
// ----------------------------------------------------------------------------------------------
class axi_config_sobel_mask_hsv_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_sobel_mask_hsv_image_frame_sequence)
    function new(string name="axi_config_sobel_mask_hsv_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_sobel_mask_hsv);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_sobel_mask_hsv_image_frame_sequence
class d5m_camera_image_sobel_mask_hsv_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_sobel_mask_hsv_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_sobel_mask_hsv_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_sobel_mask_hsv_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_sobel_mask_hsv_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_sobel_mask_hsv_sequence



// ----------------------------------------------------------------------------------------------
// TEST : [SOBEL_MASK_CGA]
// ----------------------------------------------------------------------------------------------
class axi_config_sobel_mask_cga_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_sobel_mask_cga_image_frame_sequence)
    function new(string name="axi_config_sobel_mask_cga_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_sobel_mask_cga);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_sobel_mask_cga_image_frame_sequence
class d5m_camera_image_sobel_mask_cga_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_sobel_mask_cga_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_sobel_mask_cga_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_sobel_mask_cga_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_sobel_mask_cga_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_sobel_mask_cga_sequence



// ----------------------------------------------------------------------------------------------
// TEST : [SOBEL_MASK_BLU]
// ----------------------------------------------------------------------------------------------
class axi_config_sobel_mask_blu_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_sobel_mask_blu_image_frame_sequence)
    function new(string name="axi_config_sobel_mask_blu_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_sobel_mask_blu);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_sobel_mask_blu_image_frame_sequence
class d5m_camera_image_sobel_mask_blu_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_sobel_mask_blu_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_sobel_mask_blu_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_sobel_mask_blu_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_sobel_mask_blu_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_sobel_mask_blu_sequence







// ----------------------------------------------------------------------------------------------
// TEST : [HSV]
// ----------------------------------------------------------------------------------------------
class axi_config_hsv_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_hsv_image_frame_sequence)
    function new(string name="axi_config_hsv_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_hsv);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_hsv_image_frame_sequence
class d5m_camera_image_hsv_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_hsv_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_hsv_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_hsv_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_hsv_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_hsv_sequence
// ----------------------------------------------------------------------------------------------
// TEST : [HSL]
// ----------------------------------------------------------------------------------------------
class axi_config_hsl_image_frame_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(axi_config_hsl_image_frame_sequence)
    function new(string name="axi_config_hsl_image_frame_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        axi_write_config_reg();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(threshold,config_data_threshold);
        axi_write_channel(videoChannel,select_hsl);
        axi_write_channel(dChannel,select_rgb_not_ycbcr);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn                  = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_config_hsl_image_frame_sequence
class d5m_camera_image_hsl_sequence extends uvm_sequence #(uvm_sequence_item);
   `uvm_object_utils(d5m_camera_image_hsl_sequence);
   d5m_image_generator_sequence d5m_image_seq;
   axi_config_hsl_image_frame_sequence axi_config_seq;
   protected d5m_camera_sequencer aL_sqr;
   uvm_component uvm_component_h;
 function new(string name = "d5m_camera_image_hsl_sequence");
   super.new(name);
   uvm_component_h =  uvm_top.find("*aL_sqr");
   if (uvm_component_h == null)
   `uvm_fatal("RUNALL SEQUENCE", "Failed to get the d5m_camera_sequencer")
  if (!$cast(aL_sqr, uvm_component_h))
   `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
    d5m_image_seq 	= d5m_image_generator_sequence::type_id::create("d5m_image_seq");
    axi_config_seq 	= axi_config_hsl_image_frame_sequence::type_id::create("axi_config_seq");
 endfunction : new
 task body();
    axi_config_seq.start(aL_sqr);
    d5m_image_seq.start(aL_sqr);
 endtask : body
endclass : d5m_camera_image_hsl_sequence