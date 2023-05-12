# shift_register_verilog
The aim of this project is to design vlsi layout of shift register using open source eda tools

You should install iverilog. To install follow this link
    https://www.geeksforgeeks.org/how-to-install-verilog-hdl-on-linux/
###    
run these commands in the project directory after clonning
   
    iverilog final.v final_tb.v
    vvp a.out

you can generate dumpfile to see the waveform

to generate dumpfile add this code in the final_tb.v file

      initial begin
        $dumpfile("shift_tb_sr.vcd");
          $dumpvars(0, shift_reg_tb);
      end
      
and run 

    iverilog final.v final_tb.v
    vvp a.out
    
this will generate a .vcd file.
in that case you need gtkwave.
to install gtkwave run

    sudo apt install gtkwave
    
Now run this from the terminal

    gtkwave
this will open GUI of gtwave.

Now  open the .vcd file using gtkwave GUI
