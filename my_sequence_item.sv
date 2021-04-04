//this is sequence item for pattern detect

class data_item extends uvm_sequence_item ;
  `uvm_object_utils(data_item)
  rand bit in  ;
  	   bit out ;
  
  function new(string name = "data_item");
    super.new(name);
  endfunction
  
  constraint c1 {in dist {0:/20,1:/80};}
  
endclass
  
  