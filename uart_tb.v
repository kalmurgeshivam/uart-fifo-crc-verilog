module uart_tb;

reg clk = 0;
reg rst = 1;
reg tx_start = 0;
reg rd_en = 0;
reg [7:0] data_in = 8'hA5;

wire [7:0] data_out;
wire tx;
wire error;

uart_top DUT(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .data_in(data_in),
    .rd_en(rd_en),
    .data_out(data_out),
    .tx(tx),
    .error(error)
);

always #5 clk = ~clk;

initial begin
    #10 rst = 0;
    #10 tx_start = 1;
    #10 tx_start = 0;
    #200 rd_en = 1;
    #50 $finish;
end

endmodule


