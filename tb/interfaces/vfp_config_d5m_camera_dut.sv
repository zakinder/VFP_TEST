// MODULE : VFPCONFIGDUT
module imageReadInterfaceDut(d5m_camera_if.ConfigMaster d5m_camera_vif);
import generic_pack::*;  
imageReadInterface            #(
    .i_data_width              (i_data_width                      ),
    .img_frames_cnt_bmp        (img_frames_cnt_bmp                ),
    .img_width_bmp             (img_width_bmp                     ),
    .img_height_bmp            (img_height_bmp                    ),
    .read_bmp                  (read_bmp                          ))
imageReadInterfaceInst         (
    .clk                       (d5m_camera_vif.pixclk             ),
    .m_axis_mm2s_aclk          (d5m_camera_vif.ACLK               ),
    .aclk                      (d5m_camera_vif.d5p.clkmm          ),
    .reset                     (d5m_camera_vif.reset              ),
    .iReadyToRead              (d5m_camera_vif.d5p.iReadyToRead   ),
    .iImageTypeTest            (d5m_camera_vif.d5p.iImageTypeTest ),
    .iRgb                      (d5m_camera_vif.d5p.rgb            ),
    .ilvalid                   (d5m_camera_vif.d5p.lvalid         ),
    .ifvalid                   (d5m_camera_vif.d5p.fvalid         ),
    .m_axis_mm2s_tvalid        (d5m_camera_vif.m_axis_mm2s_tvalid ),
    .m_axis_mm2s_tdata         (d5m_camera_vif.m_axis_mm2s_tdata  ),
    .valid                     (d5m_camera_vif.d5m.valid          ),
    .red                       (d5m_camera_vif.d5m.red            ),
    .green                     (d5m_camera_vif.d5m.green          ),
    .blue                      (d5m_camera_vif.d5m.blue           ),
    .lvalid                    (d5m_camera_vif.d5m.lvalid         ),
    .fvalid                    (d5m_camera_vif.d5m.fvalid         ),
    .rgb                       (d5m_camera_vif.d5m.rgb            ),
    .xCord                     (d5m_camera_vif.d5m.x              ),
    .yCord                     (d5m_camera_vif.d5m.y              ),
    .endOfFrame                (d5m_camera_vif.d5m.eof            ));
endmodule: imageReadInterfaceDut
module vfpConfigd5mCameraDut(d5m_camera_if.ConfigMaster d5m_camera_vif);
import generic_pack::*;  
VFP_v1_0                      #(
    .revision_number           ( revision_number                  ),
    .C_rgb_m_axis_TDATA_WIDTH  ( C_rgb_m_axis_TDATA_WIDTH         ),
    .C_rgb_m_axis_START_COUNT  ( C_rgb_m_axis_START_COUNT         ),
    .C_rgb_s_axis_TDATA_WIDTH  ( C_rgb_s_axis_TDATA_WIDTH         ),
    .C_m_axis_mm2s_TDATA_WIDTH ( C_m_axis_mm2s_TDATA_WIDTH        ),
    .C_m_axis_mm2s_START_COUNT ( C_m_axis_mm2s_START_COUNT        ),
    .C_vfpConfig_DATA_WIDTH    ( C_vfpConfig_DATA_WIDTH           ),
    .C_vfpConfig_ADDR_WIDTH    ( C_vfpConfig_ADDR_WIDTH           ),
    .conf_data_width           ( conf_data_width                  ),
    .conf_addr_width           ( conf_addr_width                  ),
    .i_data_width              ( i_data_width                     ),
    .s_data_width              ( s_data_width                     ),
    .b_data_width              ( b_data_width                     ),
    .i_precision               ( i_precision                      ),
    .i_full_range              ( i_full_range                     ),
    .img_width                 ( img_width                        ),
    .dataWidth                 ( dataWidth                        ),
    .img_width_bmp             ( img_width_bmp                    ),
    .img_height_bmp            ( img_height_bmp                   ),
    .F_TES                     ( F_TES                            ),
    .F_LUM                     ( F_LUM                            ),
    .F_TRM                     ( F_TRM                            ),
    .F_RGB                     ( F_RGB                            ),
    .F_SHP                     ( F_SHP                            ),
    .F_BLU                     ( F_BLU                            ),
    .F_EMB                     ( F_EMB                            ),
    .F_YCC                     ( F_YCC                            ),
    .F_SOB                     ( F_SOB                            ),
    .F_CGA                     ( F_CGA                            ),
    .F_HSV                     ( F_HSV                            ),
    .F_HSL                     ( F_HSL                            ),
    .F_CGA_TO_CGA              ( F_CGA_TO_CGA                     ),
    .F_CGA_TO_HSL              ( F_CGA_TO_HSL                     ),
    .F_CGA_TO_HSV              ( F_CGA_TO_HSV                     ),
    .F_CGA_TO_YCC              ( F_CGA_TO_YCC                     ),
    .F_CGA_TO_SHP              ( F_CGA_TO_SHP                     ),
    .F_CGA_TO_BLU              ( F_CGA_TO_BLU                     ),
    .F_SHP_TO_SHP              ( F_SHP_TO_SHP                     ),
    .F_SHP_TO_HSL              ( F_SHP_TO_HSL                     ),
    .F_SHP_TO_HSV              ( F_SHP_TO_HSV                     ),
    .F_SHP_TO_YCC              ( F_SHP_TO_YCC                     ),
    .F_SHP_TO_CGA              ( F_SHP_TO_CGA                     ),
    .F_SHP_TO_BLU              ( F_SHP_TO_BLU                     ),
    .F_BLU_TO_BLU              ( F_BLU_TO_BLU                     ),
    .F_BLU_TO_HSL              ( F_BLU_TO_HSL                     ),
    .F_BLU_TO_HSV              ( F_BLU_TO_HSV                     ),
    .F_BLU_TO_YCC              ( F_BLU_TO_YCC                     ),
    .F_BLU_TO_CGA              ( F_BLU_TO_CGA                     ),
    .F_BLU_TO_SHP              ( F_BLU_TO_SHP                     ))
