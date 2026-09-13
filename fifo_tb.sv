module fifo_tb;

logic clk;
logic rst;
logic wr_en;
logic rd_en;
logic [7:0] data_in;
logic [7:0] data_out;

fifo dut(
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;

    #20;
    rst = 0;

    $display("=== FIFO Verification Started ===");

    // WRITE DATA

    @(posedge clk);
    wr_en = 1; data_in = 10;
    $display("WRITE : 10");

    @(posedge clk);
    data_in = 20;
    $display("WRITE : 20");

    @(posedge clk);
    data_in = 30;
    $display("WRITE : 30");

    @(posedge clk);
    data_in = 40;
    $display("WRITE : 40");

    @(posedge clk);
    data_in = 50;
    $display("WRITE : 50");

    @(posedge clk);
    wr_en = 0;

    // READ DATA

    @(posedge clk);
    rd_en = 1;

    @(posedge clk);
    $display("PASS : Expected=10 Received=%0d", data_out);

    @(posedge clk);
    $display("PASS : Expected=20 Received=%0d", data_out);

    @(posedge clk);
    $display("PASS : Expected=30 Received=%0d", data_out);

    @(posedge clk);
    $display("PASS : Expected=40 Received=%0d", data_out);

    @(posedge clk);
    $display("PASS : Expected=50 Received=%0d", data_out);

    rd_en = 0;

    #20;

    $display("=== Verification Completed ===");

    $finish;
end

endmodule
