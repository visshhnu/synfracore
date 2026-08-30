# Propulsion Systems — Overview

**Before you start:** [Aerospace Foundations](/academies/aerospace/aerospace-foundations/overview) and [Aerodynamics](/academies/aerospace/aerodynamics/overview) are assumed.

Foundations gave you F = ma and vector components. Aerodynamics explained lift and drag, two of the four forces of flight. This page explains the third — thrust — and the family of engines that produce it, from air-breathing jet engines to self-contained rockets.

**Analogy** — Propulsion is like throwing bowling balls off the back of a skateboard: throw them backward fast and heavy enough, and by Newton's Third Law you roll forward. A jet engine scoops up air from outside, speeds it up, and throws it out the back — borrowing its "bowling balls" from the atmosphere. A rocket carries its own bowling balls (propellant) onboard instead of scooping them up, which is exactly why a rocket works in the vacuum of space and a jet engine doesn't — there's no air out there to scoop.

## Thrust: The Momentum Equation

```
The core physics behind every engine in this technology, jet or
rocket, is the same: Newton's Third Law applied to expelling mass.

Simplified thrust equation (captures the dominant effect for both
jets and rockets):
  F = ṁ · Δv

Where:
  ṁ (m-dot) = mass flow rate of exhaust (kg/s) — how much mass is
              being expelled per second
  Δv        = change in velocity of that mass, relative to the
              vehicle (exhaust velocity minus intake velocity for a
              jet; just exhaust velocity for a rocket, which has no
              incoming mass to subtract)

This is a simplification — the full thrust equation used in real
engine design also includes a pressure term, (Pe - P0)·Ae, which
accounts for the exhaust pressure not perfectly matching ambient
pressure at the nozzle exit. For a well-designed, "adapted" nozzle
this term is small; it's dropped here to keep the core momentum
relationship visible, not because it's always negligible in real
engineering.
```

## Jet Engines vs. Rockets — Why the Distinction Matters

```conceptgrid
{
  "boxes": [
    { "title": "Air-Breathing (Jet)", "description": "Carries only fuel -- oxidizer comes free from atmosphere. Can't operate in space", "color": "blue" },
    { "title": "Rocket", "description": "Carries both fuel AND oxidizer -- works anywhere, including vacuum", "color": "red" }
  ]
}
```

```
AIR-BREATHING (jet) engines:
  Take in ambient air, compress it, mix it with fuel, burn it,
  expel it faster than it came in.
  Only carry FUEL onboard — the oxidizer (oxygen) comes free from
  the atmosphere.
  CANNOT operate where there's no air to breathe (high altitude
  above ~20-25 km gets impractical, space is impossible).

ROCKET engines:
  Carry BOTH fuel AND oxidizer onboard, mixed and burned internally,
  expelled through a nozzle.
  Work anywhere, including vacuum — no atmosphere required, which is
  the entire reason rockets (not jets) are used for spaceflight.
  Trade-off: carrying your own oxidizer is heavy dead weight a jet
  engine never has to carry, which is a large part of why rockets
  burn through propellant so much faster than jet engines burn fuel.
```

### Annotated Example — Computing Thrust from the Momentum Equation

A small rocket engine expels 8 kg of exhaust gas per second at an exhaust velocity of 2,500 m/s relative to the rocket (starting from rest, so Δv = exhaust velocity directly).

```
Given:  ṁ = 8 kg/s
        Δv = 2,500 m/s

Apply:  F = ṁ · Δv
        F = 8 × 2,500
        F = 20,000 N

Sanity check against Foundations: this 20,000 N thrust, acting on
(for example) a 2,000 kg rocket, would produce an acceleration of
F/m = 20,000/2,000 = 10 m/s² — the exact same F = ma relationship
from Foundations, just with F now coming from the propulsion
momentum equation instead of being given directly.
```

## Try It (2 Minutes)

A jet engine takes in air at 200 m/s (the aircraft's forward speed) and expels exhaust at 600 m/s relative to the engine, with a mass flow rate of 40 kg/s.

1. What is Δv for this engine (exhaust velocity minus intake velocity, since a jet engine — unlike a rocket — already has that intake momentum to subtract)?
2. Using F = ṁ · Δv, what thrust does this engine produce?

You should land on: Δv = 600 - 200 = 400 m/s; F = 40 × 400 = 16,000 N. Notice this is the exact same core equation as the rocket example, but a jet's Δv is smaller because it's only accelerating air from its own forward speed up to exhaust speed — not from zero, the way a stationary rocket's Δv effectively starts. This is one real reason jet engines and rockets have very different thrust-to-fuel-flow characteristics even though they share the same underlying momentum equation.

## Study Resources
- **NASA Glenn Research Center — Beginner's Guide to Propulsion** (grc.nasa.gov) — free coverage of the thrust equation for both jet and rocket engines, including the full pressure-term version
- **Anderson, *Introduction to Flight*** — covers the jet-engine thrust equation and Brayton cycle in the propulsion chapters
- **Sutton & Biblarz, *Rocket Propulsion Elements*** — the standard reference for rocket-specific propulsion, referenced again in Fundamentals
