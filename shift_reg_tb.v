module shift_reg_tb;
   parameter MSB = 8;        // [Optional] Declare a parameter to represent number of bits in shift register  
  reg d, clk, en, dir, circular, rstn;
  wire [MSB-1:0] out;
  
  // Instantiate the shift_reg module
  bidir_shift_reg #(MSB) dut (
    .d(d),
    .clk(clk),
    .en(en),
    .dir(dir),
    .circular(circular),
    .rstn(rstn),
    .out(out)
  );
  initial begin
      $dumpfile("shift_tb_sr.vcd");
        $dumpvars(0, shift_reg_tb);
   end

  // Clock generator
  always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end
  
  // Initialize inputs
  initial begin
    d = 0;
    en = 0;
    dir = 0;
    circular = 0;
    rstn = 0;
    
    // Apply reset
    rstn = 0;
    #10;
    rstn = 1;
    
    // Test case 1: Bidirectional shift to the left
    #10;
    en = 1;
    dir = 0;
    d = 1;
    #10;
    d = 0;
    #10;
    
    // Test case 2: Bidirectional shift to the right
    dir = 1;
    d = 1;
    #10;
    d = 0;
    #10;
    
    // Test case 3: Circular shift to the left
    circular = 1;
    dir = 0;
    d = 1;
    #10;
    d = 0;
    #10;
    
    // Test case 4: Circular shift to the right
    dir = 1;
    d = 1;
    #10;
    d = 0;
    #10;
    
    // End simulation
    $finish;
    

  end
  always @(posedge clk) begin
        // display the value of the shift register, out, circular, dir
        $display("out = %b, circular = %b, dir = %b", out, circular, dir);
  end
  
endmodule
