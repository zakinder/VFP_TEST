
// Heading:This is *bold text*.
// This is _underlined text with spaces_.
//
//- Bullet one.
//- Bullet two.
//  Bullet two continued.
//- Bullet three.
//
//Some text after the bullet list.
//
//  * Level one.
//
//  * Level two, first paragraph.
//    Level two, first paragraph continued.
//
//    Level two, second paragraph.
//
//      * Level three.
//--- Code
//int x = 12;
//int y = 0;
//---
//
//==== Perl ====
//my $x = 12;
//my $y = 0;
//==============
//
//___ Text ____________
//
//This is plain text.
//___
// The scoreboard will receive the transactions from the Monitors implemented and connected inside this agent.

// Class: d5m_camera_agent
// This agent encapusalte the d5m driver, monitor and sequencer into single entity
// by intencitaing and conneting the the component together via TLM interface.

class d5m_camera_agent extends uvm_agent;
    `uvm_component_utils(d5m_camera_agent)

    //
    uvm_analysis_port#(d5m_trans) item_collected_port;
    uvm_analysis_port#(d5m_trans) agent_ap_mon_dut;
    uvm_analysis_port#(d5m_trans) agent_ap_mon_prd;
    
    // handle: agent components handles
    
    // handle: aL_sqr
    img_seqr       aL_sqr;
    // handle: aL_drv
    d5m_camera_driver          aL_drv;
    // handle: aL_mon
    d5m_camera_monitor         aL_mon;
    // handle: sa_d5m_mon_dut
    d5m_monitor_dut            sa_d5m_mon_dut;
    // handle: sa_d5m_mon_prd
    d5m_monitor_predict        sa_d5m_mon_prd;
    
    /* Function: new
     * Parameters:
     *
     *    name - name
     *    parent - uvm_component
     */
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new 
    

    // Function: build_phase
    // Use build() method to create agents's subcomponents.
    // If agent is active create then driver, and sequencer
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        agent_ap_mon_dut         = new(.name("agent_ap_mon_dut"), .parent(this));
        agent_ap_mon_prd         = new(.name("agent_ap_mon_prd"), .parent(this));
        
        item_collected_port      = new(.name("item_collected_port"),.parent(this));

        //Both active and passive agents need a monitor
        aL_mon                   = d5m_camera_monitor::type_id::create("aL_mon", this);
        
        sa_d5m_mon_dut           = d5m_monitor_dut::type_id::create("sa_d5m_mon_dut", this);
        sa_d5m_mon_prd           = d5m_monitor_predict::type_id::create("sa_d5m_mon_prd", this);
        
        // If this UVM agent is active, then build driver, and sequencer
        if (get_is_active() == UVM_ACTIVE) begin
            // Create object instance
            aL_sqr = img_seqr::type_id::create("aL_sqr", this);
            aL_drv = d5m_camera_driver::type_id::create("aL_drv", this);
        end
        
    endfunction: build_phase
    
    // Function: connect_phase
    // Called by uvm flow and connect monitor to agent ana
    // If this agent is active then Connect 
    // the driver to the sequencer 
    // the monitor to the item_collected_port 
    // the monitor to the agent_ap_mon_dut 
    // the monitor to the agent_ap_mon_prd 
    // get_is_active() method return the state of an agent.
    function void connect_phase(uvm_phase phase);
        if (get_is_active() == UVM_ACTIVE) begin
            // connect driver and sequencer
            aL_drv.seq_item_port.connect(aL_sqr.seq_item_export);
            // connect monitor and analysis port
            aL_mon.item_collected_port.connect(item_collected_port);
            // connect monitor and analysis port
            sa_d5m_mon_dut.mon_d5m_dut.connect(agent_ap_mon_dut);
            // connect monitor and analysis port
            sa_d5m_mon_prd.d5m_mon_prd.connect(agent_ap_mon_prd);
        end
    endfunction: connect_phase
    
endclass: d5m_camera_agent