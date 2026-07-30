# Flight Mechanics & Aircraft Structures — Fundamentals

Overview covered static stability — whether an aircraft corrects itself when disturbed. This page covers what happens when a pilot deliberately maneuvers, specifically turning, and why that maneuver directly increases the structural load the aircraft's wing has to survive. This is where Aerodynamics' lift equation and Propulsion's thrust both get reused directly, not just referenced.

**Analogy** — Load factor is like how much heavier you feel on a fairground loop compared to standing still: same body, same gravity, but the turn multiplies how hard the seat pushes back on you. An aircraft in a banked turn experiences the exact same effect — its wings have to generate more lift than its weight alone requires, and that extra lift is felt by the airframe as extra structural load, just like the extra push you feel in the loop.

## Load Factor in a Banked Turn

```
LOAD FACTOR (n) = Lift ÷ Weight

In level, unaccelerated flight (Foundations' baseline case): L = W,
so n = 1.

In a level, coordinated banked turn at bank angle φ (phi):
  n = 1 / cos(φ)

This means lift must EXCEED weight during a turn — specifically:
  L = n · W = W / cos(φ)

Since Aerodynamics' lift equation is L = ½ρV²S·CL, and the aircraft
usually isn't changing air density or wing area mid-turn, that extra
lift has to come from increasing V (speed) or CL (angle of attack)
— and CL is capped by the stall limit from Aerodynamics. This is
exactly why steep, tight turns at low speed are dangerous: the pilot
needs a higher CL to generate the required lift, and there's less
margin left before hitting the stall angle of attack — an
"accelerated stall," referenced in Aerodynamics' interview content.

Worked bank-angle values:
  φ = 0°   → n = 1.00  (level flight, no extra load)
  φ = 30°  → n = 1.15
  φ = 45°  → n = 1.41
  φ = 60°  → n = 2.00  (double the normal structural load)
  φ = 75°  → n = 3.86  (approaching typical Normal-category
                          structural limits — see below)
```

## Structural Load Limits

```
Real aircraft are certified to survive only up to a defined maximum
load factor, by category (verified against 14 CFR Part 23.337 — the
governing FAA regulation; confirm against the current regulation
text before citing these numbers in a real certification context,
since aviation regulations are periodically revised):

  NORMAL category      +3.8g / -1.52g
  UTILITY category      +4.4g
  ACROBATIC category    +6.0g

These are LIMIT loads — the maximum load the structure must survive
without permanent deformation. Aircraft structures are additionally
built with a safety margin beyond this (commonly a 1.5× factor to
"ultimate load," the point of actual structural failure), so the
limit load is a certified operating boundary, not the point where
the airframe would immediately break.

Why this connects back to Propulsion: sustaining a turn at constant
altitude and speed also increases DRAG (more lift generally comes
with more induced drag), which means more thrust is required to
hold speed through the turn — the same F = ṁ·Δv relationship from
Propulsion, just now needing a higher F to compensate for a
maneuver-induced drag increase, not just cruise drag.
```

### Annotated Example — Load Factor and Structural Margin Check

An aircraft weighing 15,000 N banks to 60°.

```
Given:  W = 15,000 N
        φ = 60°  (cos 60° = 0.5)

Apply:  n = 1 / cos(φ)
        n = 1 / 0.5
        n = 2.00

Required lift:
        L = n · W
        L = 2.00 × 15,000
        L = 30,000 N

Structural check: n = 2.00 is well within the Normal category's
+3.8g limit, so this turn is structurally acceptable for a
Normal-category aircraft — the question that would remain is purely
aerodynamic: can the wing generate 30,000 N of lift (via
Aerodynamics' L = ½ρV²S·CL) at the current speed without exceeding
the stall angle of attack.
```

## Try It (2 Minutes)

A Normal-category aircraft weighing 12,000 N banks to 75° (cos 75° ≈ 0.259).

1. Compute the load factor.
2. Compute the required lift.
3. Is this turn within the Normal category's +3.8g structural limit?

You should land on: n = 1/0.259 ≈ 3.86; L = 3.86 × 12,000 ≈ 46,320 N; this EXCEEDS the Normal category's +3.8g limit (3.86 > 3.8), meaning this specific turn is structurally outside what a Normal-category aircraft is certified to survive — a genuinely different answer from the 60° worked example, and the exact kind of boundary check (like the transonic/supersonic boundary in Aerodynamics) worth doing explicitly rather than assuming a "steep turn" is automatically fine just because 45° and 60° turns were.

## Study Resources
- **14 CFR Part 23.337, "Limit maneuvering load factors"** (ecfr.gov) — the primary regulatory source for the load factor limits cited above
- **NASA Glenn Research Center — Beginner's Guide to Aeronautics, "Turns"** (grc.nasa.gov) — free coverage of the load factor equation in banked turns
- **Anderson, *Introduction to Flight*** — covers load factor, V-n diagrams, and structural limits in the performance/structures chapters
