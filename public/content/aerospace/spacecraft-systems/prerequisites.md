# Spacecraft Systems & Mission Design — Prerequisites

## What to Know Before Starting This Guide

This guide turns Orbital Mechanics' physics into an engineering input — the prerequisites are that technology's results plus Propulsion's Δv/rocket-equation framing, not new physics.

## Required (Must Have)

### 1. Orbital Mechanics & Astrodynamics, Completed
- The LEO-to-GEO Hohmann transfer Δv figure (3,854 m/s) — Overview's mission Δv budget example reuses this exact number directly rather than recalculating it, so it needs to already be understood, not just recalled
- Comfort with Δv as "a cost, measured in velocity units, that propellant has to pay for" — this guide's entire mission-budget framework builds on that idea

### 2. Propulsion Systems, Completed
- Staging — Overview's explanation of why the spacecraft itself only carries propellant for orbital transfer and station-keeping (not the ~9.4 km/s launch-to-LEO cost) depends on understanding why staging exists
- The general relationship between Δv, propellant mass, and the rocket equation — Fundamentals in this guide uses that relationship directly to size propellant mass from the Δv budget Overview establishes

### 3. Flight Mechanics & Aircraft Structures, Completed (or at least Overview)
- Basic structural-loads framing — Overview references that the spacecraft structure subsystem has to survive "the specific launch loads covered in Flight Mechanics & Structures' load-factor content," assuming that connection is already meaningful to you

## Nice to Have (Speeds Up Learning)

### Basic Electrical/Power Concepts
The power subsystem material (solar panels, batteries, eclipse power budgeting) is easier with prior exposure to basic power/energy concepts (watts, watt-hours) — not required, since the guide introduces what's needed.

### Any Programming/Scripting Experience
Installation sets up a Python-based workflow for Δv-budget and subsystem-sizing calculations — prior scripting experience in any language speeds this up.

## What You Do NOT Need

- Prior exposure to actual spacecraft hardware or mission operations — this guide introduces the spacecraft bus and mission Δv budgeting from the systems-engineering level, not hands-on hardware experience
- Detailed thermal or structural analysis (FEA/CFD-level) — the thermal and structural material here is conceptual/systems-level, matching an actual mission-design phase rather than detailed subsystem engineering
- Any specialized mission-design software beyond what Installation introduces

## Time Estimate

If you have the prerequisites above:
- Overview + Fundamentals: 1-2 days
- Intermediate + Advanced: 2-3 days
- Interview-ready (comfortable assembling a full mission Δv budget across launch/transfer/station-keeping phases and explaining why each belongs to a different propulsion system): 4-5 days

## Start Here

Go to the **Installation** section to set up a Python environment for Δv-budget calculations, then work through **Overview**'s full mission Δv budget example yourself rather than only reading it.
