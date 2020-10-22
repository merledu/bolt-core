module alu(
    
    input logic clk,

    input logic [31:0] aop_a,

    input logic [31:0] aop_b,

    input logic [31:0] aimm,

    input logic [5:0] alu_op,

    input logic [31:0] apc,

    output logic branch,

    output logic [31:0] result,

    output logic [7:0] mem

);

always_ff @(posedge clk) begin
    

    if (alu_op ==  6'd1)begin // lb
        
        result = aop_a + aimm;

    end

    // if (alu_op ==  6'd2)begin // lh
        


    // end

    // if (alu_op ==  6'd3)begin // lw
        


    // end

    // if (alu_op ==  6'd4)begin // ld
        


    // end

    // if (alu_op ==  6'd5)begin // lbu
        
    //     result = aop_a + aimm;

    // end

    // if (alu_op ==  6'd6)begin // lhu
        


    // end

    // if (alu_op ==  6'd7)begin // lwu
        


    // end

    if (alu_op ==  6'd8)begin // addi
        
        result = aop_a + aimm;

    end

    if (alu_op ==  6'd9)begin // slli
        
        result = aop_a << aimm;

    end

    if (alu_op ==  6'd10)begin // slti
        
        result = aop_a < aimm ? 1'b1 : 1'b0;

    end

    if ($unsigned(alu_op) == $unsigned(6'd11))begin // sltiu

        result = aop_a < aimm ? 1'b1 : 1'b0;

    end

    if (alu_op ==  6'd12)begin // xori
        
        result = aop_a ^ aimm;

    end

    if (alu_op ==  6'd13)begin // srli
        
        result = aop_a >> aimm;

    end
    ///////////////////////////////////////////////////same expression???
    if (alu_op ==  6'd14)begin // srai
        
        result = aop_a >> aimm;

    end

    if (alu_op ==  6'd15)begin // ori
        
        result = aop_a | aimm;

    end

    if (alu_op ==  6'd16)begin // andi
        
        result = aop_a & aimm;

    end

    // if (alu_op ==  6'd17)begin // auipc
        


    // end

    // if (alu_op ==  6'd18)begin // sb
        
    //     [9:2] result =

    // end

    // if (alu_op ==  6'd19)begin // sh
        


    // end

    // if (alu_op ==  6'd20)begin // se
        


    // end

    // if (alu_op ==  6'd21)begin // sd
        


    // end

    if (alu_op ==  6'd22)begin // add
        
        result = aop_a + aop_b;

    end

    if (alu_op ==  6'd23)begin // sub
        
        result = aop_a - aop_b;

    end

    if (alu_op ==  6'd24)begin // sll
        
        result = aop_a << aop_b;

    end

    if (alu_op ==  6'd25)begin // slt
        
        result = aop_a < aop_b ? 1'b1 : 1'b0;

    end

    if ($unsigned(alu_op) ==  $unsigned(6'd26))begin // sltu
        
        result = aop_a < aop_b ? 1'b1 : 1'b0;

    end

    if (alu_op ==  6'd27)begin // xor
        
        result = aop_a ^ aop_b;

    end

    if (alu_op ==  6'd28)begin // srl
        
        result = aop_a >> aop_b;

    end

    if (alu_op ==  6'd29)begin // sra
        
        result = aop_a >> aop_b;

    end

    if (alu_op ==  6'd30)begin // or
        
        result = aop_a | aop_b;

    end

    if (alu_op ==  6'd31)begin // and
        
        result = aop_a & aop_b;

    end

    // if (alu_op ==  6'd32)begin // lui
        
    //     result = ;

    // end

    if (alu_op ==  6'd33)begin // beq
        
        if (aop_a == aop_b)begin

            branch = 1'b1;

        end 

    end

    if (alu_op ==  6'd34)begin // bne
        
        if (aop_a != aop_b)begin

            branch = 1'b1;

        end 

    end

    if (alu_op == 6'd35)begin // blt
            
        if (aop_a < aop_b)begin

            branch = 1'b1;

        end 

    end

    if (alu_op == 6'd36)begin // bge
        
        if (aop_a >= aop_b)begin

            branch = 1'b1;

        end     

    end

    if ($unsigned(alu_op) == $unsigned(6'd37))begin // bltu
            
        if (aop_a < aop_b)begin

            branch = 1'b1;

        end 

    end

    if ($unsigned(alu_op) ==  $unsigned(6'd38))begin // bgeu
            
        if (aop_a >= aop_b)begin

            branch = 1'b1;

        end 

    end

    if (alu_op ==  6'd39)begin // jalr
        
        result = apc + 32'd4;

    end

    if (alu_op ==  6'd40)begin // jal
        
        result = apc + 32'd4;

    end

end

endmodule