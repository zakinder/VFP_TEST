`include "frame_en_lib0.svh"

// package: generic_pack
package generic_pack;

  `define true                               1
  `define false                              0
  `define d5m_data1x_witdh                   12
  `define axi_data1x_witdh                   15
  `define d5m_data2x_witdh                   24
  `define axi_data2x_witdh                   24

  parameter select_cgain                     = 0;
  parameter select_sharp                     = 1;
  parameter select_blur                      = 2;
  parameter select_hsl                       = 3;
  parameter select_hsv                       = 4;
  parameter select_rgb                       = 5;
  parameter select_sobel                     = 6;
  parameter select_emboss                    = 7;
  
  parameter select_cgainToCgain              = 21;
  parameter select_SharpToCgain              = 27;
  parameter select_cgainToSharp              = 25;
  
  parameter select_sobel_mask_cga            = 17;
  parameter select_sobel_mask_shp            = 12;
  parameter select_sobel_mask_blu            = 13;
  parameter select_sobel_mask_hsl            = 16;
  parameter select_sobel_mask_hsv            = 15;
  parameter select_sobel_mask_rgb            = 10;
  parameter select_cgainToHsl                = 23;
  
  
  parameter select_cgainToYcbcr              = 24;
  parameter select_rgbCorrect                = 45;
  parameter select_rgbRemix                  = 46;
  parameter select_rgbDetect                 = 47;
  parameter select_rgbPoi                    = 48;
  parameter select_y_cb_cr                   = 49;

  `ifdef cgain_v0
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgain_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = 0;
    
  `elsif sharp_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sharp_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_sharp;
  `elsif blur_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 1;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "blur_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_blur;
  `elsif hsl_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "hsl_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_hsl;
  `elsif hsv_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "hsv_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_hsv;
  `elsif rgb_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 1;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "rgb_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_rgb;
  `elsif sobel_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobel_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_sobel;
  `elsif emboss_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 1;
    parameter read_bmp                         = "emboss_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_emboss;
  `elsif cgtocg_v0
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintocgain_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_cgainToCgain;
  `elsif shtocg_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sharptocgain_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_SharpToCgain;
  `elsif cgtosh_v0
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintosharp_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_cgainToSharp;
  `elsif sbmscg_v0
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskcgain_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_sobel_mask_cga;
  `elsif sbmssh_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmasksharp_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_sobel_mask_shp;
  `elsif sbmsbl_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 1;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskblur_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_sobel_mask_blu;
  `elsif sbmshl_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskhsl_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_sobel_mask_hsl;
  `elsif sbmshv_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskhsv_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_sobel_mask_hsv;
  `elsif sbmsrb_v0
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 1;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskrgb_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_sobel_mask_rgb;
  `elsif cgtohl_v0
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintohsl_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_cgainToHsl;
  `elsif cgain_v1
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgain_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_cgain;
  `elsif sharp_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sharp_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_sharp;
  `elsif blur_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 1;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "blur_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_blur;
  `elsif hsl_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "hsl_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_hsl;
  `elsif hsv_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "hsv_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_hsv;
  `elsif rgb_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 1;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "rgb_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_rgb;
  `elsif sobel_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobel_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_sobel;
  `elsif emboss_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 1;
    parameter read_bmp                         = "emboss_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_emboss;
  `elsif cgtocg_v1
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintocgain_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_cgainToCgain;
  `elsif shtocg_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sharptocgain_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_SharpToCgain;
  `elsif cgtosh_v1
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintosharp_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_cgainToSharp;
  `elsif sbmscg_v1
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskcgain_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_sobel_mask_cga;
  `elsif sbmssh_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmasksharp_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_sobel_mask_shp;
  `elsif sbmsbl_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 1;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskblur_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_sobel_mask_blu;
  `elsif sbmshl_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskhsl_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_sobel_mask_hsl;
  `elsif sbmshv_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskhsv_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_sobel_mask_hsv;
  `elsif sbmsrb_v1
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 1;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskrgb_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_sobel_mask_rgb;
  `elsif cgtohl_v1
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintohsl_v1";
    parameter img_width_bmp                    = 128;
    parameter img_height_bmp                   = 128;
    parameter selected_video_channel           = select_cgainToHsl;
  `elsif cgain_v2
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgain_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_cgain;
  `elsif sharp_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sharp_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_sharp;
  `elsif blur_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 1;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "blur_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_blur;
  `elsif hsl_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "hsl_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_hsl;
  `elsif hsv_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "hsv_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_hsv;
  `elsif rgb_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 1;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "rgb_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_rgb;
  `elsif sobel_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobel_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_sobel;
  `elsif emboss_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 1;
    parameter read_bmp                         = "emboss_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_emboss;
  `elsif cgtocg_v2
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintocgain_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_cgainToCgain;
  `elsif shtocg_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sharptocgain_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_SharpToCgain;
  `elsif cgtosh_v2
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintosharp_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_cgainToSharp;
    //------------------------------------------------------------------
  `elsif sbmscg_v2
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskcgain_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_sobel_mask_cga;
  `elsif sbmssh_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmasksharp_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_sobel_mask_shp;
  `elsif sbmsbl_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 1;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskblur_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_sobel_mask_blu;
  `elsif sbmshl_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskhsl_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_sobel_mask_hsl;
  `elsif sbmshv_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskhsv_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_sobel_mask_hsv;
  `elsif sbmsrb_v2
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 1;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskrgb_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_sobel_mask_rgb;
    //------------------------------------------------------------------
  `elsif cgtohl_v2
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintohsl_v2";
    parameter img_width_bmp                    = 400;
    parameter img_height_bmp                   = 300;
    parameter selected_video_channel           = select_cgainToHsl;
  `elsif cgain_v3
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgain_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_cgain;
  `elsif sharp_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sharp_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_sharp;
  `elsif blur_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 1;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "blur_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_blur;
  `elsif hsl_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "hsl_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_hsl;
  `elsif hsv_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "hsv_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_hsv;
  `elsif rgb_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 1;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "rgb_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_rgb;
  `elsif sobel_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobel_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_sobel;
  `elsif emboss_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 1;
    parameter read_bmp                         = "emboss_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_emboss;
  `elsif cgtocg_v3
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintocgain_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_cgainToCgain;
  `elsif shtocg_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sharptocgain_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_SharpToCgain;
  `elsif cgtosh_v3
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintosharp_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_cgainToSharp;
  `elsif sbmscg_v3
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskcgain_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_sobel_mask_cga;
  `elsif sbmssh_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 1;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmasksharp_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_sobel_mask_shp;
  `elsif sbmsbl_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 1;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskblur_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_sobel_mask_blu;
  `elsif sbmshl_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskhsl_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_sobel_mask_hsl;
  `elsif sbmshv_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskhsv_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_sobel_mask_hsv;
  `elsif sbmsrb_v3
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 1;
    parameter F_SOB                            = 1;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "sobelmaskrgb_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_sobel_mask_rgb;
  `elsif cgtohl_v3
    parameter F_CGA                            = 1;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 1;
    parameter F_HSV                            = 1;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgaintohsl_v3";
    parameter img_width_bmp                    = 1920;
    parameter img_height_bmp                   = 1080;
    parameter selected_video_channel           = select_cgainToHsl;
  `else
    parameter F_CGA                            = 0;
    parameter F_SHP                            = 0;
    parameter F_BLU                            = 0;
    parameter F_HSL                            = 0;
    parameter F_HSV                            = 0;
    parameter F_RGB                            = 0;
    parameter F_SOB                            = 0;
    parameter F_EMB                            = 0;
    parameter read_bmp                         = "cgain_v0";
    parameter img_width_bmp                    = 64;
    parameter img_height_bmp                   = 64;
    parameter selected_video_channel           = select_cgain;
  `endif
  
  
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
    parameter img_width                        = 2751; //D5M max supported img_width = 2751
    parameter dataWidth                        = 24;   //12;
    parameter F_TES                            = `false;
    parameter F_LUM                            = `false;
    parameter F_TRM                            = `false;
    parameter F_YCC                            = `false;
    parameter img_frames_cnt_bmp               = 1;
    parameter frame_width                      = 100;
    parameter lvalid_offset                    = 10;
    parameter frame_height                     = 5;
    parameter num_frames                       = 1;
    parameter initAddr                         = 8'h00;//0   [15]  
    parameter oRgbOsharp                       = 8'h00;//0   [15]         
    parameter oEdgeType                        = 8'h04;//4   [15]        
    parameter aBusSelect                       = 8'h0C;//12  [15]           
    parameter threshold                        = 8'h10;//16  [15]          
    parameter videoChannel                     = 8'h14;//20  [15]         
    parameter dChannel                         = 8'h18;//24  [15]        
    parameter cChannel                         = 8'h1C;//28  [15]          
    parameter kls_k1                           = 8'h20;//32  [15]
    parameter kls_k2                           = 8'h24;//36  [15]
    parameter kls_k3                           = 8'h28;//40  [15]
    parameter kls_k4                           = 8'h2C;//44  [15]
    parameter kls_k5                           = 8'h30;//48  [15]
    parameter kls_k6                           = 8'h34;//52  [15]
    parameter kls_k7                           = 8'h38;//56  [15]
    parameter kls_k8                           = 8'h3C;//60  [15]
    parameter kls_k9                           = 8'h40;//64  [15]
    parameter kls_config                       = 8'h44;//68  [15]
    parameter als_k1                           = 8'h54;//84  [21]
    parameter als_k2                           = 8'h58;//88  [22]
    parameter als_k3                           = 8'h5C;//92  [23]
    parameter als_k4                           = 8'h60;//96  [24]
    parameter als_k5                           = 8'h64;//100 [25]
    parameter als_k6                           = 8'h68;//104 [26]
    parameter als_k7                           = 8'h6C;//108 [27]
    parameter als_k8                           = 8'h70;//112 [28]
    parameter als_k9                           = 8'h74;//116 [29]
    parameter als_config                       = 8'h78;//120 [30]
    parameter pReg_pointInterest               = 8'h7C;//124 [31]
    parameter pReg_deltaConfig                 = 8'h80;//128 [32]
    parameter pReg_cpuAckGoAgain               = 8'h84;//132 [33]
    parameter pReg_cpuWgridLock                = 8'h88;//136 [34]
    parameter pReg_cpuAckoffFrame              = 8'h8C;//140 [35]
    parameter pReg_fifoReadAddress             = 8'h90;//144 [36] // pReg_fifoReadEnable --fifo read enable
    parameter pReg_clearFifoData               = 8'h94;//148 [37]
    parameter rgbCoord_rl                      = 8'hC8;//200 [50]
    parameter rgbCoord_rh                      = 8'hCC;//204  [51]
    parameter rgbCoord_gl                      = 8'hD0;//208 [52]
    parameter rgbCoord_gh                      = 8'hD4;//212 [53]
    parameter rgbCoord_bl                      = 8'hD8;//216 [54]
    parameter rgbCoord_bh                      = 8'hDC;//220 [55]
    parameter oLumTh                           = 8'hE0;//224 [56]
    parameter oHsvPerCh                        = 8'hE4;//228 [57]
    parameter oYccPerCh                        = 8'hE8;//232 [58]
    parameter kCoefDisabIndex                  = 8'h00;//84  [15]
    parameter kCoefYcbcrIndex                  = 8'h01;//84  [15]
    parameter kCoefCgainIndex                  = 8'h02;//84  [15]
    parameter kCoefSharpIndex                  = 8'h03;//84  [15]
    parameter kCoefBlureIndex                  = 8'h04;//84  [15]
    parameter kCoefSobeXIndex                  = 8'h05;//84  [15]
    parameter kCoefSobeYIndex                  = 8'h06;//84  [15]
    parameter kCoefEmbosIndex                  = 8'h07;//84  [19]
    parameter kCoefCgai1Index                  = 8'h08;//84  [20]
    parameter max_num_video_select             = 32'h32;//180
    parameter config_data_oRgbOsharp           = 10;
    parameter config_data_oEdgeType            = 11;
    parameter config_data_aBusSelect           = 0;
    parameter config_data_threshold            = 20;
    parameter select_ycbcr                     = 0;
    parameter select_rgb_not_ycbcr             = 1;
    parameter en_ycbcr                         = 0;
    parameter en_rgb                           = 1;
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
    parameter fval_h                           = 1'b1;
    parameter fval_l                           = 1'b0;
    parameter lval_h                           = 1'b1;
    parameter lval_l                           = 1'b0;
    parameter ImTyTest_en_patten               = 1'b1;//1 internal pattern , 0 from image file
    parameter rImage_disable                   = 1'b0;// if ImTyTest set 1 then set this variable 0 otherwise used for when to read image file when write image module is ready upon clear.
    parameter time_out                         = 62;
    parameter low                              = 0;
    parameter high                             = 1;
typedef struct packed {
    bit         clkmm;
    bit       valid;
    bit [7:0] red;
    bit [7:0] green;
    bit [7:0] blue;
    bit       sim_done;
    bit       completed_resolution_line;
    bit       completed_resolution;
    bit       completed_resolution_line_64;
    bit       completed_resolution_line_128;
    bit       completed_resolution_line_400;
    bit       completed_resolution_line_1920;
    bit       completed_resolution64_64;
    bit       completed_resolution128_128;
    bit       completed_resolution_400_300;
    bit       completed_resolution_1920_1080;
    reg [15:0]  x_coord;
    reg [15:0]  y_coord;
    reg [15:0]  detect;
    reg         increment_row;
} vfp_channels;

typedef struct packed {
    bit          clkmm;
    bit        valid;
    bit        lvalid;
    bit        fvalid;
    bit        eof;
    bit        sof;
    bit [7:0]  red;
    bit [7:0]  green;
    bit [7:0]  blue;
    bit [23:0] rgb;
    bit [11:0] x;
    bit [11:0] y;
} rgb_channel;

typedef struct packed {
    int          image_width;
    int          lval_offset;
    int          lval_lines;
    int          number_frames;
    bit [7:0]  red;
    bit [7:0]  green;
    bit [7:0]  blue;
    bit [11:0] x;
    bit [11:0] y;
} cof_channel;

typedef struct packed {
    bit [15:0]   addr;
    bit [31:0]   data;
} axi4_lite_channel;



typedef struct packed {
    bit          clkmm;
    bit        iReadyToRead;
    bit        iImageTypeTest;
    bit        valid;
    bit        lvalid;
    bit        fvalid;
    bit        eof;
    bit        sof;
    bit [23:0] rgb;
    bit [11:0] x;
    bit [11:0] y;
} pattern_channel;

//typedef struct packed {
//    int rgb_sharp;
//    int edge_type;
//    int config_threshold;
//    int video_channel;
//    int c_channel;
//    int en_ycbcr_or_rgb;
//    int point_interest;
//    int delta_config;
//    int cpu_ack_go_again;
//    int cpu_wgrid_lock;
//    int cpu_ack_off_frame;
//    int fifo_read_address;
//    int clear_fifo_data;
//    int rgb_cord_rl;
//    int rgb_cord_rh;
//    int rgb_cord_gl;
//    int rgb_cord_gh;
//    int rgb_cord_bl;
//    int rgb_cord_bh;
//    int lum_th;
//    int hsv_per_ch;
//    int ycc_per_ch;
//} vfp_config;

typedef struct packed {
    bit [7:0]         AWADDR;
    bit [ 2:0]        AWPROT;
    bit               AWVALID;
    bit               AWREADY;
    bit [31:0]        WDATA;
    bit [ 3:0]        WSTRB;
    bit               WVALID;
    bit               WREADY;
    bit [1:0]         BRESP;
    bit               BVALID;
    bit               BREADY;
    bit [7:0]         ARADDR;
    bit [ 2:0]        ARPROT;
    bit               ARVALID;
    bit               ARREADY;
    bit [31:0]        RDATA;
    bit [ 1:0]        RRESP;
    bit               RVALID;
    bit               RREADY;
} vfp_axi4;

typedef struct packed {
    bit               tready;
    bit               tvalid;
    bit               tuser;
    bit               tlast;
    bit [23:0]        tdata;
    bit [2:0]         tkeep;
    bit [2:0]         tstrb;
    bit [0:0]         tid;
    bit [0:0]         tdest;
} vfp_axi_stream;
/* typedef: vfp_regs
   REG_00    - Causes the counter to only increment in odd numbers.
   REG_01     - Causes the counter to only increment in even numbers.
*/
typedef struct packed {
  bit [31:0] REG_00;
  bit [31:0] REG_01;
  bit [31:0] REG_02;
  bit [31:0] REG_03;
  bit [31:0] REG_04;
  bit [31:0] REG_05;
  bit [31:0] REG_06;
  bit [31:0] REG_07;
  bit [31:0] REG_08;
  bit [31:0] REG_09;
  bit [31:0] REG_10;
  bit [31:0] REG_11;
  bit [31:0] REG_12;
  bit [31:0] REG_13;
  bit [31:0] REG_14;
  bit [31:0] REG_15;
  bit [31:0] REG_16;
  bit [31:0] REG_17;
  bit [31:0] REG_18;
  bit [31:0] REG_19;
  bit [31:0] REG_20;
  bit [31:0] REG_21;
  bit [31:0] REG_22;
  bit [31:0] REG_23;
  bit [31:0] REG_24;
  bit [31:0] REG_25;
  bit [31:0] REG_26;
  bit [31:0] REG_27;
  bit [31:0] REG_28;
  bit [31:0] REG_29;
  bit [31:0] REG_30;
  bit [31:0] REG_31;
  bit [31:0] REG_32;
  bit [31:0] REG_33;
  bit [31:0] REG_34;
  bit [31:0] REG_35;
  bit [31:0] REG_36;
  bit [31:0] REG_37;
  bit [31:0] REG_38;
  bit [31:0] REG_39;
  bit [31:0] REG_40;
  bit [31:0] REG_41;
  bit [31:0] REG_42;
  bit [31:0] REG_43;
  bit [31:0] REG_44;
  bit [31:0] REG_45;
  bit [31:0] REG_46;
  bit [31:0] REG_47;
  bit [31:0] REG_48;
  bit [31:0] REG_49;
  bit [31:0] REG_50;
  bit [31:0] REG_51;
  bit [31:0] REG_52;
  bit [31:0] REG_53;
  bit [31:0] REG_54;
  bit [31:0] REG_55;
  bit [31:0] REG_56;
  bit [31:0] REG_57;
  bit [31:0] REG_58;
  bit [31:0] REG_59;
  bit [31:0] REG_60;
  bit [31:0] REG_61;
  bit [31:0] REG_62;
  bit [31:0] REG_63;
} vfp_regs;
/* Enum: e_bool
   FALSE    - Causes the counter to only increment in odd numbers.
   TRUE     - Causes the counter to only increment in even numbers.
*/
typedef enum {FALSE, TRUE} e_bool;

/* Enum: sys_cmd_enum
   FALSE    - Causes the counter to only increment in odd numbers.
   TRUE     - Causes the counter to only increment in even numbers.
*/
typedef enum{
  SYS_READ,
  SYS_WRITE
} sys_cmd_enum;
/* Enum: sys_master_enum
   FALSE    - Causes the counter to only increment in odd numbers.
   TRUE     - Causes the counter to only increment in even numbers.
*/
typedef enum{
  MST_UNDEF,
  MST_A,
  MST_B,
  MST_C
}sys_master_enum;
/* Enum: sys_slave_enum
   FALSE    - Causes the counter to only increment in odd numbers.
   TRUE     - Causes the counter to only increment in even numbers.
*/
typedef enum{
  SLV_UNDEF,
  SLV_X,
  SLV_Y,
  SLV_Z
}sys_slave_enum;
/* Enum: cell_set
   rgb_incrementer    - Causes the counter to only increment in odd numbers.
   rgb_000_000_black     - Causes the counter to only increment in even numbers.
*/
typedef enum {
  rgb_incrementer, 
  sun, 
  mon, 
  wed, 
  thu, 
  fri, 
  sat, 
  red1, 
  red2, 
  red3, 
  red4,
  rgb_000_000_black,
  rgb_001_050_dark,
  rgb_051_100_med_dark,
  rgb_101_150_medium,
  rgb_151_200_med_light,
  rgb_201_255_light,
  rgb_255_255_white
} cell_set;

parameter set_increment_value   = 87;

parameter set_cell_red_value    = 45; 
parameter set_cell_gre_value    = 30;
parameter set_cell_blu_value    = 20;

parameter offset_r              = 30;
parameter offset_g              = 5;
parameter offset_b              = 3;

`define AX_TYPE_MASK 6'h38

