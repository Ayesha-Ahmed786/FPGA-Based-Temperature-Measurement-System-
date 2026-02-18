//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2025 07:46:20 PM
// Design Name: 
// Module Name: tb_top
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


//`timescale 1ns / 1ps

//module tb_top;

//    reg CLK100MHZ = 0;
//    reg reset = 1;
//    wire TMP_SDA;
//    wire TMP_SCL;
//    wire [6:0] SEG;
//    wire [3:0] AN, NAN;
//    wire [7:0] LED;

//    // Instantiate top module
//    top dut (
//        .CLK100MHZ(CLK100MHZ),
//        .reset(reset),
//        .TMP_SDA(TMP_SDA),
//        .TMP_SCL(TMP_SCL),
//        .SEG(SEG),
//        .AN(AN),
//        .NAN(NAN),
//        .LED(LED)
//    );

//    // Clock generation 100 MHz
//    always #5 CLK100MHZ = ~CLK100MHZ;  // 10ns period

//    initial begin
//        // Apply reset
//        reset = 1;
//        #100;
//        reset = 0;

//        // Run simulation for 1ms
//        #1_000_000;

//        $stop;
//    end

//endmodule


//module tb_top;

//    reg CLK100MHZ = 0;
//    reg reset = 1;

//    wire TMP_SDA;
//    wire TMP_SCL;
//    wire [6:0] SEG;
//    wire [3:0] AN, NAN;
//    wire [7:0] LED;

//    // Instantiate top module
//    top dut (
//        .CLK100MHZ(CLK100MHZ),
//        .reset(reset),
//        .TMP_SDA(TMP_SDA),
//        .TMP_SCL(TMP_SCL),
//        .SEG(SEG),
//        .AN(AN),
//        .NAN(NAN),
//        .LED(LED)
//    );

//    // 100 MHz main clock
//    always #5 CLK100MHZ = ~CLK100MHZ;  // 10ns period

//    // Optional: simulate a fake I2C sensor to toggle SDA
//    // SDA is bidirectional; here we keep it high (no ACK) for simplicity
//    // If you want proper ACKs, you can make a small module to drive SDA

//    initial begin
//        $dumpfile("top_tb.vcd");  // for waveform viewing
//        $dumpvars(0, tb_top);

//        // Apply reset
//        reset = 1;
//        #100;
//        reset = 0;

//        // Run simulation for enough time to see several SCL cycles
//       #1_000_000 // 200 us simulation (adjust as needed)
//        $stop;
//    end

//endmodule


`timescale 1ns / 1ps

module top_tb;
    // Testbench signals
    reg clk_100MHz;
    reg reset;
    wire TMP_SDA;
    wire TMP_SCL;
    wire [6:0] SEG;
    wire [3:0] AN;
    wire [3:0] NAN;
    wire [7:0] LED;
    
    // Instantiate the top module
    top dut (
        .CLK100MHZ(clk_100MHz),
        .reset(reset),
        .TMP_SDA(TMP_SDA),
        .TMP_SCL(TMP_SCL),
        .SEG(SEG),
        .AN(AN),
        .NAN(NAN),
        .LED(LED)
    );
    
    // Clock generation
    initial begin
        clk_100MHz = 0;
        forever #5 clk_100MHz = ~clk_100MHz; // 100MHz clock (10ns period)
    end
    
    // Reset generation
    initial begin
        reset = 1;
        #100 reset = 0; // Release reset after 100ns
    end
    
    // Test sequence
    initial begin
        $display("Starting simulation...");
        
        // Wait for initial reset
        #200;
        
        // Monitor some signals
        $monitor("Time: %0t, LED: %b, AN: %b, SEG: %b", 
                 $time, LED, AN, SEG);
        
        // Run simulation for a while
        #1000000;
        
        $display("Simulation completed");
        $finish;
    end
endmodule


