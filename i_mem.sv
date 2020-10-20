module i_mem
    (

        input logic clk, // Clock

        input logic r_type,

        input logic i_type, // fsmfpsfpsdmdspsmfp[agpowej[PPKE

        input logic s_type,

        input logic sb_type,

        input logic u_type,

        input logic uj_type,

        input logic [31:0]imm,

        input logic iwr_en, // Instruction memory_ write enable

        input logic [31:0] data_in,// Data input for instructions uploads

        output logic [31:0] data_out,// Data output for instructions uploads

        input logic [31:0] pci,// PC input 

        //output logic [31:0] instr, // Instruction fetch decode

        output logic [6:0] iop_c,// Instruction decoded opcode-control output

        output logic [4:0] ird_r1,// Instruction decoded read register 1 output

        output logic [4:0] ird_r2,// Instruction decoded read register 2 output

        output logic [4:0] iwr_r,// Instruction decoded write register output
        
        output logic [3:0] ifun3,// Instruction decoded funtion 3 

        output logic [7:0] ifun7// Instruction decoded function 7

    );

    logic [31:0] instr;

    logic [31:0] ins_m [0:19]; // instruction memorys with 20 bit number of instruction.s

    always_ff @(posedge clk) begin

        if (iwr_en == 1)begin

            data_out = data_in;
        
        end
        
    end

    // assign instr = ins_m [pci[21:2]];

    // assign iop_c = instr [6:0];

    // assign ird_r1 = instr [19:15];

    // assign ird_r2 = instr [20:24];

    // assign iwr_r = instr [11:7];

    // assign ifun3 = instr [14:12];

    // assign ifun7 = instr [31:25];

    if (r_type == 1'b1)begin

    iop_c = instr [6:0];

    ird_r1 = instr [19:15];

    ird_r2 = instr [24:20];

    iwr_r = instr [11:7];

    ifun3 = instr [14:12];

    ifun7 = instr [31:25];

    end
    
    if (i_type == 1'b1)begin

        iop_c = instr [6:0];

        imm = instr [31:20];

        iwr_r = instr [11:7];

        ifun3 = instr [14:12];

        ifun7 = instr [31:25];        

        ird_r1 = instr [19:15];

    end

    if (s_type == 1'b1)begin

        iop_c = instr [6:0];
       
        ird_r1 = instr [19:15];

        ird_r2 = instr [24:20];

        ifun3 = instr [14:12];

        imm = instr [31:25];

    end

    if (sb_type == 1'b1)begin

        iop_c = instr [6:0];


    end

    if (u_type == 1'b1)begin

        iop_c = instr [6:0];


    end

    if (uj_type == 1'b1)begin

        iop_c = instr [6:0];


    end


endmodule