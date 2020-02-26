// Class: d5m_monitor_predict
class d5m_monitor_predict extends uvm_monitor;

    cell_box                d5m_cell_box_predict_pkts;

    // Interafce instance
    protected virtual   d5m_camera_if d5m_camera_vif;
    
    // Id Number
    protected int       id;
    
    cell_set choices;
    
    bit[23:0] rgb;
    bit[7:0] rgb_red_data;
    bit[7:0] rgb_gre_data;
    bit[7:0] rgb_blu_data;
    int number_frames  = 1;
    int lval_offset    = 5;
    int lval_lines     = img_height_bmp;
    int image_width    = img_width_bmp;
    bit ImTyTest       = ImTyTest_en_patten;
    bit rImage         = rImage_disable; 
    bit fval           = fval_l;
    bit lval           = lval_l;

    //Declare analysis port
    uvm_analysis_port #(d5m_camera_transaction) d5m_mon_prd;

    protected d5m_camera_transaction predict_d5m_txn,predict_d5m;
    
    `uvm_component_utils_begin(d5m_monitor_predict)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    
    covergroup d5m_predict_cg;
    red_predict_cp : coverpoint predict_d5m_txn.vfp.red {
        bins red_000_025_darker     = {0,25};
        bins red_026_050_dark       = {26,50};
        bins red_051_100_med_dark   = {51,100};
        bins red_101_150_medium     = {101,150};
        bins red_151_200_med_light  = {151,200};
        bins red_201_255_light      = {201,255};
    }
    green_predict_cp : coverpoint predict_d5m_txn.vfp.green {
        bins grn_000_025_darker     = {0,25};
        bins grn_026_050_dark       = {26,50};
        bins grn_051_100_med_dark   = {51,100};
        bins grn_101_150_medium     = {101,150};
        bins grn_151_200_med_light  = {151,200};
        bins grn_201_255_light      = {201,255};
    }
    blue_predict_cp : coverpoint predict_d5m_txn.vfp.blue {
        bins blu_000_025_darker     = {0,25};
        bins blu_026_050_dark       = {26,50};
        bins blu_051_100_med_dark   = {51,100};
        bins blu_101_150_medium     = {101,150};
        bins blu_151_200_med_light  = {151,200};
        bins blu_201_255_light      = {201,255};
    }
    red_destination_cp : coverpoint d5m_camera_vif.d5m.rgb[7:0] {
        bins red_000_000_black      = {0}       iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins red_001_025_darker     = {1,25}    iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins red_026_050_dark       = {26,50}   iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins red_051_100_med_dark   = {51,100}  iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins red_101_150_medium     = {101,150} iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins red_151_200_med_light  = {151,200} iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins red_201_255_light      = {201,254} iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins red_255_255_white      = {255}     iff(d5m_camera_vif.d5m.lvalid == 1'b1);
    }
    green_destination_cp : coverpoint d5m_camera_vif.d5m.rgb[15:8] {
        bins grn_000_000_black      = {0}       iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins grn_001_025_darker     = {1,25}    iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins grn_026_050_dark       = {26,50}   iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins grn_051_100_med_dark   = {51,100}  iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins grn_101_150_medium     = {101,150} iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins grn_151_200_med_light  = {151,200} iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins grn_201_255_light      = {201,254} iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins grn_255_255_white      = {255}     iff(d5m_camera_vif.d5m.lvalid == 1'b1);
    }
    blue_destination_cp : coverpoint d5m_camera_vif.d5m.rgb[23:16] {
        bins blu_000_000_black      = {0}       iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins blu_001_025_darker     = {1,25}    iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins blu_026_050_dark       = {26,50}   iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins blu_051_100_med_dark   = {51,100}  iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins blu_101_150_medium     = {101,150} iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins blu_151_200_med_light  = {151,200} iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins blu_201_255_light      = {201,254} iff(d5m_camera_vif.d5m.lvalid == 1'b1);
        bins blu_255_255_white      = {255}     iff(d5m_camera_vif.d5m.lvalid == 1'b1);
    }
    xCord_iff_cp : coverpoint predict_d5m_txn.vfp.x[5:0] iff (predict_d5m_txn.vfp.valid ==1'b1){
        option.at_least     = 1;
        option.auto_bin_max = 4;
    }
    yCord_iff_cp : coverpoint predict_d5m_txn.vfp.y[5:0] iff (predict_d5m_txn.vfp.valid ==1'b1){
        option.at_least     = 1;
        option.auto_bin_max = 4;
    }
    cross_iff_rgb  : cross      red_predict_cp,     green_predict_cp,     blue_predict_cp,     xCord_iff_cp, yCord_iff_cp;
    endgroup: d5m_predict_cg

    // Function: new
    function new (string name, uvm_component parent);
        super.new(name, parent);
        choices            = rgb_incrementer; //rgb_051_100_med_dark
        d5m_cell_box_predict_pkts = cell_box::type_id::create("d5m_cell_box_predict_pkts");

        // Create an instance of the analysis port
        d5m_mon_prd = new("d5m_mon_prd", this);
        d5m_predict_cg = new;
    endfunction: new
    // Function: build_phase
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        // Get virtual interface handle from the configuration DB
        if(!uvm_config_db#(virtual d5m_camera_if)::get(this, "", "d5m_camera_vif", d5m_camera_vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(), ".d5m_camera_vif"});
    endfunction: build_phase
    // Method:  run_phase
    virtual task run_phase (uvm_phase phase);
        fork
            collect_transactions();
        join
    endtask: run_phase
    // Method:  collect_transactions
    virtual protected task collect_transactions();
        // Placeholder to capture transaction information.
        d5m_camera_transaction predict_d5m;
        predict_d5m        = d5m_camera_transaction::type_id::create("predict_d5m"); 
        d5m_cell_box_predict_pkts.re_gen_cell_box(lval_lines,image_width,set_cell_red_value,set_cell_gre_value,set_cell_blu_value,set_increment_value,choices);

        forever begin
        @(posedge d5m_camera_vif.clkmm)
           // if(d5m_camera_vif.d5m.valid==1'b1) begin
                predict_d5m.vfp.red   = d5m_cell_box_predict_pkts.c_blocker.c_rows[d5m_camera_vif.d5m.y].c_block[d5m_camera_vif.d5m.x].red;
                predict_d5m.vfp.green = d5m_cell_box_predict_pkts.c_blocker.c_rows[d5m_camera_vif.d5m.y].c_block[d5m_camera_vif.d5m.x].gre;
                predict_d5m.vfp.blue  = d5m_cell_box_predict_pkts.c_blocker.c_rows[d5m_camera_vif.d5m.y].c_block[d5m_camera_vif.d5m.x].blu;
                predict_d5m.vfp.x     = d5m_camera_vif.d5m.x;
                predict_d5m.vfp.y     = d5m_camera_vif.d5m.y;
                predict_d5m.vfp.valid = d5m_camera_vif.d5m.valid;
                predict_d5m_txn       = predict_d5m;
                d5m_predict_cg.sample();
                //Send the transaction to the analysis port
                d5m_mon_prd.write(predict_d5m);
          //  end
        end
        
    endtask: collect_transactions

endclass: d5m_monitor_predict