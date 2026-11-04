`timescale 1ns/1ps
module tb_display;
reg clk=0;always #5 clk=~clk;
reg rst=0,valid=0;reg [2:0] digit=7;
wire [7:0] led;wire sclk,mosi,latch;
integer k,bits=0,frames=0;reg [15:0] packet=0;reg [7:0] expected;
gesture_board_display #(.CLK_DIV(4)) u(clk,rst,valid,digit,led,sclk,mosi,latch);
always @(posedge sclk)begin packet={packet[14:0],mosi};bits=bits+1;end
always @(posedge latch)begin
 if(bits!=16)$fatal(1,"serial bit count %d",bits);
 bits=0;
 if(packet[15:8]==8'h80)begin
  if(packet[7:0]!==expected)$fatal(1,"segment expected %h got %h",expected,packet);
  frames=frames+1;
 end else if(packet[7:0]!==8'hff)$fatal(1,"unused digit not blank");
end
initial begin
 for(k=0;k<7;k=k+1)begin
  rst=0;repeat(4)@(negedge clk);bits=0;frames=0;
  digit=k;valid=k<6;
  case(k)0:expected=8'hc0;1:expected=8'hf9;2:expected=8'ha4;3:expected=8'hb0;4:expected=8'h99;5:expected=8'h92;6:expected=8'hbf;endcase
  rst=1;repeat(3000)@(negedge clk);
  if(frames<1)$fatal(1,"no display frame");
  if(led!==((k<6)?((1<<k)-1):0))$fatal(1,"LED mapping");
 end
 $display("PASS display: digits 0..5, invalid dash, LED counts, actual 16-bit HC595 packets");$finish;
end
endmodule
