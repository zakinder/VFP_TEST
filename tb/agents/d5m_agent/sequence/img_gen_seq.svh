class img_gen_seq extends uvm_sequence #(d5m_trans);
    `uvm_object_utils(img_gen_seq)
    function new(string name="img_gen_seq");
        super.new(name);
    endfunction
    virtual task body();
        d5m_trans item;
        `uvm_create(item)
        item.d5p.iImageTypeTest = 1'b0;
        item.d5m_txn            = IMAGE_READ;
        `uvm_send(item);
    endtask: body
endclass: img_gen_seq