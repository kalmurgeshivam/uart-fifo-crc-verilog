module uart_top(
    input clk,
    input rst,
    input tx_start,
    input [7:0] data_in,
    input rd_en,
    output [7:0] data_out,
    output tx,
    output error
);

wire [7:0] rx_data;
wire data_ready;
wire [2:0] crc_bits;
wire fifo_full;
wire fifo_empty;

/* CRC Generator */
crc_gen CRC_GEN(
    .data_in(data_in),
    .crc(crc_bits)
);

/* UART Transmitter */
uart_transmitter TX(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx(tx),
    .busy()
);

/* UART Receiver */
uart_receiver RX(
    .clk(clk),
    .rst(rst),
    .rx(tx),
    .data_out(rx_data),
    .data_ready(data_ready)
);

/* FIFO Buffer */
fifo_buffer FIFO(
    .clk(clk),
    .rst(rst),
    .wr_en(data_ready),
    .rd_en(rd_en),
    .din(rx_data),
    .dout(data_out),
    .full(fifo_full),
    .empty(fifo_empty)
);

/* CRC Checker */
crc_check CRC_CHECK(
    .data_in(rx_data),
    .crc_in(crc_bits),
    .error(error)
);

endmodule
