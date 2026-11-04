
module hdmi_transmitter_wrapper#(
    parameter       REF_CLK_DIV2_EN      = 1'b0,
	parameter       REF_CLK_MPLL_DIV2_EN = 1'b1,
	parameter [2:0] REF_RANGE            = 3'd4,
    parameter       IIC_SCL_DIV          = 125
)(
    input wire        I_sys_clk,
    input wire        I_rst,
	input wire        I_serdes_ref_clk,
    output wire       O_pixel_clk,

    input wire        I_configure_load_en,
    output wire       O_configure_done,

    input wire        I_edid_read_trig,
    output wire       O_edid_read_valid,
    output wire[7:0]  O_edid_read_data,

///***********************  video parameter configure port  **************************
    input wire[13:0]  I_HTOTAL,
    input wire[13:0]  I_HSA,
    input wire[13:0]  I_HFP,
    input wire[13:0]  I_HBP,
    input wire[13:0]  I_HACTIVE,
 
    input wire[13:0]  I_VTOTAL,
    input wire[13:0]  I_VSA,
    input wire[13:0]  I_VFP, 
    input wire[13:0]  I_VBP,
    input wire[13:0]  I_VACTIVE,
 
    input wire        I_hdcp_en,              /* 1'b0: HDCP disable
                                                 1'b1: HDCP enable */  
 
    input wire        I_video_test_source_en, /* 1'b0: disable video test source
                                                 1'b1: enable video test source  */
                                              
    input wire[6:0]   I_video_VIC, 
 
    input wire[1:0]   I_pixel_color_deep,     /* 2'b00: 24-bit/per pixel
                                                 2'b01: 30-bit/per pixel*/
  
    input wire[2:0]   I_video_format,         /* 3'b000: VIDEO_RGB444
                                                 3'b001: VIDEO_YUV444
                                                 3'b010: VIDEO_YUV422*/
  
    input wire[1:0]   I_pixel_num_per_clock,  /* 2'b00: 1 pixel/per clock
                                                 2'b01: 2 pixel/per clock
                                                 2'b10: 4 pixel/per clock */

    input wire        I_data_over_sample_en,

///**********************  audio parameter configure port  ******************************
    input wire[19:0]  I_audio_clock_regeneration_CTS,
    input wire[19:0]  I_audio_clock_regeneration_N,
    input wire[2:0]   I_audio_channel_number,
 
    input wire[2:0]   I_audio_sample_rate,   /* 3'b001 : 32K
                                                3'b010 : 44.1K
                                                3'b011 : 48K
                                                3'b100 : 88.2K
                                                3'b101 : 96K
                                                3'b110 : 176.4K
                                                3'b111 : 192K
                                             */

///********************** serdes configure port *************************
    input wire        I_serdes_config_load_en,
    input wire[1:0]   I_serdes_data_width_sel,
    input wire[2:0]   I_serdes_tx_rate,
    input wire[23:0]  I_serdes_ref_clk_freq,
    input wire[15:0]  I_serdes_line_rate,
    input wire        I_serdes_mpll_sel,
    input wire[7:0]   I_serdes_mpll_multiplier,
    output wire       O_serdes_config_done,


///**********************  video stream input  ***************************
    input wire        I_video_in_user,
    input wire        I_video_in_valid,
    input wire        I_video_in_last,
    input wire[119:0] I_video_in_data,
    output wire       O_video_in_ready,

///*********************  audio stream input  ***************************
    input wire        I_audio_valid,     
    input wire[23:0]  I_audio_data_ch0, 
    input wire[23:0]  I_audio_data_ch1,
	input wire[23:0]  I_audio_data_ch2,
	input wire[23:0]  I_audio_data_ch3,
	input wire[23:0]  I_audio_data_ch4,
	input wire[23:0]  I_audio_data_ch5,
	input wire[23:0]  I_audio_data_ch6,
	input wire[23:0]  I_audio_data_ch7,


    output wire       O_edid_iic_scl,
    inout wire        IO_edid_iic_sda,

    output wire       O_tmds_ch0_p,
    output wire       O_tmds_ch0_n,
    output wire       O_tmds_ch1_p,
    output wire       O_tmds_ch1_n,
    output wire       O_tmds_ch2_p,
    output wire       O_tmds_ch2_n,
    output wire       O_tmds_clk_p,
    output wire       O_tmds_clk_n
);

    wire[39:0]   S_ch0_tmds_code_data;                
    wire[39:0]   S_ch1_tmds_code_data;                
    wire[39:0]   S_ch2_tmds_code_data;                
    wire[39:0]   S_clk_tmds_code_data;

    wire         S_pixel_clk;

    assign O_pixel_clk = S_pixel_clk;
    

    hdmi_edid_wrapper #(
        .IIC_SCL_DIV ( IIC_SCL_DIV )
    ) u_hdmi_edid_wrapper(
        .I_clk             ( I_sys_clk         ),
        .I_rst             ( I_rst             ),
 
        .I_edid_read_trig  ( I_edid_read_trig  ),
        .O_edid_read_valid ( O_edid_read_valid ),
        .O_edid_read_data  ( O_edid_read_data  ),
 
        .O_iic_scl         ( O_edid_iic_scl    ),
        .IO_iic_sda        ( IO_edid_iic_sda   )
    );


    hdmi_tx_controller_wrapper u_hdmi_tx_controller_wrapper(
        .I_pixel_clk                    ( S_pixel_clk                    ),
        .I_sys_clk                      ( I_sys_clk                      ),
        .I_rst                          ( I_rst                          ),

        .I_configure_load_en            ( I_configure_load_en            ),
        .O_configure_done               ( O_configure_done               ),
        .I_HTOTAL                       ( I_HTOTAL                       ),
        .I_HSA                          ( I_HSA                          ),
        .I_HFP                          ( I_HFP                          ),
        .I_HBP                          ( I_HBP                          ),
        .I_HACTIVE                      ( I_HACTIVE                      ),
        .I_VTOTAL                       ( I_VTOTAL                       ),
        .I_VSA                          ( I_VSA                          ),
        .I_VFP                          ( I_VFP                          ),
        .I_VBP                          ( I_VBP                          ),
        .I_VACTIVE                      ( I_VACTIVE                      ),
        .I_hdcp_en                      ( I_hdcp_en                      ),
        .I_video_test_source_en         ( I_video_test_source_en         ),
        .I_video_VIC                    ( I_video_VIC                    ),
        .I_pixel_color_deep             ( I_pixel_color_deep             ),
        .I_video_format                 ( I_video_format                 ),
        .I_pixel_num_per_clock          ( I_pixel_num_per_clock          ),
        .I_data_over_sample_en          ( I_data_over_sample_en          ),
        .I_audio_clock_regeneration_CTS ( I_audio_clock_regeneration_CTS ),
        .I_audio_clock_regeneration_N   ( I_audio_clock_regeneration_N   ),
        .I_audio_channel_number         ( I_audio_channel_number         ),
        .I_audio_sample_rate            ( I_audio_sample_rate            ),

        .I_video_in_user                ( I_video_in_user                ),
        .I_video_in_valid               ( I_video_in_valid               ),
        .I_video_in_last                ( I_video_in_last                ),
        .I_video_in_data                ( I_video_in_data                ),
        .O_video_in_ready               ( O_video_in_ready               ),

        .I_audio_valid                  ( I_audio_valid                  ),     
        .I_audio_data_ch0               ( I_audio_data_ch0               ), 
        .I_audio_data_ch1               ( I_audio_data_ch1               ),
		.I_audio_data_ch2               ( I_audio_data_ch2               ),
		.I_audio_data_ch3               ( I_audio_data_ch3               ),
		.I_audio_data_ch4               ( I_audio_data_ch4               ),
		.I_audio_data_ch5               ( I_audio_data_ch5               ),
		.I_audio_data_ch6               ( I_audio_data_ch6               ),
		.I_audio_data_ch7               ( I_audio_data_ch7               ),

        .O_ch0_tmds_code_data           ( S_ch0_tmds_code_data           ),
        .O_ch1_tmds_code_data           ( S_ch1_tmds_code_data           ),
        .O_ch2_tmds_code_data           ( S_ch2_tmds_code_data           ),
        .O_clk_tmds_code_data           ( S_clk_tmds_code_data           )
    );

	

    hdmi_phy_wrapper#(
        .REF_CLK_DIV2_EN          ( REF_CLK_DIV2_EN      ),
        .REF_CLK_MPLL_DIV2_EN     ( REF_CLK_MPLL_DIV2_EN ),
        .REF_RANGE                ( REF_RANGE            )
    )u_hdmi_phy_wrapper(
        .I_sys_clk                ( I_sys_clk                ),
		.I_serdes_ref_clk         ( I_serdes_ref_clk         ),
        .O_pixel_clk              ( S_pixel_clk              ),
        .I_rst                    ( I_rst                    ),

        .I_serdes_config_load_en  ( I_serdes_config_load_en  ),
        .I_serdes_data_width_sel  ( I_serdes_data_width_sel  ),
        .I_serdes_tx_rate         ( I_serdes_tx_rate         ),
        .I_serdes_ref_clk_freq    ( I_serdes_ref_clk_freq    ),
        .I_serdes_line_rate       ( I_serdes_line_rate       ),
        .I_serdes_mpll_sel        ( I_serdes_mpll_sel        ),
        .I_serdes_mpll_tx_clk_div ( 2'b00                    ),
        .I_serdes_mpll_multiplier ( I_serdes_mpll_multiplier ),
        .O_serdes_config_done     ( O_serdes_config_done     ),

        .I_tmds_channel_0         ( S_ch0_tmds_code_data     ),
        .I_tmds_channel_1         ( S_ch1_tmds_code_data     ),
        .I_tmds_channel_2         ( S_ch2_tmds_code_data     ),
        .I_tmds_channel_clk       ( S_clk_tmds_code_data     ),

        .O_tmds_ch0_p             ( O_tmds_ch0_p             ),
        .O_tmds_ch0_n             ( O_tmds_ch0_n             ),
        .O_tmds_ch1_p             ( O_tmds_ch1_p             ),
        .O_tmds_ch1_n             ( O_tmds_ch1_n             ),
        .O_tmds_ch2_p             ( O_tmds_ch2_p             ),
        .O_tmds_ch2_n             ( O_tmds_ch2_n             ),
        .O_tmds_clk_p             ( O_tmds_clk_p             ),
        .O_tmds_clk_n             ( O_tmds_clk_n             )
    );



endmodule