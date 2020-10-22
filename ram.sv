module ram(
    
    input logic clk,

    input logic rst_enm,

    input logic rmem_rd,

    input logic rmem_wr,

    input logic [7:0] rop_a,

    input logic [31:0] rop_b,

    output logic [31:0] d_out

);
    
    logic [7:0] mem [0:31];

    always_ff @(posedge clk) begin

        int i;

        if (rst_enm == 1'b1)begin
            
            for (i = 0;i < 32;i++) begin
    
                mem [i] <= 8'd0;

            end
            
        end

        if (rmem_wr == 1'b1 && rst_enm == 1'b0)begin
            
            mem[rop_b] <= rop_a;

        end

        if (rst_enm == 1'b0)begin
            
            d_out <= mem[rop_b];

        end    
    
    end

endmodule