// RGB888 raster video -> training-free skin/marker segmentation -> static digits 0..5.
// Default input: 1920x1080; analyze 240x135. ROI units are downsampled pixels.
module gesture_video #(
 parameter WIDTH=1920,HEIGHT=1080,DS=3,
 parameter X0=45,X1=195,Y0=18,Y1=118,MIN_AREA=500,MAX_AREA=7000,
 parameter MODE=0,SHOW_MASK=0,STABLE_FRAMES=5,
 parameter CB_MIN=77,CB_MAX=127,CR_MIN=133,CR_MAX=173,Y_MIN=30)(
 input clk,input rst_n,input in_vs,input in_de,input [23:0] in_rgb,
 input [1:0] home_state,
 output reg out_vs,output reg out_de,output reg [23:0] out_rgb,
 output event_valid,output [2:0] event_code,output sample_valid,output hand_valid,
 output [11:0] center_x,output [11:0] center_y,output [31:0] hand_area,output recognized,output [2:0] digit);
 reg vs_d,de_d;reg [11:0] x,y;reg [3:0] fs_delay;
 wire frame_edge=in_vs&&!vs_d;
 wire [7:0] r=in_rgb[23:16],g=in_rgb[15:8],b=in_rgb[7:0];
 // Signed intermediate width prevents wraparound for dark and saturated colors.
 wire signed [17:0] rr=$signed({10'd0,r}),gg=$signed({10'd0,g}),bb=$signed({10'd0,b});
 wire signed [17:0] lum=(77*rr+150*gg+29*bb)>>>8;
 wire signed [17:0] cb=18'sd128+((-43*rr-85*gg+128*bb)>>>8);
 wire signed [17:0] cr=18'sd128+((128*rr-107*gg-21*bb)>>>8);
 wire skin=(lum>=Y_MIN&&cb>=CB_MIN&&cb<=CB_MAX&&cr>=CR_MIN&&cr<=CR_MAX);
 wire marker=({1'b0,g}>{1'b0,r}+9'd35)&&({1'b0,g}>{1'b0,b}+9'd25)&&(g>80);
 wire raw_mask=(MODE==0)?skin:marker;
 localparam STEP=(1<<DS);
 reg sen,smask;reg [11:0] sx,sy;
 wire men,mask;wire [11:0] mx,my;
 wire [11:0] bx0,bx1,by0,by1;wire pose_valid;wire [2:0] pose_code;
 assign recognized=pose_valid;assign digit=pose_code;
 assign center_x=(bx0+bx1)>>1;assign center_y=(by0+by1)>>1;
 wire roi_border=((x==X0*STEP||x==X1*STEP)&&(y>=Y0*STEP&&y<=Y1*STEP))||
                 ((y==Y0*STEP||y==Y1*STEP)&&(x>=X0*STEP&&x<=X1*STEP));
 wire box_border=hand_valid&&(((x==(bx0<<DS)||x==(bx1<<DS))&&(y>=(by0<<DS)&&y<=(by1<<DS)))||
                  ((y==(by0<<DS)||y==(by1<<DS))&&(x>=(bx0<<DS)&&x<=(bx1<<DS))));
 wire crosshair=hand_valid&&(((x==(center_x<<DS))&&(y+8>=(center_y<<DS)&&y<=(center_y<<DS)+8))||
                   ((y==(center_y<<DS))&&(x+8>=(center_x<<DS)&&x<=(center_x<<DS)+8)));
 reg [2:0] last_event;
 reg [6:0] seg;
 always @* case(last_event)
 0:seg=7'b1111110;1:seg=7'b0110000;2:seg=7'b1101101;
 3:seg=7'b1111001;4:seg=7'b0110011;5:seg=7'b1011011;default:seg=7'b0000001;endcase
 wire digit_on=(seg[6]&&x>=28&&x<52&&y>=24&&y<28)||
 (seg[5]&&x>=52&&x<56&&y>=28&&y<48)||(seg[4]&&x>=52&&x<56&&y>=52&&y<72)||
 (seg[3]&&x>=28&&x<52&&y>=72&&y<76)||(seg[2]&&x>=24&&x<28&&y>=52&&y<72)||
 (seg[1]&&x>=24&&x<28&&y>=28&&y<48)||(seg[0]&&x>=28&&x<52&&y>=48&&y<52);
 wire [2:0] bar=(x>=24&&x<224)?((x-24)/40)+1:0;
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin vs_d<=0;de_d<=0;x<=0;y<=0;fs_delay<=0;sen<=0;smask<=0;sx<=0;sy<=0;
   out_vs<=0;out_de<=0;out_rgb<=0;last_event<=7;end
  else begin
   vs_d<=in_vs;de_d<=in_de;fs_delay<={fs_delay[2:0],frame_edge};
   if(frame_edge)begin x<=0;y<=0;end
   else begin
    if(in_de)begin if(x<WIDTH)x<=x+1'b1;end else x<=0;
    if(de_d&&!in_de&&y<HEIGHT)y<=y+1'b1;
   end
   sen<=in_de&&(x<WIDTH)&&(y<HEIGHT)&&((x&(STEP-1))==0)&&((y&(STEP-1))==0);
   smask<=raw_mask;sx<=x>>DS;sy<=y>>DS;
   if(!pose_valid)last_event<=7;
   else last_event<=pose_code;
   out_vs<=in_vs;out_de<=in_de;
   if(!in_de)out_rgb<=0;
   else if(roi_border)out_rgb<=24'h00CFFF;
   else if(box_border)out_rgb<=pose_valid?24'h00FF55:24'hFFC000;
   else if(crosshair)out_rgb<=24'hFF3040;
   else if(x>=20&&x<60&&y>=20&&y<80)out_rgb<=digit_on?24'hFFB020:24'h182030;
   else if(y>=56&&y<72&&x>=70&&x<104)out_rgb<=home_state[0]?24'hFFE080:24'h202020;
   else if(y>=56&&y<72&&x>=112&&x<192)out_rgb<=home_state[1]?24'h60E0D0:24'h202020;
   else if(SHOW_MASK&&x>=X0*STEP&&x<X1*STEP&&y>=Y0*STEP&&y<Y1*STEP)
    out_rgb<=raw_mask?24'hFFFFFF:24'h000000;
   else out_rgb<=in_rgb;
  end
 end
 gesture_majority #(.WIDTH((WIDTH+STEP-1)/STEP)) clean(clk,rst_n,sen,smask,sx,sy,men,mask,mx,my);
 gesture_static #(.WIDTH((WIDTH+STEP-1)/STEP),.HEIGHT((HEIGHT+STEP-1)/STEP),
 .X0(X0),.X1(X1),.Y0(Y0),.Y1(Y1),.MIN_AREA(MIN_AREA),.MAX_AREA(MAX_AREA),.STABLE_FRAMES(STABLE_FRAMES))
 classifier(.clk(clk),.rst_n(rst_n),.frame_start(fs_delay[3]),.en(men),.mask(mask),.x(mx),.y(my),
 .sample_valid(sample_valid),.hand_valid(hand_valid),.pose_valid(pose_valid),.pose_code(pose_code),
 .event_valid(event_valid),.event_code(event_code),.bx0(bx0),.bx1(bx1),.by0(by0),.by1(by1),.hand_area(hand_area));
endmodule
