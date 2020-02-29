// Class: d5m_camera_env
// This Class contain verfication components

class d5m_camera_env extends uvm_env;
    `uvm_component_utils(d5m_camera_env)

    // handle: d5m_camera_vif
    // Interface to dut
    protected virtual interface d5m_camera_if d5m_camera_vif;
    
    // handle: aL_agt
    // d5m camera agent handle
    d5m_camera_agent               aL_agt;


    // handle: aL_fc_sub
    // agent handle
    d5m_camera_fc_subscriber       aL_fc_sub;


    // handle: aL_sb
    // agent handle
    d5m_scoreboard                 aL_sb;
    

    
    // Function: new
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    // Function: build_phase
    // Build components within the "build_phase"
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        // Get the configuration objects from test
        //  if (!uvm_config_db#(virtual d5m_camera_if)::get(this, "", "d5m_camera_vif", d5m_camera_vif))

        //     `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".d5m_camera_vif"});

        aL_agt          = d5m_camera_agent::type_id::create("aL_agt", this);
        aL_fc_sub       = d5m_camera_fc_subscriber::type_id::create("aL_fc_sub", this);
        aL_sb           = d5m_scoreboard::type_id::create("aL_sb", this);
        
    endfunction: build_phase
    
    // Function: connect_phase
    // Connect analysis ports from agent to the scoreboard.
    // Connect the analysis port of the scoreboard with the monitor so that 
    // the scoreboard gets data whenever monitor broadcasts the data.
    // Dut monitor : agent_ap_mon_dut is analysis port in agent connected to handle sa_d5m_mon_dut of dut monitor.
    // Prd monitor : agent_ap_mon_prd is analysis port in agent connected to handle sa_d5m_mon_dut of dut monitor.
    // Scoreboard uvm_analysis_export port export_d5m_dut connected to agent_ap_mon_dut.
    // Scoreboard uvm_analysis_export port export_d5m_prd connected to export_d5m_prd.
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        aL_agt.item_collected_port.connect(aL_fc_sub.analysis_export);
        aL_agt.agent_ap_mon_dut.connect(aL_sb.export_d5m_dut);
        aL_agt.agent_ap_mon_prd.connect(aL_sb.export_d5m_prd);
    endfunction: connect_phase
    
endclass: d5m_camera_env