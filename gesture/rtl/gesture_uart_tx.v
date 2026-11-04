// UART 8N1, one ASCII character 0/1/2/3/4/5 per accepted gesture, 115200 baud.
module gesture_uart_tx #(parameter CLK_HZ=150000000,BAUD=115200)(
 input clk,input rst_n,input valid,input [2:0] code,output tx,output reg busy);
 localparam TICKS=(CLK_HZ+BAUD/2)/BAUD;
 reg [9:0] shift;reg [31:0] count;reg [3:0] bit_count;wire [7:0] data;
 assign data=(code<=5)?(8'h30+{5'd0,code}):8'h3F;
 assign tx=busy?shift[0]:1'b1;
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n)begin busy<=0;shift<=10'h3FF;count<=0;bit_count<=0;end
  else if(!busy) begin
   if(valid)begin shift<={1'b1,data,1'b0};busy<=1;count<=0;bit_count<=0;end
  end else if(count>=TICKS-1) begin
   count<=0;shift<={1'b1,shift[9:1]};
   if(bit_count==9)busy<=0;else bit_count<=bit_count+1'b1;
  end else count<=count+1'b1;
 end
endmodule
