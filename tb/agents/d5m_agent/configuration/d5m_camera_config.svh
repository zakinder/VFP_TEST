// Class: d5m_camera_configuration
class d5m_camera_configuration extends uvm_object;
    `uvm_object_utils(d5m_camera_configuration)
    rand bit [2:0] mode;
    
    // Function: new
    function new(string name = "d5m_camera_configuration");
        super.new(name);
    endfunction: new
    
    function void do_print (uvm_printer printer);
        printer.knobs.depth=0;
        printer.print_int ("mode", mode, $bits(mode));
        `uvm_info ("DVR", "do_print called", UVM_MEDIUM)
    endfunction : do_print

endclass: d5m_camera_configuration