// +--------------------+     +--------------------+     +-----+     +------+
// |run_test()          |     |uvm_test_top        |     | env |     | comp |
// |--------------------|     |--------------------|     |-----|     |------|
// |build               |     |build               |     | bld |     | bld  |
// |connect             |---->|connect             |---->| cnt |---->| cnt  |
// |end_of_elaboration  |<----|end_of_elaboration  |<----| eoe |<----| eoe  |
// |start_of_simulation |<----|start_of_simulation |<----| sos |<----| sos  |
// |run                 |-----|run                 |-----| run |-----| run  |
// |extract             |<----|extract             |<----| ext |<----| ext  |
// |check               |<----|check               |<----| chk |<----| chk  |
// |report              |<----|report              |<----| rpt |<----| rpt  |
// |final               |<----|final               |<----| fnl |<----| fnl  |
// +--------------------+     +--------------------+     +-----+     +------+

`include "../../dut/tb/SvTb/rgbAssertion.sv"
`include "../../interfaces/d5m_camera_if.sv"
`include "../../interfaces/vfp_config_d5m_camera_dut.sv"
`include "../../interfaces/rgbAssertion_dut.sv"

// module: top
module top;
    import uvm_pkg::*;
    import d5m_camera_pkg::*;
    bit pixclk;
    bit ACLK;
    bit reset;
    bit ARESETN;
    // module: d5m_camera_vif
    d5m_camera_if                d5m_camera_vif(ACLK,pixclk,reset,ARESETN);
    // module: vfp_dut
    vfpConfigd5mCameraDut        vfp_dut(d5m_camera_vif);
    // module: imageRead_dut
    imageReadInterfaceDut        imageRead_dut(d5m_camera_vif);
    // module: rgbAssertion_dut
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
        //set
        uvm_config_db   #(virtual d5m_camera_if) ::set(null, "*", "d5m_camera_vif", d5m_camera_vif);
        run_test();
    end
endmodule: top