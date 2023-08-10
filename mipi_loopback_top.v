/////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2013-2019 Efinix Inc. All rights reserved.
//
// mipi_loopback_top.v
//
// *******************************
// Revisions:
// 1.0 Initial rev
// *******************************
/////////////////////////////////////////////////////////////////////////////

module mipi_loopback_top (
/* Signals of the video pattern generator */
	input         tx_vga_clk,
    
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
	output [3:0]  my_mipi_rx_VC_ENA,
    output        rx_vs,
    output        rx_hs,
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
                   
assign my_mipi_tx_VALID = my_mipi_rx_VALID;
assign my_mipi_tx_HSYNC = my_mipi_rx_HSYNC[0];
assign my_mipi_tx_VSYNC = my_mipi_rx_VSYNC[0];
assign my_mipi_tx_DATA = my_mipi_rx_DATA;
assign my_mipi_tx_DPHY_RSTN = 1'b1;
assign my_mipi_tx_RSTN = 1'b1;
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
assign my_mipi_rx_DPHY_RSTN = 1'b1;
assign my_mipi_rx_RSTN = 1'b1;
assign my_mipi_rx_CLEAR = 1'b0;
assign my_mipi_rx_LANES = 2'b01;         // 2 lanes
assign my_mipi_rx_VC_ENA = 4'b0001;      // Virtual Channel enable

assign led5 = my_mipi_rx_HSYNC[0];
assign led6 = my_mipi_rx_VSYNC[0];

endmodule

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2019 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the 
// original license agreement is included in it's original 
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND 
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH 
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES, 
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR 
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED 
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.  
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY 
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT 
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY 
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT, 
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY 
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF 
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR 
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN 
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER 
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR 
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT 
//     APPLY TO LICENSEE.
//
/////////////////////////////////////////////////////////////////////////////
