module fifo_buffer #
(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 16
)
(
    input clk,
    input rst,
    input wr_en,
    input rd_en,
    input [7:0] din,
    output reg [7:0] dout,
    output full,
    output empty
);

reg [7:0] mem [0:15];

reg [4:0] wr_ptr;
reg [4:0] rd_ptr;
reg [4:0] count;

assign full  = (count == DEPTH);
assign empty = (count == 0);

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        count  <= 0;
    end
    else
    begin
        // Write operation
        if(wr_en && !full)
        begin
            mem[wr_ptr] <= din;
            wr_ptr <= wr_ptr + 1;
            count <= count + 1;
        end

        // Read operation
        if(rd_en && !empty)
        begin
            dout <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;
            count <= count - 1;
        end
    end
end

endmodule


