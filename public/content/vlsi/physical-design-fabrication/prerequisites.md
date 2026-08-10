# Physical Design & Fabrication — Prerequisites

## What to Know Before Starting This Guide

This guide extends RTL Design's single-path timing formula to a real, multi-path chip — the prerequisites are that exact formula and the concept of synthesis, not new circuit theory.

## Required (Must Have)

### 1. RTL Design & Computer Architecture, Completed
- The timing formula: min clock period = clock-to-Q + combinational delay + setup — Overview's entire STA section applies this exact formula to multiple paths simultaneously and picks the worst one; if this formula itself isn't solid yet, revisit RTL Design first
- Synthesis as a concept (RTL code → gate-level netlist) — this guide picks up exactly where that leaves off, turning a netlist into a physically placed and routed chip

### 2. Digital Logic & Design Fundamentals, Completed
- Gates and Boolean logic — floorplanning and placement are about physically arranging the same gates this technology introduced, not new logic concepts

### 3. Comfort Comparing Multiple Numeric Values to Find a Maximum
- Overview's core STA technique is applying one formula to several paths and taking the worst (maximum delay) result — arithmetic comfort with this kind of "compute several, take the max" reasoning is assumed throughout

## Nice to Have (Speeds Up Learning)

### Basic Awareness of Physical/Electrical Concepts (Resistance, Capacitance)
Overview notes that routing turns "combinational delay" from an abstract number into "a real, physical wire with resistance (R) and capacitance (C)" — prior exposure to RC concepts (even at a basic circuits level) makes this connection land faster, though the guide introduces what's needed.

### Any Programming/Scripting Experience
Installation sets up a Python-based STA calculator and introduces OpenROAD, an open-source physical design flow — prior scripting experience speeds up the Python portion.

## What You Do NOT Need

- Access to a licensed commercial EDA tool (Synopsys, Cadence) — Installation uses OpenROAD, a free, open-source, actively maintained RTL-to-GDSII flow, consistent with this platform's local-sandbox approach to lab content
- Prior fabrication or process-engineering background — the fab-process-node and India Semiconductor Mission material in this guide is informational/career-context, not something you need prior expertise in to follow the physical design flow itself
- Access to real fab hardware — every example in this guide runs entirely in simulation/software, nothing here requires physical chip access

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals: 1-2 days
- Intermediate + Advanced: 2-3 days
- Interview-ready (comfortable explaining the floorplan → placement → routing → STA flow and finding a critical path across multiple given paths): 4-5 days

## Start Here

Go to the **Installation** section to set up a Python STA calculator and OpenROAD, then work through **Overview**'s 3-path critical-path example yourself rather than only reading it.
