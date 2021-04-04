module seq_det(clk,rst,in,out);
  input in,clk,rst ;
  output out ;
  
  
  
  reg [2:0] state, nextstate ;
  parameter s0 = 3'd0 ;
  parameter s1 = 3'd1 ;
  parameter s2 = 3'd2 ;
  parameter s3 = 3'd3 ;
  parameter s4 = 3'd4 ;
  
  assign out = state == s4 ? 1 : 0 ;
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
      s0 : if (in == 1) begin
        	nextstate = s1 ;
            //out = 1'b0 ;
      end
      else begin
        nextstate = s0 ;
        //out = 1'b0 ;
      end
      s1 : if (in==0) begin
        nextstate = s2 ;
        //out = 1'b0 ;
      end
      else begin
        nextstate = s1 ;
        //out = 1'b0 ;
      end
      s2 : if (in==1) begin
        nextstate = s3 ;
        //out = 1'b0 ;
      end
      else begin
        nextstate = s0 ;
        //out = 1'b0 ;
      end
      s3 : if (in == 1 ) begin
        
        nextstate = s4 ;
        //out = 1'b1 ;
      end
      else begin
        nextstate = s2 ;
        //out = 1'b0 ;
      end
      s4 : nextstate = s1 ;
    endcase
  end
endmodule
