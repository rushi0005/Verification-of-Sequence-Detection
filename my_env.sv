class my_env extends uvm_env ;
  `uvm_component_utils(my_env)
  
  my_agent a0 ;
  my_scoreboard sb ; 
  
  function new(string name = "env", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    a0 = my_agent :: type_id :: create("a0", this);
    sb = my_scoreboard :: type_id :: create("sb",this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    a0.mon.collection.connect(sb.trans_in);
  endfunction
endclass