parameter DATA_BYTES = 16;
/* Enum: channels
   rgb_incrementer    - Causes the counter to only increment in odd numbers.
   rgb_000_000_black     - Causes the counter to only increment in even numbers.
*/
typedef struct packed {
bit valid;
bit [7:0] red;
bit [7:0] green;
bit [7:0] blue;
} channels;
/* Enum: width_confg1_t
   rgb_incrementer    - Causes the counter to only increment in odd numbers.
   rgb_000_000_black     - Causes the counter to only increment in even numbers.
*/
typedef struct packed {
   byte unsigned addr_width;
   byte unsigned data_width;
} width_confg1_t;
/* Enum: width_confg1_t
   rgb_incrementer    - Causes the counter to only increment in odd numbers.
   rgb_000_000_black     - Causes the counter to only increment in even numbers.
*/
typedef struct packed {
   int unsigned payload_length;
} width_confg2_t;

typedef struct packed {
   width_confg1_t w_p1;
   width_confg2_t w_p2;
} set_config;

typedef struct {
    bit [7:0] address;
    bit [15:0] data;
  } packet_t;
  
typedef struct {
    bit [3:0] high_nibble;
    bit [3:0] low_nibble;
    bit [4:0] id;
  } layer1_t;
 
  typedef struct {
    bit [3:0] address;
    bit [3:0] data;
    bit [4:0] id;
  } frame_t;
  
  
