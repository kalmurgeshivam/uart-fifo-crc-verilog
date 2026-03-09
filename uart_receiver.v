module uart_receiver(
    input clk,
    input rst,
    input rx,
    output reg [7:0] data_out,
    output reg data_ready
);

reg [3:0] state;
reg [7:0] data;

always @(posedge clk or posedge rst)
begin
    if(rst) begin
        state <= 0;
        data_ready <= 0;
    end
    else begin
        case(state)

        0: begin
            data_ready <= 0;
            if(rx == 0)
                state <= 1;   // start bit detected
        end

        1: begin data[0] <= rx; state <= 2; end
        2: begin data[1] <= rx; state <= 3; end
        3: begin data[2] <= rx; state <= 4; end
        4: begin data[3] <= rx; state <= 5; end
        5: begin data[4] <= rx; state <= 6; end
        6: begin data[5] <= rx; state <= 7; end
        7: begin data[6] <= rx; state <= 8; end
        8: begin data[7] <= rx; state <= 9; end

        9: begin
            data_out <= data;
            data_ready <= 1;
            state <= 0;
        end

        endcase
    end
end

endmodule


