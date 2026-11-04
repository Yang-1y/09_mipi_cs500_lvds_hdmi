
`define DRAM_BYTE_NUM    4
`define APP_ADDR_WIDTH   27


module system_top (
input wire            I_sys_clk_25m,
input wire            I_ddr_clk,
inout wire            IO_cam_sda,
output wire           O_cam_scl,
output wire           O_clk_24m,
input  wire   [3:0]   I_button, 
output wire   [2:0]   O_hdmi_tx_p,
output wire           O_hdmi_clk_p,
output wire           O_gesture_uart_tx,
output wire   [7:0]   O_led,
output wire           O_spi_sclk, O_spi_mosi, O_hc595_lach,
output wire           O_mp3_tx
);

wire        S_rst;
wire        pclkx1;
wire        pclkx5;

wire        S_hs_rx_clk;           //synthesis keep  
wire        S_hs_rx_valid;         //synthesis keep  
wire[15:0]  S_hs_rx_data;          //synthesis keep
 
wire        S_csi_frame_start;       
wire        S_csi_frame_end;         
wire        S_csi_valid;             
wire[31:0]  S_csi_data;     


//	Current implementation supports RAW8 only. 
wire 			w_mipi_clk; 
wire 			w_csi_rx_vsync0;//synthesis keep
wire 			w_csi_rx_hsync0;//synthesis keep
wire 			w_csi_rx_dvalid; //synthesis keep
wire 	[47:0] 	w_csi_rx_data; 
wire 	[15:0] 	w_csi_rx_index; 

 
wire        S_raw8_frame_start; 
wire        S_raw8_frame_end;   
wire        S_raw8_valid;       
wire[31:0]  S_raw8_data;             

pll u_pll(
.refclk   ( I_sys_clk_25m          ),
.lock     ( S_pll_lock             ),
 
.clk0_out ( pclkx1                 ),
.clk1_out ( pclkx5                 ),
.clk2_out ( S_clk_70m              ),
.clk3_out ( O_clk_24m              )
);

assign S_rst = ~S_pll_lock;

localparam  AXI_ADDR_WIDTH = `APP_ADDR_WIDTH +2;
localparam  AXI_DATA_WIDTH = `DRAM_BYTE_NUM*8*8;

wire [AXI_ADDR_WIDTH-1:  0]      fdma_waddr;   //FDMA写通道地址
wire                             fdma_wareq;   //FDMA写通道请求
wire [15: 0]                     fdma_wsize;   //FDMA写通道一次FDMA的传输大小                                       
wire                             fdma_wbusy;   //FDMA处于BUSY状态，AXI总线正在写操作 		
wire [AXI_DATA_WIDTH-1 : 0]      fdma_wdata;   //FDMA写数据
wire                             fdma_wvalid;  //FDMA 写有效
wire                             fdma_wready;  //FDMA写准备好，用户可以写数据

wire [AXI_ADDR_WIDTH-1:  0]      fdma_raddr;   //FDMA读通道地址
wire                             fdma_rareq;   //FDMA读通道请求
wire [15: 0]                     fdma_rsize;   //FDMA读通道一次FDMA的传输大小                                       
wire                             fdma_rbusy;   //FDMA处于BUSY状态，AXI总线正在读操作 			
wire [AXI_DATA_WIDTH-1 : 0]      fdma_rdata;   //FDMA读数据
wire                             fdma_rvalid;  //FDMA 读有效
wire                             fdma_rready;  //FDMA读准备好，用户可以读数据	

wire                             O_axi_clk;//synthesis keep
wire                             pll_locked;//synthesis keep

