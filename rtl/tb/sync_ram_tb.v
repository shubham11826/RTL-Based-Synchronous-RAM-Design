`timescale 1ns/1ps

module sync_ram_tb;

    localparam DATA_WIDTH = 4;
    localparam DEPTH      = 4;
    localparam ADDR_WIDTH = 2;

    reg clk;
    reg rst_n;
    reg wr_en;
    reg [ADDR_WIDTH-1:0] addr_i;
    reg [DATA_WIDTH-1:0] wr_data;
    wire [DATA_WIDTH-1:0] rd_data;

    integer idx;
    reg [DATA_WIDTH-1:0] expected;

    sync_ram #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .wr_en(wr_en),
        .addr_i(addr_i),
        .wr_data(wr_data),
        .rd_data(rd_data)
    );

    always #2 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, sync_ram_tb);

        clk = 0;
        rst_n = 0;
        wr_en = 0;
        addr_i = 0;
        wr_data = 0;

        #5 rst_n = 1;

        for (idx = 0; idx < DEPTH; idx = idx + 1) begin
            @(posedge clk);
            wr_en = 1;
            addr_i = idx;
            wr_data = idx + 4;
        end

        @(posedge clk);
        wr_en = 0;

        for (idx = 0; idx < DEPTH; idx = idx + 1) begin
            @(posedge clk);
            addr_i = idx;
            @(posedge clk);

            expected = idx + 4;
            if (rd_data !== expected)
                $display("ERROR at addr=%0d | Expected=%b Got=%b",
                          idx, expected, rd_data);
            else
                $display("PASS at addr=%0d data=%b",
                          idx, rd_data);
        end

        $display("RAM verification completed successfully");
        $finish;
    end

endmodule
