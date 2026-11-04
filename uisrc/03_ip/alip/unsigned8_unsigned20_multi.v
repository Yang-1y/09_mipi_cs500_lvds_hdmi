// Verilog netlist created by Tang Dynasty v5.6.60861
// Tue Oct 25 14:43:35 2022

`timescale 1ns / 1ps
module unsigned20_unsigned8_multi
  (
  a,
  ce,
  clk,
  rst,
  y,
  p
  );

  input [19:0] a;
  input ce;
  input clk;
  input rst;
  input [7:0] y;
  output [27:0] p;

  wire [44:0] dsp0_syn_1;
  wire [26:0] dsp0_syn_154;
  wire [17:0] dsp0_syn_199;
  wire [53:0] dsp0_syn_69;

  PH1_PHY_DSPREG #(
    .CEMUX("SIG"),
    .CLKMUX("SIG"),
    .RSTMODE("SYNC"),
    .RSTMUX("SIG"),
    .WIDTH(45))
    \dsp0/M_reg  (
    .ce(ce),
    .clk(clk),
    .d(dsp0_syn_1),
    .rst(rst),
    .q({dsp0_syn_69[44:28],p}));
  PH1_PHY_DSPMULT \dsp0/_mult  (
    .opctrl(2'b11),
    .x(dsp0_syn_154),
    .y(dsp0_syn_199),
    .p(dsp0_syn_1));
  PH1_PHY_DSPMREG #(
    .CEMUX("SIG"),
    .CLKMUX("SIG"),
    .DYNAMIC_DATA("Q"),
    .RSTMODE("SYNC"),
    .RSTMUX("SIG"),
    .WIDTH(27))
    \dsp0/xa_mreg  (
    .ce(ce),
    .clk(clk),
    .d({a[19],a[19],a[19],a[19],a[19],a[19],a[19],a}),
    .opctrl(1'b1),
    .rst(rst),
    .dynamic_q(dsp0_syn_154));
  PH1_PHY_DSPMREG #(
    .CEMUX("SIG"),
    .CLKMUX("SIG"),
    .DYNAMIC_DATA("Q"),
    .RSTMODE("SYNC"),
    .RSTMUX("SIG"),
    .WIDTH(18))
    \dsp0/y_mreg  (
    .ce(ce),
    .clk(clk),
    .d({y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y}),
    .opctrl(1'b1),
    .rst(rst),
    .dynamic_q(dsp0_syn_199));

  // synthesis translate_off
  glbl glbl();
  always @(*) begin
    glbl.gsr <= PH1_PHY_GSR.gsr;
    glbl.gsrn <= PH1_PHY_GSR.gsrn;
    glbl.done_gwe <= PH1_PHY_GSR.done_gwe;
    glbl.usr_gsrn_en <= PH1_PHY_GSR.usr_gsrn_en;
  end
  // synthesis translate_on

endmodule 