dutVFP_v1Inst                  (
    //d5m input
    .pixclk                    (d5m_camera_vif.pixclk             ),//(d5m_camera_vif.ACLK   ),
    .ifval                     (d5m_camera_vif.d5m.fvalid         ),//(d5m_camera_vif.ifval),
    .ilval                     (d5m_camera_vif.d5m.lvalid         ),//(d5m_camera_vif.ilval ),
    .idata                     (d5m_camera_vif.d5m.rgb            ),//(d5m_camera_vif.idata ),
    //tx channel
    .rgb_m_axis_aclk           (d5m_camera_vif.ACLK               ),
    .rgb_m_axis_aresetn        (d5m_camera_vif.ARESETN            ),
    .rgb_m_axis_tready         (d5m_camera_vif.rgb_s_axis_tready  ),//input
    .rgb_m_axis_tvalid         (d5m_camera_vif.rgb_m_axis_tvalid  ),//output
    .rgb_m_axis_tlast          (d5m_camera_vif.rgb_m_axis_tlast   ),//output
    .rgb_m_axis_tuser          (d5m_camera_vif.rgb_m_axis_tuser   ),//output
    .rgb_m_axis_tdata          (d5m_camera_vif.rgb_m_axis_tdata   ),//output
    //rx channel               
    .rgb_s_axis_aclk           (d5m_camera_vif.ACLK               ),
    .rgb_s_axis_aresetn        (d5m_camera_vif.ARESETN            ),
    .rgb_s_axis_tready         (d5m_camera_vif.rgb_s_axis_tready  ),//output
    .rgb_s_axis_tvalid         (d5m_camera_vif.rgb_m_axis_tvalid  ),//input
    .rgb_s_axis_tlast          (d5m_camera_vif.rgb_m_axis_tlast   ),//input
    .rgb_s_axis_tuser          (d5m_camera_vif.rgb_m_axis_tuser   ),//input
    .rgb_s_axis_tdata          (d5m_camera_vif.rgb_m_axis_tdata   ),//input
    //destination channel                                    
    .m_axis_mm2s_aclk          (d5m_camera_vif.ACLK               ),
    .m_axis_mm2s_aresetn       (d5m_camera_vif.ARESETN            ),
    .m_axis_mm2s_tready        (d5m_camera_vif.m_axis_mm2s_tready ),//input
    .m_axis_mm2s_tvalid        (d5m_camera_vif.m_axis_mm2s_tvalid ),//output
    .m_axis_mm2s_tuser         (d5m_camera_vif.m_axis_mm2s_tuser  ),//output
    .m_axis_mm2s_tlast         (d5m_camera_vif.m_axis_mm2s_tlast  ),//output
    .m_axis_mm2s_tdata         (d5m_camera_vif.m_axis_mm2s_tdata  ),//output
    .m_axis_mm2s_tkeep         (d5m_camera_vif.m_axis_mm2s_tkeep  ),//output
    .m_axis_mm2s_tstrb         (d5m_camera_vif.m_axis_mm2s_tstrb  ),//output
    .m_axis_mm2s_tid           (d5m_camera_vif.m_axis_mm2s_tid    ),//output
    .m_axis_mm2s_tdest         (d5m_camera_vif.m_axis_mm2s_tdest  ),//output
    //video configuration      
    .vfpconfig_aclk            (d5m_camera_vif.ACLK               ),
    .vfpconfig_aresetn         (d5m_camera_vif.ARESETN            ),
    .vfpconfig_awaddr          (d5m_camera_vif.AWADDR             ),
    .vfpconfig_awprot          (d5m_camera_vif.AWPROT             ),
    .vfpconfig_awvalid         (d5m_camera_vif.AWVALID            ),
    .vfpconfig_awready         (d5m_camera_vif.AWREADY            ),
    .vfpconfig_wdata           (d5m_camera_vif.WDATA              ),
    .vfpconfig_wstrb           (d5m_camera_vif.WSTRB              ),
    .vfpconfig_wvalid          (d5m_camera_vif.WVALID             ),
    .vfpconfig_wready          (d5m_camera_vif.WREADY             ),
    .vfpconfig_bresp           (d5m_camera_vif.BRESP              ),
    .vfpconfig_bvalid          (d5m_camera_vif.BVALID             ),
    .vfpconfig_bready          (d5m_camera_vif.BREADY             ),
    .vfpconfig_araddr          (d5m_camera_vif.ARADDR             ),
    .vfpconfig_arprot          (d5m_camera_vif.ARPROT             ),
    .vfpconfig_arvalid         (d5m_camera_vif.ARVALID            ),
    .vfpconfig_arready         (d5m_camera_vif.ARREADY            ),
    .vfpconfig_rdata           (d5m_camera_vif.RDATA              ),
    .vfpconfig_rresp           (d5m_camera_vif.RRESP              ),
    .vfpconfig_rvalid          (d5m_camera_vif.RVALID             ),
    .vfpconfig_rready          (d5m_camera_vif.RREADY             ));
endmodule: vfpConfigd5mCameraDut