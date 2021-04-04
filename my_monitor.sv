class my_monitor extends uvm_monitor ;
  `uvm_component_utils(my_monitor)
  
  virtual intf vif ;
  data_item Item ;
  uvm_analysis_port #(data_item) collection ;
  
  
  function new (string name = "monitor", uvm_component parent);
    super.new(name, parent);
    collection = new("collection",this);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(virtual intf) :: get(null, "db", "int_f", vif)) begin
   		`uvm_fatal("Error in d", "driver cannot get interface");
    end
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin 
      @(vif.cb);
     // if (vif.rst) begin
        Item = data_item :: type_id :: create ("Item",this);
        Item.in = vif.in ;
        Item.out = vif.cb.out ;
        collection.write(Item);
     // end
    end
    
  endtask
  
endclass