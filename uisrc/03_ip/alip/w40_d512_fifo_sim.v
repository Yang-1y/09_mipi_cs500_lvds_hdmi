// Verilog netlist created by Tang Dynasty v5.6.60427
// Fri Oct 14 12:33:52 2022

`timescale 1ns / 1ps
module w40_d512_fifo  // w40_d512_fifo.v(14)
  (
  clk,
  di,
  re,
  rst,
  we,
  dout,
  empty_flag,
  full_flag,
  rdusedw,
  wrusedw
  );

  input clk;  // w40_d512_fifo.v(24)
  input [39:0] di;  // w40_d512_fifo.v(23)
  input re;  // w40_d512_fifo.v(25)
  input rst;  // w40_d512_fifo.v(22)
  input we;  // w40_d512_fifo.v(24)
  output [39:0] dout;  // w40_d512_fifo.v(27)
  output empty_flag;  // w40_d512_fifo.v(28)
  output full_flag;  // w40_d512_fifo.v(29)
  output [9:0] rdusedw;  // w40_d512_fifo.v(30)
  output [9:0] wrusedw;  // w40_d512_fifo.v(31)

  wire logic_ramfifo_syn_1;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_2;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_3;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_4;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_5;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_6;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_7;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_8;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_9;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_10;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_11;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_12;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_13;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_14;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_15;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_16;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_17;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_18;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_19;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_20;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_21;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_22;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_23;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_24;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_25;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_26;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_27;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_28;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_29;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_30;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_41;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_42;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_43;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_44;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_45;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_46;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_47;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_48;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_49;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_50;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_51;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_52;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_53;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_54;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_55;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_56;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_57;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_58;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_59;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_60;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_61;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_62;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_63;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_64;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_65;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_66;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_67;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_68;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_69;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_71;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_72;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_73;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_74;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_75;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_76;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_77;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_78;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_79;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_80;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_81;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_82;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_83;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_84;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_85;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_86;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_87;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_88;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_89;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_90;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_91;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_92;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_93;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_94;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_95;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_96;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_97;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_98;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_99;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_164;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_166;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_170;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_171;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_172;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_173;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_174;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_175;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_176;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_177;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_178;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_179;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_180;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_184;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_186;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_240;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_260;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_261;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_262;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_263;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_264;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_265;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_266;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_267;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_268;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_269;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_286;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_288;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_290;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_292;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_294;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_296;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_298;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_300;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_302;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_307;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_309;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_311;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_313;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_315;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_317;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_319;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_321;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_325;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_327;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_329;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_331;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_333;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_335;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_337;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_339;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_341;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_346;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_348;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_350;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_352;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_354;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_356;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_358;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_360;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_572;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_573;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_574;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_575;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_576;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_577;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_578;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_579;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_580;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_581;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_582;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_583;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_584;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_585;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_586;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_587;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_588;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_589;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_590;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_632;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_633;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_634;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_635;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_636;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_637;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_638;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_639;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_640;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_641;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_642;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_643;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_644;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_645;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_646;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_647;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_648;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_649;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_650;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_693;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_694;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_695;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_696;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_697;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_698;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_699;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_700;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_701;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_702;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_746;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_747;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_748;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_749;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_750;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_751;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_752;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_753;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_754;  // w40_d512_fifo.v(39)
  wire logic_ramfifo_syn_755;  // w40_d512_fifo.v(39)
  wire clk_syn_1;  // w40_d512_fifo.v(24)
  wire clk_syn_2;  // w40_d512_fifo.v(24)
  wire clk_syn_3;  // w40_d512_fifo.v(24)
  wire clk_syn_4;  // w40_d512_fifo.v(24)
  wire clk_syn_5;  // w40_d512_fifo.v(24)
  wire clk_syn_6;  // w40_d512_fifo.v(24)
  wire clk_syn_7;  // w40_d512_fifo.v(24)
  wire clk_syn_8;  // w40_d512_fifo.v(24)
  wire clk_syn_9;  // w40_d512_fifo.v(24)
  wire clk_syn_10;  // w40_d512_fifo.v(24)
  wire clk_syn_11;  // w40_d512_fifo.v(24)
  wire clk_syn_13;  // w40_d512_fifo.v(24)
  wire clk_syn_15;  // w40_d512_fifo.v(24)
  wire clk_syn_17;  // w40_d512_fifo.v(24)
  wire clk_syn_19;  // w40_d512_fifo.v(24)
  wire clk_syn_21;  // w40_d512_fifo.v(24)
  wire clk_syn_23;  // w40_d512_fifo.v(24)
  wire clk_syn_25;  // w40_d512_fifo.v(24)
  wire clk_syn_27;  // w40_d512_fifo.v(24)
  wire clk_syn_29;  // w40_d512_fifo.v(24)
  wire clk_syn_31;  // w40_d512_fifo.v(24)
  wire clk_syn_37;  // w40_d512_fifo.v(24)
  wire clk_syn_39;  // w40_d512_fifo.v(24)
  wire clk_syn_41;  // w40_d512_fifo.v(24)
  wire clk_syn_43;  // w40_d512_fifo.v(24)
  wire clk_syn_45;  // w40_d512_fifo.v(24)
  wire clk_syn_47;  // w40_d512_fifo.v(24)
  wire clk_syn_49;  // w40_d512_fifo.v(24)
  wire clk_syn_51;  // w40_d512_fifo.v(24)
  wire clk_syn_53;  // w40_d512_fifo.v(24)
  wire clk_syn_55;  // w40_d512_fifo.v(24)
  wire clk_syn_57;  // w40_d512_fifo.v(24)
  wire clk_syn_59;  // w40_d512_fifo.v(24)
  wire clk_syn_61;  // w40_d512_fifo.v(24)
  wire clk_syn_63;  // w40_d512_fifo.v(24)
  wire clk_syn_65;  // w40_d512_fifo.v(24)
  wire clk_syn_67;  // w40_d512_fifo.v(24)
  wire clk_syn_69;  // w40_d512_fifo.v(24)
  wire clk_syn_71;  // w40_d512_fifo.v(24)
  wire clk_syn_73;  // w40_d512_fifo.v(24)
  wire clk_syn_74;  // w40_d512_fifo.v(24)
  wire clk_syn_75;  // w40_d512_fifo.v(24)
  wire clk_syn_76;  // w40_d512_fifo.v(24)
  wire clk_syn_77;  // w40_d512_fifo.v(24)
  wire clk_syn_78;  // w40_d512_fifo.v(24)
  wire clk_syn_79;  // w40_d512_fifo.v(24)
  wire clk_syn_80;  // w40_d512_fifo.v(24)
  wire clk_syn_81;  // w40_d512_fifo.v(24)
  wire clk_syn_82;  // w40_d512_fifo.v(24)
  wire clk_syn_83;  // w40_d512_fifo.v(24)
  wire clk_syn_84;  // w40_d512_fifo.v(24)
  wire clk_syn_86;  // w40_d512_fifo.v(24)
  wire clk_syn_87;  // w40_d512_fifo.v(24)
  wire clk_syn_88;  // w40_d512_fifo.v(24)
  wire clk_syn_89;  // w40_d512_fifo.v(24)
  wire clk_syn_90;  // w40_d512_fifo.v(24)
  wire clk_syn_91;  // w40_d512_fifo.v(24)
  wire clk_syn_92;  // w40_d512_fifo.v(24)
  wire clk_syn_93;  // w40_d512_fifo.v(24)
  wire clk_syn_94;  // w40_d512_fifo.v(24)
  wire clk_syn_95;  // w40_d512_fifo.v(24)
  wire clk_syn_96;  // w40_d512_fifo.v(24)
  wire clk_syn_98;  // w40_d512_fifo.v(24)
  wire clk_syn_102;  // w40_d512_fifo.v(24)
  wire clk_syn_104;  // w40_d512_fifo.v(24)
  wire clk_syn_106;  // w40_d512_fifo.v(24)
  wire clk_syn_108;  // w40_d512_fifo.v(24)
  wire clk_syn_110;  // w40_d512_fifo.v(24)
  wire clk_syn_112;  // w40_d512_fifo.v(24)
  wire clk_syn_114;  // w40_d512_fifo.v(24)
  wire clk_syn_116;  // w40_d512_fifo.v(24)
  wire clk_syn_118;  // w40_d512_fifo.v(24)
  wire clk_syn_122;  // w40_d512_fifo.v(24)
  wire clk_syn_124;  // w40_d512_fifo.v(24)
  wire clk_syn_126;  // w40_d512_fifo.v(24)
  wire clk_syn_128;  // w40_d512_fifo.v(24)
  wire clk_syn_130;  // w40_d512_fifo.v(24)
  wire clk_syn_132;  // w40_d512_fifo.v(24)
  wire clk_syn_134;  // w40_d512_fifo.v(24)
  wire clk_syn_136;  // w40_d512_fifo.v(24)
  wire clk_syn_138;  // w40_d512_fifo.v(24)
  wire clk_syn_140;  // w40_d512_fifo.v(24)
  wire clk_syn_142;  // w40_d512_fifo.v(24)
  wire clk_syn_144;  // w40_d512_fifo.v(24)
  wire clk_syn_146;  // w40_d512_fifo.v(24)
  wire clk_syn_148;  // w40_d512_fifo.v(24)
  wire clk_syn_150;  // w40_d512_fifo.v(24)
  wire clk_syn_152;  // w40_d512_fifo.v(24)
  wire clk_syn_154;  // w40_d512_fifo.v(24)
  wire clk_syn_156;  // w40_d512_fifo.v(24)
  wire clk_syn_158;  // w40_d512_fifo.v(24)
  wire clk_syn_159;  // w40_d512_fifo.v(24)
  wire clk_syn_160;  // w40_d512_fifo.v(24)
  wire clk_syn_161;  // w40_d512_fifo.v(24)
  wire clk_syn_162;  // w40_d512_fifo.v(24)
  wire clk_syn_163;  // w40_d512_fifo.v(24)
  wire clk_syn_164;  // w40_d512_fifo.v(24)
  wire clk_syn_165;  // w40_d512_fifo.v(24)
  wire clk_syn_166;  // w40_d512_fifo.v(24)
  wire clk_syn_167;  // w40_d512_fifo.v(24)
  wire clk_syn_168;  // w40_d512_fifo.v(24)
  wire clk_syn_169;  // w40_d512_fifo.v(24)
  wire re_syn_2;  // w40_d512_fifo.v(25)
  wire we_syn_2;  // w40_d512_fifo.v(24)
  wire _al_n1_syn_4;
  wire _al_n1_syn_6;
  wire _al_n1_syn_8;
  wire _al_n1_syn_10;
  wire _al_n1_syn_12;
  wire _al_n1_syn_14;
  wire _al_n1_syn_16;
  wire _al_n1_syn_18;
  wire _al_n1_syn_26;
  wire _al_n1_syn_28;
  wire _al_n1_syn_30;
  wire _al_n1_syn_32;
  wire _al_n1_syn_34;
  wire _al_n1_syn_36;
  wire _al_n1_syn_38;
  wire _al_n1_syn_40;

  and _al_n1_syn_11 (_al_n1_syn_12, _al_n1_syn_10, clk_syn_25);
  and _al_n1_syn_13 (_al_n1_syn_14, _al_n1_syn_12, clk_syn_27);
  and _al_n1_syn_15 (_al_n1_syn_16, _al_n1_syn_14, clk_syn_29);
  and _al_n1_syn_17 (_al_n1_syn_18, _al_n1_syn_16, clk_syn_31);
  and _al_n1_syn_25 (_al_n1_syn_26, clk_syn_118, clk_syn_102);
  and _al_n1_syn_27 (_al_n1_syn_28, _al_n1_syn_26, clk_syn_104);
  and _al_n1_syn_29 (_al_n1_syn_30, _al_n1_syn_28, clk_syn_106);
  and _al_n1_syn_3 (_al_n1_syn_4, clk_syn_15, clk_syn_17);
  and _al_n1_syn_31 (_al_n1_syn_32, _al_n1_syn_30, clk_syn_108);
  and _al_n1_syn_33 (_al_n1_syn_34, _al_n1_syn_32, clk_syn_110);
  and _al_n1_syn_35 (_al_n1_syn_36, _al_n1_syn_34, clk_syn_112);
  and _al_n1_syn_37 (_al_n1_syn_38, _al_n1_syn_36, clk_syn_114);
  and _al_n1_syn_39 (_al_n1_syn_40, _al_n1_syn_38, clk_syn_116);
  and _al_n1_syn_5 (_al_n1_syn_6, _al_n1_syn_4, clk_syn_19);
  and _al_n1_syn_7 (_al_n1_syn_8, _al_n1_syn_6, clk_syn_21);
  and _al_n1_syn_9 (_al_n1_syn_10, _al_n1_syn_8, clk_syn_23);
  not clk_syn_101 (clk_syn_102, clk_syn_87);  // w40_d512_fifo.v(24)
  not clk_syn_103 (clk_syn_104, clk_syn_88);  // w40_d512_fifo.v(24)
  not clk_syn_105 (clk_syn_106, clk_syn_89);  // w40_d512_fifo.v(24)
  not clk_syn_107 (clk_syn_108, clk_syn_90);  // w40_d512_fifo.v(24)
  not clk_syn_109 (clk_syn_110, clk_syn_91);  // w40_d512_fifo.v(24)
  not clk_syn_111 (clk_syn_112, clk_syn_92);  // w40_d512_fifo.v(24)
  not clk_syn_113 (clk_syn_114, clk_syn_93);  // w40_d512_fifo.v(24)
  not clk_syn_115 (clk_syn_116, clk_syn_94);  // w40_d512_fifo.v(24)
  not clk_syn_117 (clk_syn_118, clk_syn_86);  // w40_d512_fifo.v(24)
  or clk_syn_12 (clk_syn_13, clk_syn_11, clk_syn_10);  // w40_d512_fifo.v(24)
  xor clk_syn_121 (clk_syn_122, clk_syn_87, clk_syn_86);  // w40_d512_fifo.v(24)
  and clk_syn_123 (clk_syn_124, clk_syn_87, clk_syn_118);  // w40_d512_fifo.v(24)
  xor clk_syn_125 (clk_syn_126, clk_syn_88, clk_syn_124);  // w40_d512_fifo.v(24)
  and clk_syn_127 (clk_syn_128, clk_syn_88, _al_n1_syn_26);  // w40_d512_fifo.v(24)
  xor clk_syn_129 (clk_syn_130, clk_syn_89, clk_syn_128);  // w40_d512_fifo.v(24)
  and clk_syn_131 (clk_syn_132, clk_syn_89, _al_n1_syn_28);  // w40_d512_fifo.v(24)
  xor clk_syn_133 (clk_syn_134, clk_syn_90, clk_syn_132);  // w40_d512_fifo.v(24)
  and clk_syn_135 (clk_syn_136, clk_syn_90, _al_n1_syn_30);  // w40_d512_fifo.v(24)
  xor clk_syn_137 (clk_syn_138, clk_syn_91, clk_syn_136);  // w40_d512_fifo.v(24)
  and clk_syn_139 (clk_syn_140, clk_syn_91, _al_n1_syn_32);  // w40_d512_fifo.v(24)
  not clk_syn_14 (clk_syn_15, clk_syn_1);  // w40_d512_fifo.v(24)
  xor clk_syn_141 (clk_syn_142, clk_syn_92, clk_syn_140);  // w40_d512_fifo.v(24)
  and clk_syn_143 (clk_syn_144, clk_syn_92, _al_n1_syn_34);  // w40_d512_fifo.v(24)
  xor clk_syn_145 (clk_syn_146, clk_syn_93, clk_syn_144);  // w40_d512_fifo.v(24)
  and clk_syn_147 (clk_syn_148, clk_syn_93, _al_n1_syn_36);  // w40_d512_fifo.v(24)
  xor clk_syn_149 (clk_syn_150, clk_syn_94, clk_syn_148);  // w40_d512_fifo.v(24)
  and clk_syn_151 (clk_syn_152, clk_syn_94, _al_n1_syn_38);  // w40_d512_fifo.v(24)
  xor clk_syn_153 (clk_syn_154, clk_syn_95, clk_syn_152);  // w40_d512_fifo.v(24)
  and clk_syn_155 (clk_syn_156, clk_syn_98, _al_n1_syn_40);  // w40_d512_fifo.v(24)
  xor clk_syn_157 (clk_syn_158, clk_syn_96, clk_syn_156);  // w40_d512_fifo.v(24)
  not clk_syn_16 (clk_syn_17, clk_syn_2);  // w40_d512_fifo.v(24)
  not clk_syn_18 (clk_syn_19, clk_syn_3);  // w40_d512_fifo.v(24)
  not clk_syn_20 (clk_syn_21, clk_syn_4);  // w40_d512_fifo.v(24)
  not clk_syn_22 (clk_syn_23, clk_syn_5);  // w40_d512_fifo.v(24)
  not clk_syn_24 (clk_syn_25, clk_syn_6);  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_256 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_74),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_1));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_257 (
    .ar(1'b0),
    .as(rst),
    .clk(clk),
    .d(clk_syn_75),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_2));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_258 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_76),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_3));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_259 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_77),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_4));  // w40_d512_fifo.v(24)
  not clk_syn_26 (clk_syn_27, clk_syn_7);  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_260 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_78),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_5));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_261 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_79),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_6));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_262 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_80),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_7));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_263 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_81),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_8));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_264 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_82),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_9));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_265 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_83),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_10));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_266 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_84),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_11));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_267 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_159),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_86));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_268 (
    .ar(1'b0),
    .as(rst),
    .clk(clk),
    .d(clk_syn_160),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_87));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_269 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_161),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_88));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_270 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_162),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_89));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_271 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_163),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_90));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_272 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_164),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_91));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_273 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_165),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_92));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_274 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_166),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_93));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_275 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_167),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_94));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_276 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_168),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_95));  // w40_d512_fifo.v(24)
  AL_DFF_X clk_syn_277 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_169),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_96));  // w40_d512_fifo.v(24)
  not clk_syn_28 (clk_syn_29, clk_syn_8);  // w40_d512_fifo.v(24)
  not clk_syn_30 (clk_syn_31, clk_syn_9);  // w40_d512_fifo.v(24)
  xor clk_syn_36 (clk_syn_37, clk_syn_2, clk_syn_1);  // w40_d512_fifo.v(24)
  and clk_syn_38 (clk_syn_39, clk_syn_2, clk_syn_15);  // w40_d512_fifo.v(24)
  xor clk_syn_40 (clk_syn_41, clk_syn_3, clk_syn_39);  // w40_d512_fifo.v(24)
  and clk_syn_42 (clk_syn_43, clk_syn_3, _al_n1_syn_4);  // w40_d512_fifo.v(24)
  xor clk_syn_44 (clk_syn_45, clk_syn_4, clk_syn_43);  // w40_d512_fifo.v(24)
  and clk_syn_46 (clk_syn_47, clk_syn_4, _al_n1_syn_6);  // w40_d512_fifo.v(24)
  xor clk_syn_48 (clk_syn_49, clk_syn_5, clk_syn_47);  // w40_d512_fifo.v(24)
  and clk_syn_50 (clk_syn_51, clk_syn_5, _al_n1_syn_8);  // w40_d512_fifo.v(24)
  xor clk_syn_52 (clk_syn_53, clk_syn_6, clk_syn_51);  // w40_d512_fifo.v(24)
  and clk_syn_54 (clk_syn_55, clk_syn_6, _al_n1_syn_10);  // w40_d512_fifo.v(24)
  xor clk_syn_56 (clk_syn_57, clk_syn_7, clk_syn_55);  // w40_d512_fifo.v(24)
  and clk_syn_58 (clk_syn_59, clk_syn_7, _al_n1_syn_12);  // w40_d512_fifo.v(24)
  xor clk_syn_60 (clk_syn_61, clk_syn_8, clk_syn_59);  // w40_d512_fifo.v(24)
  and clk_syn_62 (clk_syn_63, clk_syn_8, _al_n1_syn_14);  // w40_d512_fifo.v(24)
  xor clk_syn_64 (clk_syn_65, clk_syn_9, clk_syn_63);  // w40_d512_fifo.v(24)
  and clk_syn_66 (clk_syn_67, clk_syn_9, _al_n1_syn_16);  // w40_d512_fifo.v(24)
  xor clk_syn_68 (clk_syn_69, clk_syn_10, clk_syn_67);  // w40_d512_fifo.v(24)
  and clk_syn_70 (clk_syn_71, clk_syn_13, _al_n1_syn_18);  // w40_d512_fifo.v(24)
  xor clk_syn_72 (clk_syn_73, clk_syn_11, clk_syn_71);  // w40_d512_fifo.v(24)
  or clk_syn_97 (clk_syn_98, clk_syn_96, clk_syn_95);  // w40_d512_fifo.v(24)
  PH1_PHY_CONFIG_V2 #(
    .JTAG_PERSISTN("DISABLE"),
    .SPIX4_PERSISTN("ENABLE"))
    config_inst ();
  not logic_ramfifo_syn_163 (logic_ramfifo_syn_164, logic_ramfifo_syn_49);  // w40_d512_fifo.v(39)
  not logic_ramfifo_syn_165 (logic_ramfifo_syn_166, logic_ramfifo_syn_50);  // w40_d512_fifo.v(39)
  not logic_ramfifo_syn_169 (logic_ramfifo_syn_170, full_flag);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_183 (logic_ramfifo_syn_184, logic_ramfifo_syn_30, logic_ramfifo_syn_29);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_185 (logic_ramfifo_syn_186, logic_ramfifo_syn_10, logic_ramfifo_syn_9);  // w40_d512_fifo.v(39)
  not logic_ramfifo_syn_239 (logic_ramfifo_syn_240, empty_flag);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_285 (logic_ramfifo_syn_286, logic_ramfifo_syn_50, logic_ramfifo_syn_49);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_287 (logic_ramfifo_syn_288, logic_ramfifo_syn_286, logic_ramfifo_syn_48);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_289 (logic_ramfifo_syn_290, logic_ramfifo_syn_288, logic_ramfifo_syn_47);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_291 (logic_ramfifo_syn_292, logic_ramfifo_syn_290, logic_ramfifo_syn_46);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_293 (logic_ramfifo_syn_294, logic_ramfifo_syn_292, logic_ramfifo_syn_45);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_295 (logic_ramfifo_syn_296, logic_ramfifo_syn_294, logic_ramfifo_syn_44);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_297 (logic_ramfifo_syn_298, logic_ramfifo_syn_296, logic_ramfifo_syn_43);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_299 (logic_ramfifo_syn_300, logic_ramfifo_syn_298, logic_ramfifo_syn_42);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_301 (logic_ramfifo_syn_302, logic_ramfifo_syn_300, logic_ramfifo_syn_41);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_306 (logic_ramfifo_syn_307, logic_ramfifo_syn_186, logic_ramfifo_syn_8);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_308 (logic_ramfifo_syn_309, logic_ramfifo_syn_307, logic_ramfifo_syn_7);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_310 (logic_ramfifo_syn_311, logic_ramfifo_syn_309, logic_ramfifo_syn_6);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_312 (logic_ramfifo_syn_313, logic_ramfifo_syn_311, logic_ramfifo_syn_5);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_314 (logic_ramfifo_syn_315, logic_ramfifo_syn_313, logic_ramfifo_syn_4);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_316 (logic_ramfifo_syn_317, logic_ramfifo_syn_315, logic_ramfifo_syn_3);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_318 (logic_ramfifo_syn_319, logic_ramfifo_syn_317, logic_ramfifo_syn_2);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_320 (logic_ramfifo_syn_321, logic_ramfifo_syn_319, logic_ramfifo_syn_1);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_324 (logic_ramfifo_syn_325, logic_ramfifo_syn_80, logic_ramfifo_syn_79);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_326 (logic_ramfifo_syn_327, logic_ramfifo_syn_325, logic_ramfifo_syn_78);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_328 (logic_ramfifo_syn_329, logic_ramfifo_syn_327, logic_ramfifo_syn_77);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_330 (logic_ramfifo_syn_331, logic_ramfifo_syn_329, logic_ramfifo_syn_76);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_332 (logic_ramfifo_syn_333, logic_ramfifo_syn_331, logic_ramfifo_syn_75);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_334 (logic_ramfifo_syn_335, logic_ramfifo_syn_333, logic_ramfifo_syn_74);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_336 (logic_ramfifo_syn_337, logic_ramfifo_syn_335, logic_ramfifo_syn_73);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_338 (logic_ramfifo_syn_339, logic_ramfifo_syn_337, logic_ramfifo_syn_72);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_340 (logic_ramfifo_syn_341, logic_ramfifo_syn_339, logic_ramfifo_syn_71);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_345 (logic_ramfifo_syn_346, logic_ramfifo_syn_184, logic_ramfifo_syn_28);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_347 (logic_ramfifo_syn_348, logic_ramfifo_syn_346, logic_ramfifo_syn_27);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_349 (logic_ramfifo_syn_350, logic_ramfifo_syn_348, logic_ramfifo_syn_26);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_351 (logic_ramfifo_syn_352, logic_ramfifo_syn_350, logic_ramfifo_syn_25);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_353 (logic_ramfifo_syn_354, logic_ramfifo_syn_352, logic_ramfifo_syn_24);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_355 (logic_ramfifo_syn_356, logic_ramfifo_syn_354, logic_ramfifo_syn_23);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_357 (logic_ramfifo_syn_358, logic_ramfifo_syn_356, logic_ramfifo_syn_22);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_359 (logic_ramfifo_syn_360, logic_ramfifo_syn_358, logic_ramfifo_syn_21);  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_387 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_171),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_1));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_388 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_172),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_2));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_389 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_173),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_3));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_390 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_174),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_4));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_391 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_175),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_5));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_392 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_176),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_6));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_393 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_177),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_7));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_394 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_178),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_8));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_395 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_179),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_9));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_396 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_180),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_10));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_397 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_1),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_11));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_398 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_2),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_12));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_399 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_3),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_13));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_400 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_4),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_14));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_401 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_5),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_15));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_402 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_6),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_16));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_403 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_7),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_17));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_404 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_8),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_18));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_405 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_9),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_19));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_406 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_10),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_20));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_410 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_260),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_21));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_411 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_261),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_22));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_412 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_262),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_23));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_413 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_263),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_24));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_414 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_264),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_25));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_415 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_265),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_26));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_416 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_266),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_27));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_417 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_267),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_28));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_418 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_268),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_29));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_419 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_269),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_30));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_430 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_21),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_41));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_431 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_22),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_42));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_432 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_23),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_43));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_433 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_24),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_44));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_434 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_25),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_45));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_435 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_26),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_46));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_436 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_27),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_47));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_437 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_28),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_48));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_438 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_29),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_49));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_439 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_30),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_50));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_440 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_302),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_51));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_441 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_300),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_52));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_442 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_298),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_53));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_443 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_296),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_54));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_444 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_294),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_55));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_445 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_292),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_56));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_446 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_290),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_57));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_447 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_288),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_58));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_448 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_286),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_59));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_449 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_50),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_60));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_450 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_321),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_61));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_451 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_319),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_62));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_452 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_317),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_63));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_453 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_315),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_64));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_454 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_313),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_65));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_455 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_311),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_66));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_456 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_309),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_67));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_457 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_307),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_68));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_458 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_186),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_69));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_460 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_11),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_71));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_461 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_12),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_72));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_462 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_13),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_73));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_463 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_14),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_74));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_464 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_15),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_75));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_465 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_16),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_76));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_466 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_17),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_77));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_467 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_18),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_78));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_468 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_19),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_79));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_469 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_20),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_80));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_470 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_341),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_81));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_471 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_339),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_82));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_472 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_337),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_83));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_473 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_335),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_84));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_474 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_333),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_85));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_475 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_331),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_86));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_476 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_329),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_87));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_477 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_327),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_88));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_478 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_325),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_89));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_479 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_80),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_90));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_480 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_360),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_91));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_481 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_358),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_92));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_482 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_356),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_93));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_483 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_354),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_94));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_484 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_352),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_95));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_485 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_350),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_96));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_486 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_348),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_97));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_487 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_346),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_98));  // w40_d512_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_488 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_184),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_99));  // w40_d512_fifo.v(39)
  // address_offset=0;data_offset=0;depth=512;width=40;num_section=1;width_per_section=40;section_size=40;working_depth=512;working_width=40;working_numbyte=1;mode_ecc=1;address_step=1;bytes_in_per_section=1;
  // logic_ramfifo_syn_362_512x40
  PH1_PHY_ERAM #(
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("SIG"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("40"),
    .DATA_WIDTH_B("40"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP20K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE_A("SYNC"),
    .RESETMODE_B("SYNC"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    logic_ramfifo_syn_490 (
    .addra({logic_ramfifo_syn_186,logic_ramfifo_syn_8,logic_ramfifo_syn_7,logic_ramfifo_syn_6,logic_ramfifo_syn_5,logic_ramfifo_syn_4,logic_ramfifo_syn_3,logic_ramfifo_syn_2,logic_ramfifo_syn_1,5'b11111}),
    .addrb({logic_ramfifo_syn_184,logic_ramfifo_syn_28,logic_ramfifo_syn_27,logic_ramfifo_syn_26,logic_ramfifo_syn_25,logic_ramfifo_syn_24,logic_ramfifo_syn_23,logic_ramfifo_syn_22,logic_ramfifo_syn_21,5'b11111}),
    .clka(clk),
    .clkb(clk),
    .csa({we_syn_2,open_n227,open_n228}),
    .csb({re_syn_2,open_n229,open_n230}),
    .dia(di[15:0]),
    .dia_extra(di[35:32]),
    .dib(di[31:16]),
    .dib_extra(di[39:36]),
    .ecc_dbiterrinj(1'b0),
    .ecc_sbiterrinj(1'b0),
    .orsta(rst),
    .orstb(rst),
    .doa(dout[15:0]),
    .doa_extra(dout[35:32]),
    .dob(dout[31:16]),
    .dob_extra(dout[39:36]));  // w40_d512_fifo.v(39)
  not logic_ramfifo_syn_531 (full_flag, logic_ramfifo_syn_590);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_532 (logic_ramfifo_syn_572, logic_ramfifo_syn_1, logic_ramfifo_syn_41);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_533 (logic_ramfifo_syn_573, logic_ramfifo_syn_2, logic_ramfifo_syn_42);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_534 (logic_ramfifo_syn_574, logic_ramfifo_syn_3, logic_ramfifo_syn_43);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_535 (logic_ramfifo_syn_575, logic_ramfifo_syn_4, logic_ramfifo_syn_44);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_536 (logic_ramfifo_syn_576, logic_ramfifo_syn_5, logic_ramfifo_syn_45);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_537 (logic_ramfifo_syn_577, logic_ramfifo_syn_6, logic_ramfifo_syn_46);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_538 (logic_ramfifo_syn_578, logic_ramfifo_syn_7, logic_ramfifo_syn_47);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_539 (logic_ramfifo_syn_579, logic_ramfifo_syn_8, logic_ramfifo_syn_48);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_540 (logic_ramfifo_syn_580, logic_ramfifo_syn_9, logic_ramfifo_syn_164);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_541 (logic_ramfifo_syn_581, logic_ramfifo_syn_10, logic_ramfifo_syn_166);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_542 (logic_ramfifo_syn_582, logic_ramfifo_syn_572, logic_ramfifo_syn_573);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_543 (logic_ramfifo_syn_583, logic_ramfifo_syn_575, logic_ramfifo_syn_576);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_544 (logic_ramfifo_syn_584, logic_ramfifo_syn_574, logic_ramfifo_syn_583);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_545 (logic_ramfifo_syn_585, logic_ramfifo_syn_582, logic_ramfifo_syn_584);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_546 (logic_ramfifo_syn_586, logic_ramfifo_syn_577, logic_ramfifo_syn_578);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_547 (logic_ramfifo_syn_587, logic_ramfifo_syn_580, logic_ramfifo_syn_581);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_548 (logic_ramfifo_syn_588, logic_ramfifo_syn_579, logic_ramfifo_syn_587);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_549 (logic_ramfifo_syn_589, logic_ramfifo_syn_586, logic_ramfifo_syn_588);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_550 (logic_ramfifo_syn_590, logic_ramfifo_syn_585, logic_ramfifo_syn_589);  // w40_d512_fifo.v(39)
  not logic_ramfifo_syn_591 (empty_flag, logic_ramfifo_syn_650);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_592 (logic_ramfifo_syn_632, logic_ramfifo_syn_71, logic_ramfifo_syn_21);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_593 (logic_ramfifo_syn_633, logic_ramfifo_syn_72, logic_ramfifo_syn_22);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_594 (logic_ramfifo_syn_634, logic_ramfifo_syn_73, logic_ramfifo_syn_23);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_595 (logic_ramfifo_syn_635, logic_ramfifo_syn_74, logic_ramfifo_syn_24);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_596 (logic_ramfifo_syn_636, logic_ramfifo_syn_75, logic_ramfifo_syn_25);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_597 (logic_ramfifo_syn_637, logic_ramfifo_syn_76, logic_ramfifo_syn_26);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_598 (logic_ramfifo_syn_638, logic_ramfifo_syn_77, logic_ramfifo_syn_27);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_599 (logic_ramfifo_syn_639, logic_ramfifo_syn_78, logic_ramfifo_syn_28);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_600 (logic_ramfifo_syn_640, logic_ramfifo_syn_79, logic_ramfifo_syn_29);  // w40_d512_fifo.v(39)
  xor logic_ramfifo_syn_601 (logic_ramfifo_syn_641, logic_ramfifo_syn_80, logic_ramfifo_syn_30);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_602 (logic_ramfifo_syn_642, logic_ramfifo_syn_632, logic_ramfifo_syn_633);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_603 (logic_ramfifo_syn_643, logic_ramfifo_syn_635, logic_ramfifo_syn_636);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_604 (logic_ramfifo_syn_644, logic_ramfifo_syn_634, logic_ramfifo_syn_643);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_605 (logic_ramfifo_syn_645, logic_ramfifo_syn_642, logic_ramfifo_syn_644);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_606 (logic_ramfifo_syn_646, logic_ramfifo_syn_637, logic_ramfifo_syn_638);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_607 (logic_ramfifo_syn_647, logic_ramfifo_syn_640, logic_ramfifo_syn_641);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_608 (logic_ramfifo_syn_648, logic_ramfifo_syn_639, logic_ramfifo_syn_647);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_609 (logic_ramfifo_syn_649, logic_ramfifo_syn_646, logic_ramfifo_syn_648);  // w40_d512_fifo.v(39)
  or logic_ramfifo_syn_610 (logic_ramfifo_syn_650, logic_ramfifo_syn_645, logic_ramfifo_syn_649);  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    logic_ramfifo_syn_651 (
    .a(1'b0),
    .o({logic_ramfifo_syn_693,open_n297}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_652 (
    .a(logic_ramfifo_syn_61),
    .b(logic_ramfifo_syn_51),
    .c(logic_ramfifo_syn_693),
    .o({logic_ramfifo_syn_694,wrusedw[0]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_653 (
    .a(logic_ramfifo_syn_62),
    .b(logic_ramfifo_syn_52),
    .c(logic_ramfifo_syn_694),
    .o({logic_ramfifo_syn_695,wrusedw[1]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_654 (
    .a(logic_ramfifo_syn_63),
    .b(logic_ramfifo_syn_53),
    .c(logic_ramfifo_syn_695),
    .o({logic_ramfifo_syn_696,wrusedw[2]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_655 (
    .a(logic_ramfifo_syn_64),
    .b(logic_ramfifo_syn_54),
    .c(logic_ramfifo_syn_696),
    .o({logic_ramfifo_syn_697,wrusedw[3]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_656 (
    .a(logic_ramfifo_syn_65),
    .b(logic_ramfifo_syn_55),
    .c(logic_ramfifo_syn_697),
    .o({logic_ramfifo_syn_698,wrusedw[4]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_657 (
    .a(logic_ramfifo_syn_66),
    .b(logic_ramfifo_syn_56),
    .c(logic_ramfifo_syn_698),
    .o({logic_ramfifo_syn_699,wrusedw[5]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_658 (
    .a(logic_ramfifo_syn_67),
    .b(logic_ramfifo_syn_57),
    .c(logic_ramfifo_syn_699),
    .o({logic_ramfifo_syn_700,wrusedw[6]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_659 (
    .a(logic_ramfifo_syn_68),
    .b(logic_ramfifo_syn_58),
    .c(logic_ramfifo_syn_700),
    .o({logic_ramfifo_syn_701,wrusedw[7]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_660 (
    .a(logic_ramfifo_syn_69),
    .b(logic_ramfifo_syn_59),
    .c(logic_ramfifo_syn_701),
    .o({logic_ramfifo_syn_702,wrusedw[8]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_661 (
    .a(logic_ramfifo_syn_20),
    .b(logic_ramfifo_syn_60),
    .c(logic_ramfifo_syn_702),
    .o({open_n298,wrusedw[9]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    logic_ramfifo_syn_704 (
    .a(1'b0),
    .o({logic_ramfifo_syn_746,open_n301}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_705 (
    .a(logic_ramfifo_syn_81),
    .b(logic_ramfifo_syn_91),
    .c(logic_ramfifo_syn_746),
    .o({logic_ramfifo_syn_747,rdusedw[0]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_706 (
    .a(logic_ramfifo_syn_82),
    .b(logic_ramfifo_syn_92),
    .c(logic_ramfifo_syn_747),
    .o({logic_ramfifo_syn_748,rdusedw[1]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_707 (
    .a(logic_ramfifo_syn_83),
    .b(logic_ramfifo_syn_93),
    .c(logic_ramfifo_syn_748),
    .o({logic_ramfifo_syn_749,rdusedw[2]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_708 (
    .a(logic_ramfifo_syn_84),
    .b(logic_ramfifo_syn_94),
    .c(logic_ramfifo_syn_749),
    .o({logic_ramfifo_syn_750,rdusedw[3]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_709 (
    .a(logic_ramfifo_syn_85),
    .b(logic_ramfifo_syn_95),
    .c(logic_ramfifo_syn_750),
    .o({logic_ramfifo_syn_751,rdusedw[4]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_710 (
    .a(logic_ramfifo_syn_86),
    .b(logic_ramfifo_syn_96),
    .c(logic_ramfifo_syn_751),
    .o({logic_ramfifo_syn_752,rdusedw[5]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_711 (
    .a(logic_ramfifo_syn_87),
    .b(logic_ramfifo_syn_97),
    .c(logic_ramfifo_syn_752),
    .o({logic_ramfifo_syn_753,rdusedw[6]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_712 (
    .a(logic_ramfifo_syn_88),
    .b(logic_ramfifo_syn_98),
    .c(logic_ramfifo_syn_753),
    .o({logic_ramfifo_syn_754,rdusedw[7]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_713 (
    .a(logic_ramfifo_syn_89),
    .b(logic_ramfifo_syn_99),
    .c(logic_ramfifo_syn_754),
    .o({logic_ramfifo_syn_755,rdusedw[8]}));  // w40_d512_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_714 (
    .a(logic_ramfifo_syn_90),
    .b(logic_ramfifo_syn_50),
    .c(logic_ramfifo_syn_755),
    .o({open_n302,rdusedw[9]}));  // w40_d512_fifo.v(39)
  and re_syn_1 (re_syn_2, re, logic_ramfifo_syn_240);  // w40_d512_fifo.v(25)
  AL_MUX re_syn_571 (
    .i0(clk_syn_86),
    .i1(clk_syn_118),
    .sel(re_syn_2),
    .o(clk_syn_159));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_576 (
    .i0(clk_syn_87),
    .i1(clk_syn_122),
    .sel(re_syn_2),
    .o(clk_syn_160));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_581 (
    .i0(clk_syn_88),
    .i1(clk_syn_126),
    .sel(re_syn_2),
    .o(clk_syn_161));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_586 (
    .i0(clk_syn_89),
    .i1(clk_syn_130),
    .sel(re_syn_2),
    .o(clk_syn_162));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_591 (
    .i0(clk_syn_90),
    .i1(clk_syn_134),
    .sel(re_syn_2),
    .o(clk_syn_163));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_596 (
    .i0(clk_syn_91),
    .i1(clk_syn_138),
    .sel(re_syn_2),
    .o(clk_syn_164));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_601 (
    .i0(clk_syn_92),
    .i1(clk_syn_142),
    .sel(re_syn_2),
    .o(clk_syn_165));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_606 (
    .i0(clk_syn_93),
    .i1(clk_syn_146),
    .sel(re_syn_2),
    .o(clk_syn_166));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_611 (
    .i0(clk_syn_94),
    .i1(clk_syn_150),
    .sel(re_syn_2),
    .o(clk_syn_167));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_616 (
    .i0(clk_syn_95),
    .i1(clk_syn_154),
    .sel(re_syn_2),
    .o(clk_syn_168));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_621 (
    .i0(clk_syn_96),
    .i1(clk_syn_158),
    .sel(re_syn_2),
    .o(clk_syn_169));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_626 (
    .i0(logic_ramfifo_syn_21),
    .i1(clk_syn_87),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_260));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_631 (
    .i0(logic_ramfifo_syn_22),
    .i1(clk_syn_88),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_261));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_636 (
    .i0(logic_ramfifo_syn_23),
    .i1(clk_syn_89),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_262));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_641 (
    .i0(logic_ramfifo_syn_24),
    .i1(clk_syn_90),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_263));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_646 (
    .i0(logic_ramfifo_syn_25),
    .i1(clk_syn_91),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_264));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_651 (
    .i0(logic_ramfifo_syn_26),
    .i1(clk_syn_92),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_265));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_656 (
    .i0(logic_ramfifo_syn_27),
    .i1(clk_syn_93),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_266));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_661 (
    .i0(logic_ramfifo_syn_28),
    .i1(clk_syn_94),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_267));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_666 (
    .i0(logic_ramfifo_syn_29),
    .i1(clk_syn_95),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_268));  // w40_d512_fifo.v(25)
  AL_MUX re_syn_671 (
    .i0(logic_ramfifo_syn_30),
    .i1(clk_syn_96),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_269));  // w40_d512_fifo.v(25)
  and we_syn_1 (we_syn_2, we, logic_ramfifo_syn_170);  // w40_d512_fifo.v(24)
  AL_MUX we_syn_101 (
    .i0(logic_ramfifo_syn_5),
    .i1(clk_syn_6),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_175));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_106 (
    .i0(logic_ramfifo_syn_6),
    .i1(clk_syn_7),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_176));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_111 (
    .i0(logic_ramfifo_syn_7),
    .i1(clk_syn_8),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_177));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_116 (
    .i0(logic_ramfifo_syn_8),
    .i1(clk_syn_9),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_178));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_121 (
    .i0(logic_ramfifo_syn_9),
    .i1(clk_syn_10),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_179));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_126 (
    .i0(logic_ramfifo_syn_10),
    .i1(clk_syn_11),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_180));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_26 (
    .i0(clk_syn_1),
    .i1(clk_syn_15),
    .sel(we_syn_2),
    .o(clk_syn_74));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_31 (
    .i0(clk_syn_2),
    .i1(clk_syn_37),
    .sel(we_syn_2),
    .o(clk_syn_75));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_36 (
    .i0(clk_syn_3),
    .i1(clk_syn_41),
    .sel(we_syn_2),
    .o(clk_syn_76));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_41 (
    .i0(clk_syn_4),
    .i1(clk_syn_45),
    .sel(we_syn_2),
    .o(clk_syn_77));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_46 (
    .i0(clk_syn_5),
    .i1(clk_syn_49),
    .sel(we_syn_2),
    .o(clk_syn_78));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_51 (
    .i0(clk_syn_6),
    .i1(clk_syn_53),
    .sel(we_syn_2),
    .o(clk_syn_79));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_56 (
    .i0(clk_syn_7),
    .i1(clk_syn_57),
    .sel(we_syn_2),
    .o(clk_syn_80));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_61 (
    .i0(clk_syn_8),
    .i1(clk_syn_61),
    .sel(we_syn_2),
    .o(clk_syn_81));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_66 (
    .i0(clk_syn_9),
    .i1(clk_syn_65),
    .sel(we_syn_2),
    .o(clk_syn_82));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_71 (
    .i0(clk_syn_10),
    .i1(clk_syn_69),
    .sel(we_syn_2),
    .o(clk_syn_83));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_76 (
    .i0(clk_syn_11),
    .i1(clk_syn_73),
    .sel(we_syn_2),
    .o(clk_syn_84));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_81 (
    .i0(logic_ramfifo_syn_1),
    .i1(clk_syn_2),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_171));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_86 (
    .i0(logic_ramfifo_syn_2),
    .i1(clk_syn_3),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_172));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_91 (
    .i0(logic_ramfifo_syn_3),
    .i1(clk_syn_4),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_173));  // w40_d512_fifo.v(24)
  AL_MUX we_syn_96 (
    .i0(logic_ramfifo_syn_4),
    .i1(clk_syn_5),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_174));  // w40_d512_fifo.v(24)

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

