module control(
    input logic [6:0]op_cc,// control, opcode-control input

    input logic [2:0]fun3_c,// control,function 3 input

    input logic [6:0]fun7_c,// control, function 7 input

    input logic calu_br,// control, alu branch computation result
///////////////////////////////////////////TYPE DECODE//////////////////////////////////////////////////////    

    

///////////////////////////////////////////CONTROL DECODE///////////////////////////////////////////////////
    output logic cmem_wr,// control, memory write

    output logic cbr,// control, branch

    output logic cmem_rd,// control, memory read
    
    output logic creg_wr,// control, register write

    output logic cmem_reg,// control, memory register

    output logic [3:0] calu_op,// control, ALU opcode

    output logic [2:0] cop_a,// control, operand A

    output logic cop_b,// control, operand B

    output logic [2:0] cext_sel,// control, extended select

    output logic [2:0] cnpc_select// control, next PC select
);

    logic i_type;

    logic r_type;

    logic s_type;

    logic sb_type;

    logic u_type;

    logic uj_type;

    local parameter // OPCODES decleration

                R_TYPE = 7'b0110011 ,// (add, sub, sll, slt, sltu, xor, srl, sra, or, and)

                //R_TYPEW = 7'b0111011 ,// (addw, subw, sllw, srlw, sraw)

                I_TYPEL = 7'b0000011 ,// (lb, lh, ld, lw, lbu, lhu, lwu) LOAD

                I_TYPE = 7'b0010011 ,// (addi, slli, slti, sltiu, xori, srli, srai, ori, andi) IMMEDIATE

               //I_TYPEW = 7'b0011011 ,// (addiw, slliw, srliw, sraiw) IMMEDIATE WORD

                I_TYPEJ = 7'b1100111 ,// (jalr)

                I_TYPEE = 7'b1100111 ,// (ecall, ebreak)

                S_TYPE = 7'b0100011 ,// (sb, sh, sw, sd) STORE
                
                SB_TYPE = 7'b1100011 ,// (beq, bne, blt, bge, bltu, bgeu) BRANCH
                
                U_TYPE = 7'b0010111 ,// (auipc, lui)
                
                UJ_TYPE = 7'b1101111 ;// (jal) JUMP

    assign creg_wr = ( (op_cc == R_TYPE) | (op_cc == R_TYPEW) | (op_cc == I_TYPE) | (op_cc == I_TYPEW)
                        | (op_cc == I_TYPEJ) | (op_cc == I_TYPEL) | (op_cc == U_TYPE) | (op_cc == UJ_TYPE)
                      ) ? 1'b1 : 1'b0 ;

    assign cop_a = ( (op_cc == R_TYPE) | (op_cc == R_TYPEW) | (op_cc == I_TYPE) | (op_cc == I_TYPEW) | (op_cc == )I_TYPEJ
                        | (op_cc == I_TYPEL) | (op_cc == SB_TYPE)
                    ) ? 1'b1 : 1'b0 ;

    assign cop_b = ( (op_cc == R_TYPE) | (op_cc == R_TYPEW) | (op_cc == SB_TYPE) | (op_cc == S_TYPE)
                    ) ? 1'b1 : 1'b0 ;

    assign cmem_wr = (op_cc == S_TYPE) ? 1'b1 : 1'b0 ;

    assign cmem_rd = (op_cc == I_TYPEL) ? 1'b1 : 1'b0 ;

    assign cmem_reg = (op_cc == I_TYPEL) ? 1'b1 : 1'b0 ;

    assign cbr = (op_cc == SB_TYPE) && (calu_br == 1'b1) ? 1'b1 : 1'b0 ;


    assign i_type = ( (op_cc == I_TYPE) | ( (op_cc == I_TYPEE) | ( (op_cc == I_TYPEJ) | ( (op_cc == I_TYPEL)
                     | ( (op_cc == I_TYPEW) ) ? 1'b1 : 1'b0 ; 

    assign r_type = ( (op_cc == R_TYPE) | ( (op_cc == R_TYPEW) ) ? 1'b1 : 1'b0 ;

    assign s_type = (op_cc == S_TYPE) ? 1'b1 : 1'b0 ;

    assign sb_type = (op_cc == SB_TYPE) ? 1'b1 : 1'b0 ;

    assign s_type = (op_cc == S_TYPE) ? 1'b1 : 1'b0 ;

    assign u_type = (op_cc == U_TYPE) ? 1'b1 : 1'b0 ;

    assign uj_type = (op_cc == UJ_TYPE) ? 1'b1 : 1'b0 ;

    assign cnpc_select =

    assign calu_op =   ((op_cc == 7'h03) && (fun3_c == 3'h0)) ?  // lb

                       ((op_cc == 7'h03) && (fun3_c == 3'h1)) ?  // lh

                       ((op_cc == 7'h03) && (fun3_c == 3'h2)) ?  // lw

                       ((op_cc == 7'h03) && (fun3_c == 3'h3)) ?  // ld

                       ((op_cc == 7'h03) && (fun3_c == 3'h4)) ?  // lbu

                       ((op_cc == 7'h03) && (fun3_c == 3'h5)) ?  // lhu

                       ((op_cc == 7'h03) && (fun3_c == 3'h6)) ?  // lwu

                       ((op_cc == 7'h13) && (fun3_c == 3'h0)) ?  // addi

                       ((op_cc == 7'h13) && (fun3_c == 3'h1) && (fun7_c == 7'h0)) ?  // slli

                       ((op_cc == 7'h13) && (fun3_c == 3'h2)) ?  // slti

                       ((op_cc == 7'h13) && (fun3_c == 3'h3)) ?  // sltiu

                       ((op_cc == 7'h13) && (fun3_c == 3'h4)) ?  // xori

                       ((op_cc == 7'h13) && (fun3_c == 3'h5) && (fun7_c == 7'h00)) ?  // srli

                       ((op_cc == 7'h13) && (fun3_c == 3'h5) && (fun7_c == 7'h20)) ?  // srai

                       ((op_cc == 7'h13) && (fun3_c == 3'h6)) ?  // ori

                       ((op_cc == 7'h13) && (fun3_c == 3'h7)) ?  // andi

                       ((op_cc == 7'h17)) ?  // auipc

                       ((op_cc == 7'h1B) && (fun3_c == 3'h0)) ?  // addiw

                       ((op_cc == 7'h1B) && (fun3_c == 3'h1) && (fun7_c == 7'h00)) ?  // slliw

                       ((op_cc == 7'h1B) && (fun3_c == 3'h5) && (fun7_c == 7'h00)) ?  // srliw

                       ((op_cc == 7'h1B) && (fun3_c == 3'h5) && (fun7_c == 7'h20)) ?  // sraiw

                       ((op_cc == 7'h23) && (fun3_c == 3'h0)) ?  // lb

                       ((op_cc == 7'h23) && (fun3_c == 3'h1)) ?  // lb

                       ((op_cc == 7'h23) && (fun3_c == 3'h2)) ?  // lb

                       ((op_cc == 7'h23) && (fun3_c == 3'h3)) ?  // lb

                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 

                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 

                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 

                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 

                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ?  
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 
                       ((op_cc == 7'h) && (fun3_c == 3'h) && (fun7_c == 7'h)) ? 

                       ((op_cc==)&& (fun3_c))? :
                       ((ex))? :
    


//    assign creg_wr = (op_cc == R_TYPE | R_TYPEW | I_TYPE)

endmodule