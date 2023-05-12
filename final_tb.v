module bidir_shift_reg_tb;

  // Parameters
  parameter MSB = 8;

  // Signals
  reg d;
  reg clk;
  reg en;
  reg dir;
  reg circular;
  reg rstn;
  reg carry_in;
  wire [MSB-1:0] out;
  wire carry_out;

  // Instantiate the module
  bidir_shift_reg #(.MSB(MSB)) dut (
    .d(d),
    .clk(clk),
    .en(en),
    .dir(dir),
    .circular(circular),
    .rstn(rstn),
    .carry_in(carry_in),
    .out(out),
    .carry_out(carry_out)
  );

  // Clock generation
  always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end

  // Initial stimulus
  initial begin
    // Initialize inputs
    d = 0;
    en = 1;
    dir = 0;
    circular = 0;
    rstn = 1;
    carry_in = 0;

    // Wait for a few clock cycles
    #10;

    // Testcase 1: Bidirectional Right shift (dir = 0)
    $display("Testcase 1: Bidirectional Right Shift");
    #5;
    d = 1;
    #10;
    d = 1;
    #10;
    d = 1;
    #10;
    d = 0;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;  
    d = 0;
    #10;
    d = 0;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;  
    d = 0;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;
    d = 1;
    #10;
    
    // Testcase 2: Bidirectional Left shift (dir = 0)
    $display("Testcase 2: Bidirectional Left Shift");
    dir = 1;
    
    #5;
    d = 1;
    #10;
    d = 1;
    #10;
    d = 1;
    #10;
    d = 0;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;  
    d = 0;
    #10;
    d = 0;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;  
    d = 0;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;
    d = 1;
    #10;
    

    // Testcase 2: Circular shift (dir = 0, circular = 1)
    $display("Testcase 2: Circular Left Shift");
    dir = 0;
    circular = 1;
    #10;
    d = 1;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;
    d = 1;
    #10;
    d = 1;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;
    d = 1;
    #10;

    // Finish simulation
    $finish;
  end

  // Display output and carry_out on each positive clock edge
  always @(posedge clk) begin
    $display("dir = %b, circular = %b, d = %b, out = %b, carry_out = %b", dir, circular, d, out, carry_out);
  end

endmodule
