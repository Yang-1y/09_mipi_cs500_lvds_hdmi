// Same 150MHz domain as recognition; no multi-bit CDC.
// Feature latch with 5s hold: gesture 0 -> date, 1 -> flow light (locked), 2~4 -> digit,
// gesture 5 -> clear all. Hand removal keeps the feature for the hold time.
// Calendar counter is inlined here to avoid a separate source file / black-box issue.
module gesture_board_display #(
 parameter CLK_DIV=600,                        // HC595 SPI divider
 parameter FLOW_DIV=30000000,                  // flow step ~0.2s @150MHz
 parameter [31:0] HOLD_CNT = 150000000*5 - 1,  // 5s hold @150MHz
 parameter [7:0] YY0 = 8'd26,                  // year 20xx last two digits
 parameter [3:0] MM0 = 4'd11,                  // month
 parameter [4:0] DD0 = 5'd1                     // day
)(
 input clk,rst_n,recognized,input [2:0] digit,
 output [7:0] led,output sclk,mosi,latch);

 // ---- feature latch FSM ----
 reg [2:0] feat;        // active feature: 0 date,1 flow,2..4 digit,7 none
 reg feat_on;
 reg [31:0] hold_cnt;
 reg lock;              // flow light locked (stays on until next gesture)

 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin feat<=3'd7; feat_on<=1'b0; hold_cnt<=0; lock<=1'b0; end
  else if(recognized && digit==3'd5) begin
   feat<=3'd7; feat_on<=1'b0; hold_cnt<=0; lock<=1'b0;
  end else if(recognized) begin
   feat<=digit; feat_on<=1'b1; hold_cnt<=0; lock<=1'b0;
  end else if(feat_on) begin
   if(!lock) begin
    if(hold_cnt>=HOLD_CNT) begin
     if(feat==3'd1) lock<=1'b1;
     else begin feat_on<=1'b0; feat<=3'd7; end
    end else hold_cnt<=hold_cnt+1'b1;
   end
  end
 end

 // ---- display signals ----
 wire show_date  = feat_on && (feat==3'd0);
 wire flow       = feat_on && (feat==3'd1);
 wire show_digit = feat_on && (feat>=3'd1 && feat<=3'd4);

 // ---- LED: flow light on feature 1, else light `feat` leds ----
 reg [7:0] flow_reg;
 reg [31:0] flow_cnt;
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin flow_reg<=8'b00000001; flow_cnt<=0; end
  else if(flow) begin
   if(flow_cnt>=FLOW_DIV-1) begin flow_cnt<=0; flow_reg<={flow_reg[6:0],flow_reg[7]}; end
   else flow_cnt<=flow_cnt+1'b1;
  end else begin flow_reg<=8'b00000001; flow_cnt<=0; end
 end
 assign led = flow ? flow_reg : (show_digit ? ((8'd1<<feat)-1'b1) : 8'd0);

 // ---- inlined calendar counter (150MHz) ----
 localparam [27:0] CAL_TICK = 150000000 - 28'd1;
 reg [27:0] cal_cnt;
 reg [5:0] sec, min;
 reg [4:0] hour, day;
 reg [3:0] month;
 reg [7:0] yy;

 wire [4:0] dim =
   (month==4'd1 || month==4'd3 || month==4'd5 || month==4'd7 ||
    month==4'd8 || month==4'd10 || month==4'd12) ? 5'd31 :
   (month==4'd4 || month==4'd6 || month==4'd9 || month==4'd11) ? 5'd30 :
   (yy[1:0]==2'd0) ? 5'd29 : 5'd28;

 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
   cal_cnt<=0; sec<=0; min<=0; hour<=0; day<=DD0; month<=MM0; yy<=YY0;
  end else begin
   if(cal_cnt>=CAL_TICK) begin
    cal_cnt<=0;
    if(sec==59) begin
     sec<=0;
     if(min==59) begin
      min<=0;
      if(hour==23) begin
       hour<=0;
       if(day>=dim) begin
        day<=1;
        if(month==12) begin month<=1; yy<=yy+1; end
        else month<=month+1;
       end else day<=day+1;
      end else hour<=hour+1;
     end else min<=min+1;
    end else sec<=sec+1;
   end else cal_cnt<=cal_cnt+1;
  end
 end

 // binary -> tens/ones
 wire [3:0] y1 = (yy>=90)?4'd9:(yy>=80)?4'd8:(yy>=70)?4'd7:(yy>=60)?4'd6:
                  (yy>=50)?4'd5:(yy>=40)?4'd4:(yy>=30)?4'd3:(yy>=20)?4'd2:(yy>=10)?4'd1:4'd0;
 wire [3:0] m1 = (month>=10)?4'd1:4'd0;
 wire [3:0] d1 = (day>=30)?4'd3:(day>=20)?4'd2:(day>=10)?4'd1:4'd0;
 wire [3:0] y0 = yy - y1*4'd10;
 wire [3:0] m0 = month - m1*4'd10;
 wire [3:0] d0 = day - d1*4'd10;

 // ---- 7-seg ----
 ui_displed #(.CLK_DIV(CLK_DIV)) display(
 .I_clk(clk),.I_rstn(rst_n),.O_spi_sclk(sclk),.O_spi_mosi(mosi),.O_hc595_lach(latch),
 .I_disp_led0(show_date?d0:(show_digit?{1'b0,feat}:4'ha)),
 .I_disp_led1(show_date?d1:4'hb),
 .I_disp_led2(show_date?m0:4'hb),
 .I_disp_led3(show_date?m1:4'hb),
 .I_disp_led4(show_date?y0:4'hb),
 .I_disp_led5(show_date?y1:4'hb),
 .I_disp_led6(show_date?4'd0:4'hb),
 .I_disp_led7(show_date?4'd2:4'hb));
endmodule
