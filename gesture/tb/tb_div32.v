`timescale 1ns/1ps
module tb_div32;
reg clk=0;always #5 clk=~clk;
reg rst_n=0,start=0;reg [31:0] n=0,d=1;wire [31:0] q;wire busy,done;
integer i;reg [31:0] expected;
gesture_div32 u(clk,rst_n,start,n,d,q,busy,done);
initial begin
 repeat(3)@(negedge clk);rst_n=1;
 for(i=0;i<200;i=i+1)begin
  @(negedge clk);n=$random;d=(i%13==0)?0:$unsigned($random);expected=(d==0)?0:n/d;start=1;
  @(negedge clk);start=0;wait(done);#1;
  if(q!==expected)$fatal(1,"divide n=%d d=%d q=%d exp=%d",n,d,q,expected);
 end
 $display("PASS divider: 200 unsigned cases including zero");$finish;
end
initial begin #200000;$fatal(1,"timeout");end
endmodule
