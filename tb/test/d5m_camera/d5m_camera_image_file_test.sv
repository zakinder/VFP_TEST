// UVM_TEST : d5m_camera_TEST [d5m_camera]
class d5m_camera_image_file_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_file_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_file_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_test
// TEST : [SHARP]
class d5m_camera_image_file_sharp_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_sharp_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_sharp_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_sharp_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_sharp_test
// TEST : [CGAIN]
class d5m_camera_image_file_cgain_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_cgain_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_cgain_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_cgain_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_cgain_test

// TEST : [CGAIN_HSL]
class d5m_camera_image_file_cgain_hsl_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_cgain_hsl_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_cgain_hsl_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_cgain_hsl_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_cgain_hsl_test

// TEST : [CGAIN_HSL]
class d5m_camera_image_file_cgain_sharp_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_cgain_sharp_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_cgain_sharp_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_cgain_sharp_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_cgain_sharp_test

// TEST : [CGAIN_HSL]
class d5m_camera_image_file_sharp_cgain_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_sharp_cgain_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_sharp_cgain_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_sharp_cgain_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_sharp_cgain_test


// TEST : [BLUR]
class d5m_camera_image_file_blur_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_blur_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_blur_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_blur_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_blur_test
// TEST : [EMBOSS]
class d5m_camera_image_file_emboss_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_emboss_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_emboss_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_emboss_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_emboss_test
// TEST : [SOBEL]
class d5m_camera_image_file_sobel_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_sobel_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_sobel_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_sobel_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_sobel_test
// TEST : [RGB]
class d5m_camera_image_file_rgb_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_rgb_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_rgb_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_rgb_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_rgb_test
// TEST : [HSL]
class d5m_camera_image_file_hsl_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_hsl_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_hsl_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_hsl_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_hsl_test
// TEST : [HSV]
class d5m_camera_image_file_hsv_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_hsv_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        d5m_camera_image_hsv_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_hsv_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_hsv_test