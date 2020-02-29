// Class: d5m_monitor_dut
class d5m_monitor_dut extends uvm_monitor;

    // handle: d5m_camera_vif
    // Interafce instance
    protected virtual   d5m_camera_if d5m_camera_vif;
    
    // Id Number
    protected int       id;

    // Create an analysis port by the name "mon_d5m_dut" that can broadcast packets of type "d5m_trans".
    uvm_analysis_port #(d5m_trans) mon_d5m_dut;

    protected d5m_trans rx_fdut;
    
    `uvm_component_utils_begin(d5m_monitor_dut)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    
    // Function: new
    // Create mon_d5m_dut instance of the analysis port
    function new (string name, uvm_component parent);
        super.new(name, parent);
        //mon_d5m_dut = new("mon_d5m_dut", this);
    endfunction: new
    
    // Function: build_phase
    // Get virtual interface handle from the configuration db
    // Build the analysis port mon_d5m_dut
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        
        if(!uvm_config_db#(virtual d5m_camera_if)::get(this, "", "d5m_camera_vif", d5m_camera_vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(), ".d5m_camera_vif"});
        
        mon_d5m_dut = new("mon_d5m_dut", this);
    endfunction: build_phase
    
    // Method:  run_phase
    virtual task run_phase (uvm_phase phase);
        fork
            collect_transactions();
        join
    endtask: run_phase
    
    // Method:  collect_transactions
    virtual protected task collect_transactions();
        // Placeholder to capture transaction information.
        d5m_trans rx_fdut;
        rx_fdut            = d5m_trans::type_id::create("rx_fdut"); 
        forever begin
        @(posedge d5m_camera_vif.clkmm)
            //Monitor interface sigals and populate "rx_fdut" data object.
            //if(d5m_camera_vif.d5m.valid==1'b1) begin
                rx_fdut.d5m.valid  = d5m_camera_vif.d5m.valid;
                rx_fdut.d5m.red    = d5m_camera_vif.d5m.red;
                rx_fdut.d5m.green  = d5m_camera_vif.d5m.green;
                rx_fdut.d5m.blue   = d5m_camera_vif.d5m.blue;
           // end
            //if(d5m_camera_vif.d5m.lvalid==1'b1) begin
                rx_fdut.d5m.rgb    = d5m_camera_vif.d5m.rgb;
                rx_fdut.d5m.lvalid = d5m_camera_vif.d5m.lvalid;
                rx_fdut.d5m.fvalid = d5m_camera_vif.d5m.fvalid;
                rx_fdut.d5m.x      = d5m_camera_vif.d5m.x;
                rx_fdut.d5m.y      = d5m_camera_vif.d5m.y;
                rx_fdut.d5m.eof    = d5m_camera_vif.d5m.eof;
            //end

            //Send the transaction to the analysis port
            mon_d5m_dut.write(rx_fdut);
            
        end
    endtask: collect_transactions
    
endclass: d5m_monitor_dut