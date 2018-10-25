`timescale 1ns / 1ps
module transTocut(
    input [31:0] address,new_address,data1,data2,result,DB,
    input [4:0] rs,rt,
    output [7:0] addr_4,new_addr_4,rs_4,data1_4,rt_4,data2_4,result_4,
    output [7:0] DB_4
);

   assign     addr_4[7:0] = address[7:0];
   assign     new_addr_4[7:0] = new_address[7:0];
   assign     rs_4[4:0] = rs[7:0];
   assign     rs_4[7:5] = 0;
   assign     data1_4[7:0] = data1[7:0];
   assign     rt_4[4:0] = rt[7:0];
   assign     rt_4[7:5] = 0;
   assign     data2_4[7:0] = data2[7:0];
   assign     result_4[7:0] = result[7:0];
   assign     DB_4[7:0] = DB[7:0];
endmodule