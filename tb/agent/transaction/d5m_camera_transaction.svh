    `define IMAGE_CONFIG(value1,value2) value1 == value2;
class d5m_camera_transaction extends uvm_sequence_item;
    //-------------------------------
    //imageReadInterface
    //-------------------------------
    rgb_channel         vfp;
    rgb_channel         d5m;
    cof_channel         cof;
    axi4_lite_channel   axi4_lite;
    d5m_interconnect    d5m_inf;
    pattern_channel     d5p;
    //-------------------------------
    constraint cof_image_width   {`IMAGE_CONFIG(cof.image_width,frame_width)  }
    constraint cof_lval_offset   {`IMAGE_CONFIG(cof.lval_offset,lvalid_offset)}
    constraint cof_lval_lines    {`IMAGE_CONFIG(cof.lval_lines,frame_height)  }
    constraint cof_number_frames {`IMAGE_CONFIG(cof.number_frames,num_frames) }
    //-------------------------------
    rand d5m_txn_e      d5m_txn;
    function new (string name = "");
        super.new(name);
    endfunction
    `uvm_object_utils_begin(d5m_camera_transaction)
        `uvm_field_int  (vfp.valid,                     UVM_DEFAULT);
        `uvm_field_int  (vfp.lvalid,                    UVM_DEFAULT);
        `uvm_field_int  (vfp.fvalid,                    UVM_DEFAULT);
        `uvm_field_int  (vfp.eof,                       UVM_DEFAULT);
        `uvm_field_int  (vfp.sof,                       UVM_DEFAULT);
        `uvm_field_int  (vfp.red,                       UVM_DEFAULT);
        `uvm_field_int  (vfp.green,                     UVM_DEFAULT);
        `uvm_field_int  (vfp.blue,                      UVM_DEFAULT);
        `uvm_field_int  (vfp.x,                         UVM_DEFAULT);
        `uvm_field_int  (vfp.y,                         UVM_DEFAULT);
        `uvm_field_int  (d5m.valid,                     UVM_DEFAULT);
        `uvm_field_int  (d5m.lvalid,                    UVM_DEFAULT);
        `uvm_field_int  (d5m.fvalid,                    UVM_DEFAULT);
        `uvm_field_int  (d5m.eof,                       UVM_DEFAULT);
        `uvm_field_int  (d5m.sof,                       UVM_DEFAULT);
        `uvm_field_int  (d5m.red,                       UVM_DEFAULT);
        `uvm_field_int  (d5m.green,                     UVM_DEFAULT);
        `uvm_field_int  (d5m.blue,                      UVM_DEFAULT);
        `uvm_field_int  (d5m.x,                         UVM_DEFAULT);
        `uvm_field_int  (d5m.y,                         UVM_DEFAULT);
        `uvm_field_int  (cof.lval_offset,               UVM_DEFAULT);
        `uvm_field_int  (cof.lval_lines,                UVM_DEFAULT);
        `uvm_field_int  (cof.number_frames,             UVM_DEFAULT);
        `uvm_field_int  (cof.image_width,               UVM_DEFAULT);
        `uvm_field_int  (d5p.iReadyToRead,              UVM_DEFAULT);
        `uvm_field_int  (d5p.iImageTypeTest,            UVM_DEFAULT);
        `uvm_field_int  (d5p.valid,                     UVM_DEFAULT);
        `uvm_field_int  (d5p.lvalid,                    UVM_DEFAULT);
        `uvm_field_int  (d5p.fvalid,                    UVM_DEFAULT);
        `uvm_field_int  (d5p.eof,                       UVM_DEFAULT);
        `uvm_field_int  (d5p.sof,                       UVM_DEFAULT);
        `uvm_field_int  (d5p.rgb,                       UVM_DEFAULT);
        `uvm_field_int  (d5p.x,                         UVM_DEFAULT);
        `uvm_field_int  (d5p.y,                         UVM_DEFAULT);
        `uvm_field_int  (axi4_lite.addr,                UVM_DEFAULT);
        `uvm_field_int  (axi4_lite.data,                UVM_DEFAULT);
        `uvm_field_enum (d5m_txn_e, d5m_txn,            UVM_DEFAULT); 
    `uvm_object_utils_end
endclass: d5m_camera_transaction