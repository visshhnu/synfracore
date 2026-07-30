# Spacecraft Systems & Mission Design — Fundamentals

Overview assembled a full spacecraft-level Δv budget (4.354 km/s for a 10-year GEO mission) from Orbital Mechanics' transfer number plus a new station-keeping figure. This page uses Propulsion's rocket equation to answer the next real engineering question: given that Δv budget, how much propellant mass does the spacecraft actually have to carry — and separately, how the power subsystem gets sized using Orbital Mechanics' own orbital period equation.

**Analogy** — Sizing a spacecraft's propellant load from a Δv budget is like packing luggage for a trip with a fixed number of connecting flights: you don't just guess a suitcase size, you work backward from exactly how many legs of the trip you need fuel (money, in the luggage analogy) for, and pack precisely that much — no more, because every extra kilogram of propellant is itself extra mass that has to be launched, at real cost.

## Sizing Propellant Mass from a Δv Budget

```
Propulsion's Tsiolkovsky rocket equation, rearranged to solve for
propellant mass instead of Δv:

  Δv = Isp · g0 · ln(m0/mf)
  →  m0/mf = e^(Δv / (Isp·g0))
  →  m0 = mf · e^(Δv / (Isp·g0))
  →  propellant mass = m0 - mf

Where, for this sizing problem:
  mf  = the spacecraft's DRY mass — structure, subsystems, payload,
        everything EXCEPT the propellant needed for this specific
        Δv budget
  m0  = the spacecraft's WET mass at the start of the budget —
        dry mass PLUS the propellant being solved for

This is the exact same equation Propulsion used, just solved in the
opposite direction: Propulsion asked "given this much propellant,
how much Δv can I achieve?" — here we're asking "given this much
required Δv, how much propellant do I have to carry?"
```

### Annotated Example — Propellant Mass for the 10-Year GEO Mission

Using Overview's 4,354 m/s spacecraft-level Δv budget, a spacecraft with 2,000 kg dry mass, and a bipropellant apogee engine with Isp = 320 s (a realistic value for this engine class).

```
Given:  Δv = 4,354 m/s (Overview's worked mission budget — reused
              directly, not recalculated)
        mf = 2,000 kg (dry mass)
        Isp = 320 s
        g0 = 9.80665 m/s²

Apply:  mass ratio = e^(Δv / (Isp·g0))
        mass ratio = e^(4,354 / (320 × 9.80665))
        mass ratio = e^(4,354 / 3,138.1)
        mass ratio = e^1.3874
        mass ratio ≈ 4.005

        m0 = mf × mass ratio = 2,000 × 4.005 ≈ 8,009 kg
        propellant mass = m0 - mf = 8,009 - 2,000 ≈ 6,009 kg

This means a spacecraft with only 2,000 kg of "useful" dry mass
(structure, subsystems, payload) needs to launch at roughly 8,000 kg
total — three times its dry mass — just to carry enough propellant
for this mission's Δv budget. This is a direct, calculable
consequence of the Δv budget Overview assembled, not a rough
estimate.
```

## Power Subsystem Sizing — Reusing the Orbital Period Equation

```
Solar panels only generate power while the spacecraft is in
sunlight — during ECLIPSE (when Earth blocks the Sun), the
spacecraft runs entirely on battery power. Sizing both the solar
panels and the batteries correctly requires knowing how long each
eclipse typically lasts relative to the full orbit.

Orbital Mechanics' period equation, T = 2π·√(r³/μ), gives the total
orbit duration directly. The FRACTION of that period spent in
eclipse depends on orbital geometry (altitude and the "beta angle"
between the orbital plane and the Sun) — this fraction varies
significantly by mission (commonly cited real-mission figures range
from roughly 13% up to 35-40% of the orbit for typical LEO cases;
this needs verification against the SPECIFIC mission's actual orbit
geometry before being used for real spacecraft sizing — it is not a
single fixed constant the way orbital period itself is).

Design consequence: batteries must be sized to power the spacecraft
through the LONGEST expected eclipse duration for its specific
orbit, and solar panels must generate enough EXCESS power during
sunlight to both run the spacecraft AND recharge the batteries
before the next eclipse — not just match average power draw.
```

## Try It (2 Minutes)

A smaller spacecraft has a dry mass of 500 kg and needs to achieve the same 4,354 m/s Δv budget, but uses a lower-performance monopropellant engine with Isp = 230 s instead of 320 s.

1. Compute the mass ratio using e^(Δv/(Isp·g0)).
2. Compute the propellant mass required.
3. Compare the propellant-to-dry-mass ratio here to the worked example's (roughly 3:1) — does the lower Isp make this ratio better or worse, and does that match Propulsion's earlier finding about Isp's effect on achievable Δv?

You should land on: mass ratio = e^(4,354/(230×9.80665)) = e^(1.930) ≈ 6.89; propellant mass = 500 × 6.89 - 500 ≈ 2,946 kg — a roughly 5.9:1 propellant-to-dry-mass ratio, noticeably WORSE than the 3:1 ratio in the worked example. This directly confirms Propulsion's earlier point: for the same required Δv, a lower-Isp engine demands disproportionately more propellant mass, because Δv depends on the natural logarithm of the mass ratio — a lower Isp means a much larger mass ratio is needed to close the same Δv gap.

## Study Resources
- **Wertz & Larson, *Space Mission Analysis and Design (SMAD)*** — the standard reference for propellant mass budgeting and power subsystem sizing
- **Sutton & Biblarz, *Rocket Propulsion Elements*** — referenced again here for realistic Isp values by engine type, used to justify the 320 s and 230 s figures above
- **NASA Glenn Research Center — Beginner's Guide to Rockets** (grc.nasa.gov) — free coverage of the rocket equation used throughout this page
