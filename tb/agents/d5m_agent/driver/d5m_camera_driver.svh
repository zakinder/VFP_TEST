// UVM_DRIVER : d5m_camera_drv [d5m_camera]
// +------------------------+
// |    d5m_camera_driver   |
// |------------------------|
// |                        |
// |                        |
// |                        |
// |                        |
// +------------------------+
class d5m_camera_driver extends uvm_driver #(d5m_camera_transaction);
    protected virtual d5m_camera_if d5m_camera_vif;
    protected int     id;
    `uvm_component_utils_begin(d5m_camera_driver)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        // Get virtual interface d5m_camera_if handle d5m_camera_vif from the configuration DB
        // Get interface reference from config database
        if (!uvm_config_db#(virtual d5m_camera_if)::get(this, "", "d5m_camera_vif", d5m_camera_vif))
        `uvm_fatal("NOVIF", {"virtual interface must be set for: ",get_full_name(), ".d5m_camera_vif"});
    endfunction
    virtual task run_phase (uvm_phase phase);
    // Here fork join constructs are used to separate 
    // threads that drive each of the channels.
        fork
            //reset the signals to dut
            reset_signals();
            // drive data to dut
            d5m_frame();
        join
    endtask: run_phase
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- AXI4LITE WRITE: RESET SIGNALS
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task reset_signals();
        //`uvm_info("AXI4LITE WRITE: RESET SIGNALS", "RESET SIGNALS",UVM_LOW)
        forever begin
        // Reset the required signals when system reset is asserted.
            @(posedge d5m_camera_vif.ARESETN);
            d5m_camera_vif.axi4.AWADDR        <=  8'h0;
            d5m_camera_vif.axi4.AWPROT        <=  3'h0;
            d5m_camera_vif.axi4.AWVALID       <=  1'b0;
            d5m_camera_vif.axi4.WDATA         <= 32'h0;
            d5m_camera_vif.axi4.WSTRB         <=  4'h0;
            d5m_camera_vif.axi4.WVALID        <=  1'b0;
            d5m_camera_vif.axi4.BREADY        <=  1'b0;
            d5m_camera_vif.axi4.ARADDR        <=  8'h0;
            d5m_camera_vif.axi4.ARPROT        <=  3'h0;
            d5m_camera_vif.axi4.ARVALID       <=  1'b0;
            d5m_camera_vif.axi4.RREADY        <=  1'b0;
            d5m_camera_vif.d5p.iImageTypeTest <=  1'b0;
            d5m_camera_vif.d5p.iReadyToRead   <=  1'b0;
            d5m_camera_vif.d5p.fvalid         <=  1'b0;
            d5m_camera_vif.d5p.lvalid         <=  1'b0;
        end
    endtask: reset_signals
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- GET_AND_DRIVE
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task d5m_frame();
        forever begin
        // drive the signals from defined seq in uvm_sequence.
            @(posedge d5m_camera_vif.clkmm);
            //Get next item from the sequencer
            seq_item_port.get_next_item(req);
            drive_transfer(req);
            // Tell the sequence that driver has finished current item
            seq_item_port.item_done();
        end
    endtask: d5m_frame
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- DRIVE READ DATA CHANNEL
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_transfer (d5m_camera_transaction d5m_tx);
        // drive the address channels
        drive_address_phase(d5m_tx);
        // drive the data of given address in address channels
        drive_data_phase(d5m_tx);
        //reads_d5m_phase(d5m_tx);
    endtask: drive_transfer
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- DRIVE READ DATA CHANNEL
    //------------------------------------------------------------------------------------
    //====================================================================================
   virtual protected task reads_d5m_phase (d5m_camera_transaction d5m_tx);
            d5m_tx.d5m.valid                   <= d5m_camera_vif.d5m.valid;
            d5m_tx.d5m.red                     <= d5m_camera_vif.d5m.red;
            d5m_tx.d5m.green                   <= d5m_camera_vif.d5m.green;
            d5m_tx.d5m.blue                    <= d5m_camera_vif.d5m.blue;
            d5m_tx.d5m.rgb                     <= d5m_camera_vif.d5m.rgb;
            d5m_tx.d5m.lvalid                  <= d5m_camera_vif.d5m.lvalid;
            d5m_tx.d5m.fvalid                  <= d5m_camera_vif.d5m.fvalid;
            d5m_tx.d5m.x                       <= d5m_camera_vif.d5m.x;
            d5m_tx.d5m.y                       <= d5m_camera_vif.d5m.y;
            d5m_tx.d5m.eof                     <= d5m_camera_vif.d5m.eof;
            //d5m_tx.axi4                        <= d5m_camera_vif.axi4;
   endtask: reads_d5m_phase
    virtual protected task drive_address_phase (d5m_camera_transaction d5m_tx);
        case (d5m_tx.d5m_txn)
            AXI4_WRITE : drive_write_address_channel(d5m_tx);
            AXI4_READ  : drive_read_address_channel(d5m_tx);
            D5M_WRITE  : d5m_data_phase(d5m_tx);
            IMAGE_READ : read_d5m_phase(d5m_tx);
        endcase
    endtask: drive_address_phase
    virtual protected task drive_data_phase (d5m_camera_transaction d5m_tx);
        bit[31:0] rw_data;
        bit err;
        rw_data = d5m_tx.axi4_lite.data;
        case (d5m_tx.d5m_txn)
            AXI4_WRITE : drive_write_data_channel(d5m_tx);
            AXI4_READ  : drive_read_data_channel(rw_data, err);
            D5M_WRITE  : d5m_data_phase(d5m_tx);
            IMAGE_READ : read_d5m_phase(d5m_tx);
        endcase    
    endtask: drive_data_phase
    virtual protected task read_d5m_phase(d5m_camera_transaction d5m_tx);
            @(posedge d5m_camera_vif.clkmm);
            d5m_camera_vif.d5p.iImageTypeTest  <= 1'b0;
            d5m_camera_vif.d5p.iReadyToRead    <= 1'b1;
            d5m_tx.d5m.valid                   <= d5m_camera_vif.d5m.valid;
            d5m_tx.d5m.red                     <= d5m_camera_vif.d5m.red;
            d5m_tx.d5m.green                   <= d5m_camera_vif.d5m.green;
            d5m_tx.d5m.blue                    <= d5m_camera_vif.d5m.blue;
            d5m_tx.d5m.rgb                     <= d5m_camera_vif.d5m.rgb;
            d5m_tx.d5m.lvalid                  <= d5m_camera_vif.d5m.lvalid;
            d5m_tx.d5m.fvalid                  <= d5m_camera_vif.d5m.fvalid;
            d5m_tx.d5m.x                       <= d5m_camera_vif.d5m.x;
            d5m_tx.d5m.y                       <= d5m_camera_vif.d5m.y;
            d5m_tx.d5m.eof                     <= d5m_camera_vif.d5m.eof;
        forever begin
            @(posedge d5m_camera_vif.clkmm);
            if (d5m_camera_vif.d5m.eof) break;
        end
    endtask: read_d5m_phase
    virtual protected task d5m_data_phase (d5m_camera_transaction d5m_tx);
        bit[23:0] rw_data;
        bit err;
        bit ifvalid;
        bit ilvalid;
        bit iImageTypeTest;
        ifvalid          = d5m_tx.d5p.fvalid;
        ilvalid          = d5m_tx.d5p.lvalid;
        iImageTypeTest   = d5m_tx.d5p.iImageTypeTest;
        rw_data          = d5m_tx.d5p.rgb;
        d5m_write_idata(rw_data,ilvalid,ifvalid,iImageTypeTest, err);
    endtask: d5m_data_phase
    virtual protected task d5m_write_idata (bit[23:0] iRgb,bit ilvalid,bit ifvalid,bit iImageTypeTest, output bit error);
        d5m_camera_vif.d5p.iReadyToRead   <= 1'b0;
        d5m_camera_vif.d5p.iImageTypeTest <= iImageTypeTest;
        d5m_camera_vif.d5p.rgb            <= iRgb;
        d5m_camera_vif.d5p.fvalid         <= ifvalid;
        d5m_camera_vif.d5p.lvalid         <= ilvalid;
       // `uvm_info("RGB_DATA", $sformatf("rgb=%0d,fvalid=%0d,lvalid=%0d\n",d5m_camera_vif.d5p.rgb,d5m_camera_vif.d5p.fvalid,d5m_camera_vif.d5p.lvalid), UVM_LOW)
    endtask: d5m_write_idata

    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- AXI4LITE WRITE ADDRESS
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_write_address_channel (d5m_camera_transaction d5m_tx);
        int axi_lite_ctr;
        d5m_camera_vif.axi4.AWADDR  <= {8'h0, d5m_tx.axi4_lite.addr};
        d5m_camera_vif.axi4.AWPROT  <= 3'h0;
        d5m_camera_vif.axi4.AWVALID <= 1'b1;
        //wait for write response
        for(axi_lite_ctr = 0; axi_lite_ctr <= 62; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.clkmm);
            if (d5m_camera_vif.axi4.BVALID) break;
        end
        if (axi_lite_ctr == 62) begin
            `uvm_error("axi_lite_master_driver","AWVALID timeout");
        end    
    endtask: drive_write_address_channel
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- AXI4LITE WRITE DATA
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_write_data_channel (d5m_camera_transaction d5m_tx);
        int axi_lite_ctr;
        d5m_camera_vif.axi4.WDATA  <= d5m_tx.axi4_lite.data;
        d5m_camera_vif.axi4.WSTRB  <= 4'hf;
        d5m_camera_vif.axi4.WVALID <= 1'b1;
        @(posedge d5m_camera_vif.clkmm);
            for(axi_lite_ctr = 0; axi_lite_ctr <= 62; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.clkmm);
            //------------------------------
            if (d5m_camera_vif.axi4.WREADY) 
                d5m_camera_vif.axi4.AWADDR  <= 8'h0;
                d5m_camera_vif.axi4.AWPROT  <= 3'h0;
                d5m_camera_vif.axi4.AWVALID <= 1'b0; 
            break;
            //------------------------------
            end
            if (axi_lite_ctr == 62) begin
            `uvm_error("axi_lite_master_driver","AWVALID timeout");
            end
        @(posedge d5m_camera_vif.clkmm);
            d5m_camera_vif.axi4.WDATA  <= 32'h0;
            d5m_camera_vif.axi4.WSTRB  <= 4'h0;
            d5m_camera_vif.axi4.WVALID <= 1'b0;
        //wait for write response
        for(axi_lite_ctr = 0; axi_lite_ctr <= 62; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.clkmm);
            if (d5m_camera_vif.axi4.BVALID) break;
        end
        if (axi_lite_ctr == 62) begin
            `uvm_error("axi_lite_master_driver","BVALID timeout");
        end
        else begin
            if (d5m_camera_vif.axi4.BVALID == 1'b1 && d5m_camera_vif.axi4.BRESP != 2'h0)
            `uvm_error("axi_lite_master_driver","Received ERROR Write Response");
            d5m_camera_vif.axi4.BREADY <= d5m_camera_vif.axi4.BVALID;
         @(posedge d5m_camera_vif.clkmm);
        end
    endtask: drive_write_data_channel
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- AXI4LITE WRITE READ ADDRESS
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_read_address_channel (d5m_camera_transaction d5m_tx);
        int axi_lite_ctr;
        d5m_camera_vif.axi4.ARADDR  <= {8'h0, d5m_tx.axi4_lite.addr};
        d5m_camera_vif.axi4.ARPROT  <= 3'h0;
        d5m_camera_vif.axi4.ARVALID <= 1'b1;
        for(axi_lite_ctr = 0; axi_lite_ctr <= 62; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.clkmm);
            if (d5m_camera_vif.axi4.ARREADY) break;
        end
        if (axi_lite_ctr == 62) begin
            `uvm_error("axi_lite_master_driver","ARVALID timeout");
        end
        @(posedge d5m_camera_vif.clkmm);
            d5m_camera_vif.axi4.ARADDR  <= 8'h0;
            d5m_camera_vif.axi4.ARPROT  <= 3'h0;
            d5m_camera_vif.axi4.ARVALID <= 1'b0;    
    endtask: drive_read_address_channel
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- AXI4LITE READ DATA
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_read_data_channel (output bit [31:0] data, output bit error);
        int axi_lite_ctr;
        for(axi_lite_ctr = 0; axi_lite_ctr <= 62; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.clkmm);
            if (d5m_camera_vif.axi4.RVALID) break;
        end
        data = d5m_camera_vif.axi4.RDATA;
        if (axi_lite_ctr == 62) begin
            `uvm_error("axi_lite_master_driver","RVALID timeout");
        end
        else begin
        if (d5m_camera_vif.axi4.RVALID == 1'b1 && d5m_camera_vif.axi4.RRESP != 2'h0)
            `uvm_error("axi_lite_master_driver","Received ERROR Read Response");
            d5m_camera_vif.axi4.RREADY <= d5m_camera_vif.axi4.RVALID;
            @(posedge d5m_camera_vif.clkmm);
        end
    endtask: drive_read_data_channel
endclass: d5m_camera_driver