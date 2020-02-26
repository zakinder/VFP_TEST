// Class: d5m_camera_image_file_test
class d5m_camera_image_file_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
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
        d5m_camera_image_file_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_file_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_test
// Class: d5m_camera_image_file_sharp_test
class d5m_camera_image_file_sharp_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_sharp_test)
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
            uvm_config_db#(d5m_camera_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(d5m_camera_cfg));
            aL_env = d5m_camera_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    // Function: end_of_elaboration_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction: end_of_elaboration_phase
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
// Class: d5m_camera_image_file_cgain_test
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
// Class: d5m_camera_image_file_cgain_hsl_test
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
// Class: d5m_camera_image_file_cgain_sharp_test
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
// Class: d5m_camera_image_file_sharp_cgain_test
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
// Class: d5m_camera_image_file_cgain_cgain_test
class d5m_camera_image_file_cgain_cgain_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_cgain_cgain_test)
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
        d5m_camera_image_cgain_cgain_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_cgain_cgain_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_cgain_cgain_test
// Class: d5m_camera_image_file_sobel_mask_hsl_test
class d5m_camera_image_file_sobel_mask_hsl_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_sobel_mask_hsl_test)
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
        d5m_camera_image_sobel_mask_hsl_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_sobel_mask_hsl_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_sobel_mask_hsl_test
// Class: d5m_camera_image_file_sobel_mask_blu_test
class d5m_camera_image_file_sobel_mask_blu_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_sobel_mask_blu_test)
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
        d5m_camera_image_sobel_mask_blu_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_sobel_mask_blu_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_sobel_mask_blu_test
// Class: d5m_camera_image_file_sobel_mask_cga_test
class d5m_camera_image_file_sobel_mask_cga_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_sobel_mask_cga_test)
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
        d5m_camera_image_sobel_mask_cga_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_sobel_mask_cga_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_sobel_mask_cga_test
// Class: d5m_camera_image_file_sobel_mask_hsv_test
class d5m_camera_image_file_sobel_mask_hsv_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_sobel_mask_hsv_test)
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
        d5m_camera_image_sobel_mask_hsv_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_sobel_mask_hsv_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_sobel_mask_hsv_test
// Class: d5m_camera_image_file_sobel_mask_rgb_test
class d5m_camera_image_file_sobel_mask_rgb_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_sobel_mask_rgb_test)
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
        d5m_camera_image_sobel_mask_rgb_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_sobel_mask_rgb_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_sobel_mask_rgb_test
// Class: d5m_camera_image_file_sobel_mask_shp_test
class d5m_camera_image_file_sobel_mask_shp_test extends uvm_test;
    `uvm_component_utils(d5m_camera_image_file_sobel_mask_shp_test)
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
        d5m_camera_image_sobel_mask_shp_sequence    d5m_camera_seq;
        phase.raise_objection(.obj(this));
        d5m_camera_seq = d5m_camera_image_sobel_mask_shp_sequence::type_id::create(.name("d5m_camera_seq"));
        assert(d5m_camera_seq.randomize());
        `uvm_info("aL_env", { "\n", d5m_camera_seq.sprint() }, UVM_LOW)
        d5m_camera_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: d5m_camera_image_file_sobel_mask_shp_test
// Class: d5m_camera_image_file_blur_test
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
// Class: d5m_camera_image_file_emboss_test
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
// Class: d5m_camera_image_file_sobel_test
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
// Class: d5m_camera_image_file_rgb_test
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
// Class: d5m_camera_image_file_hsl_test
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
// Class: d5m_camera_image_file_hsv_test
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