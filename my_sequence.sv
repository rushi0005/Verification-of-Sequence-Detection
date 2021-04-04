//this is sequence for pattern detect
class my_sequence extends uvm_sequence #(data_item);
  `uvm_object_utils(my_sequence)
  data_item req ;
  
  function new(string name = "my_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat (50) begin
      req = data_item :: type_id :: create ("req");
      wait_for_grant();
      req.randomize();
      send_request(req);
      wait_for_item_done();
    end
  endtask
endclass