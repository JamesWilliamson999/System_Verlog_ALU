module testbench();
  logic [15:0] instruction;
  logic signed [15:0] register [15:0];
 
 
 initial begin
   //loads reg 0
   instruction = 16'b1111_0000_0000_0010;
   #1;
   $display("Reg[%0d]:%0d",instruction[11:8],register[instruction[11:8]]);
   //loads reg 1
   instruction = 16'b1111000100000111;
   #1;
   $display("Reg[%0d]:%0d",instruction[11:8],register[instruction[11:8]]);
   //tests adder
   instruction = 16'b0000_0000_0001_0011;
	#1;
   $display("%0d + %0d = %0d",register[instruction[11:8]],register[instruction[7:4]],register[instruction[3:0]]);
   //tests sub
   instruction = 16'b0001_0000_0001_0011;
	#1;
   $display("%0d + %0d = %0d",register[instruction[11:8]],register[instruction[7:4]],register[instruction[3:0]]);
    //tests mulit
   instruction = 16'b0010_0000_0001_0011;
	#1;
   $display("%0d * %0d = %0d",register[instruction[11:8]],register[instruction[7:4]],register[instruction[3:0]]);
       //tests AND
   instruction = 16'b0011_0000_0001_0011;
	#1;
   $display("%0b & %0b = %0b",register[instruction[11:8]],register[instruction[7:4]],register[instruction[3:0]]);
     //tests Or
   instruction = 16'b0100_0000_0001_0011;
	#1;
   $display("%0b | %0b = %0b",register[instruction[11:8]],register[instruction[7:4]],register[instruction[3:0]]);
   //tests Xor
   instruction = 16'b0101_0000_0001_0011;
	#1;
   $display("%0b ^ %0b = %0b",register[instruction[11:8]],register[instruction[7:4]],register[instruction[3:0]]);
   //tests Not
   instruction = 16'b0110_0000_0001_0011;
	#1;
   $display("~%0b = %0b",register[instruction[11:8]],register[instruction[3:0]]);
   
   $finish;
 end  
  
   AUL uut (.instruction(instruction), .register (register));
  
endmodule