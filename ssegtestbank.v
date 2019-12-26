`timescale 1ms / 1us


module ssegtestbank(
    input [15:0] sw, 
    input BTNC, clk,
    output [6:0] seg, [15:0] led, [7:0] an
    );
    
    assign led = sw;
    
    wire clock;
    
    clockdivider #(.DIV(100000), .WIDTH(17)) DIV0 (.in(clk), .reset(BTNC), .out(clock));
    
    sevenseg DRV0 (.CLK(clock), .RST(BTNC), .I0(sw[3:0]), .I2(sw[7:4]), .I5(sw[11:8]), .I7(sw[15:12]),
    .AN(an), .sA(seg[0]), .sB(seg[1]), .sC(seg[2]), .sD(seg[3]), .sE(seg[4]), .sF(seg[5]), .sG(seg[6]), 
    .I1(4'he), .I3(4'hc), .I4(4'ha), .I6(4'hf)
    );
    
endmodule
