module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            OFF: next_state = j;
            ON: next_state = ~k;
        endcase
    end

    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if(reset)
            state<=OFF;
        else
            state<=next_state;
    end

    assign out = state;
    // Output logic
    // assign out = (state == ...);

endmodule