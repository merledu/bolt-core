module ifu(
    
    input logic i_typej, // fsmfpsfpsdmdspsmfp[agpowej[PPKE

    input logic sb_type,

    input logic uj_type,

    input logic iop_a,

    input logic imm,

    input logic clk, 

    output logic [31:0]pc // Output to Instruction Decoders

);
    
always @(posedge clk) begin
    
    pc=pc+32'd4;

end

if (sb_type == 1'b1)begin
    pc = pc + {imm,1'b0};
end

if (i_typej == 1'b1)begin
    pc = iop_a + {imm,1'b0};
end

if (uj_type == 1'b1)begin
    pc = pc + {imm,1'b0};
end

endmodule