# Aerodynamics — Advanced

Fundamentals classified flow regimes by Mach number and flagged that transonic drag rise happens because local airflow exceeds Mach 1 before the aircraft itself does. This page makes that precise: how much lift changes as air becomes compressible (even still subsonic), what determines exactly when local flow first goes supersonic, and why sweeping a wing back is a genuine, quantifiable way to delay that moment.

**Analogy** — Wing sweep is like turning a knife blade sideways before pushing it through a dense material: a straight-on push (an unswept wing) presents the material with the blade's full effective thickness immediately, while an angled push (a swept wing) makes the material "feel" a thinner, more gradual edge, even though the actual blade hasn't changed at all. Sweeping a wing back doesn't change the aircraft's true airspeed — it changes what Mach number the wing's own airflow effectively experiences, which is exactly why swept wings can fly faster before running into the same drag-rise wall an unswept wing hits sooner.

## The Prandtl-Glauert Compressibility Correction

```
Overview and Intermediate's lift equation (L = ½ρV²S·CL) implicitly
assumes INCOMPRESSIBLE flow — valid at low Mach numbers, but air
genuinely compresses as speed increases, and CL itself changes as a
result, even in the subsonic regime, before any shockwave forms.

Prandtl-Glauert correction (valid roughly M < 0.7-0.8, before
transonic effects dominate):

  CL_compressible = CL_incompressible / √(1 - M²)

As M increases toward 1, the denominator shrinks toward zero, so
CL_compressible grows — meaning a wing produces MORE lift for the
same geometry and angle of attack as compressibility becomes
significant, not less. This is a real, first-order correction
engineers apply before ever reaching the transonic regime where
Fundamentals' drag-rise effects take over.
```

### Annotated Example — Compressibility's Effect on Lift

An airfoil has an incompressible-flow CL = 0.5 at a given angle of attack. Compute its corrected CL at M = 0.6 and again at M = 0.7.

```
Given:  CL_incompressible = 0.5

At M = 0.6:
  CL_compressible = 0.5 / √(1 - 0.6²) = 0.5 / √(0.64) = 0.5 / 0.8
  CL_compressible = 0.625

At M = 0.7:
  CL_compressible = 0.5 / √(1 - 0.7²) = 0.5 / √(0.51) = 0.5 / 0.714
  CL_compressible = 0.700

Verified programmatically: both values computed directly from the
formula. Notice the correction grows non-linearly as M approaches
1 — going from M=0.6 to M=0.7 (a 0.1 increase) grew CL by 0.075,
noticeably more than a similar-sized Mach increase would at a lower
starting M — this accelerating growth is exactly why the correction
becomes unreliable and is abandoned once transonic effects (shocks,
flow separation) take over above roughly M=0.7-0.8.
```

## Critical Mach Number

```
CRITICAL MACH NUMBER (Mcr) — the free-stream Mach number at which
local airflow SOMEWHERE on the airfoil (almost always the point of
maximum curvature on the upper surface) first reaches exactly
Mach 1, even though the aircraft's own speed is still subsonic.

This is the precise, quantitative version of Fundamentals'
qualitative transonic explanation — Mcr is a specific, real number
for a given airfoil shape (not a fixed universal value), and flying
above Mcr is what actually triggers the drag-rise Fundamentals
described, because that's the point local shockwaves begin forming.

A THINNER, less-cambered airfoil generally has a HIGHER Mcr (delays
the onset of local supersonic flow, and therefore drag rise, to a
higher flight Mach number) — a real, first-order reason supersonic
and high-subsonic aircraft use thin airfoil sections, at the direct
cost of internal volume for fuel/structure that a thicker airfoil
would provide.
```

## Wing Sweep — Delaying Critical Mach

```
EFFECTIVE MACH NUMBER seen by a swept wing's airflow:
  M_effective = M_flight · cos(Λ)

Where Λ (capital lambda) is the wing's sweep angle, measured from
the perpendicular to the fuselage.

The physical idea: only the velocity component PERPENDICULAR to the
wing's leading edge actually "does the work" of accelerating flow
over the airfoil's curvature the way Mcr cares about — sweeping the
wing back reduces that perpendicular component relative to the
aircraft's true forward speed, without changing the true airspeed at
all.
```

### Annotated Example — Why Swept Wings Fly Faster Before Drag Rise

An aircraft flies at M = 0.85 (true flight Mach number). Compare the effective Mach number its wing airflow experiences with an unswept wing (Λ = 0°) versus a 35°-swept wing.

```
Given:  M_flight = 0.85

Unswept (Λ = 0°):
  M_effective = 0.85 · cos(0°) = 0.85 · 1.0 = 0.85
  -> the wing's airflow experiences the FULL flight Mach number

Swept 35° (Λ = 35°):
  M_effective = 0.85 · cos(35°) = 0.85 · 0.8192 = 0.696

Verified programmatically: cos(35°) = 0.8192, giving an effective
Mach of 0.696 -- noticeably below the aircraft's true 0.85 flight
Mach. If this airfoil's Mcr is, say, 0.72, the UNSWEPT wing (seeing
the full 0.85) would already be well past Mcr and deep into drag
rise, while the SWEPT wing (seeing only 0.696) would still be safely
below Mcr at the exact same true flight speed -- the sweep alone is
what makes the difference between "already past drag rise" and
"not yet."
```

This is the real, physical reason nearly every high-subsonic and transonic commercial airliner has a swept wing (typically 25-35° for airliners) — it's a direct, quantifiable way to fly faster before paying the transonic drag-rise penalty Fundamentals introduced, at the real cost of more complex structural design and generally worse low-speed handling (which is why swept-wing aircraft need more sophisticated high-lift devices for takeoff and landing).

## Try It (2 Minutes)

An aircraft has a wing with Mcr = 0.75 for its airfoil section. It's considering two configurations at true flight Mach M = 0.82: unswept (Λ = 0°), or swept at Λ = 25°.

1. Compute the effective Mach number for each configuration using M_effective = M_flight · cos(Λ).
2. For each configuration, is the effective Mach number above or below Mcr = 0.75?
3. Based on this, which configuration would already be experiencing transonic drag rise at M = 0.82, and which would not?

You should land on: unswept — M_effective = 0.82 · cos(0°) = 0.82, which is above Mcr = 0.75, meaning this configuration IS already past its critical Mach number and experiencing drag rise. Swept 25° — M_effective = 0.82 · cos(25°) = 0.82 · 0.9063 = 0.743, which is just below Mcr = 0.75, meaning this configuration is NOT yet past critical Mach at the same true flight speed. This is precisely the quantitative payoff of wing sweep: the exact same aircraft, at the exact same true airspeed, can be either past or before its drag-rise threshold purely depending on wing sweep angle.

## Study Resources
- **Anderson, *Fundamentals of Aerodynamics*** — the standard reference for the Prandtl-Glauert correction, critical Mach number, and wing sweep theory in full mathematical depth
- **NASA Glenn Research Center — "Prandtl-Glauert Compressibility Correction"** (grc.nasa.gov) — free coverage of the exact formula used above
- **NASA Glenn Research Center — "Critical Mach Number"** (grc.nasa.gov) — free explanation of Mcr and its relationship to airfoil shape
