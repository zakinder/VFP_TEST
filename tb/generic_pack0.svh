`include "frame_en_lib0.svh"
package generic_pack;
  `define true                               1
  `define false                              0
  `define d5m_data1x_witdh                   12
  `define axi_data1x_witdh                   15
  `define d5m_data2x_witdh                   24
  `define axi_data2x_witdh                   24
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
    parameter select_sobel_mask_rgb            = 10;
    parameter select_sobel_mask_shp            = 12;
    parameter select_sobel_mask_blu            = 13;
    parameter select_sobel_mask_hsv            = 15;
    parameter select_sobel_mask_hsl            = 16;
    parameter select_sobel_mask_cga            = 17;
    parameter select_cgainToCgain              = 21;
    parameter select_cgainToHsl                = 23;
    parameter select_cgainToYcbcr              = 24;
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
    logic       completed_resolution_line;
    logic       completed_resolution;
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