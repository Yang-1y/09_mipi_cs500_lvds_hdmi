`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    19:22:52 06/12/2023 
// Module Name:    awb_outfifo 
//////////////////////////////////////////////////////////////////////////////////
module awb_outfifo(
	input 			clk_i,
	input 			rst_i,
	
	//	Sync
	input 			sync_i, 	//	On sync_i reset read controller. 
	
	//	FIFO Request 
	input 			dready_i,
	output 			drd_o,
	input 	[23:0] 	ddata_i,
	
	//	FIFO Read
	input 			rd_i,
	output 	[23:0] 	rdata_o
);
	
	//	The timing generator will read 1920 words at a single time. 
	//	Flush on rising edge of sync_i. 
	
	reg 	[1:0] 	r_rsync = 0; 
	wire 			w_rsync = (r_rsync == 2'b01); 
	reg 	[5:0] 	r_rsync_o = 0; 
	always @(posedge clk_i or posedge rst_i) begin
		if(rst_i) begin
			r_rsync <= 0; 
			r_rsync_o <= 0; 
		end else begin
			r_rsync <= {r_rsync, rframe_vsync}; 
			r_rsync_o <= w_rsync ? 6'h3F : {r_rsync_o, 1'b0}; 	//	Delay for enough time. 
		end
	end
	
	reg 	[10:0] 	rc_pixel = 0; 
	reg 	[1:0] 	rs_rd = 0; 
	always @(posedge clk_i or posedge rst_i) begin
		if(rst_i) begin
			rs_rd <= 0; 
			rc_pixel <= 0; 
		end else begin
			
			if(r_rsync_o[5]) begin
				rs_rd <= 0; 
				rc_pixel <= 0; 
			end else begin
				
				case (rs_rd)
					0: begin
							rc_pixel <= 0; 
							if(dready_i) begin
							end else begin
							end
						end
				endcase
				
			end
		end
	end
	
	
	

	wire 			w_rgb_vsync, w_rgb_href; 
	wire 	[7:0] 	w_rgb_r, w_rgb_g, w_rgb_b; 
	VIP_RAW8_RGB888 #(.IMG_HDISP(1920), .IMG_VDISP(1080)) bayer2rgb (
		.clk				(clk_i),                //cmos video pixel clock
		.rst_n			(~rst_i),              //global reset
	    
		.mirror			(0),

		    //CMOS YCbCr444 data output
		.per_frame_vsync		(~vtc_vs),    //Prepared Image data vsync valid signal. Reset on falling edge. 
		.per_frame_href		(vtc_de),     //Prepared Image data href vaild  signal
		.per_img_RAW		(video_hdmi_data),        //Prepared Image data 8 Bit RAW Data

		.post_frame_vsync		(w_rgb_vsync),   //Processed Image data vsync valid signal
		.post_frame_href		(w_rgb_href),    //Processed Image data href vaild  signal
		.post_img_red		(w_rgb_r),       //Prepared Image green data to be processed 
		.post_img_green		(w_rgb_g),     //Prepared Image green data to be processed
		.post_img_blue		(w_rgb_b)       //Prepared Image blue data to be processed
	);

	wire 			w_awb_vs, w_awb_hs, w_awb_de; 
	wire 	[7:0] 	w_awb_r, w_awb_g, w_awb_b; 
	awb u_awb 
	(
		.clk             (clk_i),
		.rst_n           (~rst_i),

		.red_gain        (0),
		.green_gain      (0),
		.blue_gain       (0),

		.per_lcd_vs      (w_rgb_vsync),
		.per_lcd_hs      (w_rgb_href),
		.per_lcd_de      (1),
		.per_lcd_rgb     ({w_rgb_r, w_rgb_g, w_rgb_b}),

		.post_lcd_vs     (w_awb_vs),
		.post_lcd_hs     (w_awb_hs),
		.post_lcd_de     (w_awb_de),
		.post_lcd_rgb    ({w_awb_r, w_awb_g, w_awb_b})
	);

	fifo_24b  // fifo_24b.v(14)
	(
		.clkr			(),
		.clkw 		(clk_i),
		.di			({w_awb_r, w_awb_g, w_awb_b}),
		.re			(),
		.rrst			(r_rsync_o[1]),
		.we			(),
		.wrst			(r_rsync_o[1]),
		.afull_flag		(),
		.dout			(),
		.empty_flag		(),
		.fifo_rdpointer	(),
		.fifo_wrpointer	(),
		.full_flag		()
	);

	
endmodule
