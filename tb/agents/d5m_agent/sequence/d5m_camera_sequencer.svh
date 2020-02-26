// Class: d5m_camera_sequencer
class d5m_camera_sequencer extends uvm_sequencer #(d5m_camera_transaction);
    int id;
    `uvm_component_utils_begin(d5m_camera_sequencer)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    // Function: new
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
endclass: d5m_camera_sequencer