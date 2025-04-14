

// by nous 
module uart_fifoed_send (
    input wire clk_100MHz,
    input wire reset,
    input wire dat_en,
    input wire [7:0] dat,
    output wire TX,
    output wire fifo_empty,
    output wire fifo_afull,
    output wire fifo_full
);


    reg [7:0] FIFO [0:127];
    reg [11:0] cnt;
    wire top;
    reg [8:0] shift;
    reg [3:0] nbbits;
    reg [11:0] read_index, write_index, n_elements;

    assign top = (cnt == 0);
    assign TX = shift[0];
    assign fifo_empty = (n_elements == 0);
    assign fifo_afull = (n_elements >= 122);
    assign fifo_full = (n_elements == 128) || 
                       (dat_en && nbbits < 12 && n_elements == 127);


    always @(posedge clk_100MHz) begin
        if (reset) begin
            cnt <= 0;
        end else if (nbbits >= 12 || cnt == 0) begin
            cnt <= 867;////////////////////////////////////////////////////////////////
        end else begin
            cnt <= cnt - 1;
        end
    end
    
    

    // UART shift register handling
    always @(posedge clk_100MHz) begin
        if (reset) begin
            shift <= 9'b111111111;
            nbbits <= 12;
        end else if (nbbits >= 12) begin
            if (n_elements > 0) begin
                shift <= {FIFO[read_index], 1'b0}; // Start bit
                nbbits <= 9; // 8 data bits + stop bit
            end
        end else if (top) begin
            shift <= {1'b1, shift[8:1]}; // shift right with stop bit
            if (nbbits == 0)
                nbbits <= 15;
            else
                nbbits <= nbbits - 1;
        end
    end
    




    // FIFO read pointer logic
    always @(posedge clk_100MHz) begin
        if (reset) begin
            read_index <= 0;
        end else if ((n_elements > 0) && (nbbits >= 12)) begin
            read_index <= (read_index == 127) ? 0 : read_index + 1;
        end
    end
    
       


    // FIFO element count management
    always @(posedge clk_100MHz) begin
        if (reset) begin
            n_elements <= 0;
        end else if (dat_en) begin
            if (n_elements == 0) begin
                n_elements <= 1;
            end else if (nbbits < 12 && n_elements < 128) begin
                n_elements <= n_elements + 1;
            end
        end else if ((n_elements > 0) && (nbbits >= 12)) begin
            n_elements <= n_elements - 1;
        end
    end

    // FIFO write pointer + writing data
always @(posedge clk_100MHz) begin
    if (reset) begin
        write_index <= 0;
    end 
    else if (dat_en && (n_elements < 128))
    begin
        if (write_index == 127) 
        begin
            write_index <= 0;
        end
        else 
        begin
            write_index <= write_index + 1;
        end
        FIFO[write_index] <= dat;   
    end   
end
endmodule
