module bidir_shift_reg #(parameter MSB=8) (
  input d,
  input clk,
  input en,
  input dir,
  input circular,
  input rstn,
  output reg [MSB-1:0] out
);
always @(posedge clk) begin
  if (!rstn)
    out <= 0;
  else begin
    if (en) begin
      if (circular) begin
        if (dir)
          out <= {out[0], out[MSB-1:1]};
        else
          out <= {out[MSB-2:0], out[MSB-1]};
      end 
      else begin
        if (dir)
          out <= {out[MSB-2:0], d};
        else
          out <= {d, out[MSB-1:1]};
      end
    end 
    else
      out <= out;
  end
end
endmodule
