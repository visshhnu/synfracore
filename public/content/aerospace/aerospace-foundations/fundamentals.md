# Aerospace Foundations — Fundamentals

Overview showed *why* vectors, Newton's laws, and calculus matter here. This page teaches the actual mechanics of using them: how to break a vector into components and combine vectors with the dot and cross products, how Newton's Second Law works for both straight-line motion and rotation, and how calculus formally connects position, velocity, and acceleration — the exact relationship you'll use to work out a rocket's speed after a burn or an aircraft's distance during a takeoff roll.

**Analogy** — Think of a car dashboard: the odometer shows position, the speedometer shows velocity, and the feeling of being pushed back into your seat is acceleration. Calculus is just the formal rule connecting all three: velocity is how fast the odometer reading is changing (its *rate of change*), and acceleration is how fast the speedometer reading is changing. Nothing about a rocket or aircraft changes this — it's the same three-way relationship, just applied to a vehicle instead of a car.

## Vectors: Components, Dot Product, Cross Product

```
COMPONENTS — breaking one vector into two perpendicular pieces:
  A vector V at angle θ from the horizontal splits into:
    Vx = V·cos(θ)   (horizontal component)
    Vy = V·sin(θ)   (vertical component)
  This is exactly the climb-angle math from Overview, generalized to
  any vector, not just weight.

DOT PRODUCT (·) — combines two vectors into a single NUMBER (scalar).
  A · B = |A|·|B|·cos(θ)   where θ is the angle between them
  Physical meaning in aerospace: WORK. If a force F moves an object
  through displacement d, the work done is F · d — only the
  component of force ALONG the direction of motion counts. A force
  perpendicular to motion (θ = 90°, cos = 0) does zero work.

CROSS PRODUCT (×) — combines two vectors into a NEW VECTOR,
  perpendicular to both.
  |A × B| = |A|·|B|·sin(θ)
  Physical meaning in aerospace: TORQUE (rotational force). If a
  force F is applied at a distance r from a pivot (e.g., an aileron
  deflecting at the wingtip, rolling the aircraft), the torque is
  r × F. This is the rotational equivalent of F = ma, and it's what
  Flight Mechanics builds on for stability and control.
```

## Newton's Second Law — Straight-Line and Rotational

```
STRAIGHT-LINE (translational):
  F = ma
  Net force (N) = mass (kg) × acceleration (m/s²)
  This is the single most-used equation in this entire academy —
  every thrust, drag, lift, and weight calculation eventually feeds
  into this to answer "how does the vehicle actually move."

ROTATIONAL (the same law, for spinning/turning motion):
  τ = Iα
  Net torque (τ, from the cross product above) = moment of inertia
  (I — resistance to rotational acceleration, like mass but for
  spinning) × angular acceleration (α)
  This is what governs an aircraft rolling, pitching, or yawing —
  Flight Mechanics' entire stability-and-control topic is this
  equation applied to real aircraft.
```

## Calculus: Connecting Position, Velocity, and Acceleration

```
Position  x(t)  — where the vehicle is, as a function of time
Velocity  v(t)  — how fast position is changing:  v = dx/dt
Acceleration a(t) — how fast velocity is changing:  a = dv/dt

Going the OTHER direction (integration — the reverse of a
derivative) answers "given acceleration, what's the velocity and
position":
  v(t) = v0 + ∫a dt
  x(t) = x0 + ∫v dt

For the common case of CONSTANT acceleration (a rocket motor
burning at steady thrust, for example), these integrate to the
standard kinematics equations:
  v = v0 + at
  x = x0 + v0·t + ½at²
```

### Annotated Example — Velocity Gained During a Rocket Burn

Documentation: a small solid rocket motor produces a constant acceleration of 40 m/s² for a 6-second burn, starting from rest.

```
Given:  a = 40 m/s² (constant)
        t = 6 s
        v0 = 0 m/s (starting from rest)

Apply:  v = v0 + at
        v = 0 + (40)(6)
        v = 240 m/s

Distance covered during the burn (needed later for staging/altitude
calculations):
        x = v0·t + ½at²
        x = (0)(6) + ½(40)(6²)
        x = ½(40)(36)
        x = 720 m

Why this matters beyond the arithmetic: this is the SAME v = v0 + at
relationship Propulsion Systems will use to relate thrust and burn
time to final velocity, and the SAME integration logic Orbital
Mechanics will use — just with the constant acceleration replaced by
gravity's pull, which isn't constant once you're far from Earth.
```

## Try It (2 Minutes)

A different rocket stage produces a constant acceleration of 25 m/s² for an 8-second burn, starting from rest.

1. What velocity does the rocket reach at the end of the burn?
2. How far does it travel during the burn?
3. If this stage's job were instead to decelerate a 5,000 kg spacecraft at that same 25 m/s² rate, how much force (thrust) would that require, using F = ma from Newton's Second Law?

You should land on: v = 0 + (25)(8) = 200 m/s; x = ½(25)(8²) = ½(25)(64) = 800 m; force required = (5,000 kg)(25 m/s²) = 125,000 N. That third question is the real point of this page — the same acceleration number feeds two completely different formulas (kinematics for "how fast/how far," Newton's Second Law for "how much force") depending on what you're actually being asked.

## Study Resources
- **Anderson, *Introduction to Flight*** — Chapters 1–2 cover this exact vector/calculus/Newton's-laws foundation with aerospace-specific examples
- **NASA Glenn Research Center — Beginner's Guide to Rockets** (grc.nasa.gov) — free, walks through the same kinematics equations using real rocket examples
- **Paul's Online Math Notes — Calculus I** (tutorial.math.lamar.edu) — free refresher on derivatives/integrals if the calculus itself, not the aerospace application, needs review first
