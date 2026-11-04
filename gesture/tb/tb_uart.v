`timescale 1ns/1ps
module tb_uart;
reg clk=0;always #5 clk=~clk;
reg rst_n=0,valid=0;reg [2:0] code=2;wire tx,busy;integer i;reg [7:0] data;
gesture_uart_tx #(.CLK_HZ(1000000),.BAUD(100000))u(clk,rst_n,valid,code,tx,busy);
initial begin
 repeat(3)@(negedge clk);rst_n=1;valid=1;@(negedge clk);valid=0;
 if(tx!==0)$fatal(1,"start bit");
 repeat(15)@(negedge clk);
 for(i=0;i<8;i=i+1)begin data[i]=tx;repeat(10)@(negedge clk);end
 if(data!==8'h32||tx!==1)$fatal(1,"UART wrong data/stop %h",data);
 repeat(10)@(negedge clk);if(busy)$fatal(1,"UART busy stuck");
 $display("PASS UART: ASCII 2, 8N1 framing and idle");$finish;
end
endmodule
