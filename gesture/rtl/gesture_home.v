// All ports synchronous to clk. GPIO outputs are logic signals for external drivers.
// Local commands win over simultaneous remote commands. STOP clears loads.
module gesture_home #(
 parameter CLK_HZ=150000000,FAILSAFE_MS=2000,BEEP_MS=100)(
 input clk,input rst_n,input frame_tick,input local_valid,input [2:0] local_code,
 input remote_valid,input [2:0] remote_code,
 output reg led_on,output reg fan_on,output fan_pwm,output servo_pwm,
 output buzzer_en,output speaker_tone,output reg accepted,output reg [2:0] accepted_code);
 localparam PWM_TICKS=CLK_HZ/25000;
 localparam SERVO_TICKS=CLK_HZ/50;
 localparam US_TICKS=CLK_HZ/1000000;
 localparam WATCH_TICKS=(CLK_HZ/1000)*FAILSAFE_MS;
 localparam BEEP_TICKS=(CLK_HZ/1000)*BEEP_MS;
 reg [31:0] pwm_count,servo_count,watch_count,beep_count,tone_count;
 reg tone;reg [11:0] servo_us,active_servo_us;
 wire command_valid=local_valid||remote_valid;
 wire [2:0] command=local_valid?local_code:remote_code;
 assign fan_pwm=rst_n&&fan_on&&(pwm_count<(PWM_TICKS*3/4));
 assign servo_pwm=rst_n&&(servo_count<(US_TICKS*active_servo_us));
 assign buzzer_en=rst_n&&(beep_count!=0);
 assign speaker_tone=buzzer_en&&tone;
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n)begin led_on<=0;fan_on<=0;servo_us<=1500;active_servo_us<=1500;pwm_count<=0;servo_count<=0;watch_count<=0;
   beep_count<=0;tone_count<=0;tone<=0;accepted<=0;accepted_code<=0;end
  else begin
   accepted<=0;
   if(pwm_count>=PWM_TICKS-1)pwm_count<=0;else pwm_count<=pwm_count+1'b1;
   if(servo_count>=SERVO_TICKS-1)begin servo_count<=0;active_servo_us<=servo_us;end else servo_count<=servo_count+1'b1;
   if(tone_count>=CLK_HZ/2000-1)begin tone_count<=0;tone<=~tone;end else tone_count<=tone_count+1'b1;
   if(beep_count!=0)beep_count<=beep_count-1'b1;
   if(frame_tick)watch_count<=0;else if(watch_count<WATCH_TICKS)watch_count<=watch_count+1'b1;
   if(!frame_tick&&watch_count>=WATCH_TICKS-1)begin led_on<=0;fan_on<=0;servo_us<=1500;beep_count<=0;end
   else if(command_valid&&command<=5) begin
    accepted<=1;accepted_code<=command;beep_count<=BEEP_TICKS;
    case(command)
     0:begin led_on<=0;fan_on<=0;servo_us<=1500;beep_count<=0;end
     1:led_on<=1;
     2:fan_on<=1;
     3:servo_us<=1000;
     4:servo_us<=2000;
     5:begin end // Beep/tone only, preserve other loads.
    endcase
   end
  end
 end
endmodule
