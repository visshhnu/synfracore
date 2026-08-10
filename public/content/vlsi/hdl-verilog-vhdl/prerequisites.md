# HDL — Verilog & VHDL — Prerequisites

## What to Know Before Starting This Guide

This page is a direct translation exercise from Digital Logic & Design Fundamentals' vocabulary into code — the prerequisites here are almost entirely "have you actually finished that technology," not a separate skill set.

## Required (Must Have)

### 1. Digital Logic & Design Fundamentals, Completed
- Boolean algebra (AND/OR/NOT, De Morgan's laws) — this becomes HDL operators and `assign`/dataflow statements directly
- Truth tables — this becomes `case` statements and `if`/`else` logic
- The combinational vs. sequential logic distinction — this becomes the difference between `assign`/dataflow blocks and `always @(posedge clk)` blocks
- The flip-flop as a memory element — Overview's D flip-flop example assumes you already know *why* a flip-flop samples only at a clock edge, not just how to write the Verilog for it

### 2. Basic Programming Logic (Any Language)
- Comfort with `if`/`else`, loops, and variables in any language (Python, C, Java — doesn't matter which) — HDL syntax is different from software languages, but the underlying logical constructs (conditionals, procedural blocks) aren't new concepts if you've written any code before
- No prior Verilog, VHDL, or hardware-specific experience required — this guide introduces both from zero

### 3. A Text Editor and Comfort with the Command Line
- Enough command-line familiarity to run a compiler and pass it a filename (Installation section covers the exact commands) — this is not a GUI-only workflow

## Nice to Have (Speeds Up Learning)

### Any Prior Exposure to C-like Syntax
Verilog's syntax (semicolons, `{}` blocks, `&`/`|`/`~` operators) is closer to C than to Python — prior C/C++/Java exposure makes the syntax itself faster to read, though it isn't required.

### Awareness That "Simulation" and "Synthesis" Are Different Processes
This guide draws that distinction explicitly (Interview's synthesizable-vs-simulation-only question), but knowing in advance that HDL code can be *run* (simulated, to check behavior) separately from being *turned into real gates* (synthesized) helps some of Fundamentals' framing land faster.

## What You Do NOT Need

- Any FPGA or ASIC hardware — every example in this guide runs entirely in simulation; nothing here requires physical hardware
- Prior experience with a licensed EDA tool (Synopsys, Cadence) — Installation uses free, open-source tools exclusively
- Knowledge of RTL design patterns (FSMs, datapaths) — that's RTL Design & Computer Architecture's subject, introduced only after this guide

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals: 1-2 days
- Intermediate + Advanced: 2-3 days
- Interview-ready (comfortable explaining blocking vs. non-blocking assignment and tracing a testbench by hand): 3-5 days

## Start Here

Go to the **Installation** section to get a real Verilog simulator running, then work through the mux example from **Overview** yourself rather than only reading it.
