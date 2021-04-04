class my_test extends uvm_test ;
  `uvm_component_utils(my_test);
  
  function new(string name = "",uvm_component parent);
    super.new(name,parent);
  endfunction

  my_env e0 ;
  my_sequence seq ;
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    e0 = my_env :: type_id :: create("e0",this);
    seq = my_sequence :: type_id :: create("seq",this);
  endfunction

  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.start(e0.a0.sqr);
    phase.drop_objection(this);
  endtask
endclass