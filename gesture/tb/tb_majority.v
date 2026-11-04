`timescale 1ns/1ps
module tb_majority;
reg clk=0;always #5 clk=~clk;
reg rst_n=0,en=0,bit_in=0;reg [11:0] x=0,y=0;wire oe,ob;wire [11:0] ox,oy;
reg img[0:255];integer a,b,i,j,sum,f;
gesture_majority #(.WIDTH(16)) u(clk,rst_n,en,bit_in,x,y,oe,ob,ox,oy);
initial begin
 repeat(3)@(negedge clk);rst_n=1;
 for(f=0;f<3;f=f+1)begin
  for(i=0;i<256;i=i+1)img[i]=$random;
  for(b=0;b<16;b=b+1)for(a=0;a<16;a=a+1)begin
   @(negedge clk);en=1;x=a;y=b;bit_in=img[b*16+a];
   @(posedge clk);#1;
   if(a>=2&&b>=2)begin
    sum=0;for(i=-2;i<=0;i=i+1)for(j=-2;j<=0;j=j+1)sum=sum+img[(b+i)*16+a+j];
    if(oe!==1||ob!==(sum>=5)||ox!=a-1||oy!=b-1)$fatal(1,"majority mismatch");
   end else if(oe!==0)$fatal(1,"invalid border");
   @(negedge clk);en=0;
  end
 end
 $display("PASS majority: random raster windows, bubbles, frame overwrite");$finish;
end
endmodule
