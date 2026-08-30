# Aerodynamics — Overview

**Before you start:** [Aerospace Foundations](/academies/aerospace/aerospace-foundations/overview) (vectors, Newton's laws, the four forces of flight) is assumed.

Foundations gave you vectors, F = ma, and the four forces of flight as a balance to satisfy. This page explains where two of those four forces — lift and drag — actually come from, and how engineers predict their size before a wing is ever built.

**Analogy** — Stick your flat hand out of a moving car window, palm down, and tilt your fingertips up slightly. You'll feel your hand pushed upward and backward. That's lift and drag, in miniature: your tilted hand deflects air downward and, by Newton's Third Law, the air pushes back on your hand — upward. A wing does the same thing, just shaped and angled to do it far more efficiently than a flat hand.

## Where Lift Actually Comes From

```
Common misconception to unlearn: lift is NOT caused by air molecules
splitting at the leading edge and needing to "arrive together" at
the trailing edge ("equal transit time"). NASA and modern aerodynamics
education explicitly flag this as false — measured airflow shows the
air over the top of a wing arrives at the trailing edge well BEFORE
the air underneath, not at the same time.

The accurate explanation combines two views of the same physical
event:
  1. NEWTON'S THIRD LAW view: the wing's shape and angle of attack
     deflect airflow downward (called "downwash"). By Newton's Third
     Law, deflecting air downward means the air pushes the wing
     upward — this IS the lift force.
  2. PRESSURE view: that same downward deflection creates faster-
     moving, lower-pressure air above the wing and slower-moving,
     higher-pressure air below it. The pressure difference, summed
     over the wing's surface, IS the lift force.

These are not competing theories — they're the same physical event
described two different ways (a force viewpoint and a pressure
viewpoint), and both give the same answer.
```

```conceptgrid
{
  "boxes": [
    { "title": "Newton's Third Law View", "description": "Wing deflects airflow downward (downwash) -- air pushes back up on the wing", "color": "blue" },
    { "title": "Pressure View", "description": "Downwash creates lower pressure above, higher below -- the difference IS lift", "color": "purple" }
  ]
}
```

## The Lift and Drag Equations

```
LIFT:   L = ½ · ρ · V² · S · CL
DRAG:   D = ½ · ρ · V² · S · CD

Where:
  ρ (rho)  = air density (kg/m³) — thinner air at altitude means
             less lift for the same speed, which is why aircraft
             need more runway or higher speed to take off from a
             high-altitude airport
  V        = airspeed (m/s)
  S        = wing reference area (m²)
  CL       = lift coefficient — captures the airfoil's shape AND
             angle of attack in one number, found experimentally or
             computationally, not from a simple formula
  CD       = drag coefficient — same idea, for drag

Notice both equations share the same ½ρV²S term — only the
coefficient (CL vs CD) differs. This shared term has a name: dynamic
pressure. Lift and drag are really just "dynamic pressure × a shape-
and-angle-dependent coefficient," for two different coefficients.
```

## Angle of Attack and Stall

```
ANGLE OF ATTACK (α) — the angle between the wing's chord line and
the oncoming airflow direction. NOT the same as the aircraft's pitch
angle relative to the ground.

As α increases from zero:
  CL increases roughly linearly at first — more angle, more lift,
  up to a point.

STALL — beyond a critical angle of attack (roughly 15-20° for most
conventional airfoils, varying by airfoil design — needs
verification for any SPECIFIC airfoil's exact stall angle before
citing it in a real design context), the airflow can no longer
follow the wing's upper surface smoothly. It separates, CL drops
sharply, and lift is lost — this is a stall. Critically: stall is
about ANGLE OF ATTACK, not airspeed directly — an aircraft can stall
at any airspeed if the angle of attack gets too high.
```

### Annotated Example — Computing Lift

An aircraft's wing has 20 m² of reference area, flying at 60 m/s through air with density 1.225 kg/m³ (standard sea-level density), at an angle of attack where CL = 0.5.

```
Given:  ρ = 1.225 kg/m³
        V = 60 m/s
        S = 20 m²
        CL = 0.5

Apply:  L = ½ · ρ · V² · S · CL
        L = ½ · (1.225) · (60²) · (20) · (0.5)
        L = ½ · (1.225) · (3,600) · (20) · (0.5)
        L = 0.5 × 1.225 × 3,600 × 20 × 0.5
        L = 22,050 N

Note the V² term: doubling speed doesn't double lift, it QUADRUPLES
it (60² = 3,600 vs 30² = 900) — this is why small speed changes near
stall or during takeoff/landing matter so much more than the same
speed change at cruise.
```

## Try It (2 Minutes)

Using the same wing (S = 20 m², sea-level air ρ = 1.225 kg/m³), but now at 40 m/s with CL = 0.8 (a higher angle of attack, lower speed — like an aircraft slowing for landing):

1. Compute the lift using L = ½ · ρ · V² · S · CL.
2. Compare it to the 22,050 N computed above at 60 m/s — is it more or less, and does that match your intuition about why aircraft raise their angle of attack (and CL) as they slow down for landing?

You should land on: L = 0.5 × 1.225 × (40²) × 20 × 0.8 = 0.5 × 1.225 × 1,600 × 20 × 0.8 = 15,680 N — noticeably less than the 22,050 N at 60 m/s, even with a higher CL, because the V² term dominates. This is exactly why real aircraft need flaps and a higher angle of attack at landing speed: CL alone can't fully make up for the lift lost to slowing down, so the aircraft trades speed for pushing CL as high as possible without stalling.

## Study Resources
- **NASA Glenn Research Center — "Incorrect Lift Theory"** (grc.nasa.gov) — the source for the equal-transit-time misconception correction above; explains the accurate Newton/pressure explanation in more depth
- **NASA Glenn Research Center — Beginner's Guide to Aerodynamics** (grc.nasa.gov) — free coverage of the lift/drag equations and coefficients
- **Anderson, *Fundamentals of Aerodynamics*** — the standard university-level reference for lift, drag, and airfoil theory
