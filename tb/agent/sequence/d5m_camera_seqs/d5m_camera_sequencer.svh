// UVM_SEQUENCE : d5m_camera_SEQUENCER [d5m_camera]
class d5m_camera_sequencer extends uvm_sequencer #(d5m_camera_transaction);
    int id;
    `uvm_component_utils_begin(d5m_camera_sequencer)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass: d5m_camera_sequencer