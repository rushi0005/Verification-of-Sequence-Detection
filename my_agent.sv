class my_agent extends uvm_agent ;
  `uvm_component_utils(my_agent)
  
  function new (string name = "my_agent", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  my_driver drv;
  my_monitor mon ;
  my_sequencer sqr ;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = my_driver :: type_id :: create("drv",this);
    mon = my_monitor :: type_id :: create("mon",this);
    sqr = my_sequencer :: type_id :: create("sqr",this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction
  
  
endclass