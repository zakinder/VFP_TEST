

// d5m_scoreboard compare the dut output values with prediction or golden ref values.
// using uvm fifo sychronize write transaction from dut and predict monitor.
// get method  access data from fifo which are connected to  write method input.
`uvm_analysis_imp_decl(_d5m_dut)
`uvm_analysis_imp_decl(_d5m_prd)
class d5m_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(d5m_scoreboard)
    

    uvm_analysis_export   #(d5m_camera_transaction)     export_d5m_dut;
    uvm_analysis_export   #(d5m_camera_transaction)     export_d5m_prd;
    
    uvm_tlm_analysis_fifo #(d5m_camera_transaction)     d5m_dut_fifo;
    uvm_tlm_analysis_fifo #(d5m_camera_transaction)     d5m_prd_fifo;
    
    d5m_camera_transaction                              trans_d5m_dut;
    d5m_camera_transaction                              trans_d5m_prd;
    
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
        trans_d5m_dut    = new("trans_d5m_dut");
        trans_d5m_prd    = new("trans_d5m_prd");
    endfunction: new
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        export_d5m_dut      = new("export_d5m_dut", this);
        export_d5m_prd      = new("export_d5m_prd", this);
        d5m_dut_fifo        = new("d5m_dut_fifo", this);
        d5m_prd_fifo        = new("d5m_prd_fifo", this);
    endfunction: build_phase
    
    function void connect_phase(uvm_phase phase);
        export_d5m_dut.connect(d5m_dut_fifo.analysis_export);
        export_d5m_prd.connect(d5m_prd_fifo.analysis_export);
    endfunction: connect_phase
    
    task run();
        forever begin
            d5m_dut_fifo.get(trans_d5m_dut);
            d5m_prd_fifo.get(trans_d5m_prd);
            compare();
        end
    endtask: run
    
    virtual function void compare();
    if(trans_d5m_dut.d5m.valid==1'b1) begin
        if(trans_d5m_dut.d5m.red == trans_d5m_prd.vfp.red) begin
            `uvm_info("Test: OK",$sformatf("DUT = %d PRED = %d",trans_d5m_dut.d5m.red,trans_d5m_prd.vfp.red), UVM_LOW)
        end else begin
            `uvm_info("Test: Fail",$sformatf("DUT = %d PRED = %d",trans_d5m_dut.d5m.red,trans_d5m_prd.vfp.red), UVM_LOW)
        end
    end   
    endfunction: compare
    
endclass: d5m_scoreboard

