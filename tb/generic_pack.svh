package generic_pack;
    `define true                          1
    `define false                         0
    `define d5m_data1x_witdh              12
    `define axi_data1x_witdh              15
    `define d5m_data2x_witdh              24
    `define axi_data2x_witdh              24
    parameter revision_number                  = 32'h09072019;
    parameter C_rgb_m_axis_TDATA_WIDTH         = 24;//16;
    parameter C_rgb_m_axis_START_COUNT         = 32;
    parameter C_rgb_s_axis_TDATA_WIDTH         = 24;//16;
    parameter C_m_axis_mm2s_TDATA_WIDTH        = 24;//16;
    parameter C_m_axis_mm2s_START_COUNT        = 32;
    parameter C_vfpConfig_DATA_WIDTH           = 32;
    parameter C_vfpConfig_ADDR_WIDTH           = 8;
    parameter conf_data_width                  = 32;
    parameter conf_addr_width                  = 8;
    parameter i_data_width                     = 8;
    parameter s_data_width                     = 24;//16;
    parameter b_data_width                     = 32;
    parameter i_precision                      = 12;
    parameter i_full_range                     = `false;
    parameter img_width                        = 2751;       //D5M max supported img_width = 2751
    parameter dataWidth                        = 24;         //12;                
    parameter read_bmp                         = "sharp_v2"; //128_128 //400_300 //1920_1080
    parameter img_width_bmp                    = 400;      //64  //128     //400       1920
    parameter img_height_bmp                   = 300;      //64  //128     //300       1080
    parameter img_frames_cnt_bmp               = 1;
    parameter frame_width                      = 100;
    parameter lvalid_offset                    = 10;
    parameter frame_height                     = 5;
    parameter num_frames                       = 1;
    parameter initAddr                         = 16'h00;//0   [15]  
    parameter oRgbOsharp                       = 16'h00;//0   [15]         
    parameter oEdgeType                        = 16'h04;//4   [15]        
    parameter aBusSelect                       = 16'h0C;//12  [15]           
    parameter threshold                        = 16'h10;//16  [15]          
    parameter videoChannel                     = 16'h14;//20  [15]         
    parameter dChannel                         = 16'h18;//24  [15]        
    parameter cChannel                         = 16'h1C;//28  [15]          
    parameter pReg_pointInterest               = 16'h7C;//124 [31]
    parameter pReg_deltaConfig                 = 16'h80;//128 [32]
    parameter pReg_cpuAckGoAgain               = 16'h84;//132 [33]
    parameter pReg_cpuWgridLock                = 16'h88;//136 [34]
    parameter pReg_cpuAckoffFrame              = 16'h8C;//140 [35]
    parameter pReg_fifoReadAddress             = 16'h90;//144 [36] // pReg_fifoReadEnable --fifo read enable
    parameter pReg_clearFifoData               = 16'h94;//148 [37]
    parameter rgbCoord_rl                      = 16'hC8;//200 [50]
    parameter rgbCoord_rh                      = 16'hCC;//204  [51]
    parameter rgbCoord_gl                      = 16'hD0;//208 [52]
    parameter rgbCoord_gh                      = 16'hD4;//212 [53]
    parameter rgbCoord_bl                      = 16'hD8;//216 [54]
    parameter rgbCoord_bh                      = 16'hDC;//220 [55]
    parameter oLumTh                           = 16'hE0;//224 [56]
    parameter oHsvPerCh                        = 16'hE4;//228 [57]
    parameter oYccPerCh                        = 16'hE8;//232 [58]
    parameter config_data_oRgbOsharp           = 10;
    parameter config_data_oEdgeType            = 11;
    parameter config_data_aBusSelect           = 0;
    parameter config_data_threshold            = 20;
    parameter select_ycbcr                     = 0;
    parameter select_rgb_not_ycbcr             = 1;
    parameter select_cgain                     = 0;
    parameter select_sharp                     = 1;
    parameter select_blur                      = 2;
    parameter select_hsl                       = 3;
    parameter select_hsv                       = 4;
    parameter select_rgb                       = 5;
    parameter select_sobel                     = 6;
    parameter select_emboss                    = 7;
    parameter select_cgainToHsl                = 22;
    parameter select_cgainToSharp              = 25;
    parameter select_SharpToCgain              = 27;
    parameter select_rgbCorrect                = 45;
    parameter select_rgbRemix                  = 46;
    parameter select_rgbDetect                 = 47;
    parameter select_rgbPoi                    = 48;
    parameter config_data_cChannel             = 15;
    parameter config_data_pReg_pointInterest   = 10;
    parameter config_data_pReg_deltaConfig     = 5;
    parameter config_data_pReg_cpuAckGoAgain   = 1;
    parameter config_data_pReg_cpuWgridLock    = 1;
    parameter config_data_pReg_cpuAckoffFrame  = 6;
    parameter config_data_pReg_fifoReadAddress = 6;
    parameter config_data_pReg_clearFifoData   = 5;
    parameter config_data_rgbCoord_rl          = 0;
    parameter config_data_rgbCoord_rh          = 255;
    parameter config_data_rgbCoord_gl          = 0;
    parameter config_data_rgbCoord_gh          = 255;
    parameter config_data_rgbCoord_bl          = 0;
    parameter config_data_rgbCoord_bh          = 255;
    parameter config_data_oLumTh               = 36;
    parameter config_data_oHsvPerCh            = 0;
    parameter config_data_oYccPerCh            = 0;
typedef struct packed {
    bit         clkmm;
    logic       valid;
    logic [7:0] red;
    logic [7:0] green;
    logic [7:0] blue;
    logic       sim_done;
    logic       completed_resolution_line_64;
    logic       completed_resolution_line_128;
    logic       completed_resolution_line_400;
    logic       completed_resolution_line_1920;
    logic       completed_resolution64_64;
    logic       completed_resolution128_128;
    logic       completed_resolution_400_300;
    logic       completed_resolution_1920_1080;
    reg [15:0]  x_coord;
    reg [15:0]  y_coord;
    reg [15:0]  detect;
    reg         increment_row;
} vfp_channels;
typedef struct packed {
    bit          clkmm;
    logic        valid;
    logic        lvalid;
    logic        fvalid;
    logic        eof;
    logic        sof;
    logic [7:0]  red;
    logic [7:0]  green;
    logic [7:0]  blue;
    logic [23:0] rgb;
    logic [11:0] x;
    logic [11:0] y;
} rgb_channel;
typedef struct packed {
    int          image_width;
    int          lval_offset;
    int          lval_lines;
    int          number_frames;
    logic [7:0]  red;
    logic [7:0]  green;
    logic [7:0]  blue;
    logic [11:0] x;
    logic [11:0] y;
} cof_channel;
typedef struct packed {
    bit [15:0]   addr;
    bit [31:0]   data;
} axi4_lite_channel;
typedef struct packed {
    bit [15:0]   addr;
    bit [31:0]   data;
} d5m_interconnect;
typedef struct packed {
    bit          clkmm;
    logic        iReadyToRead;
    logic        iImageTypeTest;
    logic        valid;
    logic        lvalid;
    logic        fvalid;
    logic        eof;
    logic        sof;
    logic [23:0] rgb;
    logic [11:0] x;
    logic [11:0] y;
} pattern_channel;
endpackage                
