# Orbital Mechanics & Astrodynamics — Prerequisites

## What to Know Before Starting This Guide

This is where the academy shifts from atmospheric flight to spaceflight — the prerequisites are Foundations' math/physics toolkit applied to a new physical regime (free-fall orbits instead of aerodynamic flight), not an unrelated new subject.

## Required (Must Have)

### 1. Aerospace Foundations, Completed
- Vectors and F = ma — Overview's explanation of why an orbiting object doesn't need continuous thrust ("it's in continuous free-fall along a curved path") is a direct application of Foundations' Newton's-laws framework to a new scenario
- Basic calculus vocabulary — Kepler's Second Law (equal areas in equal time) and the velocity/period relationships throughout this guide build on the same rate-of-change intuition Foundations introduced

### 2. Comfort With Algebra Involving Square Roots and Ratios
- Overview's core equations (v = √(μ/r), T = 2π√(r³/μ)) require comfortable manipulation of square roots, cubes, and ratios — being able to predict how a result changes when one variable changes (without necessarily computing the exact number) is assumed baseline comfort

### 3. Unit Discipline
- This guide works in a mix of km, km/s, and km³/s² (via the gravitational parameter μ) — consistently tracking units through a multi-step calculation is assumed, since a units mismatch is the most common real mistake in orbital mechanics calculations

## Nice to Have (Speeds Up Learning)

### Aerodynamics and Propulsion Systems, Completed
Not strictly required (orbital mechanics is physically independent of atmospheric aerodynamics), but familiarity with Propulsion's thrust/Δv framing makes Intermediate's orbital-maneuver material (which introduces its own Δv budgeting) land faster, since the underlying "cost of changing velocity" concept is shared.

### Any Programming/Scripting Experience
Installation sets up a Python-based workflow for orbital velocity/period calculations, plus an introduction to GMAT (NASA's mission-design tool) — prior scripting experience in any language speeds up the Python portion.

## What You Do NOT Need

- Prior exposure to satellites, spacecraft, or mission design specifically — this guide introduces orbital mechanics from Kepler's laws forward, assuming no prior astrodynamics background
- Advanced perturbation theory or numerical orbit propagation — this guide covers idealized two-body orbital mechanics (the standard starting point), not the full perturbed real-world orbit modeling that later, more specialized study would cover
- Any specialized astrodynamics software — Installation uses free, open-source/NASA-maintained tools

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals: 1-2 days
- Intermediate + Advanced: 2-3 days
- Interview-ready (comfortable deriving orbital velocity and period for a given altitude, and explaining Kepler's laws from first principles): 4-5 days

## Start Here

Go to the **Installation** section to set up a Python environment for orbital calculations, then work through **Overview**'s ISS orbital velocity/period example yourself rather than only reading it.