//例化APP接口转AXI接口
uifdma_axi_ddr#
(
.M_AXI_MAX_BURST_LEN (16)
)
u_uifdma_axi_ddr
(
.I_ddr_clk                       ( I_ddr_clk    ),
.I_sys_rstn                      ( 1'b1         ),
.O_ddr_pll_locked                ( pll_locked   ),
.O_init_calib_complete           ( ddr_cal_done ),

// DDR signals
.ddr_reset_n                     ( ddr_reset_n  ),
.ddr_addr                        ( ddr_addr     ),
.ddr_ba                          ( ddr_ba       ),
.ddr_ck_p                        ( ddr_ck_p     ),
.ddr_ck_n                        ( ddr_ck_n     ),
.ddr_cke                         ( ddr_cke      ),
.ddr_cs_n                        ( ddr_cs_n     ),
.ddr_ras_n                       ( ddr_ras_n    ),
.ddr_cas_n                       ( ddr_cas_n    ),
.ddr_we_n                        ( ddr_we_n     ),
.ddr_odt                         ( ddr_odt      ),
.ddr_dqs_p                       ( ddr_dqs_p    ),
.ddr_dqs_n                       ( ddr_dqs_n    ),
.ddr_dq                          ( ddr_dq       ),
.ddr_dm                          ( ddr_dm       ),

.O_uart_txd                      (O_uart_txd    ),
.I_uart_rxd                      (I_uart_rxd    ),

.O_axi_clk                       (O_axi_clk     ),

.I_fdma_waddr                    (fdma_waddr)    ,// FDMA写通道地址
.I_fdma_wareq                    (fdma_wareq)    ,// FDMA写通道请求
.I_fdma_wsize                    (fdma_wsize)    ,// FDMA写通道一次FDMA的传输大小                                            
.O_fdma_wbusy                    (fdma_wbusy)    ,// FDMA处于BUSY状态，AXI总线正在写操作  
				
.I_fdma_wdata                    (fdma_wdata)    ,// FDMA写数据
.O_fdma_wvalid                   (fdma_wvalid)   ,// FDMA 写有效
.I_fdma_wready                   (1'b1)		     ,// FDMA写准备好，用户可以写数据

.I_fdma_raddr                    (fdma_raddr)    ,// FDMA读通道地址
.I_fdma_rareq                    (fdma_rareq)    ,// FDMA读通道请求
.I_fdma_rsize                    (fdma_rsize)    ,// FDMA读通道一次FDMA的传输大小                                      
.O_fdma_rbusy                    (fdma_rbusy)    ,// FDMA处于BUSY状态，AXI总线正在读操作 
				
.O_fdma_rdata                    (fdma_rdata)    ,// FDMA读数据
.O_fdma_rvalid                   (fdma_rvalid)   ,// FDMA 读有效
.I_fdma_rready                   (1'b1)		     // FDMA读准备好，用户可以读数据
);


wire   vtc_rstn ;
wire   vtc_clk;
wire   vtc_vs;//synthesis keep
wire   vtc_hs;//synthesis keep
wire   vtc_user;//synthesis keep
wire   vtc_de_valid;//synthesis keep
wire   vtc_last;////synthesis keep

assign vtc_clk  =  pclkx1; // 内部像素时钟
assign vtc_rstn = S_pll_lock;    // 


uivtc#
(
.H_ActiveSize       (1920), //视频时间参数,行视频信号，一行有效(需要显示的部分)像素所占的时钟数，一个时钟对应一个有效像素
.H_SyncStart        (1920+88), //视频时间参数,行同步开始，即多少时钟数后开始产生行同步信号 
.H_SyncEnd          (1920+88+44),//视频时间参数,行同步结束，即多少时钟数后停止产生行同步信号，之后就是行有效数据部分
.H_FrameSize        (1920+88+44+148), //视频时间参数,行视频信号，一行视频信号总计占用的时钟数

.V_ActiveSize       (1080),//视频时间参数,场视频信号，一帧图像所占用的有效(需要显示的部分)行数量，通常说的视频分辨率即H_ActiveSize*V_ActiveSize
.V_SyncStart        (1080+4),//视频时间参数,场同步开始，即多少行数后开始产生场同步信号 
.V_SyncEnd          (1080+4+5), //视频时间参数,场同步结束，多少行后停止产生长同步信号  
.V_FrameSize        (1080+4+5+36) //视频时间参数,场视频信号，一帧视频信号总计占用的行数量       
)
uivtc_inst
(
.I_vtc_clk(vtc_clk),  //系统时钟 
.I_vtc_rstn(vtc_rstn),//系统复位
.O_vtc_vs  (vtc_vs),//场同步输出
.O_vtc_hs  (vtc_hs),//行同步输出
.O_vtc_de_valid(vtc_de_valid),//视频数据有效
.O_vtc_user(vtc_user),    //满足stream时序产生 user 信号,用于帧同步
.O_vtc_last(vtc_last)     //满足stream时序产生 later 信号,用于每行结束
);

wire ud_wclk;//synthesis keep
wire ud_wvs;//synthesis keep
wire ud_wde;//synthesis keep
wire [31:0] ud_wdata;//synthesis keep

wire ud_rclk,ud_rvs,ud_rde;
wire [31:0]  ud_rdata;//synthesis keep

wire [7:0] wbuf_sync,rbuf_sync;
reg  ud_rfifo_en;

assign ud_wclk   = S_hs_rx_clk;
assign ud_wvs    = S_raw8_frame_start;
assign ud_wde    = S_raw8_valid;
assign ud_wdata  = S_raw8_data;


//assign ud_wclk   = w_mipi_clk;
//assign ud_wvs    = w_csi_rx_vsync0;
//assign ud_wde    = w_csi_rx_hsync0 && w_csi_rx_dvalid;
//assign ud_wdata  = {w_csi_rx_data[11:4],w_csi_rx_data[23:16], w_csi_rx_data[35:28],w_csi_rx_data[47:40]}; 

assign ud_rclk   = vtc_clk;
assign ud_rvs    = vtc_vs;
assign ud_rde    = ud_rfifo_en;

//例化uidbuf 控制器
uidbuf# (
.VIDEO_ENABLE(1'b1),  
.ENABLE_WRITE(1'b1), 
.ENABLE_READ(1'b1), 
.AXI_DATA_WIDTH(AXI_DATA_WIDTH),
.AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),

.W_BUFDEPTH(1024),
.W_DATAWIDTH(32),
.W_BASEADDR(0),
.W_DSIZEBITS(25),
.W_XSIZE(480),
.W_XSTRIDE(480),
.W_YSIZE(1080),
.W_XDIV(1),
.W_BUFSIZE(3),

.R_BUFDEPTH(1024),
.R_DATAWIDTH(32),
.R_BASEADDR(0),
.R_DSIZEBITS(25),
.R_XSIZE(480),
.R_XSTRIDE(480),
.R_YSIZE(1080),
.R_XDIV(1),
.R_BUFSIZE(3)
)
uidbuf_u0
(
.I_ui_clk(O_axi_clk),
.I_ui_rstn(pll_locked),

.I_W_FS(ud_wvs),
.I_W_clk(ud_wclk),
.I_W_wren(ud_wde),
.I_W_data(ud_wdata), 
.O_W_sync_cnt(wbuf_sync),
.I_W_buf(wbuf_sync),
.O_W_full(),

.I_R_FS(ud_rvs),
.I_R_clk(ud_rclk),
.I_R_rden(ud_rde),
.O_R_data(ud_rdata),
.O_R_sync_cnt(),
.I_R_buf(rbuf_sync),
.O_R_empty(),
       
.O_fdma_waddr(fdma_waddr)  ,
.O_fdma_wareq(fdma_wareq)  ,
.O_fdma_wsize(fdma_wsize)  ,                                     
.I_fdma_wbusy(fdma_wbusy)  ,			
.O_fdma_wdata(fdma_wdata)	 ,
.I_fdma_wvalid(fdma_wvalid),
.O_fdma_wready(fdma_wready),
.O_fdma_raddr(fdma_raddr)  ,
.O_fdma_rareq(fdma_rareq)  ,
.O_fdma_rsize(fdma_rsize)  ,                                     
.I_fdma_rbusy(fdma_rbusy)  ,			
.I_fdma_rdata(fdma_rdata)	 ,
.I_fdma_rvalid(fdma_rvalid),
.O_fdma_rready(fdma_rready),
.O_fmda_wbuf  (fdma_wbuf),	
.O_fdma_wirq  (fdma_wirq),		
.O_fmda_rbuf  (fdma_rbuf),	
.O_fdma_rirq  (fdma_rirq)
 ); 

//设置3帧缓存，读延迟写1帧
uisetvbuf#(
.BUF_DELAY(2),
.BUF_LENTH(3)
)
uisetvbuf_u
(
.I_bufn(wbuf_sync),
.O_bufn(rbuf_sync)
);   

//以下代码需要注意时序设计，在正确的时序输出
reg [1 :0] ud_rdata_cnt; //synthesis keep
reg [7 :0] ud_rdata_d1;//synthesis keep
reg  vtc_user_d1;//synthesis keep
reg  vtc_last_d1;//synthesis keep
reg  vtc_de_valid_d1; //synthesis keep

always @(posedge vtc_clk) begin
    if(vtc_de_valid)
        ud_rdata_cnt <= ud_rdata_cnt + 'd1;
    else 
        ud_rdata_cnt <= 0;
end

always @(posedge vtc_clk) begin
        vtc_user_d1     <= vtc_user;
        vtc_last_d1     <= vtc_last;
        vtc_de_valid_d1 <= vtc_de_valid;
end

// 当vtc_de_valid = 1 ud_rdata_cnt =1 读1个数据，但是ud_rfifo_en延迟1个周期输出1，fifo再延迟1个周期更新数据
always @(posedge vtc_clk) begin
    ud_rfifo_en <=  (ud_rdata_cnt == 2);
end

always @(posedge vtc_clk) begin
    if(vtc_de_valid)begin
        case(ud_rdata_cnt)
            'd0: ud_rdata_d1 <=  ud_rdata[31:24]; 
            'd1: ud_rdata_d1 <=  ud_rdata[23:16]; 
            'd2: ud_rdata_d1 <=  ud_rdata[15: 8];
            'd3: ud_rdata_d1 <=  ud_rdata[7 : 0];
        default:
            ud_rdata_d1 <= ud_rdata_d1;
    endcase
    end
    else 
        ud_rdata_d1 <=0;
end

wire 			w_rgb_vsync, w_rgb_href; 
wire 	[7:0] 	w_rgb_r, w_rgb_g, w_rgb_b; 


raw8_2_rgb888 #(
.H_SIZE(1920), 
.V_SIZE(1080)
)u_raw8_2_rgb888 
(
.I_clk	        (vtc_clk),                //cmos video pixel clock
.I_rst_n	    (vtc_rstn),              //global reset
	    
//CMOS YCbCr444 data output
.I_raw_vs	    (~vtc_vs),    //Prepared Image data vsync valid signal. Reset on falling edge. 
.I_raw_de	    (vtc_de_valid_d1),     //Prepared Image data href vaild  signal
.I_raw_data	    (ud_rdata_d1),        //Prepared Image data 8 Bit RAW Data

.O_rgb_vs	    (w_rgb_vsync),   //Processed Image data vsync valid signal
.O_rgb_de	    (w_rgb_href),    //Processed Image data href vaild  signal
.O_rgb_r		(w_rgb_r),       //Prepared Image green data to be processed 
.O_rgb_g	    (w_rgb_g),     //Prepared Image green data to be processed
.O_rgb_b		(w_rgb_b)       //Prepared Image blue data to be processed
);

wire 			w_awb_vs, w_awb_hs, w_awb_de; 
wire 	[7:0] 	w_awb_r, w_awb_g, w_awb_b;
awb u_awb 
(
.I_clk          (vtc_clk),
.I_rst_n        (vtc_rstn),

.I_red_gain     (0),
.I_green_gain   (0),
.I_blue_gain    (0),

.I_awb_vs       (w_rgb_vsync),
.I_awb_hs       (w_rgb_href),
.I_awb_de       (w_rgb_href),
.I_awb_rgb      ({w_rgb_r, w_rgb_g, w_rgb_b}),

.O_awb_vs       (w_awb_vs),
.O_awb_hs       (w_awb_hs),
.O_awb_de       (w_awb_de),
.O_awb_rgb      ({w_awb_r, w_awb_g, w_awb_b})
);


wire 			w_crop_vs, w_crop_hs, w_crop_de; 
wire 	[23:0] 	w_crop_data; 

bound_cut u_bound_cut 
(
.I_clk		    (vtc_clk),
.I_awb_vs 		(w_awb_vs),
.I_awb_hs 		(w_awb_hs),
.I_awb_de 		(w_awb_de),
.I_awb_data 	({w_awb_r, w_awb_g, w_awb_b}),
		
.O_awb_vs 		(w_crop_vs),
.O_awb_hs 		(w_crop_hs),
.O_awb_de 		(w_crop_de),
.O_awb_data     (w_crop_data)
);

//解码为RAW8
/**/
raw10_unpacket_2lane u_raw10_unpacket(
.I_clk                 ( S_hs_rx_clk          ),
.I_rst_n               ( ~S_rst               ),
                                                     
.I_csi_frame_start     ( S_csi_frame_start    ),
.I_csi_frame_end       ( S_csi_frame_end      ),
.I_csi_valid           ( S_csi_valid          ),
.I_csi_data            ( S_csi_data           ),
    
.O_raw8_frame_start    ( S_raw8_frame_start   ),
.O_raw8_frame_end      ( S_raw8_frame_end     ),
.O_raw8_valid          ( S_raw8_valid         ),
.O_raw8_data           ( S_raw8_data          )
);

//csi 解码为RAW数据

csi_unpacket_2lane u_csi_unpacket(
.I_clk                 ( S_hs_rx_clk       ),
.I_rst_n               ( ~S_rst            ),

.I_hs_valid            ( S_hs_rx_valid     ),
.I_hs_data             ( S_hs_rx_data      ),

.O_csi_frame_start     ( S_csi_frame_start ),
.O_csi_frame_end       ( S_csi_frame_end   ),
.O_csi_valid           ( S_csi_valid       ),
.O_csi_data            ( S_csi_data        )
);

assign S_data_lane1_idelay = 100;
assign S_data_lane0_idelay = 100;
assign S_clk_lane_idelay   = 0;

wire [1:0] S_lane_error;//synthesis keep
wire [7:0] 	O_lp_rx_data; 


mipi_dphy_rx_ph1a_mipiio_wrapper#(
.LANE_NUM              ( 2 ),
.BYTE_NUM              ( 1 )
)u_mipi_dphy_rx_ph1a_mipiio_wrapper(
.I_lp_clk              ( S_clk_70m        ),
.I_rst                 ( S_rst        ),

.I_clk_lane_in_delay   ( S_clk_lane_idelay     ),
.I_data_lane0_in_delay ( S_data_lane0_idelay   ),
.I_data_lane1_in_delay ( S_data_lane1_idelay   ),
.I_data_lane2_in_delay ( S_data_lane2_idelay  ),
.I_data_lane3_in_delay ( S_data_lane3_idelay  ),

.I_lane_invert         ( 4'b0000         ),

.O_hs_rx_clk           ( S_hs_rx_clk     ),
.O_hs_rx_valid         ( S_hs_rx_valid   ),
.O_hs_rx_data          ( S_hs_rx_data    ),

.O_lp_rx_lane0_p       ( S_lp_rx_lane0_p ),
.O_lp_rx_lane0_n       ( S_lp_rx_lane0_n ),

.I_lp_tx_en            ( 1'b0            ),
.I_lp_tx_lane0_p       ( 1'b0            ),
.I_lp_tx_lane0_n       ( 1'b0            ),

.O_lane_error          ( S_lane_error    )
);

wire [15:0]ae;//synthesis keep
wire [15:0]ag;//synthesis keep
wire cam_cfg_done,ae_cfg_done;
wire ae_req;
ae_set u_ae_set(
.I_clk(O_clk_24m),
.I_rst(~S_pll_lock),
.I_btn(I_button),
.I_cam_cfg_done(cam_cfg_done),
.I_ae_cfg_done(ae_cfg_done),
.O_ae_req(ae_req),
.O_ae(ae),
.O_ag(ag)
);

uicfgcs500#
(
.CLK_DIV(24000000/100000-1)
)
u_uicfgcs500
(
.I_clk(O_clk_24m),  //系统时钟输入
.I_rst_n(S_pll_lock),  //系统复位输入
.I_ae_req(ae_req),
.I_ae(ae),
.I_ag(ag),
.O_cam_scl(O_cam_scl), //I2C总线，SCL时钟
.IO_cam_sda(IO_cam_sda), //I2C总线，SDA数据
.O_cfg_done(cam_cfg_done),//摄像头寄存器初始化完成
.O_ae_cfg_done(ae_cfg_done)//AE配置完成
);	


// Training-free gesture analysis in the existing RGB pixel-clock domain.
// 150 MHz is the actual clk0 frequency in the supplied pll.ipc.
wire ddr_cal_done;
(* async_reg = "true" *) reg [1:0] gesture_cam_ready, gesture_ddr_ready;
reg [1:0] gesture_reset_pipe;
always @(posedge vtc_clk or negedge S_pll_lock) begin
    if (!S_pll_lock) begin gesture_cam_ready<=0;gesture_ddr_ready<=0;gesture_reset_pipe<=0;end
    else begin
        gesture_cam_ready<={gesture_cam_ready[0],cam_cfg_done};
        gesture_ddr_ready<={gesture_ddr_ready[0],ddr_cal_done};
        gesture_reset_pipe<={gesture_reset_pipe[0],gesture_cam_ready[1]&&gesture_ddr_ready[1]};
    end
end
wire gesture_rst_n=gesture_reset_pipe[1];
wire g_vs,g_de,g_valid,g_sample,g_hand,g_recognized;
wire [2:0] g_digit;
wire [23:0] g_rgb;
wire [2:0] g_code,g_accepted_code;
wire [11:0] g_cx,g_cy;
wire [31:0] g_area;
wire g_led,g_fan,g_fan_pwm,g_servo_pwm,g_buzzer,g_tone,g_accepted,g_uart_busy;
gesture_video #(
    .WIDTH(1920),.HEIGHT(1080),.DS(3),
    .X0(45),.X1(195),.Y0(18),.Y1(118),
    .MODE(0),.SHOW_MASK(0),.STABLE_FRAMES(5),
    .Y_MIN(10),.CR_MIN(128)
) u_gesture_video (
    .clk(vtc_clk),.rst_n(gesture_rst_n),.in_vs(w_crop_vs),.in_de(w_crop_de),.in_rgb(w_crop_data),
    .home_state(2'b00),.out_vs(g_vs),.out_de(g_de),.out_rgb(g_rgb),
    .event_valid(g_valid),.event_code(g_code),.sample_valid(g_sample),.hand_valid(g_hand),
    .center_x(g_cx),.center_y(g_cy),.hand_area(g_area),.recognized(g_recognized),.digit(g_digit)
);
gesture_uart_tx #(.CLK_HZ(150000000),.BAUD(115200)) u_gesture_uart (
    .clk(vtc_clk),.rst_n(gesture_rst_n),.valid(g_valid),.code(g_code),
    .tx(O_gesture_uart_tx),.busy(g_uart_busy)
);
gesture_dfplayer #(.CLK_HZ(150000000),.BAUD(9600)) u_dfplayer (
    .clk(vtc_clk),.rst_n(gesture_rst_n),.valid(g_valid),.code(g_code),.tx(O_mp3_tx)
);
gesture_board_display u_board_display(
 .clk(vtc_clk),.rst_n(gesture_rst_n),.recognized(g_recognized),.digit(g_digit),
 .led(O_led),.sclk(O_spi_sclk),.mosi(O_spi_mosi),.latch(O_hc595_lach));

//hdmi 输出IP
hdmi_tx#(
 //HDMI视频参数设置       
.H_ActiveSize       (1920), //视频时间参数,行视频信号，一行有效(需要显示的部分)像素所占的时钟数，一个时钟对应一个有效像素
.H_SyncStart        (1920+88), //视频时间参数,行同步开始，即多少时钟数后开始产生行同步信号 
.H_SyncEnd          (1920+88+44),//视频时间参数,行同步结束，即多少时钟数后停止产生行同步信号，之后就是行有效数据部分
.H_FrameSize        (1920+88+44+148), //视频时间参数,行视频信号，一行视频信号总计占用的时钟数

.V_ActiveSize       (1080),//视频时间参数,场视频信号，一帧图像所占用的有效(需要显示的部分)行数量，通常说的视频分辨率即H_ActiveSize*V_ActiveSize
.V_SyncStart        (1080+4),//视频时间参数,场同步开始，即多少行数后开始产生场同步信号 
.V_SyncEnd          (1080+4+5), //视频时间参数,场同步结束，多少行后停止产生长同步信号  
.V_FrameSize        (1080+4+5+36),  //视频时间参数,场视频信号，一帧视频信号总计占用的行数量               
     
.VIDEO_VIC          ( 16),
.VIDEO_TPG          ( "Disable"),//设置disable，用户数据驱动HDMI接口，否则设置eable产生内部测试图形
.VIDEO_FORMAT       ( "RGB444")//设置输入数据格式为RGB格式
)u_hdmi_tx
(
.I_pixel_clk        ( pclkx1),//像素时钟
.I_serial_clk       ( pclkx5),//串行发送时钟
.I_rst              ( S_rst),//异步复位信号，高电平有效

.I_video_rgb_enable (1'b1),//是否使能RGB输入接口，设置1使能，否则采用stream video时序接口  
.I_video_in_vs      (g_vs ),	//~w_awb_vs), 	//	vtc_vs),//RGB 输入VS 帧同步
.I_video_in_de      (g_de ), 	//w_awb_de), 	//	vtc_de),//RGB 输入de有效
.I_video_in_data    (g_rgb), 	//	{w_awb_r, w_awb_g, w_awb_b}), 	//	video_hdmi_data), //视频输入数据     
.O_hdmi_clk_p       (O_hdmi_clk_p),//HDMI时钟通道
.O_hdmi_tx_p        (O_hdmi_tx_p)//HDMI数据通道
);

    
endmodule
