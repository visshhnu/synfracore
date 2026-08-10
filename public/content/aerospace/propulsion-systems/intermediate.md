# Propulsion Systems — Intermediate

Fundamentals gave you the Tsiolkovsky rocket equation for a SINGLE stage. This page extends it to a real multi-stage rocket — summing each stage's own Δv contribution — and introduces thrust-to-weight ratio, the single number that determines whether a rocket can even lift off the ground in the first place, independent of how much total Δv it can eventually achieve.

**Analogy** — A single-stage Tsiolkovsky calculation is like asking how far one full tank of gas gets a car. A multi-stage rocket is like a relay race: each stage runs its own leg (its own mass ratio, its own Isp), then drops away entirely — dead weight it no longer needs to carry — before the next stage picks up from that speed and adds its own contribution. The total distance covered is the sum of each leg, not one giant tank trying to do the whole race alone (which the "tyranny of the rocket equation" from Fundamentals makes increasingly inefficient as a single stage gets bigger).

## Multi-Stage Δv Budgeting

```
For a MULTI-STAGE rocket, total achievable Δv is the SUM of each
stage's own Tsiolkovsky Δv, computed INDEPENDENTLY using that
stage's own Isp and mass ratio:

  Δv_total = Δv_stage1 + Δv_stage2 + ... + Δv_stageN

Where each Δv_stageN = Isp_N · g0 · ln(m0_N / mf_N)

CRITICAL DETAIL: each stage's m0 is that stage's OWN wet mass at
the moment it starts burning -- which for stage 2 onward, does NOT
include the mass of any already-jettisoned earlier stage. This is
the entire mechanical point of staging (Fundamentals' "tyranny of
the rocket equation"): stage 2 never has to carry stage 1's now-
empty, dead-weight structure through its own burn.
```

### Annotated Example — A Real Two-Stage Δv Budget

Stage 1: Isp = 280 s, wet mass = 100,000 kg, dry mass = 20,000 kg. Stage 2 (vacuum-optimized, higher Isp since it operates above the atmosphere): Isp = 340 s, wet mass = 15,000 kg, dry mass = 4,000 kg.

```
Given:  Stage 1: Isp = 280 s, m0 = 100,000 kg, mf = 20,000 kg
        Stage 2: Isp = 340 s, m0 = 15,000 kg, mf = 4,000 kg
        g0 = 9.80665 m/s²

Stage 1: Δv1 = 280 × 9.80665 × ln(100,000/20,000)
              = 280 × 9.80665 × ln(5)
              = 2,745.86 × 1.6094
              = 4,419.3 m/s

Stage 2: Δv2 = 340 × 9.80665 × ln(15,000/4,000)
              = 340 × 9.80665 × ln(3.75)
              = 3,334.26 × 1.3218
              = 4,407.1 m/s

Total: Δv_total = 4,419.3 + 4,407.1 = 8,826.4 m/s (8.83 km/s)

Verified computationally: each stage's Δv computed independently
and summed gives 8,826.4 m/s total -- notice this is REMARKABLY
close to the ~9.4 km/s real launch-to-LEO figure referenced in
Spacecraft Systems' Overview (this simplified two-stage example
doesn't account for gravity/drag losses during ascent, which is
exactly why the real figure runs somewhat higher than the idealized
vacuum rocket-equation sum).
```

## Try It (2 Minutes)

A single-stage rocket (for comparison) has the SAME total propellant mass as the two-stage example above's combined propellant (100,000 - 20,000 + 15,000 - 4,000 = 91,000 kg propellant), carried in one stage with Isp = 300 s, wet mass 100,000 kg, dry mass 9,000 kg (assuming the same total dry structural mass, 20,000 + 4,000 - 15,000 = 9,000 kg, since it doesn't need a second stage's separate structure).

1. Compute this single-stage rocket's Δv using the standard Tsiolkovsky equation.
2. Compare it to the two-stage total of 8,826.4 m/s — which achieves more Δv for a similar propellant investment?

You should land on: Δv = 300 × 9.80665 × ln(100,000/9,000) = 2,942.0 × ln(11.11) = 2,942.0 × 2.408 ≈ 7,084 m/s — noticeably LESS than the two-stage total of 8,826.4 m/s, despite using a comparable amount of propellant. This is the concrete, numeric payoff of staging: dropping dead structural mass partway through flight genuinely produces more total Δv than one stage hauling all its structure the whole way, even before accounting for each stage's engine being individually optimized (like Stage 2's higher vacuum Isp above).

## Thrust-to-Weight Ratio — Can It Even Lift Off?

```
Thrust-to-weight ratio (T/W) is a SEPARATE question from total Δv --
Δv answers "how much velocity change can this rocket eventually
achieve," while T/W answers "can this rocket even get off the
ground right now."

T/W = F_thrust / (m · g0)

T/W > 1 is REQUIRED at liftoff -- thrust must exceed the rocket's
own weight, or it simply doesn't lift off at all, regardless of how
much Δv the rocket equation says it could theoretically achieve
over a full burn. Real launch vehicles typically lift off with T/W
in roughly the 1.2-2.5 range `(needs verification — recheck against
current source: exact typical T/W ranges vary by vehicle design and
mission profile)` -- too low risks a dangerously slow, inefficient
climb through the atmosphere; too high wastes structural mass on
engines bigger than needed.
```

### Annotated Example — Checking Liftoff Feasibility

A rocket's total mass at liftoff is 100,000 kg, and its engines produce 2,200,000 N (2.2 MN) of thrust.

```
Given:  F = 2,200,000 N, m = 100,000 kg, g0 = 9.80665 m/s²

Apply:  T/W = F / (m · g0)
        T/W = 2,200,000 / (100,000 × 9.80665)
        T/W = 2,200,000 / 980,665
        T/W ≈ 2.24

Verified computationally: T/W = 2.24, comfortably above the required
1.0 threshold and within the typical real-vehicle range -- this
rocket CAN lift off, and has meaningful margin for a reasonably
brisk initial climb, not just a marginal, barely-positive liftoff.
```

## Try It (2 Minutes)

A different rocket has a liftoff mass of 50,000 kg and engines producing 400,000 N of thrust.

1. Compute this rocket's T/W ratio.
2. Can it lift off? What does this tell you about its design, independent of whatever Δv its rocket-equation calculation might predict?

You should land on: T/W = 400,000 / (50,000 × 9.80665) = 400,000 / 490,332.5 ≈ 0.816 — LESS than 1.0, meaning this rocket CANNOT lift off, no matter how favorable its Isp or mass ratio might make its theoretical Δv. This is the exact reason T/W and Δv are evaluated as two genuinely separate design checks: a rocket can have excellent theoretical Δv and still be completely non-functional if its engines can't even overcome its own weight at liftoff.

## Study Resources
- **Sutton & Biblarz, *Rocket Propulsion Elements*** — the standard reference for multi-stage vehicle design and thrust-to-weight considerations
- **NASA Glenn Research Center — Beginner's Guide to Rockets** (grc.nasa.gov) — free coverage of staging and liftoff thrust requirements
- **Spacecraft Systems & Mission Design** (this academy) — uses this guide's Δv figures directly in its own full mission Δv budget
