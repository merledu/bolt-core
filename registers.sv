module registers
    (

    input logic clk,

    input logic rst_enr, // Reset enable register

    input logic [4:0] rd_r1, // Read Register 1

    input logic [4:0] rd_r2, // Read Register 2

    input logic [4:0] wr_r, // Write Register

    input logic rwr_en, // Reg Write enable

    input logic [31:0] wr_d, // Write data

    output logic [31:0] rd_d1, // Read Data 1

    output logic [31:0] rd_d2 // Read Data 2

    );

    logic [31:0] rx [0:31]; // This pattern is used for decleration of memory. Left of rx is [31:0] which is number of bits per register and right of rx is [0:31] which is number of registers.

    always_ff @(posedge clk) begin

        int i;

        rx[0]=32'd0;

        if (rst_enr == 1'b1)begin // When reset pin is enable all registers will be resetted to zero.

            for (i = 0;i < 32;i++) begin
    
                rx [i] <= 32'd0;

            end
        end

        if (rwr_en == 1'b1 && rst_enr == 1'b0 && wr_r != 5'd0)begin
    
            rx[wr_r] <= wr_d;

        end
    end

    assign rd_d1 = rx[rd_r1];

    assign rd_d2 = rx[rd_r2];

endmodule