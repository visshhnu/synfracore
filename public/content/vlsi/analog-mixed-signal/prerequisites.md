# Analog & Mixed-Signal Design — Prerequisites

## What to Know Before Starting This Guide

This guide branches off from Digital Logic & Design Fundamentals directly (not through HDL/RTL/Verification/Physical Design) into circuits that process continuous voltages — the prerequisites are that one technology's foundation, not the digital-design chain that follows it.

## Required (Must Have)

### 1. Digital Logic & Design Fundamentals, Completed
- Boolean 0/1 thinking and binary number systems — Overview's ADC/DAC section reuses binary number representation directly, mapping a continuous voltage to exactly the kind of N-bit binary code Digital Logic Fundamentals introduced
- No further digital-track technologies (HDL, RTL Design, Functional Verification, Physical Design) are required — Overview is explicit that this track "doesn't build on any of that"

### 2. Basic Algebra
- Rearranging Vout = -(Rf/Rin) × Vin (or the non-inverting equivalent) to solve for a different variable — Overview's op-amp gain equations are simple ratio algebra, not calculus

### 3. Basic Electrical Concepts (Voltage, Resistance)
- Comfort with Ohm's-law-level circuit concepts (voltage, resistance, current) — Overview's op-amp examples assume this baseline; if it's unfamiliar, a quick review of basic circuit theory before starting will make the op-amp gain equations land faster

## Nice to Have (Speeds Up Learning)

### Basic Signal Concepts (Continuous vs. Discrete)
Overview's dimmer-switch-vs-light-switch analogy introduces continuous vs. discrete signals from scratch, but any prior exposure to the concept (from a signals/systems course, or general electronics hobbyist experience) speeds this up.

### Any Programming/Scripting Experience
Installation sets up a Python-based op-amp gain calculator and introduces ngspice, a real circuit simulator — prior scripting experience helps with the Python portion.

## What You Do NOT Need

- Prior op-amp, filter, or analog circuit design experience — this guide introduces op-amp configurations and ADC/DAC concepts from zero
- Prior HDL or digital-design-tool experience — this track is deliberately independent of that chain, as Overview explains
- Access to a licensed commercial SPICE tool — Installation uses ngspice, a free, actively maintained, open-source SPICE simulator

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals: 1-2 days
- Intermediate + Advanced: 2-3 days
- Interview-ready (comfortable computing op-amp gain for both configurations and explaining quantization error in ADC/DAC conversion): 4-5 days

## Start Here

Go to the **Installation** section to set up a Python op-amp gain calculator and ngspice, then work through **Overview**'s inverting and non-inverting gain examples yourself rather than only reading them.
