module crc_gen(
    input [7:0] data_in,
    output [2:0] crc
);

assign crc[0] = data_in[0] ^ data_in[3] ^ data_in[6];
assign crc[1] = data_in[1] ^ data_in[4] ^ data_in[7];
assign crc[2] = data_in[2] ^ data_in[5];

endmodule


