// UVM_MONITOR : d5m_camera_MONITOR [d5m_camera]
class d5m_camera_monitor extends uvm_monitor;
    protected virtual   d5m_camera_if d5m_camera_vif;
    protected int       id;
    uvm_analysis_port #(d5m_camera_transaction) item_collected_port;
    protected d5m_camera_transaction d5m_txn;
    `uvm_component_utils_begin(d5m_camera_monitor)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    function new (string name, uvm_component parent);
        super.new(name, parent);
        d5m_txn = new();
        item_collected_port = new("item_collected_port", this);
    endfunction
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual d5m_camera_if)::get(this, "", "d5m_camera_vif", d5m_camera_vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(), ".d5m_camera_vif"});
    endfunction
    virtual task run_phase (uvm_phase phase);
        fork
            collect_transactions();
        join
    endtask: run_phase
    virtual protected task collect_transactions();
            d5m_camera_transaction d5m_tx;
            forever begin
            @(posedge d5m_camera_vif.pixclk)
                d5m_tx            = d5m_camera_transaction::type_id::create("d5m_tx"); 
                d5m_tx.valid      = d5m_camera_vif.valid;
                d5m_tx.red        = d5m_camera_vif.red;
                d5m_tx.green      = d5m_camera_vif.green;
                d5m_tx.blue       = d5m_camera_vif.blue;
                d5m_tx.rgb        = d5m_camera_vif.rgb;
                d5m_tx.lvalid     = d5m_camera_vif.lvalid;
                d5m_tx.fvalid     = d5m_camera_vif.fvalid;
                d5m_tx.xCord      = d5m_camera_vif.xCord;
                d5m_tx.yCord      = d5m_camera_vif.yCord;
                d5m_tx.endOfFrame = d5m_camera_vif.endOfFrame;
                item_collected_port.write(d5m_tx);
            end
    endtask: collect_transactions
endclass: d5m_camera_monitor