typedef enum { READ, WRITE } axi_lite_txn_e;
typedef enum { AXI4_READ, AXI4_WRITE, D5M_WRITE, IMAGE_READ } d5m_txn_e;

parameter set_config par_1 = '{ '{ addr_width: 11, data_width: 8 }, '{ payload_length: 2 } };
parameter set_config par_2 = '{ '{ addr_width: 11, data_width: 8 }, '{ payload_length: 4 } };
parameter set_config par_3 = '{ '{ addr_width: 11, data_width: 8 }, '{ payload_length: 3 } };

typedef enum bit [5:0] {
    AX_FLOW_TYPE                = 6'h00,
    AX_WRITE_TYPE               = 6'h08,
    AX_MISC_WRITE_TYPE          = 6'h10,
    AX_POSTED_WRITE_TYPE        = 6'h18,
    AX_POSTED_MISC_WRITE_TYPE   = 6'h20,
    AX_MODE_READ_TYPE           = 6'h28,
    AX_READ_TYPE                = 6'h30,
    AX_RESPONSE_TYPE            = 6'h38
} ax_command_type;

typedef enum bit [5:0] {
    AX_NULL                     = 6'h00,
    AX_PRET                     = 6'h01,
    AX_TRET                     = 6'h02,
    AX_IRTRY                    = 6'h03,
    AX_WRITE_16                 = 6'h08,
    AX_WRITE_32                 = 6'h09,
    AX_WRITE_48                 = 6'h0a,
    AX_WRITE_64                 = 6'h0b,
    AX_WRITE_80                 = 6'h0c,
    AX_WRITE_96                 = 6'h0d,
    AX_WRITE_112                = 6'h0e,
    AX_WRITE_128                = 6'h0f,
    //-- misc write
    AX_MODE_WRITE               = 6'h10,
    AX_BIT_WRITE                = 6'h11,
    AX_DUAL_8B_ADDI             = 6'h12,
    AX_SINGLE_16B_ADDI          = 6'h13,
    AX_POSTED_WRITE_16          = 6'h18,
    AX_POSTED_WRITE_32          = 6'h19,
    AX_POSTED_WRITE_48          = 6'h1a,
    AX_POSTED_WRITE_64          = 6'h1b,
    AX_POSTED_WRITE_80          = 6'h1c,
    AX_POSTED_WRITE_96          = 6'h1d,
    AX_POSTED_WRITE_112         = 6'h1e,
    AX_POSTED_WRITE_128         = 6'h1f,
    AX_POSTED_BIT_WRIT          = 6'h21,
    AX_POSTED_DUAL_8B_ADDI      = 6'h22,
    AX_POSTED_SINGLE_16B_ADDI   = 6'h23,
    AX_MODE_READ                = 6'h28,
    AX_READ_16                  = 6'h30,
    AX_READ_32                  = 6'h31,
    AX_READ_48                  = 6'h32,
    AX_READ_64                  = 6'h33,
    AX_READ_80                  = 6'h34,
    AX_READ_96                  = 6'h35,
    AX_READ_112                 = 6'h36,
    AX_READ_128                 = 6'h37,
    AX_READ_RESPONSE            = 6'h38,
    AX_WRITE_RESPONSE           = 6'h39,
    AX_MODE_READ_RESPONSE       = 6'h3A,
    AX_MODE_WRITE_RESPONSE      = 6'h3B,
    AX_ERROR_RESPONSE           = 6'h3E
} ax_command_encoding;
endpackage                