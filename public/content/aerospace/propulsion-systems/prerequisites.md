# Propulsion Systems — Prerequisites

## What to Know Before Starting This Guide

This page explains where thrust comes from — the prerequisites are Foundations' F = ma and vector tools, applied to a new physical situation (expelling mass), not a new branch of math.

## Required (Must Have)

### 1. Aerospace Foundations, Completed
- F = ma and Newton's laws — Overview's thrust equation derivation assumes you're already comfortable applying Newton's Third Law to a physical system
- Basic vector/component thinking — thrust, like lift and drag, is a force with direction, and this guide occasionally resolves it into components (particularly once Aerodynamics' four-forces balance is revisited)

### 2. Aerodynamics, Completed (or at least Overview)
- The four forces of flight framing (lift, drag, thrust, weight) — this guide explains the third of those four, and assumes you already understand how thrust fits into the overall force balance
- Comfort with the idea that a "coefficient" (like CL, CD) captures shape/configuration effects in one number — propulsion has analogous concepts (specific impulse, thrust coefficient) that follow the same pattern

### 3. Basic Algebra
- Rearranging F = ṁ·Δv to solve for a different variable, and unit consistency (kg/s for mass flow rate, m/s for velocity, giving Newtons) — the single most common calculation mistake in this guide is a units error, not a conceptual one

## Nice to Have (Speeds Up Learning)

### Basic Thermodynamics Concepts (Temperature, Pressure, Energy)
Intermediate and Advanced's engine-cycle material (compression, combustion, expansion) is easier to follow with prior exposure to basic thermodynamics — not required, since the guide introduces what's needed, but prior exposure speeds things up.

### Any Programming/Scripting Experience
Installation sets up a Python-based workflow for thrust and specific-impulse calculations — prior scripting experience in any language helps, though the guide's Python is written to be followed without deep programming background.

## What You Do NOT Need

- Prior exposure to jet engine or rocket engine design specifically — this guide introduces both engine families from zero
- Chemistry/combustion background — propellant chemistry is covered only at the level needed to understand thrust and specific impulse, not as a standalone chemistry course
- Any specialized propulsion software — Installation uses free, open-source tools

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals: 1 day
- Intermediate + Advanced: 2 days
- Interview-ready (comfortable deriving thrust from the momentum equation and explaining why rockets and jets have different Δv characteristics): 3-4 days

## Start Here

Go to the **Installation** section to set up a Python environment for thrust calculations, then work through **Overview**'s rocket-thrust example yourself rather than only reading it.
