class d5m_image_random_sequence extends uvm_sequence #(d5m_camera_transaction);
   `uvm_object_utils(d5m_image_random_sequence);
   d5m_camera_transaction item,s2;
   function new(string name = "d5m_image_random_sequence");
      super.new(name);
   endfunction : new
   virtual task body();
      repeat (1) begin : random_loop
         //create method
         item = d5m_camera_transaction::type_id::create("item");
         s2 = d5m_camera_transaction::type_id::create("s2");
         start_item(item);
          //randomizing the seq_item
         assert(item.randomize());
        //`uvm_info(get_type_name(),$psprintf("convert_A %0x",item.convert_A), UVM_LOW)
        `uvm_info("convert_A", item.convert2string(), UVM_LOW);
        `uvm_info(get_type_name(),$psprintf("convert_axi4_lite %0d",item.axi4_lite.addr), UVM_LOW)
         finish_item(item);
         start_item(s2);
         assert(s2.randomize());
         s2.copy(item);
       // `uvm_info(get_type_name(),$psprintf("convert_B %0x",s2.convert_B), UVM_LOW)
        `uvm_info("convert_B", s2.convert2string(), UVM_LOW);
        `uvm_info(get_type_name(),$psprintf("s1==s2: ",item.compare(s2)), UVM_LOW)
        `uvm_info(get_type_name(),$psprintf("convert_axi4_lite %0d",s2.axi4_lite.addr), UVM_LOW)
         finish_item(s2);
      end : random_loop
    endtask: body
endclass : d5m_image_random_sequence