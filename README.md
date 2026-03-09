# UART Communication System with FIFO Buffer and CRC Error Detection (uart-fifo-crc-verilog)

## Overview

This project implements a UART-based digital communication system using Verilog HDL.
The design includes a FIFO buffer for temporary data storage and CRC error detection to ensure reliable communication.

## System Architecture

Data Flow:

Data Input → CRC Generator → UART Transmitter → UART Receiver → FIFO Buffer → CRC Checker → Data Output

## Modules

* uart_transmitter.v
* uart_receiver.v
* fifo_buffer.v
* crc_gen.v
* crc_check.v
* uart_top.v
* uart_tb.v

## Tools Used

* Verilog HDL
* Xilinx Vivado Simulator

## Simulation Result

Example verification:

```
data_in  = A5
data_out = A5
error    = 0
```
This confirms successful data transmission and error-free communication.

![Simulation Waveform]
(Simulation_Waveform.png)


