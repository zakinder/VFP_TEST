// Class: d5m_rgb_patten_test
class d5m_rgb_patten_test extends uvm_test;
    `uvm_component_utils(d5m_rgb_patten_test)
    // handle: aL_env
    d5m_camera_env aL_env;

    // Function: new
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    // Function: build_phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        begin
            d5m_camera_configuration d5m_camera_cfg;
            d5m_camera_cfg = new;
            assert(d5m_camera_cfg.randomize());
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase

    // Function: end_of_elaboration_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction: end_of_elaboration_phase

    // Function: run_phase
    task run_phase(uvm_phase phase);
        d5m_rgb_seq    d5m_seq;
        phase.raise_objection(.obj(this));
        d5m_seq = d5m_rgb_seq::type_id::create(.name("d5m_seq"));
        assert(d5m_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_seq.sprint() }, UVM_LOW)
        d5m_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
    
endclass: d5m_rgb_patten_test