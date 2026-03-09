module uart_transmitter(
    input clk,
    input rst,
    input tx_start,
    input [7:0] data_in,
    output reg tx,
    output reg busy
);

reg [3:0] state;
reg [7:0] data;

always @(posedge clk or posedge rst)
begin
    if(rst) begin
        tx <= 1;
        busy <= 0;
        state <= 0;
    end
    else begin
        case(state)

        0: begin
            tx <= 1;
            busy <= 0;
            if(tx_start) begin
                data <= data_in;
                busy <= 1;
                state <= 1;
            end
        end

        1: begin
            tx <= 0;     // start bit
            state <= 2;
        end

        2: begin
            tx <= data[0];
            state <= 3;
        end

        3: begin
            tx <= data[1];
            state <= 4;
        end

        4: begin
            tx <= data[2];
            state <= 5;
        end

        5: begin
            tx <= data[3];
            state <= 6;
        end

        6: begin
            tx <= data[4];
            state <= 7;
        end

        7: begin
            tx <= data[5];
            state <= 8;
        end

        8: begin
            tx <= data[6];
            state <= 9;
        end

        9: begin
            tx <= data[7];
            state <= 10;
        end

        10: begin
            tx <= 1;     // stop bit
            state <= 0;
        end

        endcase
    end
end

endmodule


