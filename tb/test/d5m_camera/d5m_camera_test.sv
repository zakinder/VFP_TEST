// Class: d5m_camera_test
class d5m_camera_test extends uvm_test;
    `uvm_component_utils(d5m_camera_test)
    
    d5m_camera_env aL_env;
    d5m_camera_configuration d5m_camera_cfg;
    uvm_table_printer tprinter;
    // Function: new
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    // Function: build_phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        begin
        aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        d5m_camera_cfg = d5m_camera_configuration::type_id::create(.name("d5m_camera_cfg"),.parent(this));
        uvm_config_db #(d5m_camera_configuration)::set (this, "aL_env.aL_agt", "d5m_camera_cfg", d5m_camera_cfg);
        tprinter = new(); 
        cfg_printer();        
        end
    endfunction: build_phase

    // Function: end_of_elaboration_phase
    // Print the factory topology.
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction: end_of_elaboration_phase

    // Function: run_phase
    // Create and randomize the camera sequence.
    // Start the camera sequnece through image sequencer handle aL_sqr as input transaction to driver.
    // In d5m camera agent connect phase, connect driver sequnece port to image sequencer sequnece export.
    task run_phase(uvm_phase phase);
        camera_seq    d5m_seq;
        phase.raise_objection(.obj(this));
        d5m_seq = camera_seq::type_id::create(.name("d5m_seq"));
        assert(d5m_seq.randomize());
        d5m_seq.print (tprinter);
        d5m_camera_cfg.print (tprinter);
        d5m_camera_cfg.print (uvm_default_table_printer);
        `uvm_info("aL_env", { "\n", d5m_seq.sprint() }, UVM_LOW)
        d5m_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
    
   function void cfg_printer ();
      tprinter.knobs.full_name = 1;               // Show full name of the variable relative to class instance
      tprinter.knobs.size = 0;                    // Do not show size column
      tprinter.knobs.depth = 1;                   // Only show upto 1 level of the nested hierarchy
      tprinter.knobs.reference = 2;               // Do not print object ID handles
      tprinter.knobs.type_name = 0;               // Do not show Type column
      tprinter.knobs.indent = 4;                  // Indent from the left by 4
      tprinter.knobs.hex_radix = "0x";            // Replace 'h radix by 0x - observe Value field to see this
   endfunction
    
endclass: d5m_camera_test