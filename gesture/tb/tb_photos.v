`timescale 1ns/1ps
module tb_photos;
reg clk=0;always #5 clk=~clk;
reg rst_n=0,vs=0,de=0;reg [23:0] rgb=0;
wire ovs,ode,ev,sv,hv;wire [23:0] orgb;wire [2:0] code;wire [11:0] cx,cy;wire [31:0] area;
reg [23:0] photo[0:32399];integer k,f,x,y,events,expected,unknown_events;reg [255:0] fn;
gesture_video #(.WIDTH(240),.HEIGHT(135),.DS(0)) u(clk,rst_n,vs,de,rgb,2'b00,ovs,ode,orgb,ev,code,sv,hv,cx,cy,area,,);
always @(negedge clk)if(ev)begin
 if(code!==expected)$fatal(1,"photo expected %0d got %0d",expected,code);
 events=events+1;
end
task frame; input blank;begin
 @(negedge clk);vs=1;de=0;repeat(10)@(negedge clk);vs=0;
 // Enough blanking for completed ROI analysis, also exercise bank overlap below.
 for(y=0;y<135;y=y+1)begin
  for(x=0;x<240;x=x+1)begin de=1;rgb=blank?24'h808080:photo[y*240+x];@(negedge clk);end
  de=0;rgb=0;repeat(4)@(negedge clk);
 end
 repeat(40000)@(negedge clk);
end endtask
initial begin
 events=0;expected=7;repeat(3)@(negedge clk);rst_n=1;
 repeat(7)frame(1);if(events!=0)$fatal(1,"no hand emitted a digit");
 for(k=0;k<6;k=k+1)begin
  case(k)
   0:fn="gesture/sim/photos/0.hex";1:fn="gesture/sim/photos/1.hex";
   2:fn="gesture/sim/photos/2.hex";3:fn="gesture/sim/photos/3.hex";
   4:fn="gesture/sim/photos/4.hex";5:fn="gesture/sim/photos/5.hex";
  endcase
  $readmemh(fn,photo);expected=k;events=0;
  repeat(8)frame(0);
  if(events!=1)$fatal(1,"photo %0d event count=%0d",k,events);
  $display("PASS photo %0d: RGB -> majority -> static classifier -> stable event",k);
  repeat(7)frame(1);
  if(events!=1)$fatal(1,"blank caused spurious event");
 end
 $display("PASS photo pipeline: all six supplied images, no-hand rejection, hold suppression");$finish;
end
endmodule
