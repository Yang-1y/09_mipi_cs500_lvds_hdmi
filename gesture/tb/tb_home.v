`timescale 1ns/1ps
module tb_home;
reg clk=0;always #5 clk=~clk;
reg rst_n=0,ft=1,lv=0,rv=0;reg [2:0] lc=0,rc=0;
wire led,fan,fp,sp,bz,tone,accept;wire [2:0] ac;integer i,n;
gesture_home #(.CLK_HZ(1000000),.FAILSAFE_MS(5),.BEEP_MS(2))u(clk,rst_n,ft,lv,lc,rv,rc,led,fan,fp,sp,bz,tone,accept,ac);
task command;input [2:0] c;begin @(negedge clk);lv=1;lc=c;@(negedge clk);lv=0;end endtask
initial begin
 repeat(3)@(negedge clk);rst_n=1;
 command(2);if(!fan||!bz)$fatal(1,"fan on");n=0;
 for(i=0;i<40;i=i+1)begin @(negedge clk);if(fp)n=n+1;end
 if(n!=30)$fatal(1,"fan PWM duty=%d",n);
 command(1);if(!led)$fatal(1,"LED on");
 command(4);repeat(40000)@(negedge clk);n=0;
 for(i=0;i<20000;i=i+1)begin @(negedge clk);if(sp)n=n+1;end
 if(n!=2000)$fatal(1,"servo pulse %d",n);
 @(negedge clk);lv=1;lc=0;rv=1;rc=3;
 @(negedge clk);lv=0;rv=0;
 if(fan||led||ac!=0)$fatal(1,"local stop priority");
 @(negedge clk);rv=1;rc=7;@(negedge clk);rv=0;if(accept)$fatal(1,"bad command accepted");
 command(2);ft=0;repeat(5005)@(negedge clk);
 if(fan||led||bz)$fatal(1,"video watchdog");
 $display("PASS home: outputs, 75%% PWM, servo 2ms/20ms, priority, reject, watchdog");$finish;
end
endmodule
