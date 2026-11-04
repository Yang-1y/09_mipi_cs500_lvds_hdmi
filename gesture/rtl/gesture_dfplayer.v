// DFPlayer Mini (MP3-TF-16P) trigger. 9600 8N1.
// gesture 2 -> play track1, gesture 3 -> play track2, gesture 4 -> play track3,
// gesture 5 -> pause (0x0E). gesture 0/1 do nothing here (date / flow-light).
// Playback keeps running (DFPlayer auto-advances) until gesture 5 pauses it.
// Frame: 7E FF 06 CMD FB DH DL CSH CSL EF.
module gesture_dfplayer #(
 parameter CLK_HZ=150000000, BAUD=9600
)(
 input clk, input rst_n, input valid, input [2:0] code,
 output reg tx);
localparam TICKS=(CLK_HZ+BAUD/2)/BAUD;
localparam [31:0] INIT_TICKS=(CLK_HZ/1000)*3000;
reg [31:0] div, boot; reg [3:0] byte_idx, bit_cnt; reg busy, inited;
reg [9:0] shift;
reg [7:0] d0,d1,d2,d3,d4,d5,d6,d7,d8,d9;

wire pause = (code==3'd5);
wire [7:0] trk = (code==3'd2) ? 8'd1 :
                  (code==3'd3) ? 8'd2 :
                  (code==3'd4) ? 8'd3 : 8'd1;
wire [7:0] cmd = pause ? 8'h0E : 8'h03;   // 0x0E pause, 0x03 play
wire [7:0] dat = pause ? 8'd0 : trk;
// checksum = -(FF+06+CMD+FB+DH+DL)
wire [15:0] psum = 16'hFF+16'h06+{8'h00,cmd}+{8'h00,dat};
wire [15:0] pchk = ~psum+16'd1;

wire [3:0] nb = byte_idx + 4'd1;
reg [7:0] nxt;
always @* case(nb)
 4'd0:nxt=d0; 4'd1:nxt=d1; 4'd2:nxt=d2; 4'd3:nxt=d3; 4'd4:nxt=d4;
 4'd5:nxt=d5; 4'd6:nxt=d6; 4'd7:nxt=d7; 4'd8:nxt=d8; default:nxt=d9; endcase
wire fire = valid&&(code>=3'd2 && code<=3'd5)&&inited&&!busy;
always @(posedge clk or negedge rst_n) begin
 if(!rst_n) begin
  tx<=1;busy<=0;byte_idx<=0;bit_cnt<=0;div<=0;boot<=0;inited<=0;shift<=10'h3FF;
  d0<=0;d1<=0;d2<=0;d3<=0;d4<=0;d5<=0;d6<=0;d7<=0;d8<=0;d9<=0;
 end else begin
  if(!inited) begin
   if(boot>=INIT_TICKS) begin
    inited<=1;
    // volume 8 (half of 15): 7E FF 06 06 00 00 08 FE ED EF
    d0<=8'h7E;d1<=8'hFF;d2<=8'h06;d3<=8'h06;d4<=8'h00;d5<=8'h00;d6<=8'h08;
    d7<=8'hFE;d8<=8'hED;d9<=8'hEF;
    busy<=1;byte_idx<=0;bit_cnt<=0;div<=0;tx<=0;shift<={1'b1,8'h7E,1'b0};
   end else boot<=boot+1'b1;
  end else if(fire) begin
   // play or pause frame
   d0<=8'h7E;d1<=8'hFF;d2<=8'h06;d3<=cmd;d4<=8'h00;d5<=8'h00;d6<=dat;
   d7<=pchk[15:8];d8<=pchk[7:0];d9<=8'hEF;
   busy<=1;byte_idx<=0;bit_cnt<=0;div<=0;tx<=0;shift<={1'b1,8'h7E,1'b0};
  end else if(busy) begin
   if(div>=TICKS-1) begin
    div<=0;shift<={1'b1,shift[9:1]};tx<=shift[1];
    if(bit_cnt==9) begin
     if(byte_idx==9) begin busy<=0;tx<=1;end
     else begin byte_idx<=nb;bit_cnt<=0;shift<={1'b1,nxt,1'b0};tx<=1'b0;end
    end else bit_cnt<=bit_cnt+1;
   end else div<=div+1;
  end
 end
end
endmodule
