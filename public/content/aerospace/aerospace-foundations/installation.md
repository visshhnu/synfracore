# Aerospace Foundations — Installation

## What You're Setting Up

Every example in this guide is hand-calculable with a scientific calculator — nothing here strictly requires software. This section sets up a small Python environment anyway, because every later technology in this academy (Aerodynamics, Propulsion, Orbital Mechanics) builds on exactly this same pattern of "compute a formula, check it against a known example" — establishing the habit and the toolchain here, on the simplest possible formulas, makes every later Installation section faster.

## Install Python

```bash
python3 --version
pip install numpy
```

`(needs verification — recheck against current source: exact current numpy version changes frequently; the install command above pulls whatever is current, which is what you want.)`

## Verify Your Setup — Recompute Overview's Climb Example

This reproduces Overview's worked climb-angle example (W = 10,000 N, γ = 15°) in Python.

```python
import math

def climb_forces(W, gamma_deg):
    gamma = math.radians(gamma_deg)
    L_required = W * math.cos(gamma)
    backward_weight = W * math.sin(gamma)
    return L_required, backward_weight

L, backward = climb_forces(W=10000, gamma_deg=15)
print(f"Lift required = {L:.1f} N")
print(f"Backward weight component = {backward:.1f} N")
```

```
Expected output:
Lift required = 9659.3 N
Backward weight component = 2588.2 N

This matches Overview's hand-computed 9,660 N and 2,590 N (the small
difference is only rounding — Overview used cos(15°) ≈ 0.966 and
sin(15°) ≈ 0.259 rounded to 3 decimal places, while Python computes
the full-precision value). Confirms both your Python environment
works and that the vector-decomposition formula, in code, behaves
identically to the algebra worked by hand.
```

## A Second Check — Vector Magnitude and Direction

A genuinely new check (not just Overview's example repeated): given a force's horizontal and vertical components, compute its magnitude and direction — the reverse operation from decomposing a known force into components.

```python
def vector_from_components(Fx, Fy):
    magnitude = math.sqrt(Fx**2 + Fy**2)
    direction_deg = math.degrees(math.atan2(Fy, Fx))
    return magnitude, direction_deg

mag, angle = vector_from_components(Fx=9659.3, Fy=-2588.2)
print(f"Magnitude = {mag:.1f} N, direction = {angle:.1f} degrees")
```

```
Expected output: Magnitude = 10000.0 N, direction = -15.0 degrees

This recovers the ORIGINAL 10,000 N weight vector and its -15°
direction from just its two components — confirming the
decomposition and recombination are true inverses of each other,
the same relationship Aerodynamics and Orbital Mechanics rely on
repeatedly when resolving forces and velocities into components and
back.
```

## Verify Everything Works

```bash
# 1. Confirm the climb-forces check prints 9659.3 N and 2588.2 N

# 2. Confirm the vector-recombination check recovers 10000.0 N at
#    -15.0 degrees, matching the original input exactly
```

## Common Setup Issues

**Computed angle comes out positive when a negative (or vice versa) was expected**
Check the sign convention you're using for `Fy` — a downward-pointing force component should be entered as negative if "up" is your positive y-direction, which is the standard convention used throughout this guide. Mixing sign conventions between different parts of a calculation is a common source of an answer that's correct in magnitude but wrong in direction.

**`math.atan2` gives a different answer than expected compared to `math.atan`**
Use `atan2(Fy, Fx)`, not plain `atan(Fy/Fx)`, whenever you need the correct quadrant — `atan` alone can't distinguish between a vector pointing into the first quadrant versus the third quadrant (opposite direction), since the ratio Fy/Fx is identical for both; `atan2` takes both components separately and resolves this ambiguity correctly.

## What's Set Up

- **Python 3 + NumPy** — for checking vector and force-balance calculations throughout this guide and, more importantly, every later technology in this academy that reuses the same pattern

## Next Steps

Go to the **Fundamentals** section to continue building on this same vector/Newton's-laws toolkit.
