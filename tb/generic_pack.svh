package generic_pack;
    `define true                          1
    `define false                         0
    `define d5m_data1x_witdh              12
    `define axi_data1x_witdh              15
    `define d5m_data2x_witdh              24
    `define axi_data2x_witdh              24
    parameter revision_number           = 32'h09072019;
    parameter C_rgb_m_axis_TDATA_WIDTH  = 24;//16;
    parameter C_rgb_m_axis_START_COUNT  = 32;
    parameter C_rgb_s_axis_TDATA_WIDTH  = 24;//16;
    parameter C_m_axis_mm2s_TDATA_WIDTH = 24;//16;
    parameter C_m_axis_mm2s_START_COUNT = 32;
    parameter C_vfpConfig_DATA_WIDTH    = 32;
    parameter C_vfpConfig_ADDR_WIDTH    = 8;
    parameter conf_data_width           = 32;
    parameter conf_addr_width           = 8;
    parameter i_data_width              = 8;
    parameter s_data_width              = 24;//16;
    parameter b_data_width              = 32;
    parameter i_precision               = 12;
    parameter i_full_range              = `false;
    parameter img_width                 = 2751;       //D5M max supported img_width = 2751
    parameter dataWidth                 = 24;         //12;                
    parameter read_bmp                  = "sharp_v3"; //128_128 //400_300 //1920_1080
    parameter img_width_bmp             = 1920;       //128     //400       1920
    parameter img_height_bmp            = 1080;       //128     //300       1080
    parameter img_frames_cnt_bmp        = 1;
    parameter frame_width               = 100;
    parameter lvalid_offset             = 10;
    parameter frame_height              = 5;
    parameter num_frames                = 1;
    
typedef struct packed {
    logic       valid;
    logic [7:0] red;
    logic [7:0] green;
    logic [7:0] blue;
    logic       sim_done;
    logic       completed_resolution_line_128;
    logic       completed_resolution_line_400;
    logic       completed_resolution_line_1920;
    logic       completed_resolution128_128;
    logic       completed_resolution_400_300;
    logic       completed_resolution_1920_1080;
    reg [15:0]  x_coord;
    reg [15:0]  y_coord;
    reg [15:0]  detect;
    reg         increment_row;
} vfp_channels;
typedef struct packed {
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
