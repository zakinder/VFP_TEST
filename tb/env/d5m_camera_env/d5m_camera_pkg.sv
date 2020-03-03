  `include "../../generic_pack0.svh"
  `include "../../vfp_structs.svh"
  `include "../../image_kernal_coefs.svh"
  `include "../../agents/d5m_agent/d5m_camera_agent_pkg.sv"

package d5m_camera_pkg;
  import d5m_camera_agent_pkg::*;
  import uvm_pkg::*;
  import generic_pack::*;
  `include "uvm_macros.svh"
  `include "../../defin_lib.svh"
  `include "../../config/sb_subscriber.svh"
  `include "../../config/rgb_scoreboard.svh"

  `include "d5m_camera_env.sv"
  `include "../../test/d5m_camera/d5m_camera_test.sv"
  `include "../../test/d5m_camera/d5m_camera_image_pattern_test.sv"
  `include "../../test/d5m_camera/d5m_rgb_patten_test.sv"
  `include "../../test/d5m_camera/img_test.sv"
  `include "../../test/d5m_camera/img_sharp_test.sv"
  `include "../../test/d5m_camera/img_cgain_test.sv"
  `include "../../test/d5m_camera/img_cgain_hsl_test.sv"
  `include "../../test/d5m_camera/img_cgain_sharp_test.sv"
  `include "../../test/d5m_camera/img_sharp_cgain_test.sv"
  `include "../../test/d5m_camera/img_cgain_cgain_test.sv"
  `include "../../test/d5m_camera/img_sobel_mask_hsl_test.sv"
  `include "../../test/d5m_camera/img_sobel_mask_blu_test.sv"
  `include "../../test/d5m_camera/img_sobel_mask_cga_test.sv"
  `include "../../test/d5m_camera/img_sobel_mask_hsv_test.sv"
  `include "../../test/d5m_camera/img_sobel_mask_rgb_test.sv"
  `include "../../test/d5m_camera/img_sobel_mask_shp_test.sv"
  `include "../../test/d5m_camera/img_blur_test.sv"
  `include "../../test/d5m_camera/img_emboss_test.sv"
  `include "../../test/d5m_camera/img_sobel_test.sv"
  `include "../../test/d5m_camera/img_rgb_test.sv"
  `include "../../test/d5m_camera/img_hsl_test.sv"
  `include "../../test/d5m_camera/img_hsv_test.sv"
endpackage:d5m_camera_pkg
