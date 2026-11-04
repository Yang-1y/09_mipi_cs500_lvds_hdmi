// Streaming 3x3 binary majority. One valid output per valid input after borders.
// Raster order, x=0..WIDTH-1; buffers need no reset: first two rows are discarded.
module gesture_majority #(parameter WIDTH=240)(
 input clk,input rst_n,input en,input bit_in,input [11:0] x,input [11:0] y,
 output reg out_en,output reg bit_out,output reg [11:0] ox,output reg [11:0] oy);
 reg row1[0:WIDTH-1]; reg row2[0:WIDTH-1];
 reg [1:0] a,b,c;
 wire [3:0] total={3'b0,a[0]}+{3'b0,a[1]}+{3'b0,b[0]}+{3'b0,b[1]}+
                  {3'b0,c[0]}+{3'b0,c[1]}+{3'b0,bit_in}+{3'b0,row1[x]}+{3'b0,row2[x]};
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin out_en<=0;bit_out<=0;ox<=0;oy<=0;a<=0;b<=0;c<=0;end
  else begin
   out_en<=0;
   if(en&&x<WIDTH) begin
    row2[x]<=row1[x];row1[x]<=bit_in;
    if(x==0) begin a<={1'b0,bit_in};b<={1'b0,row1[x]};c<={1'b0,row2[x]};end
    else begin a<={a[0],bit_in};b<={b[0],row1[x]};c<={c[0],row2[x]};end
    ox<=x-1'b1;oy<=y-1'b1;
    if(x>=2&&y>=2) begin out_en<=1;bit_out<=(total>=5);end
   end
  end
 end
endmodule
