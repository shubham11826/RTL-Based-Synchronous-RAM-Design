## RTL-Based-Synchronous-RAM-Design
This project implements a parameterized synchronous RAM using Verilog HDL.
The design supports clocked write operations, registered read output,
and active-low reset.

## Features
- Parameterized data width and memory depth
- Synchronous write logic
- One-cycle registered read latency
- Reset-based memory initialization
- Self-checking Verilog testbench

## Simulation
- Simulated using EDA Playground (Icarus Verilog)
- Waveforms analyzed using EPWave

## How to Run
1. Open https://www.edaplayground.com
2. Select Verilog + Icarus Verilog
3. Paste `rtl/sync_ram.v` and `tb/sync_ram_tb.v`
4. Enable "Open EPWave after run"
5. Click Run

## What I Learned
- Difference between conceptual RAM and synchronous RTL RAM
- One-cycle read latency in registered designs
- Importance of signal width matching in testbenches
- applied verilog knowledge into a real project

## Author
Shubham Kumar  
B.Tech Electronics & Communication Engineering
