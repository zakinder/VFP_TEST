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
                d5m_tx.d5m.valid  = d5m_camera_vif.d5m.valid;
                d5m_tx.d5m.red    = d5m_camera_vif.d5m.red;
                d5m_tx.d5m.green  = d5m_camera_vif.d5m.green;
                d5m_tx.d5m.blue   = d5m_camera_vif.d5m.blue;
                d5m_tx.d5m.rgb    = d5m_camera_vif.d5m.rgb;
                d5m_tx.d5m.lvalid = d5m_camera_vif.d5m.lvalid;
                d5m_tx.d5m.fvalid = d5m_camera_vif.d5m.fvalid;
                d5m_tx.d5m.x      = d5m_camera_vif.d5m.x;
                d5m_tx.d5m.y      = d5m_camera_vif.d5m.y;
                d5m_tx.d5m.eof    = d5m_camera_vif.d5m.eof;
                item_collected_port.write(d5m_tx);
            end
    endtask: collect_transactions
endclass: d5m_camera_monitor

