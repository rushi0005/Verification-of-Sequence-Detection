//this is scoreboard for sequence detector

class my_scoreboard extends uvm_scoreboard ;
  `uvm_component_utils(my_scoreboard)
  
  bit [3:0] r_pattern = 4'b1011 ;
  bit [3:0] a_pattern ;
  bit 		exp_out   ;
  
  uvm_analysis_imp #(data_item,my_scoreboard) trans_in ;
  
  function new (string name = "",uvm_component parent);
    super.new(name,parent);
    trans_in = new("trans_in",this);
  endfunction
  
  virtual function write (data_item item);
    a_pattern = a_pattern << 1 | item.in ;
    `uvm_info("SCBD", $sformatf("in = %0d, out = %0d, pattern = 4b'%0b", item.in,item.out, a_pattern),UVM_LOW)
    
    if(!(r_pattern ^ a_pattern)) begin
      `uvm_info("SCBD", $sformatf("pattern found"), UVM_LOW)
      exp_out = 1 ;
    end
    else begin
      exp_out = 0 ;
    end
    if (item.out != exp_out) begin
      `uvm_error("scbd", $sformatf ("Error out = %0d and exp=%0d miss_match",item.out,exp_out))
    end
    else begin
      //$display("exp_out %0d and out = %0d", exp_out,item.out);
      `uvm_info("scbd", $sformatf (" out = %0d and exp=%0d miss_match",item.out,exp_out),UVM_HIGH)
    end
  endfunction
  
endclass
  
  