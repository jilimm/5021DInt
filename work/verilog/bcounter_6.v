/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module bcounter_6 (
    input clk,
    input rst,
    input button,
    input button2,
    input button3,
    output reg [7:0] bttnPress
  );
  
  
  
  wire [1-1:0] M_button_cond_out;
  reg [1-1:0] M_button_cond_in;
  button_conditioner_8 button_cond (
    .clk(clk),
    .in(M_button_cond_in),
    .out(M_button_cond_out)
  );
  wire [1-1:0] M_button_cond2_out;
  reg [1-1:0] M_button_cond2_in;
  button_conditioner_8 button_cond2 (
    .clk(clk),
    .in(M_button_cond2_in),
    .out(M_button_cond2_out)
  );
  wire [1-1:0] M_button_cond3_out;
  reg [1-1:0] M_button_cond3_in;
  button_conditioner_8 button_cond3 (
    .clk(clk),
    .in(M_button_cond3_in),
    .out(M_button_cond3_out)
  );
  reg [7:0] M_ctr_d, M_ctr_q = 1'h0;
  wire [1-1:0] M_edge_ctr_value;
  counter_11 edge_ctr (
    .clk(clk),
    .rst(rst),
    .value(M_edge_ctr_value)
  );
  reg [0:0] M_left_d, M_left_q = 1'h0;
  reg [0:0] M_right_d, M_right_q = 1'h0;
  reg [0:0] M_cent_d, M_cent_q = 1'h0;
  
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_13 edge_detector (
    .clk(M_edge_ctr_value),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  wire [1-1:0] M_edge_detector2_out;
  reg [1-1:0] M_edge_detector2_in;
  edge_detector_13 edge_detector2 (
    .clk(M_edge_ctr_value),
    .in(M_edge_detector2_in),
    .out(M_edge_detector2_out)
  );
  wire [1-1:0] M_edge_detector3_out;
  reg [1-1:0] M_edge_detector3_in;
  edge_detector_13 edge_detector3 (
    .clk(M_edge_ctr_value),
    .in(M_edge_detector3_in),
    .out(M_edge_detector3_out)
  );
  
  always @* begin
    M_cent_d = M_cent_q;
    M_left_d = M_left_q;
    M_right_d = M_right_q;
    M_ctr_d = M_ctr_q;
    
    M_button_cond_in = button;
    M_edge_detector_in = M_button_cond_out;
    M_button_cond2_in = button2;
    M_edge_detector2_in = M_button_cond2_out;
    M_button_cond3_in = button3;
    M_edge_detector3_in = M_button_cond3_out;
    bttnPress = M_ctr_q;
    if (M_edge_detector_out) begin
      M_left_d = 1'h1;
    end
    if (M_edge_detector2_out) begin
      M_cent_d = 1'h1;
    end
    if (M_edge_detector3_out) begin
      M_right_d = 1'h1;
    end
    if (M_edge_ctr_value) begin
      M_ctr_d = M_ctr_q | M_left_q | M_right_q | M_cent_q;
      M_left_d = 1'h0;
      M_right_d = 1'h0;
      M_cent_d = 1'h0;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
      M_left_q <= 1'h0;
      M_right_q <= 1'h0;
      M_cent_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
      M_left_q <= M_left_d;
      M_right_q <= M_right_d;
      M_cent_q <= M_cent_d;
    end
  end
  
endmodule
