module AUL(
  input logic [15:0] instruction,
  output logic signed [15:0] register [15:0]
);
  always @* begin
  case (instruction[15:12])
    4'b0000:register[instruction[3:0]][15:0]= register[instruction[11:8]][15:0] + register[instruction[7:4]][15:0];
    4'b0001:register[instruction[3:0]][15:0]= register[instruction[11:8]][15:0] - register[instruction[7:4]][15:0];
    4'b0010:register[instruction[3:0]][15:0]= register[instruction[11:8]][15:0] * register[instruction[7:4]][15:0];
    4'b0011:register[instruction[3:0]][15:0]= register[instruction[11:8]][15:0] & register[instruction[7:4]][15:0];
    4'b0100:register[instruction[3:0]][15:0]= register[instruction[11:8]][15:0] | register[instruction[7:4]][15:0];
    4'b0101:register[instruction[3:0]][15:0]= register[instruction[11:8]][15:0] ^ register[instruction[7:4]][15:0];
    4'b0110:register[instruction[3:0]][15:0]= ~register[instruction[11:8]][15:0];
    4'b1111:register[instruction[11:8]]= instruction[7:0];
  endcase 
  end
endmodule