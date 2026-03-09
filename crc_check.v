module crc_check(
    input [7:0] data_in,
    input [2:0] crc_in,
    output error
);

wire [2:0] crc_calc;

assign crc_calc[0] = data_in[0] ^ data_in[3] ^ data_in[6];
assign crc_calc[1] = data_in[1] ^ data_in[4] ^ data_in[7];
assign crc_calc[2] = data_in[2] ^ data_in[5];

assign error = (crc_calc != crc_in);

endmodule


