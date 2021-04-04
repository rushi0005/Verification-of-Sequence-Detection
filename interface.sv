//This is interface for pattern detecter


interface intf (input logic clk );
  //logic rst ;
  logic in   ;
  logic out ;
  
  clocking cb @(posedge clk);
    default input #1ns output #2ns ;
    	input out ;
    	output in ;
  endclocking
endinterface

  