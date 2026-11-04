//////////////////////////////////////////////////////////////////////////////////

/*******************************MILIANKE*******************************
*Company : MiLianKe Electronic Technology Co., Ltd.
*WebSite:https://www.milianke.com
*TechWeb:https://www.uisrc.com
*tmall-shop:https://milianke.tmall.com
*jd-shop:https://milianke.jd.com
*taobao-shop1: https://milianke.taobao.com
*Create Date: 2023/03/23
*Module Name:
*File Name:
*Description: 
*The reference demo provided by Milianke is only used for learning. 
*We cannot ensure that the demo itself is free of bugs, so users 
*should be responsible for the technical problems and consequences
*caused by the use of their own products.
*Copyright: Copyright (c) MiLianKe
*All rights reserved.
*Revision: 1.1
*Signal description
*1) I_ input
*2) O_ output
*3) IO_ input output
*4) S_ state mechine
*5) _n activ low
*6) _dg debug signal 
*7) _r delay or register
*********************************************************************/
`timescale 1ns / 1ns

//***********spi数码管显示控制器 ***********//
module ui_displed#
(
parameter CLK_DIV = 100 
)
(
input  I_clk,          //系统时钟
input  I_rstn,         //复位
output O_spi_sclk,     //hc595移位时钟
output O_spi_mosi,     //hc595串行数据
output O_hc595_lach,   //hc595数据加载到输出寄存器
input  [3:0]I_disp_led0, //Display LED0
input  [3:0]I_disp_led1, //Display LED1
input  [3:0]I_disp_led2, //Display LED2
input  [3:0]I_disp_led3, //Display LED3
input  [3:0]I_disp_led4, //Display LED4
input  [3:0]I_disp_led5, //Display LED5
input  [3:0]I_disp_led6, //Display LED6
input  [3:0]I_disp_led7  //Display LED7
);





//数码管真值表
localparam 
            DS_0        = 8'hC0,//数码管显示0
            DS_1        = 8'hF9,//数码管显示1
            DS_2        = 8'hA4,//数码管显示2
            DS_3        = 8'hB0,//数码管显示3
            DS_4        = 8'h99,//数码管显示4
            DS_5        = 8'h92,//数码管显示5
            DS_6        = 8'h82,//数码管显示6
            DS_7        = 8'hf8,//数码管显示7
            DS_8        = 8'h80,//数码管显示8
            DS_9        = 8'h90,//数码管显示9
            DS_A        = 8'h88,//数码管显示A
            DS_B        = 8'h83,//数码管显示B
            DS_C        = 8'hc6,//数码管显示C
            DS_D        = 8'ha1,//数码管显示D
            DS_E        = 8'h86,//数码管显示E
            DS_F        = 8'h8e,//数码管显示F
            DS_BC_ON    = 8'hbf,//b c点亮
            DS_BC_OFF   = 8'hff;//b c点灭

reg [7:0]   spi_tx_data = 8'd0;
reg         spi_tx_req  = 1'b0;
wire        spi_busy;
reg         lach595     = 1'b0;
reg [3:0]   M_S         = 4'd0;

reg [2:0]   disp_num    = 3'd0;
reg [7:0]   disp_led_n  = 8'd0;
reg [3:0]   disp_led    = 4'd0;
reg [7:0]   disp_truth_value = 8'd0;
wire        disp_en ;

assign O_hc595_lach = lach595;               //hc595数据加载到输出寄存器的控制信号
assign disp_en      = (M_S == 4'd15);       //到达状态15完成一次传输

//动态门控数字管
always @(posedge I_clk or negedge I_rstn)begin 
    if(!I_rstn)
         disp_num <= 3'd0;                           
     else if( disp_en ) 
         disp_num <= disp_num + 1'b1;   
end

always @(posedge I_clk or negedge I_rstn)begin
    if(!I_rstn)begin                               //异步复位，低电平有效
        spi_tx_req  <= 1'b0;                       //req 信号归零，回归初始状态
        spi_tx_data <= 8'd0;                       //待发送数据的data信号清零
        lach595     <= 1'b0;
        M_S         <= 4'd0;
    end
    else begin
        case(M_S)
            0:if(!spi_busy)begin                       //总线不忙启动传输
               spi_tx_req       <= 1'b1;               //req信号拉高，开始第一次传输
               spi_tx_data      <= disp_led_n;        //哪一个数码管显示数字信号传输
               M_S              <= 4'd1;   
            end
            1:if(spi_busy)begin
                spi_tx_req      <= 1'b0;               //req信号拉低，等待传输完成，也就是busy信号拉低
                M_S             <= 4'd2;
            end
            2:if(!spi_busy)begin                       //总线不忙启动传输
                spi_tx_req      <= 1'b1;               //req信号拉高，开始第二次传输
                spi_tx_data     <= disp_truth_value;   //数码管显示数字数值传输
                M_S             <= 4'd3;   
            end
            3:if(spi_busy)begin
                spi_tx_req      <= 1'b0;                 //req信号拉低，等待传输完成，也就是busy信号拉低
                M_S             <= 4'd4;
            end
            4:if(!spi_busy)begin                          //向hc595输出寄存器发送数据
                lach595         <= 1'b1;                  //控制信号拉高
                M_S             <= 4'd5;
            end
            5,6,7,8,9,10,11,12,13,14:begin              //延迟一些时钟以满足发射定时要求
                M_S <= M_S + 1'b1;
            end 
            15:begin
                lach595 <= 1'b0;
                M_S <= 4'd0;
            end 
            default:M_S <= 4'd0;    
        endcase
     end
end   
//动态门控数字管，hc595的第1组数据
always @(*)begin
            case ( disp_num ) 
            0:
            begin disp_led <= I_disp_led0;disp_led_n <= 8'b1000_0000;end//数码管 0 选中
            1:
            begin disp_led <= I_disp_led1;disp_led_n <= 8'b0100_0000;end//数码管 1 选中
            2:
            begin disp_led <= I_disp_led2;disp_led_n <= 8'b0010_0000;end//数码管 2 选中
            3:
            begin disp_led <= I_disp_led3;disp_led_n <= 8'b0001_0000;end//数码管 3 选中
            4:
            begin disp_led <= I_disp_led4;disp_led_n <= 8'b0000_1000;end//数码管 4 选中
            5:
            begin disp_led <= I_disp_led5;disp_led_n <= 8'b0000_0100;end//数码管 5 选中
            6:
            begin disp_led <= I_disp_led6;disp_led_n <= 8'b0000_0010;end//数码管 6 选中
            7:
            begin disp_led <= I_disp_led7;disp_led_n <= 8'b0000_0001;end//数码管 7 选中            
            endcase
end
//动态门控数字管，hc595第2组数据  
always @(*)begin
            case( disp_led ) 
                4'h0: disp_truth_value <= DS_0; //disp_led数字选择几，就disp_truth_value值就传输对应的数码管真值表
                4'h1: disp_truth_value <= DS_1;
                4'h2: disp_truth_value <= DS_2;
                4'h3: disp_truth_value <= DS_3;
                4'h4: disp_truth_value <= DS_4;
                4'h5: disp_truth_value <= DS_5;
                4'h6: disp_truth_value <= DS_6;
                4'h7: disp_truth_value <= DS_7;
                4'h8: disp_truth_value <= DS_8;
                4'h9: disp_truth_value <= DS_9;
                4'ha: disp_truth_value <= DS_BC_ON;
                4'hb: disp_truth_value <= DS_BC_OFF;                        
                default : disp_truth_value <= 8'd0; // disp_truth_value的值复位清零
            endcase
end
//spi主控制器
uimspi_tx#
(
.CLK_DIV(CLK_DIV),
.CPOL(1'b0),
.CPHA(1'b0)
)
uimspi_tx_inst(
.I_clk(I_clk),//全局时钟信号
.I_rstn(I_rstn),//全局复位
.O_spi_mosi(O_spi_mosi),//spi 数据传输信号
.O_spi_sclk(O_spi_sclk),//spi 时钟信号
.I_spi_tx_req(spi_tx_req),//spi_tx_req信号为高时，表示传输开始
.I_spi_tx_data(spi_tx_data),//spi tx传输驱动需要传输的数据
.O_spi_busy(spi_busy)//spi 忙信号，拉高表示正在传输，新的数据暂停刷入传输寄存器
 );

endmodule