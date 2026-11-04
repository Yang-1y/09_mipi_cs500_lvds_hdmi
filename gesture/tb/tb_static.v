`timescale 1ns/1ps
module tb_static;
reg clk=0;always #5 clk=~clk;
reg rst_n=0,fs=0,en=0,mask=0;reg [11:0] x=0,y=0;
wire sv,hv,pv,ev;wire [2:0] pc,ec;wire [11:0] a,b,c,d;wire [31:0] area;
integer events=0,wanted=7,i;
gesture_static u(clk,rst_n,fs,en,mask,x,y,sv,hv,pv,pc,ev,ec,a,b,c,d,area);
always @(negedge clk)if(ev)begin
 if(ec!=wanted)$fatal(1,"expected %0d got %0d",wanted,ec);
 events=events+1;
end
// Synthetic upright silhouette: palm/wrist, separated upright fingers and thumb.
function shape;input integer kind,px,py;integer n;begin
 shape=0;
 if(kind>=0&&kind<=5)begin
  shape=(px>=85&&px<135&&py>=75&&py<115);
  n=(kind==5)?4:kind;
  if(n>0&&py>=40&&py<75)begin
   if(px>=85&&px<93)shape=1;
   if(n>=2&&px>=98&&px<106)shape=1;
   if(n>=3&&px>=111&&px<119)shape=1;
   if(n>=4&&px>=124&&px<132)shape=1;
  end
  if(kind==5&&px>=145&&px<153&&py>=86&&py<96)shape=1;
  if(kind==5&&px>=130&&px<153&&py>=96&&py<103)shape=1;
 end
 // Cropped foreground touching left ROI must be rejected.
 if(kind==8)shape=(px>=45&&px<100&&py>=40&&py<110);
end endfunction
task frame;input integer kind;begin
 @(negedge clk);fs=1;en=0;@(negedge clk);fs=0;
 for(y=0;y<135;y=y+1)for(x=0;x<240;x=x+1)begin
  en=1;mask=shape(kind,x,y);@(negedge clk);
 end
 en=0;repeat(1000)@(negedge clk);
end endtask
initial begin
 repeat(3)@(negedge clk);rst_n=1;
 repeat(7)frame(7);if(events)$fatal(1,"empty accepted as fist");
 wanted=1;repeat(8)frame(1);if(events!=1)$fatal(1,"stable/hold");
 // Alternate poses never satisfy five frames. Account for previous completed frame.
 repeat(6)begin frame(2);frame(3);end
 if(events!=1)$fatal(1,"unstable emitted");
 wanted=2;repeat(8)frame(2);if(events!=2)$fatal(1,"direct pose change");
 repeat(7)frame(8);if(pv||hv||events!=2)$fatal(1,"clipped ROI accepted");
 wanted=2;repeat(8)frame(2);if(events!=3)$fatal(1,"release/rearm");
 wanted=0;repeat(8)frame(0);if(events!=4)$fatal(1,"fist zero");
 $display("PASS static: empty, clipped, stable, alternating, direct change, rearm, fist");$finish;
end
endmodule
