# Digital Logic & Design Fundamentals — Prerequisites

## What to Know Before Starting This Guide

This is the on-ramp for the entire VLSI academy — the prerequisites are genuinely basic math and logic, not prior digital-design or electronics knowledge of any kind.

## Required (Must Have)

### 1. Basic Algebra
- Comfortable manipulating an algebraic expression (grouping terms, factoring) — Overview's Boolean simplification examples (F = AB + AB' + A'B → A + B) apply the same grouping/factoring instincts from ordinary algebra to 1s and 0s instead of real numbers

### 2. Basic Logical Reasoning (AND/OR/NOT in Everyday Language)
- Understanding "both conditions must be true" (AND) versus "at least one condition must be true" (OR) versus "the opposite of this condition" (NOT) in plain English — Overview formalizes exactly this everyday logic into gates and truth tables, not introducing a new kind of reasoning

### 3. Comfort Reading a Truth Table
- Being able to trace through a table of input/output combinations systematically, row by row — this guide's entire verification style ("verified computationally against all N input combinations") depends on this being a comfortable, mechanical process, not a source of confusion

## Nice to Have (Speeds Up Learning)

### Prior Exposure to Binary Numbers
Fundamentals covers binary and hexadecimal number systems from scratch, but any prior exposure (even just knowing that binary uses only 0s and 1s) makes that section faster to absorb.

### Any Programming/Scripting Experience
Installation sets up a small Python-based truth-table verifier — prior scripting experience in any language helps, though the guide's Python is written to be followed without deep programming background.

## What You Do NOT Need

- Any prior electronics, circuits, or hardware background — this guide starts from the logical/mathematical abstraction (gates and truth tables), not physical transistor behavior
- Prior HDL, Verilog, or VHDL experience — that comes immediately after this technology (HDL — Verilog & VHDL), building directly on what's taught here
- Any specialized EDA software — Installation uses a free, actively maintained circuit simulator

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals: 1-2 days
- Ready to move into HDL — Verilog & VHDL (this academy's next technology): same day, if the Boolean algebra and gate material feels solid

## Start Here

Go to the **Installation** section to set up a circuit simulator for building and testing real gate circuits, then work through **Overview**'s Boolean simplification example yourself rather than only reading it.
