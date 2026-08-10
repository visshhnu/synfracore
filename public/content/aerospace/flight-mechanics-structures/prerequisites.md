# Flight Mechanics & Aircraft Structures — Prerequisites

## What to Know Before Starting This Guide

This guide is the connective layer between the forces Aerodynamics and Propulsion Systems explained and whether an aircraft actually flies in a stable, controllable, structurally sound way — the prerequisites are those two technologies plus Foundations' torque/moment tools, not new physics from scratch.

## Required (Must Have)

### 1. Aerospace Foundations, Completed
- Vectors and F = ma
- Torque and the cross product (τ = r × F) — Overview's static-stability derivation reuses this directly to explain how a tail force creates a restoring moment; if torque feels unfamiliar, revisit Foundations before continuing here

### 2. Aerodynamics, Completed
- The lift equation (L = ½ρV²S·CL) and how CL changes with angle of attack — Overview's stability chain ("nose pitches up → tail's angle of attack increases → tail generates more lift") assumes this relationship is already second nature
- Angle of attack as a concept distinct from pitch angle — this distinction becomes important again here in a slightly different context (the tail's own local angle of attack, separate from the aircraft's)

### 3. Propulsion Systems, Completed (or at least Overview)
- Thrust as one of the four forces — this guide's force-and-moment balance treats thrust as a given input, building on Propulsion's explanation of where it comes from rather than re-deriving it

## Nice to Have (Speeds Up Learning)

### Basic Structural/Materials Concepts (Stress, Strain)
The structures half of this guide (load paths, material limits) is easier with prior exposure to basic stress/strain concepts — not required, since the guide introduces what's needed, but any prior physics or materials-science exposure helps.

### Any Programming/Scripting Experience
Installation sets up a Python-based workflow for stability-moment calculations — prior scripting experience in any language speeds this up.

## What You Do NOT Need

- Prior exposure to flight control systems or autopilot design — this guide covers the underlying stability physics, not control-system implementation
- Structural finite-element analysis experience — the structures material here is conceptual/algebraic, not FEA-based
- Any specialized aircraft-design software — Installation uses a free, NASA-maintained open-source tool

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals: 1-2 days
- Intermediate + Advanced: 2-3 days
- Interview-ready (comfortable explaining why CG position relative to the neutral point determines stability, and deriving a restoring moment from first principles): 4-5 days

## Start Here

Go to the **Installation** section to set up a Python environment for stability-moment calculations, then work through **Overview**'s restoring-moment example yourself rather than only reading it.
