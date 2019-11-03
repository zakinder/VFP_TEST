`include "../../defin_lib.svh"

`include "../../generic_pack.svh"
`include "../../interfaces/d5m_camera_if.sv"
`include "../../interfaces/vfp_config_d5m_camera_dut.sv"
`include "../../interfaces/rgbAssertion_dut.sv"
module top;
    import uvm_pkg::*;
    import d5m_camera_pkg::*;
    bit pixclk;
    bit ACLK;
    bit reset;
    bit ARESETN;
    //INTERFACE
    d5m_camera_if                d5m_camera_vif(ACLK,pixclk,reset,ARESETN);
    //MODULE
    vfpConfigd5mCameraDut        vfp_dut(d5m_camera_vif);
    imageReadInterfaceDut        imageRead_dut(d5m_camera_vif);
    rgbAssertionDut              rgbAssertion_dut(d5m_camera_vif);
  initial begin
    reset = 0;
    #100ns reset = 1;
  end
  initial begin
    ARESETN = 0;
    #100ns ARESETN = 1;
  end
   initial begin
   pixclk = 0;
   #5ns;
   forever #5ns pixclk = ! pixclk;
   end
   initial begin
   ACLK = 0;
   #5ns;
   forever #5ns ACLK = ! ACLK;
   end
    initial begin
        uvm_config_db   #(virtual d5m_camera_if) ::set(null, "*", "d5m_camera_vif", d5m_camera_vif);
        run_test();
    end
endmodule: top