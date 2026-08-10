# Functional Verification — Prerequisites

## What to Know Before Starting This Guide

This guide builds a self-checking testbench for the exact `seq_detector_101` module RTL Design & Computer Architecture already built — the prerequisites are that exact module and toolchain, not a new design or a new simulator.

## Required (Must Have)

### 1. RTL Design & Computer Architecture, Completed
- The `seq_detector_101` Mealy FSM — Overview's testbench instantiates this exact module, unmodified, and reuses its exact input stream and expected output sequence rather than inventing a new example
- Comfort compiling and simulating with `iverilog`/`vvp` — this guide's Installation runs a full self-checking testbench through that same toolchain

### 2. HDL — Verilog & VHDL, Completed
- `initial` blocks, `$display`, and simulation-only constructs (`#10` delays) — Overview's testbench uses all of these, and Interview's own material (referenced from HDL) already distinguishes synthesizable RTL from simulation-only testbench code

### 3. Comfort With the Idea of "Comparing Actual Output Against a Known-Correct Expected Value"
- This is the entire discipline this guide formalizes — if the difference between "watching a waveform and eyeballing it" versus "an automated pass/fail comparison" doesn't yet feel important, Overview's analogy (a food inspector who tastes every dish against a reference, rather than trusting the chef's word) is worth re-reading before continuing

## Nice to Have (Speeds Up Learning)

### Prior Exposure to Automated Testing in Software
If you've written a unit test in any programming language (asserting an actual result equals an expected result), the self-checking testbench pattern here is the exact same idea applied to hardware simulation — prior exposure speeds up the conceptual leap, though it isn't required.

## What You Do NOT Need

- Prior SystemVerilog or UVM experience — this guide builds self-checking testbenches in plain Verilog first, establishing the underlying principle before any methodology-specific syntax
- Prior exposure to coverage-driven verification or formal methods — this guide's scope is directed, self-checking testbenches; broader verification methodology is a natural next step after this guide, not a prerequisite for it

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals: 1-2 days
- Intermediate + Advanced: 2-3 days
- Interview-ready (comfortable explaining why a self-checking testbench matters and designing one for a new module from scratch): 4-5 days

## Start Here

Go to the **Installation** section to actually compile and run Overview's self-checking testbench — against both the correct design and a deliberately broken one — rather than only reading the expected results.
