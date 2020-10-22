module top(
    
    input logic clk,

    input logic 

);
    

    if (mem_reg == 1'b1)begin
        
        wr_data_reg <= ram_result;

    end
    else begin

        wr_data_reg <= alu_result;
    
    end

    if (branch == 1'b1)begin
        


    end

endmodule