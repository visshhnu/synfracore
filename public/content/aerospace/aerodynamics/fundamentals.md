# Aerodynamics — Fundamentals

Overview covered where lift and drag come from and how to compute them at a given speed. This page covers two more variables that change the entire character of the airflow: how fast you're going relative to the speed of sound (Mach number, and the flow regimes it defines), and how "thick" or "thin" the air behaves relative to your size and speed (Reynolds number) — plus the single ratio, L/D, that engineers use to judge how efficient a shape actually is.

**Analogy** — Reynolds number is like asking whether you're wading through honey or running through open air: same body, same motion, wildly different resistance depending on how "sticky" the fluid feels relative to your size and speed. A tiny insect moving slowly experiences air almost like a thick fluid (low Reynolds number, viscosity dominates); a large aircraft moving fast experiences the same air as nearly frictionless (high Reynolds number, inertia dominates). Same air, completely different aerodynamic experience — that's what Reynolds number captures in one dimensionless value.

## Mach Number and Flow Regimes

```
Mach number (M) = aircraft speed ÷ local speed of sound

The speed of sound is NOT a fixed number — it depends on air
temperature (roughly 343 m/s / 767 mph at sea level on a standard
20°C day, but noticeably lower at cruise altitude where it's colder).
This means the SAME airspeed can be a different Mach number at
different altitudes.

Flow regimes, by Mach number (verified figures):
  SUBSONIC    M < 0.75           — air can "get out of the way"
                                    smoothly ahead of the aircraft;
                                    compressibility effects negligible
  TRANSONIC   0.75 ≤ M < 1.20    — parts of the airflow (especially
                                    over the curved upper wing
                                    surface) are already exceeding
                                    Mach 1 even though the aircraft
                                    itself hasn't — shockwaves start
                                    forming locally, drag rises sharply
  SUPERSONIC  1.20 ≤ M < 5.00    — the entire flow field exceeds the
                                    speed of sound; shockwaves attach
                                    to the aircraft
  HYPERSONIC  M ≥ 5.00           — extreme heating from air
                                    compression becomes a dominant
                                    design constraint, not just a
                                    side effect
```

## Reynolds Number

```
Re = (ρ · V · L) / μ

Where:
  ρ = air density
  V = velocity
  L = a characteristic length (for a wing, usually chord length —
      the distance from leading to trailing edge)
  μ (mu) = dynamic viscosity of the air

Low Re  → viscous forces dominate → smooth ("laminar") flow, but
          more prone to flow separation
High Re → inertial forces dominate → flow tends toward turbulence,
          but turbulence itself can actually delay separation and
          reduce stall tendency in some cases

This is why a small drone wing and a full-size aircraft wing, even
at "the same" airspeed, can behave aerodynamically quite differently
— they're operating at very different Reynolds numbers because of
the size difference in L.
```

## L/D Ratio — The Efficiency Number

```
L/D = Lift ÷ Drag

This single ratio is how engineers compare how "efficient" a shape
is at producing lift without paying too high a drag penalty.

Higher L/D  → more lift per unit of drag → longer glide distance
              without power, or better fuel efficiency in powered
              flight
Lower L/D   → more drag relative to lift produced

L/D varies with angle of attack for a GIVEN airfoil — it isn't a
single fixed number for an aircraft, it has a maximum value at a
specific angle of attack (often called L/D max), which is why glide
performance and cruise efficiency are usually quoted at a specific
speed/angle, not as a single universal number for the aircraft.
```

### Annotated Example — Classifying a Flow Regime

An aircraft is cruising at 250 m/s at an altitude where the local speed of sound is 295 m/s (colder air at altitude lowers the speed of sound compared to sea level).

```
Given:  V = 250 m/s
        speed of sound (local) = 295 m/s

Apply:  M = V / speed of sound
        M = 250 / 295
        M = 0.847

Classify: 0.75 ≤ 0.847 < 1.20 → TRANSONIC

This matters practically: at M = 0.847, even though the aircraft's
own speed is subsonic relative to the ground, some airflow over the
curved upper wing surface is likely already local supersonic —
transonic-regime drag-rise effects apply here, not the simpler
subsonic aerodynamics from Overview's lift equation alone.
```

## Try It (2 Minutes)

A different aircraft flies at 340 m/s where the local speed of sound is 300 m/s.

1. Compute its Mach number.
2. Classify the flow regime using the ranges above.
3. Based on that classification, would you expect this aircraft to have shockwaves attached to it, or just localized transonic effects over parts of the wing?

You should land on: M = 340/300 = 1.133 — checking this against the ranges above, 1.133 is still below 1.20, so it falls in the TRANSONIC band, not supersonic, even though the aircraft's own speed already exceeds the local speed of sound. This is the exact kind of boundary case worth checking against the actual ranges rather than assuming "faster than sound = automatically supersonic regime": the transonic band extends up to M 1.20 specifically because shockwave behavior doesn't fully stabilize into the clean supersonic pattern immediately at M = 1.0. You'd expect localized shockwaves over parts of the aircraft (wherever local flow acceleration pushes past Mach 1 first), not yet the fully-attached shock structure of the supersonic regime.

## Study Resources
- **NASA Glenn Research Center — "Role of the Mach Number"** (grc.nasa.gov) — source for the flow-regime Mach ranges used above
- **Anderson, *Fundamentals of Aerodynamics*** — standard reference for Reynolds number, L/D ratio, and compressible-flow regimes in more depth
- **NASA Glenn Research Center — Beginner's Guide to Reynolds Number** (grc.nasa.gov) — free walkthrough of the Reynolds number formula and its physical meaning
