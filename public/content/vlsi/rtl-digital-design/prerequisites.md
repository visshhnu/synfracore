# RTL Design & Computer Architecture — Prerequisites

## What to Know Before Starting This Guide

This guide composes HDL's two isolated primitives (combinational logic, one flip-flop) into finite state machines — the prerequisites are that technology's exact toolkit, not new circuit primitives.

## Required (Must Have)

### 1. HDL — Verilog & VHDL, Completed
- The D flip-flop pattern (`always @(posedge clk) Q <= D;`) — Overview's state register is directly this pattern, just holding multiple bits instead of one
- Blocking vs. non-blocking assignment — the FSM's `seq_detector_101` example uses both deliberately (non-blocking for the state register, blocking-style `always @(*)` for next-state/output logic), and Overview assumes you already know why that split exists
- Comfort compiling and simulating a Verilog module with `iverilog`/`vvp` — this guide's Installation extends that exact toolchain rather than re-introducing it

### 2. Digital Logic & Design Fundamentals, Completed
- Boolean algebra and truth tables — the next-state and output logic inside an FSM is ordinary combinational logic underneath, described with a `case` statement instead of hand-drawn gates

### 3. Basic Comfort Tracing a State Table by Hand
- Overview's entire verification style depends on being able to trace a sequence of inputs through a state table row by row (state → next state → output) — if this feels unfamiliar, work through Overview's own worked trace slowly before attempting the Try It exercise

## Nice to Have (Speeds Up Learning)

### Any Prior Exposure to State Machines (Even Outside Hardware)
A state machine in software (a game character's states, a network protocol's connection states) uses the exact same "current state + input determines next state" idea — prior exposure in any context makes Overview's Moore/Mealy framing land faster.

## What You Do NOT Need

- Prior computer architecture coursework — despite the technology's title, this guide teaches the RTL composition patterns (FSMs, datapaths) that computer architecture is built from, not a full CPU-design course
- Prior exposure to testbench methodology or verification — that's Functional Verification's subject, covered immediately after this technology
- Any new EDA tools — Installation reuses HDL's exact `iverilog`/`vvp`/GTKWave toolchain

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals: 1-2 days
- Intermediate + Advanced: 2-3 days
- Interview-ready (comfortable designing a Moore or Mealy FSM from a word description and tracing it against a real bit stream): 4-5 days

## Start Here

Go to the **Installation** section to compile and simulate the `seq_detector_101` FSM from Overview using the same `iverilog`/`vvp` workflow from HDL, then work through the bit-stream trace yourself rather than only reading it.
