`timescale 1ns/1ps

module tb;

/* ----- 各種定数 ----- */
localparam integer STEP = 1000 / 100;   // 100Mhz

/* ----- クロック ----- */
reg CLK;
reg RST;

always begin
    CLK = 0; #(STEP/2);
    CLK = 1; #(STEP/2);
end

/* ----- テスト対象モジュールとの接続 ----- */
wire com_ser, com_rclk, com_srclk;
wire seg_ser, seg_rclk, seg_srclk;

segm7 segm7 (
    .COM_SER    (com_ser),
    .COM_RCLK   (com_rclk),
    .COM_SRCLK  (com_srclk),
    .SEG_SER    (seg_ser),
    .SEG_RCLK   (seg_rclk),
    .SEG_SRCLK  (seg_srclk),

    .S_AXI_ACLK (CLK),
    .S_AXI_ARSTN(RST)
);

/* ----- 監視対象信号 ----- */
wire [7:0]  CTL_COM_DATA = segm7.segm7_AXI.segm7_main.ctl_com_data;
wire [31:0] CTL_SEG_DATA = segm7.segm7_AXI.segm7_main.ctl_seg_data;

/* ----- テストベンチ本体 ----- */
initial begin
    RST = 1;
    #(10*STEP)
    RST = 0;
    #(10*STEP)
    RST = 1;

    $stop;
end

endmodule
