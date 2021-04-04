//this is driver for pattern detecter

class my_driver extends uvm_driver #(data_item) ;
  `uvm_component_utils(my_driver)
  
 virtual intf vif ;
 //data_item req ; 
  function new (string name = "my_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(virtual intf) :: get(null, "db", "int_f", vif)) begin
   		`uvm_fatal("Error in driver", "driver cannot get interface");
    end
  endfunction
  
  virtual task run_phase (uvm_phase phase);
    super.run_phase(phase);
   
    forever begin
      data_item req ;
      seq_item_port.get_next_item(req);
      drive(req);
      seq_item_port.item_done();
    end
  endtask
  
  virtual task drive (data_item req);
    @(vif.cb);
   vif.cb.in <= req.in;
  endtask
endclass
      