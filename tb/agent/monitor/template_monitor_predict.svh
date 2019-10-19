// UVM_MONITOR : TEMPLATE_MONITOR_PREDICT [TEMPLATE]
//The second axi4_monitor, monitor_afterToDut, will get both inputs 
//and make a prediction of the expected result. 
//The scoreboard will get this predicted result as well and make a comparison between the two values.
class template_monitor_predict extends uvm_monitor;
    `uvm_component_utils(template_monitor_predict)
    uvm_analysis_port#(tp_transaction)  mon_ap_afterToDut;
    virtual tp_if                       tp_vif;
    tp_transaction                      tx_pred;
    tp_transaction                      sa_tx_cg;
    covergroup template_cg;
              ina_cp:     coverpoint sa_tx_cg.ina;
              inb_cp:     coverpoint sa_tx_cg.inb;
              ida_cp:     coverpoint sa_tx_cg.idata;
              
        cross ina_cp, inb_cp, ida_cp;
    endgroup: template_cg
    function new(string name, uvm_component parent);
        super.new(name, parent);
        template_cg = new;
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        void'(uvm_resource_db#(virtual tp_if)::read_by_name(.scope("ifs"), .name("tp_if"), .val(tp_vif)));
        mon_ap_afterToDut= new(.name("mon_ap_afterToDut"), .parent(this));
    endfunction: build_phase
    task run_phase(uvm_phase phase);
        integer counter_mon = 0, state = 0;
        tx_pred = tp_transaction::type_id::create(.name("tx_pred"), .contxt(get_full_name()));
        forever begin
            @(posedge tp_vif.sig_clock)
            begin
                if(tp_vif.sig_en_i==1'b1)
                begin
                    state  = 1;
                    tx_pred.ina = 2'b00;
                    tx_pred.inb = 2'b00;
                    tx_pred.outValTbs = 3'b000;
                end
                if(state==1)
                begin
                    tx_pred.ina    = tx_pred.ina << 1;
                    tx_pred.inb    = tx_pred.inb << 1;
                    tx_pred.ina[0] = tp_vif.sig_ina;
                    tx_pred.inb[0] = tp_vif.sig_inb;
                    counter_mon = counter_mon + 1;
                    if(counter_mon==3)
                    begin
                        state = 0;
                        counter_mon = 1;
                        //Predict the result
                        predictor();
                        sa_tx_cg = tx_pred;
                        //Coverage
                        template_cg.sample();
                        //Send the transaction to the analysis port
                        mon_ap_afterToDut.write(tx_pred);
                    end
                end
            end
        end
    endtask: run_phase
    virtual function void predictor();
        tx_pred.outValTbs = tx_pred.ina + tx_pred.inb;//Predicted value
    endfunction: predictor
endclass: template_monitor_predict