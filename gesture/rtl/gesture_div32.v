// Unsigned restoring divider. 32 cycles, start only while !busy.
module gesture_div32(input clk,input rst_n,input start,
 input [31:0] numerator,input [31:0] denominator,
 output reg [31:0] quotient,output reg busy,output reg done);
 reg [31:0] q,d; reg [32:0] rem; reg [5:0] count;
 wire [32:0] shifted={rem[31:0],q[31]};
 wire ge=shifted>={1'b0,d};
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin quotient<=0;busy<=0;done<=0;q<=0;d<=0;rem<=0;count<=0;end
  else begin
   done<=0;
   if(start&&!busy) begin
    if(denominator==0) begin quotient<=0;done<=1;end
    else begin q<=numerator;d<=denominator;rem<=0;count<=0;busy<=1;end
   end else if(busy) begin
    rem<=ge ? shifted-{1'b0,d}:shifted;
    q<={q[30:0],ge};
    if(count==31) begin quotient<={q[30:0],ge};busy<=0;done<=1;end
    else count<=count+1'b1;
   end
  end
 end
endmodule
