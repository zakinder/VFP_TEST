// MODULE : ADDER [TEMPLATE]
module rgbAssertionDut(d5m_camera_if.ConfigMaster d5m_camera_vif);
import generic_pack::*;
rgbAssertion rgb_dut   (
   .pixclk             (d5m_camera_vif.pixclk),
   .mmclk              (d5m_camera_vif.ACLK),
   .reset              (d5m_camera_vif.reset),
   .valid              (d5m_camera_vif.valid),
   .iRed               (d5m_camera_vif.red),
   .iGreen             (d5m_camera_vif.green),
   .iBlue              (d5m_camera_vif.blue),
   .m_axis_mm2s_tvalid (d5m_camera_vif.m_axis_mm2s_tvalid),
   .m_axis_mm2s_tdata  (d5m_camera_vif.m_axis_mm2s_tdata));
endmodule: rgbAssertionDut