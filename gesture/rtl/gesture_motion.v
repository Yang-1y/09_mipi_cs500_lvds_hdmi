// Rule-based directional gestures, not finger/pose recognition.
// 1=left 2=right 3=up 4=down 5=stationary hand stop. 0=none.
module gesture_motion #(
 parameter ACQUIRE=3,SWIPE=12,CONFIRM=2,MAX_TRACK=24,HOLD=36,COOLDOWN=18,MAX_JUMP=30)(
 input clk,input rst_n,input sample_valid,input hand_valid,input [11:0] cx,input [11:0] cy,
 output reg event_valid,output reg [2:0] event_code,output reg tracking);
 reg [11:0] origin_x,origin_y,prev_x,prev_y,still_x,still_y;
 reg [7:0] acquired,age,still_count,cool,streak;reg [2:0] candidate;
 wire signed [12:0] dx=$signed({1'b0,cx})-$signed({1'b0,origin_x});
 wire signed [12:0] dy=$signed({1'b0,cy})-$signed({1'b0,origin_y});
 wire [12:0] ax=dx[12] ? -dx:dx;wire [12:0] ay=dy[12] ? -dy:dy;
 wire [12:0] jx=(cx>=prev_x)?{1'b0,cx}-{1'b0,prev_x}:{1'b0,prev_x}-{1'b0,cx};
 wire [12:0] jy=(cy>=prev_y)?{1'b0,cy}-{1'b0,prev_y}:{1'b0,prev_y}-{1'b0,cy};
 wire [12:0] stx=(cx>=still_x)?{1'b0,cx}-{1'b0,still_x}:{1'b0,still_x}-{1'b0,cx};
 wire [12:0] sty=(cy>=still_y)?{1'b0,cy}-{1'b0,still_y}:{1'b0,still_y}-{1'b0,cy};
 wire stationary=stx<=2&&sty<=2;
 wire [2:0] direction=(ax>=SWIPE&&{1'b0,ax}>={ay,1'b0})?(dx[12]?3'd1:3'd2):
                      (ay>=SWIPE&&{1'b0,ay}>={ax,1'b0})?(dy[12]?3'd3:3'd4):3'd0;
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin event_valid<=0;event_code<=0;tracking<=0;origin_x<=0;origin_y<=0;
   prev_x<=0;prev_y<=0;still_x<=0;still_y<=0;acquired<=0;age<=0;still_count<=0;cool<=0;streak<=0;candidate<=0;end
  else begin
   event_valid<=0;
   if(sample_valid) begin
    prev_x<=cx;prev_y<=cy;
    if(cool!=0) begin cool<=cool-1'b1;tracking<=0;acquired<=0;still_count<=0;streak<=0;candidate<=0;end
    else if(!hand_valid) begin tracking<=0;acquired<=0;age<=0;still_count<=0;streak<=0;candidate<=0;end
    else if(!tracking) begin
     if(acquired!=0&&(jx>MAX_JUMP||jy>MAX_JUMP)) acquired<=1;
     else if(acquired>=ACQUIRE-1) begin tracking<=1;origin_x<=cx;origin_y<=cy;still_x<=cx;still_y<=cy;age<=0;still_count<=0;acquired<=0;end
     else acquired<=acquired+1'b1;
    end else if(jx>MAX_JUMP||jy>MAX_JUMP) begin
     tracking<=0;acquired<=0;still_count<=0;streak<=0;candidate<=0;
    end else begin
     age<=age+1'b1;
     if(stationary) begin if(still_count<255)still_count<=still_count+1'b1;end
     else begin still_count<=0;still_x<=cx;still_y<=cy;end
     if(direction!=0) begin
      candidate<=direction;
      if(direction==candidate)begin if(streak<255)streak<=streak+1'b1;end
      else streak<=1;
      if(CONFIRM<=1||(direction==candidate&&streak>=CONFIRM-1)) begin
       event_valid<=1;event_code<=direction;cool<=COOLDOWN;tracking<=0;acquired<=0;streak<=0;candidate<=0;still_count<=0;
      end
     end else begin streak<=0;candidate<=0;end
     if(direction==0&&stationary&&still_count>=HOLD-1) begin
      event_valid<=1;event_code<=5;cool<=COOLDOWN;tracking<=0;acquired<=0;still_count<=0;streak<=0;candidate<=0;
     end else if(age>=MAX_TRACK-1) begin origin_x<=cx;origin_y<=cy;age<=0;streak<=0;candidate<=0;end
    end
   end
  end
 end
endmodule
