module bidir_shift_reg #(parameter MSB=8) (
  input d,
  input clk,
  input en,
  input dir,
  input circular,
  input rstn,
  input carry_in,
  output reg [MSB-1:0] out,
  output reg carry_out
);

  always @(posedge clk) begin
    if (!rstn) begin
      out <= 0;       // reset the output
      carry_out <= 0; // reset the carry_out
    end
    else begin
      if (en) begin
        if (circular) begin
          // executes circular shift register if circular=1
          carry_out <= out[0];
          if (dir)
            // performs left shift operation when dir=1
            out <= {out[MSB-2:0], out[MSB-1]};  // left shift operation
          else
            // performs right shift operation when dir=0
            out <= {out[0], out[MSB-1:1]};      // right shift operation
        end
        else begin
          // executes shift register if circular=0
          if (dir) begin              
            // performs left shift operation when dir=1
            carry_out <= out[MSB-1];  // sets the output bit
            out <= {out[MSB-2:0], d}; // left shift operation
          end
          else begin                  
            // performs right shift operation when dir=0
            carry_out <= out[0];      // sets the output bit
            out <= {d, out[MSB-1:1]}; // right shift operation
          end
        end
      end 
      else begin
        out <= out;             // no change in output 
        carry_out <= carry_in;  // carry_out is set to carry_in
      end
    end
  end



endmodule


