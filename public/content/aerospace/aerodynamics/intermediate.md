# Aerodynamics — Intermediate

Fundamentals introduced L/D as a single efficiency ratio without explaining what actually makes drag go up or down as an aircraft changes speed or angle of attack. This page breaks drag into its two structurally different sources — parasite drag and induced drag — and shows why L/D has a genuine, computable maximum at one specific CL, not just a vague "somewhere in the middle."

**Analogy** — Parasite drag is like the constant rolling resistance of a bicycle's tires — it's there no matter how hard you're pedaling or what angle you're leaning at, purely a function of speed. Induced drag is like the extra effort of pedaling while also steering hard around a tight curve — the harder you turn (the more lift-generating "work" the wing does), the more energy gets diverted into that effort instead of forward motion. An aircraft flying slow and high-angle-of-attack pays heavily in induced drag (steering hard); an aircraft flying fast and level pays mostly in parasite drag (rolling resistance) — L/D max is the specific speed where the sum of both is smallest relative to lift produced.

## Parasite Drag vs. Induced Drag

```
PARASITE DRAG (CD0)                 INDUCED DRAG (CDi)
Caused by skin friction and         Caused by lift generation itself
shape (form drag) — exists even     — a direct BYPRODUCT of
at ZERO lift                        producing lift, zero at zero lift
Roughly CONSTANT with angle of      Increases with the SQUARE of CL
attack/CL (a simplification;                (CDi ∝ CL²)
real CD0 has some CL dependence
too, but treating it as roughly
constant is the standard first-
order model)
Dominates at HIGH SPEED, LOW        Dominates at LOW SPEED, HIGH
angle of attack (cruise)            angle of attack (takeoff,
                                     landing, climbing)
```

## The Drag Polar and Induced Drag Formula

```
CDi = CL² / (π · e · AR)

Where:
  CL = lift coefficient
  e  = Oswald efficiency factor (a real, measured/estimated number,
       typically 0.7-0.85 for a conventional wing — captures how far
       the real wing's lift distribution falls short of the
       theoretical ideal elliptical distribution, which would give
       e = 1.0)
  AR = aspect ratio = wingspan² / wing area — a LONG, THIN wing (high
       AR, like a glider) has much lower induced drag than a SHORT,
       WIDE wing (low AR, like a fighter jet) for the same lift, at
       the direct cost of structural weight and roll agility

DRAG POLAR (total drag coefficient as a function of CL):
  CD = CD0 + CL² / (π · e · AR)

This is the actual equation behind Fundamentals' L/D ratio — L/D
isn't a single number because CD isn't constant; it depends on CL
through this exact formula, which is why L/D changes as an aircraft
changes angle of attack/speed.
```

## Deriving L/D Max

```
L/D = CL / CD = CL / (CD0 + CL²/(π·e·AR))

This ratio is maximized at a SPECIFIC CL — not the highest CL
available, and not CL = 0 (where L/D = 0/CD0 = 0). The maximum
occurs exactly where parasite drag EQUALS induced drag:
  CD0 = CDi  (at the optimal CL, called CL*)

Solving CD0 = CL*²/(π·e·AR) for CL*:
  CL* = √(CD0 · π · e · AR)

This is a genuinely useful, memorable result: L/D max happens at the
specific flight condition where the two structurally different drag
sources are exactly balanced — not more induced-drag-heavy, not more
parasite-drag-heavy.
```

### Annotated Example — Computing L/D Max for a Real Configuration

An aircraft has CD0 = 0.02, Oswald efficiency e = 0.8, and aspect ratio AR = 8 (a moderate, conventional wing).

```
Given:  CD0 = 0.02, e = 0.8, AR = 8

Step 1 — find CL* (the CL where L/D is maximized):
  CL* = √(CD0 · π · e · AR)
  CL* = √(0.02 · π · 0.8 · 8)
  CL* = √(0.4021)
  CL* = 0.6341

Step 2 — confirm CDi = CD0 at this CL* (should match, by construction):
  CDi = CL*² / (π · e · AR) = (0.6341)² / (π · 0.8 · 8)
  CDi = 0.4021 / 20.106 = 0.0200  -- matches CD0 = 0.02 exactly

Step 3 — total drag and L/D max:
  CD_total = CD0 + CDi = 0.02 + 0.02 = 0.04
  L/D max  = CL* / CD_total = 0.6341 / 0.04 = 15.85

Verified programmatically by computing L/D across a range of CL
values from 0.4 to 0.8 in steps: L/D = 14.31 at CL=0.4, rising to a
genuine PEAK of 15.85 exactly at CL=0.6341, then falling back to
15.44 at CL=0.8 -- confirming CL* = 0.6341 is a true maximum, not an
arbitrary point on a monotonic curve.
```

## Try It (2 Minutes)

Using the same aircraft (CD0 = 0.02, e = 0.8), but now with a higher aspect ratio wing, AR = 12 (a more glider-like design):

1. Compute the new CL* using CL* = √(CD0 · π · e · AR).
2. Is CL* higher or lower than the AR=8 case's 0.6341, and does that match your intuition about a higher-AR wing needing a different optimal angle of attack?
3. Compute the new L/D max at this CL*, and compare it to the AR=8 case's 15.85.

You should land on: CL* = √(0.02 · π · 0.8 · 12) = √(0.6032) = 0.7767 — higher than the AR=8 case's 0.6341. At this CL*, CDi = CD0 = 0.02 again (by the same construction), so CD_total = 0.04 (unchanged), and L/D max = 0.7767/0.04 = 19.42 — meaningfully higher than the AR=8 case's 15.85. This matches the expected direction: a higher aspect ratio wing genuinely achieves a higher best-case L/D, which is exactly why gliders (built purely to maximize L/D, with no fighter-jet agility requirement) have extremely high aspect ratio wings.

## Study Resources
- **Anderson, *Fundamentals of Aerodynamics*** — the standard reference for the drag polar, Oswald efficiency factor, and L/D-max derivation in full mathematical depth
- **NASA Glenn Research Center — "Drag of a Wing"** (grc.nasa.gov) — free coverage of parasite vs. induced drag and the drag polar concept
- **NASA Glenn Research Center — Aspect Ratio** (grc.nasa.gov) — free explanation of why aspect ratio affects induced drag the way it does
