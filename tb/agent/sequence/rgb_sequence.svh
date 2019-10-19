// UVM_SEQUENCE : RGB_SEQUENCER [RGB]
class rgb_sequencer#(parameter set_config cfg = par_1) extends uvm_sequencer#(rgb_transaction#(cfg));
    `uvm_component_param_utils(rgb_sequencer#(cfg))
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass: rgb_sequencer

// UVM_SEQUENCE : RGB_RANDOM_SEQUENCE [RGB]
class rgb_random_sequence#(parameter set_config cfg = par_1) extends uvm_sequence#(rgb_transaction#(cfg));
    `uvm_object_param_utils(rgb_random_sequence#(cfg));
    function new(string name = "rgb_random_sequence");
        super.new(name);
    endfunction : new
    task body();
    rgb_transaction#(cfg) frame_tx = rgb_transaction#(cfg)::type_id::create("frame_tx");
        repeat (10) begin : random_loop
            start_item(frame_tx);
            assert(frame_tx.randomize());
            finish_item(frame_tx);
        end : random_loop
    endtask : body
endclass: rgb_random_sequence
// UVM_SEQUENCE : RANDOM_SEQUENCE_R1 [RGB]
class random_sequence_r1#(parameter set_config cfg = par_1) extends uvm_sequence#(rgb_transaction#(cfg));
    `uvm_object_param_utils(random_sequence_r1#(cfg));
    function new(string name = "random_sequence_r1");
        super.new(name);
    endfunction : new
    task body();
    rgb_transaction#(cfg) frame_tx = rgb_transaction#(cfg)::type_id::create("frame_tx");
    `uvm_info("random_sequence_r1", "executing...", UVM_LOW)
        repeat (100) begin : random_loop
            start_item(frame_tx);
            assert(frame_tx.randomize());
            finish_item(frame_tx);
        end : random_loop
    endtask : body
endclass: random_sequence_r1
// UVM_SEQUENCE : RANDOM_SEQUENCE_R2 [RGB]
class random_sequence_r2 extends random_sequence_r1;
    `uvm_object_utils(random_sequence_r2);
    function new(string name = "random_sequence_r2");
        super.new(name);
    endfunction : new
    task body();
    rgb_transaction#(cfg) frame_tx = rgb_transaction#(cfg)::type_id::create("frame_tx");
    `uvm_info("random_sequence_r2", "executing...", UVM_LOW)
        repeat (1) begin : random_loop
            start_item(frame_tx);
            assert(frame_tx.randomize());
            finish_item(frame_tx);
        end : random_loop
    endtask : body
endclass: random_sequence_r2
// UVM_SEQUENCE : TOP_SEQUENCE [RGB]
class top_sequence extends uvm_sequence #(rgb_transaction);
    `uvm_object_utils(top_sequence)
    `uvm_declare_p_sequencer(rgb_sequencer)
    function new (string name = "");
        super.new(name);
    endfunction
    task body;
        rgb_configuration cfg;
        int count;
        if ( uvm_config_db #(rgb_configuration)::get(p_sequencer, "", "config", cfg) ) begin
            count    = cfg.count;
        end
        else begin
            count    = 1;
        end
        if (starting_phase != null)
            starting_phase.raise_objection(this);
        repeat(count) begin
            random_sequence_r1#(par_1) seq;
            seq = random_sequence_r1#(par_1)::type_id::create("seq");
            seq.start(p_sequencer, this);
        end
        if (starting_phase != null)
            starting_phase.drop_objection(this);
    endtask: body
endclass: top_sequence