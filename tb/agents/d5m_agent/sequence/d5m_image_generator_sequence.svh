// Class: d5m_image_generator_sequence
class d5m_image_generator_sequence extends uvm_sequence #(d5m_camera_transaction);
    `uvm_object_utils(d5m_image_generator_sequence)
    // Function: new
    function new(string name="d5m_image_generator_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        `uvm_create(item)
        item.d5p.iImageTypeTest = 1'b0;
        item.d5m_txn            = IMAGE_READ;
        `uvm_send(item);
    endtask: body
endclass: d5m_image_generator_sequence