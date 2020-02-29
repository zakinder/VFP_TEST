// Class: img_sobel_mask_shp_test
class img_sobel_mask_shp_test extends uvm_test;
    `uvm_component_utils(img_sobel_mask_shp_test)
    d5m_camera_env aL_env;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        begin
            d5m_camera_configuration d5m_camera_cfg;
            d5m_camera_cfg = new;
            assert(d5m_camera_cfg.randomize());
            //uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        img_sbmk_shp_seq    d5m_seq;
        phase.raise_objection(.obj(this));
        d5m_seq = img_sbmk_shp_seq::type_id::create(.name("d5m_seq"));
        assert(d5m_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_seq.sprint() }, UVM_LOW)
        d5m_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: img_sobel_mask_shp_test