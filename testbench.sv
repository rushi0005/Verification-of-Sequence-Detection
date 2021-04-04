// Code your testbench here
// or browse Examples
`include "interface.sv"
package silly ;
	import uvm_pkg :: * ;
	`include "my_sequence_item.sv"
	`include "my_sequence.sv"
	`include "my_sequencer.sv"
	`include "my_driver.sv"
	`include "my_monitor.sv"
	`include "my_scoreboard.sv"
	`include "my_agent.sv"
	`include "my_env.sv"
	`include "my_test.sv"
endpackage
module top ();
  import uvm_pkg :: * ;
  logic clk ;
  logic rst ;
  intf int_f(clk);
  seq_det dut(.clk(clk), .rst(rst),.in(int_f.in), .out(int_f.out));
  //DUT instantiation
  initial begin
    clk = 0 ;
    forever begin
      #5 clk = ~clk ;
    end
  end
  initial begin
    rst = 0 ;
    #3 rst = 1 ;
  end  
 initial begin
   uvm_config_db#(virtual intf) :: set(null, "db", "int_f", int_f);  //config db
  run_test("my_test");
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
//`include "design.sv"