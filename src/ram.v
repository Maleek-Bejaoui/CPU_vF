`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 04:15:15 PM
// Design Name: 
// Module Name: ramverilog
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RAM_SP_64_8 (
    input [5:0] add,        // Adresse (6 bits)
    input [15:0] data_in,   // Données à écrire
    input r_w,              // Signal de lecture (r_w = 0) / écriture (r_w = 1)
    input enable,           // Activation du module
    input clk,              // Horloge
    input ce,               // Signal d'activation du processus
    output reg [15:0] data_out // Données lues
);

    // Déclaration de la mémoire
    reg [15:0] memory [0:63];  // RAM de 64 mots de 16 bits

    always @(posedge clk) begin
        if (ce) begin
            if (enable) begin
                if (r_w == 1'b0) begin // Lecture
                    data_out <= memory[add];
                end else begin // Écriture
                    memory[add] <= data_in;
                end
            end
        end
    end

endmodule
