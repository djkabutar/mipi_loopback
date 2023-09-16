module mipi_loopback_top (
    output        led5,
    output        led6,

/* Clocks of MIPI TX and RX parallel interfaces */
	input         tx_pixel_clk,
	input         rx_pixel_clk,
/* Signals used by the MIPI TX Interface Designer instance */

	output        my_mipi_tx_DPHY_RSTN,
	output        my_mipi_tx_RSTN,
	output        my_mipi_tx_VALID,
	output        my_mipi_tx_HSYNC,
	output        my_mipi_tx_VSYNC,
	output [63:0] my_mipi_tx_DATA,

	output [5:0]  my_mipi_tx_TYPE,
	output [1:0]  my_mipi_tx_LANES,
	output        my_mipi_tx_FRAME_MODE,
	output [15:0] my_mipi_tx_HRES,
	output [1:0]  my_mipi_tx_VC,
	output [3:0]  my_mipi_tx_ULPS_ENTER,
	output [3:0]  my_mipi_tx_ULPS_EXIT,
	output        my_mipi_tx_ULPS_CLK_ENTER,
	output        my_mipi_tx_ULPS_CLK_EXIT,
/* Signals used by the MIPI RX Interface Designer instance */

	output        my_mipi_rx_DPHY_RSTN,
	output        my_mipi_rx_RSTN,
	output        my_mipi_rx_CLEAR,
	output [1:0]  my_mipi_rx_LANES,

	input         my_mipi_rx_VALID,
	input [3:0]   my_mipi_rx_HSYNC,
	input [3:0]   my_mipi_rx_VSYNC,
	input [63:0]  my_mipi_rx_DATA,
	input [5:0]   my_mipi_rx_TYPE,
	input [1:0]   my_mipi_rx_VC,
	input [3:0]   my_mipi_rx_CNT,
	input [17:0]  my_mipi_rx_ERROR,
	input         my_mipi_rx_ULPS_CLK,
	input [3:0]   my_mipi_rx_ULPS
);

reg prev_2_valid = 0;
reg prev_valid = 0;
                   
assign my_mipi_tx_VALID = prev_2_valid;
assign my_mipi_tx_HSYNC = my_mipi_rx_HSYNC[0];
assign my_mipi_tx_VSYNC = my_mipi_rx_VSYNC[0];
assign my_mipi_tx_DATA = my_mipi_rx_DATA;
assign my_mipi_tx_DPHY_RSTN = 1;
assign my_mipi_tx_RSTN = 1;
assign my_mipi_tx_TYPE = 6'h24;			// RGB888
assign my_mipi_tx_LANES = 2'b11;                // 4 lanes
assign my_mipi_tx_FRAME_MODE = 1'b0;            // Generic Frame Mode
assign my_mipi_tx_HRES = 1280;         // Number of pixels per line
assign my_mipi_tx_VC = 2'b00;                   // Virtual Channel select
assign my_mipi_tx_ULPS_ENTER = 4'b0000;
assign my_mipi_tx_ULPS_EXIT = 4'b0000;
assign my_mipi_tx_ULPS_CLK_ENTER = 1'b0;
assign my_mipi_tx_ULPS_CLK_EXIT = 1'b0;
//***************
/* MIPI RX HOOKUP */
//***************
assign my_mipi_rx_DPHY_RSTN = 1;
assign my_mipi_rx_RSTN = 1;
assign my_mipi_rx_CLEAR = 0;
assign my_mipi_rx_LANES = 2'b11;         // 4 lanes
assign my_mipi_rx_VC_ENA = 4'b0001;    // Virtual Channel enable

assign led5 = my_mipi_rx_CLEAR;
assign led6 = my_mipi_rx_RSTN;

always @(posedge rx_pixel_clk) begin
    prev_valid <= my_mipi_rx_VALID;
    prev_2_valid <= prev_valid;
end

endmodule
