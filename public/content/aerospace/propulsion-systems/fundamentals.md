# Propulsion Systems — Fundamentals

Overview covered where thrust comes from (F = ṁ·Δv) and the jet-vs-rocket distinction. This page covers how engineers compare engine *efficiency* (specific impulse), and the single equation that governs how much velocity change a rocket can actually achieve given how much propellant it carries — arguably the most important equation in all of spaceflight, and the one Orbital Mechanics will lean on directly for delta-v budgets.

**Analogy** — Specific impulse is a rocket engine's version of fuel economy. A car with better MPG travels farther on the same tank of gas; a rocket engine with higher specific impulse produces more thrust — or more precisely, more total velocity change — from the same mass of propellant. It's measured in seconds for historical reasons, but the "more efficient engine" intuition is exactly the same one you already have for MPG.

## Specific Impulse (Isp)

```
Isp = Ve / g0

Where:
  Ve  = effective exhaust velocity (m/s) — how fast propellant
        leaves the engine
  g0  = standard gravity, a FIXED reference constant =
        9.80665 m/s² — used here purely as a unit-conversion
        constant, not because gravity is doing anything physically
        in this equation. This is why Isp comes out in seconds
        regardless of what planet the engine would theoretically
        operate near.

Rearranged, this also gives you exhaust velocity directly from a
quoted Isp:
  Ve = Isp · g0

Typical Isp ranges (useful for sanity-checking, not for citing as
exact specs of any particular real engine without checking current
manufacturer data):
  Solid rocket motors    ~ 250-270 s
  Liquid bipropellant    ~ 300-450 s (varies significantly by
                            propellant combination)
  Ion/electric propulsion ~ 1,500-3,000+ s (much higher efficiency,
                            but very low thrust — a genuinely
                            different design trade-off, not just a
                            "better" engine)
```

## The Tsiolkovsky Rocket Equation

```
Δv = Isp · g0 · ln(m0 / mf)

Where:
  Δv  = total velocity change the rocket can achieve (m/s)
  m0  = initial ("wet") mass — vehicle + all propellant, at launch
  mf  = final ("dry") mass — vehicle alone, after all propellant is
        burned
  ln  = natural logarithm

This equation (derived by Konstantin Tsiolkovsky in 1903 — verified
attribution, a genuinely old and foundational result, not new
research) is why rockets are staged. Because mass ratio (m0/mf) sits
inside a LOGARITHM, adding more propellant gives rapidly
diminishing returns on Δv — this is often called "the tyranny of
the rocket equation." Dropping dead structural mass (an empty stage)
partway through flight, rather than hauling it all the way to orbit,
is what makes staging worth the added complexity.
```

### Annotated Example — Computing Achievable Delta-v

A rocket stage has Isp = 300 s, a wet mass (fully fueled) of 50,000 kg, and a dry mass (propellant burned out) of 8,000 kg.

```
Given:  Isp = 300 s
        g0 = 9.80665 m/s²
        m0 = 50,000 kg
        mf = 8,000 kg

Apply:  Δv = Isp · g0 · ln(m0/mf)
        Δv = 300 × 9.80665 × ln(50,000/8,000)
        Δv = 300 × 9.80665 × ln(6.25)
        Δv = 300 × 9.80665 × 1.8326
        Δv = 2,942.0 × 1.8326
        Δv ≈ 5,392 m/s

This single number — roughly 5.4 km/s of achievable velocity change
— is exactly the kind of figure Orbital Mechanics will compare
against a mission's required delta-v (e.g., "how much Δv does it
take to reach low Earth orbit") to determine whether this stage,
alone or combined with others, can actually complete the mission.
```

## Try It (2 Minutes)

A different stage has Isp = 450 s, wet mass 20,000 kg, dry mass 4,000 kg.

1. Compute the mass ratio (m0/mf).
2. Compute the achievable Δv using the Tsiolkovsky equation.
3. This stage has a higher Isp than the worked example above but a smaller mass ratio (5 vs. 6.25) — which effect wins?

You should land on: mass ratio = 20,000/4,000 = 5; Δv = 450 × 9.80665 × ln(5) = 450 × 9.80665 × 1.6094 ≈ 7,101 m/s. Despite the smaller mass ratio, this stage achieves a noticeably HIGHER Δv than the worked example — because Δv scales linearly with Isp but only logarithmically with mass ratio, a big efficiency gain (Isp) tends to matter more than a similarly-sized change in how much propellant fraction you're carrying. This is exactly why engine efficiency (Isp) is such a heavily fought-over design parameter in real rocket engineering.

## Study Resources
- **NASA Glenn Research Center — Beginner's Guide to Rockets** (grc.nasa.gov) — free coverage of specific impulse and the rocket equation
- **Sutton & Biblarz, *Rocket Propulsion Elements*** — the standard university-level reference for specific impulse ranges by propellant type
- **Tsiolkovsky's original 1903 work, "Exploration of Outer Space by Means of Reaction Devices"** — the historical source of the rocket equation, for context on how old and foundational this result is
