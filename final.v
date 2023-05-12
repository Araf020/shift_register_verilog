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
      out <= 0;
      carry_out <= 0;
    end
    else begin
      if (en) begin
        // circular shift
        if (circular) begin
          carry_out <= out[0];
          if (dir)
            out <= {out[0], out[MSB-1:1]};
          else
            out <= {out[MSB-2:0], out[MSB-1]};
        end 
        else begin
          // left shift
          if (dir) begin              
            carry_out <= out[MSB-1];
            out <= {out[MSB-2:0], d};
          end
          // right shift
          else begin                  
            carry_out <= out[0];
            out <= {d, out[MSB-1:1]};
          end
        end
      end 
      else begin
        out <= out;
        carry_out <= carry_in;
      end
    end
  end
  
endmodule