
`timescale 1ps/1ps



module sim_tb_top;

localparam DRAM_WIDTH         = 16;
localparam ADDR_WIDTH         = 14;
localparam DQS_WIDTH          = 4 ;
localparam DQ_WIDTH           = DQS_WIDTH * 8;
localparam DM_WIDTH           = DQS_WIDTH    ;
localparam NUM_PHYSICAL_PARTS = (DQ_WIDTH/DRAM_WIDTH) ;

parameter  CS_WIDTH           = 1;
parameter  ODT_WIDTH          = 1;

localparam MRS                = 3'b000;
localparam REF                = 3'b001;
localparam PRE                = 3'b010;
localparam ACT                = 3'b011;
localparam WR                 = 3'b100;
localparam RD                 = 3'b101;
localparam ZQC                = 3'b110;
localparam NOP                = 3'b111;

//-------- Ports Definition --------//
reg             sys_clk_i;
reg             sys_rst;

wire  [ ADDR_WIDTH-1:0]    c0_ddr3_adr     ;
wire  [            2:0]    c0_ddr3_ba      ;
wire  [            0:0]    c0_ddr3_cke     ;
wire  [            0:0]    c0_ddr3_odt     ;
wire  [            0:0]    c0_ddr3_cs_n    ;
wire                       c0_ddr3_ras_n   ;
wire                       c0_ddr3_cas_n   ;
wire                       c0_ddr3_we_n    ;
wire  [            0:0]    c0_ddr3_ck_p    ;
wire  [            0:0]    c0_ddr3_ck_n    ;
wire                       c0_ddr3_reset_n ;

wire  [DQS_WIDTH  -1:0]    c0_ddr3_dm      ;
wire  [DQS_WIDTH*8-1:0]    c0_ddr3_dq      ;
wire  [DQS_WIDTH  -1:0]    c0_ddr3_dqs_p   ;
wire  [DQS_WIDTH  -1:0]    c0_ddr3_dqs_n   ;

//**************************************************************************//
// Reset Generation
//**************************************************************************//
initial begin
    sys_rst = 1'b0; #20000;
    sys_rst = 1'b1; #20000;
    sys_rst = 1'b0; #20000;
end

//**************************************************************************//
// Clock Generation
//**************************************************************************//
always begin
    sys_clk_i = 1'b0; #(10_000/2.0);
    sys_clk_i = 1'b1; #(10_000/2.0);
end

//===========================================================================
//                         FPGA Memory Controller instantiation
//===========================================================================

glbl glbl ();
PH1_PHY_GSR PH1_PHY_GSR ();



system_top u_system_top (
    .sys_rst_n           (~sys_rst   ),
    .sys_clk             ( sys_clk_i ),

    .ddr_addr            ( c0_ddr3_adr    ),
    .ddr_ba              ( c0_ddr3_ba     ),
    .ddr_cke             ( c0_ddr3_cke    ),
    .ddr_odt             ( c0_ddr3_odt    ),
    .ddr_cs_n            ( c0_ddr3_cs_n   ),
    .ddr_ras_n           ( c0_ddr3_ras_n  ),
    .ddr_cas_n           ( c0_ddr3_cas_n  ),
    .ddr_we_n            ( c0_ddr3_we_n   ),
    .ddr_ck_p            ( c0_ddr3_ck_p   ),
    .ddr_ck_n            ( c0_ddr3_ck_n   ),
    .ddr_reset_n         ( c0_ddr3_reset_n),
    .ddr_dm              ( c0_ddr3_dm     ),
    .ddr_dq              ( c0_ddr3_dq     ),
    .ddr_dqs_p           ( c0_ddr3_dqs_p  ),
    .ddr_dqs_n           ( c0_ddr3_dqs_n  )
);

reg [31:0] cmdName;

always @(*)
    if (c0_ddr3_cs_n == 1'b1)
        cmdName = "DSEL";
    else
        casez ({c0_ddr3_ras_n, c0_ddr3_cas_n, c0_ddr3_we_n})
        ACT:     cmdName = "ACT";
        MRS:     cmdName = "MRS";
        REF:     cmdName = "REF";
        PRE:     cmdName = "PRE";
        WR:      cmdName = "WR";
        RD:      cmdName = "RD";
        ZQC:     cmdName = "ZQC";
        NOP:     cmdName = "NOP";
        default: cmdName = "***";
endcase

//===========================================================================
//                         Memory Model instantiation
//===========================================================================
genvar i;
generate
    if (DRAM_WIDTH == 8) begin: mem_model_x8

        for (i = 0; i < DQ_WIDTH/DRAM_WIDTH; i=i+1) begin:memModel
            ddr3 u_ddr3_x8 (
                .tdqs_n  (                    ),
                .addr    ( c0_ddr3_adr        ),
                .ba      ( c0_ddr3_ba         ),
                .cke     ( c0_ddr3_cke[0]     ),
                .odt     ( c0_ddr3_odt[0]     ),
                .cs_n    ( c0_ddr3_cs_n[0]    ),
                .ras_n   ( c0_ddr3_ras_n      ),
                .cas_n   ( c0_ddr3_cas_n      ),
                .we_n    ( c0_ddr3_we_n       ),
                .ck      ( c0_ddr3_ck_p       ),
                .ck_n    ( c0_ddr3_ck_n       ),
                .rst_n   ( c0_ddr3_reset_n    ),
                .dm_tdqs ( c0_ddr3_dm[i]      ),
                .dq      ( c0_ddr3_dq[i*8+:8] ),
                .dqs     ( c0_ddr3_dqs_p[i]   ),
                .dqs_n   ( c0_ddr3_dqs_n[i]   )
            );
        end

    end else begin: mem_model_x16

        for (i = 0; i < (DQ_WIDTH/DRAM_WIDTH); i=i+1) begin:memModel
            ddr3 u_ddr3_x16 (
                .tdqs_n  (                                    ),
                .addr    ( c0_ddr3_adr                        ),
                .ba      ( c0_ddr3_ba                         ),
                .cke     ( c0_ddr3_cke[0]                     ),
                .odt     ( c0_ddr3_odt[0]                     ),
                .cs_n    ( c0_ddr3_cs_n[0]                    ),
                .ras_n   ( c0_ddr3_ras_n                      ),
                .cas_n   ( c0_ddr3_cas_n                      ),
                .we_n    ( c0_ddr3_we_n                       ),
                .ck      ( c0_ddr3_ck_p                       ),
                .ck_n    ( c0_ddr3_ck_n                       ),
                .rst_n   ( c0_ddr3_reset_n                    ),
                .dm_tdqs ( c0_ddr3_dm   [( 2*(i+1)-1):( 2*i)] ),
                .dq      ( c0_ddr3_dq   [(16*(i+1)-1):(16*i)] ),
                .dqs     ( c0_ddr3_dqs_p[( 2*(i+1)-1):( 2*i)] ),
                .dqs_n   ( c0_ddr3_dqs_n[( 2*(i+1)-1):( 2*i)] )
            );
        end

    end
endgenerate


//===========================================================================
//   Debug Assistant
//===========================================================================
wire [           2:0] MR_REG   ; 
wire [          12:0] MR_DATA  ;
wire [           2:0] PRE_ADDR ;
wire [           2:0] ACT_BANK ;
wire [ADDR_WIDTH-1:0] ACT_ADDR ;
wire [           9:0] WR_ADDR  ;
wire [           9:0] RD_ADDR  ;
wire [           2:0] WR_BANK  ;
wire [           2:0] RD_BANK  ;

assign MR_REG   = (cmdName == "MRS") ? c0_ddr3_ba [ 2:0] : { 3{1'bz}};
assign MR_DATA  = (cmdName == "MRS") ? c0_ddr3_adr[12:0] : {13{1'bz}};

assign PRE_ADDR = (cmdName == "PRE") ? c0_ddr3_ba [ 2:0] : { 3{1'bz}};
assign ACT_BANK = (cmdName == "ACT") ? c0_ddr3_ba [ 2:0] : { 3{1'bz}};
assign ACT_ADDR = (cmdName == "ACT") ? c0_ddr3_adr[ADDR_WIDTH-1:0] : {ADDR_WIDTH{1'bz}};
assign WR_ADDR  = (cmdName == "WR" ) ? c0_ddr3_adr[ 9:0] : {10{1'bz}};
assign RD_ADDR  = (cmdName == "RD" ) ? c0_ddr3_adr[ 9:0] : {10{1'bz}};
assign WR_BANK  = (cmdName == "WR" ) ? c0_ddr3_ba [ 2:0] : { 3{1'bz}};
assign RD_BANK  = (cmdName == "RD" ) ? c0_ddr3_ba [ 2:0] : { 3{1'bz}};

`ifdef FSDB
initial begin
    $fsdbDumpfile("sim_tb_top.fsdb");
    $fsdbDumpvars(0,sim_tb_top);
    $fsdbDumpMDA();
end
`endif

endmodule
