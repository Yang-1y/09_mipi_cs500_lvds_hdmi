// Upright single-hand silhouette classifier. No weights or learned model.
// Two 1-bit frame banks; scan a completed ROI while the next frame is captured.
// Width <= 4095, ROI strictly inside majority-filter borders. Code 7 = unknown.
module gesture_static #(
 parameter WIDTH=240,HEIGHT=135,X0=45,X1=195,Y0=18,Y1=118,
 parameter MIN_AREA=500,MAX_AREA=7000,MIN_RUN=3,VOTE_ROWS=6,THUMB_ROWS=4,
 parameter STABLE_FRAMES=5,RELEASE_FRAMES=5)(
 input clk,input rst_n,input frame_start,input en,input mask,input [11:0] x,y,
 output reg sample_valid,output reg hand_valid,output reg pose_valid,
 output reg [2:0] pose_code,output reg event_valid,output reg [2:0] event_code,
 output reg [11:0] bx0,bx1,by0,by1,output reg [31:0] hand_area);
 localparam SIZE=WIDTH*HEIGHT;
 reg mem[0:2*SIZE-1];
 reg bank,scan_bank,primed;
 reg [31:0] area;
 reg [11:0] ax0,ax1,ay0,ay1;
 reg [11:0] xx,yy,ww,hh,mid_y;
 reg [3:0] state;
 reg pixel;
 reg [11:0] run;
 reg [3:0] narrow,wide;
 reg row_broad;
 reg [11:0] votes1,votes2,votes3,votes4,thumb,broad;
 reg [2:0] candidate,last_sent;
 reg [7:0] stable,release_count;
 reg armed;
 reg [2:0] decision;
 // Synchronous simple dual-port style RAM, no bulk reset or initialization.
 always @(posedge clk) begin
  if(en&&x>=X0&&x<X1&&y>=Y0&&y<Y1)
   mem[(bank?SIZE:0)+y*WIDTH+x]<=mask;
  if(state==1)pixel<=mem[(scan_bank?SIZE:0)+yy*WIDTH+xx];
 end
 always @* begin
  decision=7;
  if(votes4>=VOTE_ROWS)decision=(thumb>=THUMB_ROWS)?5:4;
  else if(votes3>=VOTE_ROWS)decision=3;
  else if(votes2>=VOTE_ROWS)decision=2;
  else if(votes1>=VOTE_ROWS)decision=1;
  else if(broad>=VOTE_ROWS)decision=0;
 end
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n)begin
   bank<=0;scan_bank<=0;primed<=0;area<=0;ax0<=4095;ax1<=0;ay0<=4095;ay1<=0;
   sample_valid<=0;hand_valid<=0;pose_valid<=0;pose_code<=7;event_valid<=0;event_code<=7;
   bx0<=0;bx1<=0;by0<=0;by1<=0;hand_area<=0;xx<=0;yy<=0;ww<=0;hh<=0;mid_y<=0;
   state<=0;run<=0;narrow<=0;wide<=0;row_broad<=0;
   votes1<=0;votes2<=0;votes3<=0;votes4<=0;thumb<=0;broad<=0;
   candidate<=7;last_sent<=7;stable<=0;release_count<=0;armed<=1;
  end else begin
   sample_valid<=0;event_valid<=0;
   if(en&&mask&&x>=X0&&x<X1&&y>=Y0&&y<Y1)begin
    area<=area+1'b1;
    if(x<ax0)ax0<=x;if(x>ax1)ax1<=x;
    if(y<ay0)ay0<=y;if(y>ay1)ay1<=y;
   end
   if(frame_start)begin
    bank<=~bank;scan_bank<=bank;primed<=1;
    area<=0;ax0<=4095;ax1<=0;ay0<=4095;ay1<=0;
    bx0<=ax0;bx1<=ax1;by0<=ay0;by1<=ay1;hand_area<=area;
    votes1<=0;votes2<=0;votes3<=0;votes4<=0;thumb<=0;broad<=0;
    run<=0;narrow<=0;wide<=0;row_broad<=0;
    // Any interrupted scan is rejected; never emit a partially analyzed frame.
    if(primed&&state==0&&area>=MIN_AREA&&area<=MAX_AREA&&
       ax0>X0&&ax1<X1-1&&ay0>Y0&&ax1-ax0>=23&&ay1-ay0>=29)begin
     hand_valid<=1;ww<=ax1-ax0+1'b1;hh<=ay1-ay0+1'b1;
     mid_y<=ay0+((ay1-ay0+1'b1)>>1);xx<=X0;yy<=ay0;state<=1;
    end else begin hand_valid<=0;state<=5;end
   end else case(state)
    1:state<=2; // RAM read latency
    2:begin
     if(pixel)run<=run+1'b1;
     else begin
      if(run>=MIN_RUN)begin
       if(run*3<=ww)begin if(narrow<7)narrow<=narrow+1'b1;end
       else begin if(wide<7)wide<=wide+1'b1;end
       if(run*5>=ww*3)row_broad<=1;
      end
      run<=0;
     end
     if(xx==X1-1)state<=3;
     else begin xx<=xx+1'b1;state<=1;end
    end
    // Hand cannot touch right ROI edge, so the final pixel flushed the run.
    3:begin
     if(yy<mid_y)begin
      if(wide==0)case(narrow)
       1:votes1<=votes1+1'b1;2:votes2<=votes2+1'b1;
       3:votes3<=votes3+1'b1;4:votes4<=votes4+1'b1;
      endcase
      if(row_broad)broad<=broad+1'b1;
     end else if(narrow==1&&wide==1)thumb<=thumb+1'b1;
     run<=0;narrow<=0;wide<=0;row_broad<=0;xx<=X0;
     if(yy==by1)state<=4;else begin yy<=yy+1'b1;state<=1;end
    end
    4:begin
     sample_valid<=1;state<=0;
     if(decision<=5)begin
      pose_valid<=(candidate==decision&&stable>=STABLE_FRAMES-1);pose_code<=decision;release_count<=0;
      if(candidate!=decision)begin candidate<=decision;stable<=1;end
      else if(stable<STABLE_FRAMES)stable<=stable+1'b1;
      if(candidate==decision&&stable>=STABLE_FRAMES-1&&(armed||last_sent!=decision))begin
       event_valid<=1;event_code<=decision;last_sent<=decision;armed<=0;
      end
     end else begin
      pose_valid<=0;pose_code<=7;candidate<=7;stable<=0;
      if(release_count<RELEASE_FRAMES)release_count<=release_count+1'b1;
      if(release_count>=RELEASE_FRAMES-1)armed<=1;
     end
    end
    5:begin
     sample_valid<=1;pose_valid<=0;pose_code<=7;candidate<=7;stable<=0;state<=0;
     if(release_count<RELEASE_FRAMES)release_count<=release_count+1'b1;
     if(release_count>=RELEASE_FRAMES-1)armed<=1;
    end
   endcase
  end
 end
endmodule
