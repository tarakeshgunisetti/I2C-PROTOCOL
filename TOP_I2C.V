
`include "i2c_master.sv"
`include "i2c_slave.sv"

module top_i2c#(SYS_CLK=2000000,I2C_CLK=1000000)
  				 (input clk,rst_n,
                  input [6:0] slv_addr,
                  input rw,
                  input [7:0] reg_addr,
                  input [7:0] wdata,
                  output reg [7:0] rdata,
                 output reg  done);
  
  wire SDA;
  wire SCL;
  
  I2C_MASTER#(SYS_CLK,I2C_CLK)M1
  (clk,rst_n,slv_addr,rw,reg_addr,wdata,rdata,SDA,SCL,done);
  
  I2C_SLAVE#(SYS_CLK,I2C_CLK)S1(SDA,SCL,rst_n);
  
  
endmodule
