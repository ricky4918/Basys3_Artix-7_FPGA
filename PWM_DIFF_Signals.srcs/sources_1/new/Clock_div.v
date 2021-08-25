`timescale 1ns / 1ps



module Clock_Signal(
    input clk_FPGA,
    output reg TINT,
    output reg NWRST,
    output reg RSET
  
    );
    
    
    
    reg[25:0] count_TINT = 0;
    reg[25:0] count_NWRST = 0;
    reg[25:0] count_RSET = 0;
    
    always @(posedge clk_FPGA)
    begin
    count_TINT <= count_TINT + 1;
    
    if(count_TINT <= 2000 | count_TINT >= 7001) begin
        TINT <= 0;
        if(count_TINT >=9999) begin
        count_TINT <=0;
        end
    end
    else begin
        TINT <= 1;
    end
   
    end
    
    
    
    always @(posedge clk_FPGA)
    begin
    count_NWRST <= count_NWRST + 1;
    if(count_NWRST >=9999) begin
        count_NWRST <=0;
    end
    if(count_NWRST>=1001) begin
        NWRST <= 0;
    end
    else begin
        NWRST <= 1; 
    end
    end
    
    always @(posedge clk_FPGA)
    begin
    count_RSET <= count_RSET + 1;
    
    if(count_RSET <= 1000 | count_RSET >= 2001) begin
        RSET <= 0;
        if(count_RSET >=9999) begin
        count_RSET <=0;
        end
    end
    else begin
        RSET <= 1;
    end
   
    end
  
   
endmodule
