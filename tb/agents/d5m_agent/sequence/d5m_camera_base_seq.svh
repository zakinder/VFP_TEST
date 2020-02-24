// UVM_SEQUENCE : d5m_camera_BASE_SEQ [d5m_camera]
virtual class d5m_camera_base_seq extends uvm_sequence #(d5m_camera_transaction);
  `uvm_object_utils(d5m_camera_base_seq)
int status;
int status1;
  function new (string name="d5m_camera_base_seq");
      super.new(name);
  endfunction
  function void SetStatus(input int a);
    status  = a + 100;
    `uvm_info(get_type_name(),$psprintf("status %0x", status), UVM_LOW)
  endfunction
  virtual function void Set1Status(input int a);
    status1  = a + 100;
    `uvm_info(get_type_name(),$psprintf("Set1Status %0x", status1), UVM_LOW)
  endfunction
endclass: d5m_camera_base_seq
class Packet extends uvm_object;
rand bit[15:0]   m_addr;
// Function is used to return contents of this class in a 
// string format
virtual function string convert2string();
  string contents;
  contents = $sformatf("m_addr=0x%0h", m_addr);
endfunction
`uvm_object_utils(Packet)
// Implementation of "do_copy". A generic uvm_object called "rhs"
// is received and type casted into Packet called "_pkt". Then 
// m_addr is copied from _pkt to the variable in current class
virtual function void do_copy(uvm_object rhs);
  Packet _pkt;
  super.do_copy(rhs);
  $cast(_pkt, rhs);
   m_addr = _pkt.m_addr;
  `uvm_info(get_name(), "In Packet::do_copy()", UVM_LOW)
endfunction
function new(string name = "Packet");
  super.new(name);
endfunction
endclass
class Object extends uvm_object;
`uvm_object_utils(Object)
  rand e_bool         m_bool;
  rand byte           m_mode;
  rand byte           m_data[4];
  string              m_name;
  rand Packet         m_pkt;
   constraint my_range {  m_mode < 12;
                          m_mode > 9;}
function new(string name = "Object");
  super.new(name);
  m_name = name;
  m_pkt  = Packet::type_id::create("m_pkt");
endfunction
// Function used to return contents of this class in a 
// string format
virtual function string convert2string();
  string contents = "";
  $sformat(contents, "%s m_name=%s", contents, m_name);
  $sformat(contents, "%s m_bool=%s", contents, m_bool.name());
  $sformat(contents, "%s m_mode=0x%0h", contents, m_mode);
  return contents;
endfunction
// "rhs" does not contain m_bool, m_mode, etc since its a parent
// handle. So cast into child data type and access using child handle
// Copy each field from the casted handle into local variables
virtual function void do_copy(uvm_object rhs);
  Object _obj;
  super.do_copy(rhs);
  $cast(_obj, rhs);
  m_bool   = _obj.m_bool;
  m_mode   = _obj.m_mode;
  m_data   = _obj.m_data;
  m_name   = _obj.m_name;
  m_pkt.copy(_obj.m_pkt);
  `uvm_info(get_name(), "In Object::do_copy()", UVM_LOW)
endfunction
endclass