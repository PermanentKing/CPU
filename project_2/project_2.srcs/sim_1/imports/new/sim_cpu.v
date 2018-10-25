`timescale 1ns / 1ps


module sim_cpu(

    );
    reg reset;
    reg clk;
    
    wire [7:0] t_addr;
    wire [7:0] t_new_addr;
    wire [7:0] t_rs;
    wire [7:0] t_data1;
    wire [7:0] t_data2;
    wire [7:0] t_rt;
    wire [7:0] t_result;
    wire [7:0] t_DB;
    
    SingleCPU cpu(
        .clk(clk),
        .reset(reset),
        .addr_4(t_addr),
        .new_addr_4(t_new_addr),
        .rs_4(t_rs),
        .data1_4(t_data1),
        .data2_4(t_data2),
        .rt_4(t_rt),
        .result_4(t_result),
        .DB_4(t_DB)
    );
    initial
    begin
        clk = 1;
        reset = 1;
        #20 reset = 0;
        #20 reset = 1;
        
        forever #20 clk = ~clk;
        #800 $stop;
    end
endmodule
