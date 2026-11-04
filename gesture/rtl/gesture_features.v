// Centroid and bounding box of the foreground within a fixed ROI.
// frame_end is a blanking pulse after the last pipeline pixel. >=36 idle clocks
// are required before the next frame_end (normal video has millions).
module gesture_features #(
 parameter X0=45,X1=195,Y0=18,Y1=118,MIN_AREA=250,MAX_AREA=10000)(
 input clk,input rst_n,input frame_end,input en,input mask,
 input [11:0] x,input [11:0] y,
 output sample_valid,output reg hand_valid,output [11:0] cx,output [11:0] cy,
 output reg [11:0] bx0,output reg [11:0] bx1,output reg [11:0] by0,output reg [11:0] by1,
 output reg [31:0] area);
 reg [31:0] count,sx,sy,nx,ny,den;reg start;
 reg [11:0] minx,maxx,miny,maxy;
 wire [31:0] qx,qy;wire dx,dy,busy_x,busy_y;
 assign sample_valid=dx&&dy; assign cx=qx[11:0];assign cy=qy[11:0];
 gesture_div32 divx(clk,rst_n,start,nx,den,qx,busy_x,dx);
 gesture_div32 divy(clk,rst_n,start,ny,den,qy,busy_y,dy);
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin count<=0;sx<=0;sy<=0;nx<=0;ny<=0;den<=1;start<=0;
   minx<=4095;maxx<=0;miny<=4095;maxy<=0;bx0<=0;bx1<=0;by0<=0;by1<=0;area<=0;hand_valid<=0;end
  else begin
   start<=0;
   if(frame_end) begin
    nx<=sx;ny<=sy;den<=(count==0)?32'd1:count;start<=1;area<=count;
    hand_valid<=(count>=MIN_AREA&&count<=MAX_AREA&&maxx>minx&&maxy>miny);
    bx0<=minx;bx1<=maxx;by0<=miny;by1<=maxy;
    count<=0;sx<=0;sy<=0;minx<=4095;maxx<=0;miny<=4095;maxy<=0;
   end else if(en&&mask&&x>=X0&&x<X1&&y>=Y0&&y<Y1) begin
    count<=count+1'b1;sx<=sx+{20'b0,x};sy<=sy+{20'b0,y};
    if(x<minx)minx<=x;if(x>maxx)maxx<=x;
    if(y<miny)miny<=y;if(y>maxy)maxy<=y;
   end
  end
 end
endmodule
