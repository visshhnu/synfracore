# Aerodynamics — Prerequisites

## What to Know Before Starting This Guide

This page explains where lift and drag physically come from and how to compute them — the prerequisites are the math and physics tools that make those equations usable, not prior aerodynamics knowledge itself.

## Required (Must Have)

### 1. Aerospace Foundations, Completed
- Vectors and F = ma — Overview's Newton's Third Law explanation of lift assumes you're already comfortable applying Newton's laws to a physical system, not learning them for the first time here
- The four forces of flight (lift, drag, thrust, weight) as a balance to satisfy — this technology explains two of those four in depth

### 2. Basic Algebra and Trigonometry
- Comfortable rearranging an equation like L = ½ρV²S·CL to solve for a different variable (used throughout Overview and the Try It exercises)
- Degrees vs. radians, and converting between them — angle of attack and Mach-regime boundaries are given in degrees throughout this guide, but some formulas in Intermediate and Advanced (thin airfoil theory, in particular) require radians

### 3. Comfort Reading Formulas With Multiple Variables
- The lift and drag equations each combine four variables (ρ, V, S, and a coefficient) — being able to track which variable changed and predict the directional effect on the result (without necessarily computing the exact number) is assumed baseline comfort

## Nice to Have (Speeds Up Learning)

### Basic Calculus (Derivatives)
Intermediate's L/D-max derivation and Advanced's compressibility corrections are easier to follow with basic derivative intuition (rate of change, finding a maximum), though the guide walks through the key results without requiring you to perform the calculus yourself.

### Any Programming/Scripting Experience
Installation sets up a Python-based workflow for computing and plotting lift/drag curves — prior exposure to any scripting language (not necessarily Python) makes that section faster, though the guide's Python is written to be readable without deep programming background.

### Prior Exposure to Fluid Concepts (Density, Pressure, Viscosity)
Not required — Overview and Fundamentals introduce air density, dynamic pressure, and viscosity from scratch — but any prior physics or chemistry exposure to these concepts (even at a high-school level) makes the material land faster.

## What You Do NOT Need

- Prior XFOIL, OpenFOAM, or any CFD software experience — Installation introduces these tools from zero, and most of this guide's own worked examples use closed-form equations you can compute by hand or with a basic calculator, not simulation software
- Compressible-flow or shockwave background — Fundamentals and Advanced build this up from the Mach number definition forward
- Aircraft design experience — this guide teaches the physics that underlies aircraft design, not the design process itself (covered more directly in Flight Mechanics & Aircraft Structures)

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals: 1-2 days
- Intermediate + Advanced: 2-3 days
- Interview-ready (comfortable deriving why V² dominates the lift equation and explaining transonic drag rise from first principles): 1 week

## Start Here

Go to the **Installation** section to set up a Python environment for computing and plotting lift/drag curves, then work through **Overview**'s lift-computation example yourself rather than only reading it.
