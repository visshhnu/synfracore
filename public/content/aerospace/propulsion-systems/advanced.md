# Propulsion Systems — Advanced

Overview's thrust equation (F = ṁ·Δv) was explicitly flagged as a simplification, dropping a pressure term "because it's dropped here to keep the core momentum relationship visible, not because it's always negligible in real engineering." This page brings that term back with real numbers, showing exactly how the same rocket engine produces measurably different thrust at sea level versus in vacuum — a real, quantifiable effect, not a rounding error.

**Analogy** — Think of a nozzle as a specifically-shaped funnel designed to expand exhaust gas down to a target pressure as it exits. If the surrounding air pushes back harder than the nozzle was designed for (sea level, high ambient pressure), the exhaust gets squeezed and loses some of its forward "push" — like trying to exhale forcefully into a headwind. If the surroundings push back less than expected (vacuum, zero ambient pressure), the exhaust expands more freely than the nozzle strictly needed to plan for, and the engine picks up a small additional "bonus" push it wouldn't get back on the ground.

## The Full Thrust Equation

```
Overview's simplified equation:  F = ṁ · Δv

The FULL equation, restoring the pressure term:
  F = ṁ · Ve + (Pe - P0) · Ae

Where:
  ṁ · Ve   = MOMENTUM thrust (Overview's simplified term, using
             exhaust velocity directly)
  Pe        = static pressure of the exhaust AT the nozzle exit
  P0        = ambient (surrounding atmospheric) pressure
  Ae        = nozzle exit area
  (Pe - P0) · Ae = PRESSURE thrust -- an additional contribution
             (positive or NEGATIVE) depending on whether exit
             pressure is above or below ambient

A nozzle is designed for a SPECIFIC ambient pressure (Pe matched to
expected P0) -- this is why the SAME engine produces a genuinely
DIFFERENT total thrust at sea level versus in vacuum, even with
identical propellant flow and exhaust velocity.
```

## Over-Expanded vs. Under-Expanded Nozzles

```
Pe < P0  -- OVER-EXPANDED (exit pressure below ambient): the
            pressure term is NEGATIVE, costing thrust. This happens
            to a vacuum-optimized nozzle operated at sea level --
            the nozzle expanded the exhaust more than the higher
            sea-level ambient pressure "wants," costing thrust and,
            at the extreme, risking flow separation inside the
            nozzle itself.

Pe > P0  -- UNDER-EXPANDED (exit pressure above ambient): the
            pressure term is POSITIVE, adding a small thrust bonus,
            but it also means the nozzle could have expanded the
            exhaust further (extracting more useful momentum) if it
            had been designed with a larger exit area for these
            specific ambient conditions -- some potential
            performance is left on the table, just not as a net
            thrust LOSS.

Pe = P0  -- PERFECTLY EXPANDED: the pressure term is exactly zero,
            and momentum thrust alone (Overview's simplified
            equation) IS the full, exact thrust -- this is the one
            specific condition where the simplified equation isn't
            just an approximation, it's exactly correct.
```

### Annotated Example — The Same Engine at Sea Level vs. Vacuum

An engine has ṁ = 250 kg/s, Ve = 2,400 m/s, exit pressure Pe = 15,000 Pa, and nozzle exit area Ae = 0.5 m². Compare its thrust at sea level (P0 = 101,325 Pa) versus in vacuum (P0 = 0 Pa).

```
Given:  ṁ = 250 kg/s, Ve = 2,400 m/s, Pe = 15,000 Pa, Ae = 0.5 m²

Momentum thrust (same in both cases):
  ṁ · Ve = 250 × 2,400 = 600,000 N

SEA LEVEL (P0 = 101,325 Pa):
  Pressure term = (15,000 - 101,325) × 0.5 = (-86,325) × 0.5
                = -43,162.5 N   (NEGATIVE -- over-expanded at sea
                                  level, since Pe < P0)
  Total thrust  = 600,000 - 43,162.5 = 556,837.5 N

VACUUM (P0 = 0 Pa):
  Pressure term = (15,000 - 0) × 0.5 = 7,500 N   (POSITIVE --
                                  under-expanded relative to zero
                                  ambient pressure)
  Total thrust  = 600,000 + 7,500 = 607,500 N

Verified computationally: the IDENTICAL engine, same propellant flow
and exhaust velocity, produces 556,837.5 N at sea level versus
607,500 N in vacuum -- a real difference of 50,662.5 N (roughly
9% of sea-level thrust), purely from the pressure term Overview's
simplified equation dropped. This is exactly why real rocket
performance specs are quoted separately for sea-level and vacuum
conditions, not as one single number.
```

## Try It (2 Minutes)

A different engine has ṁ = 180 kg/s, Ve = 3,000 m/s, Pe = 20,000 Pa, Ae = 0.4 m². Compute its thrust at sea level (P0 = 101,325 Pa) and in vacuum (P0 = 0 Pa).

1. Compute momentum thrust.
2. Compute the pressure term at sea level, and total sea-level thrust.
3. Compute the pressure term in vacuum, and total vacuum thrust.

You should land on: momentum thrust = 180 × 3,000 = 540,000 N. Sea level: pressure term = (20,000 - 101,325) × 0.4 = -32,530 N, total = 540,000 - 32,530 = 507,470 N. Vacuum: pressure term = (20,000 - 0) × 0.4 = 8,000 N, total = 540,000 + 8,000 = 548,000 N. Same pattern as the annotated example: lower thrust at sea level (over-expanded, losing thrust to the negative pressure term), higher thrust in vacuum (gaining a small positive pressure-thrust bonus) — confirming this isn't specific to one engine's numbers, it's a structural consequence of how nozzle expansion interacts with ambient pressure.

## Study Resources
- **Sutton & Biblarz, *Rocket Propulsion Elements*** — the standard reference for the full thrust equation, nozzle expansion, and over/under-expansion analysis
- **NASA Glenn Research Center — "Rocket Thrust Equations"** (grc.nasa.gov) — free coverage of the full thrust equation including the pressure term
- **Anderson, *Introduction to Flight*** — covers nozzle design and expansion ratio in the propulsion chapters
