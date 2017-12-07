/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module state_4 (
    input clk,
    input rst,
    input leftBtn,
    input centBtn,
    input rightBtn,
    output reg row1,
    output reg row2,
    output reg row3,
    output reg row4,
    output reg row5,
    output reg row6,
    output reg row7,
    output reg row8,
    output reg row9,
    output reg row10,
    output reg gnd1,
    output reg gnd2,
    output reg gnd3,
    output reg [7:0] totalScore,
    output reg [1:0] result,
    output reg startbutt
  );
  
  
  
  localparam MAIN_state = 1'd0;
  localparam HALT_state = 1'd1;
  
  reg M_state_d, M_state_q = HALT_state;
  wire [1-1:0] M_bttnpress_bttnPress;
  reg [1-1:0] M_bttnpress_button;
  reg [1-1:0] M_bttnpress_button2;
  reg [1-1:0] M_bttnpress_button3;
  bcounter_5 bttnpress (
    .clk(clk),
    .rst(rst),
    .button(M_bttnpress_button),
    .button2(M_bttnpress_button2),
    .button3(M_bttnpress_button3),
    .bttnPress(M_bttnpress_bttnPress)
  );
  wire [8-1:0] M_scoreSum_out;
  reg [1-1:0] M_scoreSum_en;
  reg [8-1:0] M_scoreSum_data;
  reg8bit_6 scoreSum (
    .clk(clk),
    .rst(rst),
    .en(M_scoreSum_en),
    .data(M_scoreSum_data),
    .out(M_scoreSum_out)
  );
  wire [2-1:0] M_mainState_result;
  wire [1-1:0] M_mainState_high1;
  wire [1-1:0] M_mainState_high2;
  wire [1-1:0] M_mainState_high3;
  wire [1-1:0] M_mainState_high4;
  wire [1-1:0] M_mainState_high5;
  wire [1-1:0] M_mainState_high6;
  wire [1-1:0] M_mainState_high7;
  wire [1-1:0] M_mainState_high8;
  wire [1-1:0] M_mainState_high9;
  wire [1-1:0] M_mainState_high10;
  wire [1-1:0] M_mainState_low1;
  wire [1-1:0] M_mainState_low2;
  wire [1-1:0] M_mainState_low3;
  wire [2-1:0] M_mainState_rowOn;
  reg [1-1:0] M_mainState_rst;
  reg [1-1:0] M_mainState_left2;
  reg [1-1:0] M_mainState_center1;
  reg [1-1:0] M_mainState_right0;
  main_7 mainState (
    .clk(clk),
    .rst(M_mainState_rst),
    .left2(M_mainState_left2),
    .center1(M_mainState_center1),
    .right0(M_mainState_right0),
    .result(M_mainState_result),
    .high1(M_mainState_high1),
    .high2(M_mainState_high2),
    .high3(M_mainState_high3),
    .high4(M_mainState_high4),
    .high5(M_mainState_high5),
    .high6(M_mainState_high6),
    .high7(M_mainState_high7),
    .high8(M_mainState_high8),
    .high9(M_mainState_high9),
    .high10(M_mainState_high10),
    .low1(M_mainState_low1),
    .low2(M_mainState_low2),
    .low3(M_mainState_low3),
    .rowOn(M_mainState_rowOn)
  );
  
  wire [1-1:0] M_myalu_z;
  wire [1-1:0] M_myalu_v;
  wire [1-1:0] M_myalu_n;
  wire [8-1:0] M_myalu_alu;
  reg [8-1:0] M_myalu_a;
  reg [8-1:0] M_myalu_b;
  reg [6-1:0] M_myalu_alufn;
  alu_8 myalu (
    .a(M_myalu_a),
    .b(M_myalu_b),
    .alufn(M_myalu_alufn),
    .z(M_myalu_z),
    .v(M_myalu_v),
    .n(M_myalu_n),
    .alu(M_myalu_alu)
  );
  
  always @* begin
    M_state_d = M_state_q;
    
    totalScore = M_scoreSum_out;
    M_scoreSum_data = 8'h00;
    M_scoreSum_en = 1'h0;
    M_mainState_rst = rst;
    result = M_mainState_result;
    M_mainState_left2 = leftBtn;
    M_mainState_right0 = rightBtn;
    M_mainState_center1 = centBtn;
    M_bttnpress_button = leftBtn;
    M_bttnpress_button2 = centBtn;
    M_bttnpress_button3 = rightBtn;
    startbutt = M_bttnpress_bttnPress;
    M_myalu_a = 1'h0;
    M_myalu_b = 1'h0;
    M_myalu_alufn = 1'h0;
    row1 = 1'h0;
    row2 = 1'h0;
    row3 = 1'h0;
    row4 = 1'h0;
    row5 = 1'h0;
    row6 = 1'h0;
    row7 = 1'h0;
    row8 = 1'h0;
    row9 = 1'h0;
    row10 = 1'h0;
    gnd1 = 1'h1;
    gnd2 = 1'h1;
    gnd3 = 1'h1;
    
    case (M_state_q)
      MAIN_state: begin
        gnd1 = M_mainState_low1;
        gnd2 = M_mainState_low2;
        gnd3 = M_mainState_low3;
        row1 = M_mainState_high1;
        row2 = M_mainState_high2;
        row3 = M_mainState_high3;
        row4 = M_mainState_high4;
        row5 = M_mainState_high5;
        row6 = M_mainState_high6;
        row7 = M_mainState_high7;
        row8 = M_mainState_high8;
        row9 = M_mainState_high9;
        row10 = M_mainState_high10;
        M_scoreSum_en = 1'h0;
        if (M_mainState_result != 1'h0 && M_mainState_rowOn == 4'ha) begin
          M_myalu_alufn = 6'h00;
          M_myalu_a = M_mainState_result;
          M_myalu_b = M_scoreSum_out;
          M_scoreSum_data = M_myalu_alu;
          M_scoreSum_en = 1'h1;
          M_state_d = HALT_state;
        end
      end
      HALT_state: begin
        row1 = 1'h0;
        row2 = 1'h0;
        row3 = 1'h0;
        row4 = 1'h0;
        row5 = 1'h0;
        row6 = 1'h0;
        row7 = 1'h0;
        row8 = 1'h0;
        row9 = 1'h0;
        row10 = 1'h0;
        gnd1 = 1'h1;
        gnd2 = 1'h1;
        gnd3 = 1'h1;
        M_scoreSum_en = 1'h0;
        if (M_bttnpress_bttnPress == 1'h1) begin
          M_mainState_rst = 1'h1;
          M_state_d = MAIN_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h1;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
