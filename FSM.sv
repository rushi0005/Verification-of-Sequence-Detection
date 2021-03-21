// Code your testbench here
// or browse Examples
module seq_det(x,o,clk,rst);
  input x,clk,reset ;
  output o ;
  
  reg [2:0] state, nextstate ;
  parameter s0 = 3'd0 ;
  parameter s1 = 3'd1 ;
  parameter s2 = 3'd2 ;
  parameter s3 = 3'd3 ;
  parameter s4 = 3'd4 ;
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= s0 ;
      nextstate <= s0;
    end
    else 
      state <= nextstate ;
  end
  
  always @(*) begin
    case(state)
      s0 : if (x == 1) begin
        	nextstate = s1 ;
            o = 1'b0 ;
      end
      else begin
        nextstate = s0 ;
        o = 1'b0 ;
      end
      s1 : if (x==0) begin
        nextstate = s2 ;
        o = 1'b0 ;
      end
      else begin
        nextstate = s1 ;
        o = 1'b0 ;
      end
      
      s2 : if (x==1) begin
        nextstate = s3 ;
        o = 1'b0 ;
      end
      else begin
        nextstate = s0 ;
        o = 1'b0 ;
      end
      
      s3 : if (x == 1 ) begin
        
        nextstate = s4 ;
        o = 1'b0 ;
      end
      
      else begin
        nextstate = s2 ;
        o = 1'b0 ;
      end
      
      s4 : if (x==1) begin
        nextstate = s1 ;
        o = 1'b0 ;
      end
      else begin
      nextstate = s2   
      o = 1'b1 ;
      end
    endcase
  end
endmodule
