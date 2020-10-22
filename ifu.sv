module ifu(
    
    input logic ibranch, // from alu

    input logic i_typej, // For pc generation from control

    input logic sb_type, // For pc generation from control

    input logic uj_type, // For pc generation from control

    input logic iop_a, // takes register read data 1

    input logic [31:0] imm,

    input logic clk, 

    output logic [31:0] pc // Output to Instruction Decoders

);
    
always @(posedge clk) begin

    if (sb_type == 1'b1 && ibranch == 1'b1)begin // branch
    pc = pc + {imm,1'b0};
    end

    else if (i_typej == 1'b1)begin // jalr
    pc = iop_a + imm;
    end

    else if (uj_type == 1'b1)begin // 
    pc = pc + {imm,1'b0};
    end

    else begin
        pc = pc + 32'd4;
    end
end


endmodule