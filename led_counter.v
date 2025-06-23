module Counter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n,
    output wire [7:0] leds
);

localparam ONE_SEC = CLK_FREQ / 2; // 1 second at 25 MHz

reg [31:0] counter;
reg [7:0] leds_counter = 0;

assign leds = leds_counter;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= 0;
        leds_counter <= 0; // Reset LED counter on reset
    end else begin
        if (counter >= ONE_SEC - 1) begin
            leds_counter <= leds_counter + 1; // Increment LED counter
            counter <= 0; // Reset counter after 1 second
        end else begin
            counter <= counter + 1; // Increment counter
        end
    end
end
endmodule
