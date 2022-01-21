// Class: img_base_seq
virtual class img_base_seq extends uvm_sequence #(d5m_trans);
  `uvm_object_utils(img_base_seq)
    // Function: new
    function new (string name="img_base_seq");
        super.new(name);
    endfunction
endclass: img_base_seq