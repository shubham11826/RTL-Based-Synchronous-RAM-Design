`timescale 1ns/1ps

module sync_ram #(
    parameter DATA_WIDTH = 4,
    parameter DEPTH      = 4,
    parameter ADDR_WIDTH = 2
)(
    input  wire                     clk,
    input  wire                     rst_n,
    input  wire                     wr_en,
    input  wire [ADDR_WIDTH-1:0]    addr_i,
    input  wire [DATA_WIDTH-1:0]    wr_data,
    output reg  [DATA_WIDTH-1:0]    rd_data
);

    reg [DATA_WIDTH-1:0] mem_array [0:DEPTH-1];
    integer i;

    always @(posedge clk) begin
        if (!rst_n) begin
            for (i = 0; i < DEPTH; i = i + 1)
                mem_array[i] <= '0;
        end
        else if (wr_en) begin
            mem_array[addr_i] <= wr_data;
        end
    end

    always @(posedge clk) begin
        rd_data <= mem_array[addr_i];
    end

endmodule
