# Modified this design for Trion T120324. 

Trion T120 MIPI Development Kit: Loopback Example Design


The mipi_loopback_top Efinity project helps you verify the functionality of
the MIPI TX and RX interfaces on the Trion T20 MIPI development board. The 
FPGA receives a video pattern from MIPI RX and transmits it out the MIPI TX.


Requirements:


Efinity software version 2019.2 or later

Trion® T120 MIPI Development Board
Raspberry Pi camera daughter card for MIPI RX
A bridge to convert HDMI TX to MIPI TX for Raspberry Pi
15-pin FFC/FPC cable

### Overview

As of the MIPI core, there should be FIFO where the core stores the data,
to convert it into 64-Bit packet, by storing the data into the FIFO
it takes one clock cycle.

Same happens in transmitting as well, therefore mipi loopback's valid
signal for the transmit block will be delayed for 2 clock cycles. So while 
receiving the data, that has to be keep in mind from the processor.

HSYNC and VSYNC of them are assigned directly so they are going to be instantly
passed to the DPHY from the MIPI CSI TX Core.

### Usage

Update Horizontal Active in the MIPI TX assign blocks for your resolution and
also the pixel clock in the PLL configuration.

By default, it is configured as 1280x1024x60 resolution, you can customize it
however you want but keep in mind that you have check clocks, blanking
period and phy frequency as of your resolution with data lanes.

You can check your resolution and clock [here](https://docs.google.com/spreadsheets/d/1H6d436q-6mzwUZPEsymqT9noEm0PC_MO/edit#gid=1001728934)
