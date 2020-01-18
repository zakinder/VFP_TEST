package d5m_camera_agent_pkg;
  import uvm_pkg::*;
  import generic_pack::*;
  `include "uvm_macros.svh"
  `include "../defin_lib.svh"
  `include "transaction/d5m_camera_transaction.svh"
  
  `include "sequence/d5m_camera_seqs/d5m_camera_sequencer.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_base_seq.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_image_generator_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_image_random_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_file_sequence.svh"

  `include "sequence/d5m_camera_seqs/axi_config_image_frame_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_cgain_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_sharp_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_blur_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_hsv_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_hsl_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_emboss_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_rgb_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_cgain_hsl_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_sharp_cgain_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_cgain_cgain_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_cgain_sharp_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_sobel_sequence.svh"
  
  
  `include "sequence/d5m_camera_seqs/d5m_camera_image_sobel_mask_rgb_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_sobel_mask_hsl_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_sobel_mask_shp_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_sobel_mask_hsv_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_sobel_mask_cga_sequence.svh"
  `include "sequence/d5m_camera_seqs/d5m_camera_image_sobel_mask_blu_sequence.svh"

  `include "sequence/d5m_camera_seqs/d5m_camera_image_pattern_sequence.svh"
  
  `include "configuration/d5m_camera_config.svh"
  `include "driver/d5m_camera_driver.svh"
  `include "monitor/d5m_camera_monitor.svh"
  `include "coverage/d5m_camera_coverage.svh"
  `include "d5m_camera_agent.svh"
endpackage:d5m_camera_agent_pkg