package generic_pack;                
    `define true 1                
    `define false 0                
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
    parameter img_width                 = 2751;//D5M max supported img_width = 2751                
    parameter dataWidth                 = 24;//12;                
    parameter read_bmp                  = "emboss_v2";//400_300//400_400   
    parameter img_width_bmp             = 400;//400//400     1920           
    parameter img_height_bmp            = 300;//300//400    1080             
    parameter img_frames_cnt_bmp        = 1;
    
typedef struct packed {
    logic valid;
    logic [7:0] red;
    logic [7:0] green;
    logic [7:0] blue;
    logic sim_done;
    logic completed_resolution_line_128;
    logic completed_resolution_line_400;
    logic completed_resolution_line_1920;
    logic completed_resolution128_128;
    logic completed_resolution_400_300;
    reg [15:0] x_coord;
    reg [15:0] y_coord;
    reg increment_row;
} vfp_channels;
typedef struct packed {
    logic valid;
    logic [7:0] red;
    logic [7:0] green;
    logic [7:0] blue;
    logic sim_done;
    logic completed_resolution_line_128;
    logic completed_resolution_line_400;
    logic completed_resolution_line_1920;
    logic completed_resolution128_128;
    logic completed_resolution_400_300;
    reg [15:0] x_coord;
    reg [15:0] y_coord;
    reg [15:0] detect;
    reg increment_row;
} d5m_channels;
endpackage                
