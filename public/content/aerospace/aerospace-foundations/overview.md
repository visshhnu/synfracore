# Aerospace Foundations — Overview

**Before you start:** basic algebra and trigonometry (sin/cos, right-triangle relationships) are assumed — no prior physics or calculus background is required, since this page introduces the necessary vector/Newton's-laws vocabulary from scratch.

This is the on-ramp for the whole Aerospace academy. Every technology after this one — Aerodynamics, Propulsion, Flight Mechanics, Orbital Mechanics, Spacecraft Systems — leans on the same small toolkit: vectors, Newton's laws applied to a vehicle instead of a point mass, and just enough calculus to connect position, velocity, and acceleration. This page doesn't teach a specific aircraft or rocket — it teaches the math/physics vocabulary you'll see reused in every module that follows.

**Analogy** — A vector is an arrow with a job to do: its length tells you how hard it's pushing or pulling, its direction tells you which way. An aircraft in steady flight has four such arrows fighting each other — lift, weight, thrust, drag — and almost everything in introductory aerospace engineering is just learning to add and resolve arrows like these correctly. Nothing more exotic than that is happening at this stage, even though the diagrams look intimidating at first.

## Why This Academy Starts Here

```
Aerospace engineering splits into two connected halves:
  AERONAUTICAL  — flight within the atmosphere (aircraft)
  ASTRONAUTICAL — flight beyond the atmosphere (spacecraft, orbits)

Both halves use the exact same three mathematical tools:
  1. VECTORS      — forces, velocities, and positions all have both a
                     size and a direction; you can't add them like
                     plain numbers, you have to add them as arrows.
  2. NEWTON'S LAWS — F = ma, applied to a vehicle instead of a single
                     point. This is the rule that turns "what forces
                     are acting on this aircraft/rocket" into "how is
                     it actually going to move."
  3. CALCULUS      — the bridge between position, velocity, and
                     acceleration. Velocity is how fast position is
                     changing; acceleration is how fast velocity is
                     changing. Calculus is just the formal name for
                     "rate of change."
```

## The Four Forces of Flight — A Worked Vector Example

```conceptgrid
{
  "boxes": [
    { "title": "Lift", "description": "Upward -- balances Weight in steady flight", "color": "blue" },
    { "title": "Weight", "description": "Downward -- gravity acting on the aircraft's mass", "color": "purple" },
    { "title": "Thrust", "description": "Forward -- balances Drag in steady flight", "color": "green" },
    { "title": "Drag", "description": "Backward -- aerodynamic resistance to motion", "color": "red" }
  ]
}
```

```
                    LIFT (↑)
                      |
THRUST (→) ─────── [AIRCRAFT] ─────── DRAG (←)
                      |
                   WEIGHT (↓)

In steady, level, unaccelerated flight, the vectors balance in pairs:
  LIFT   = WEIGHT   (vertical forces cancel out)
  THRUST = DRAG     (horizontal forces cancel out)

This is Newton's First Law in action: zero net force means zero
acceleration, which is exactly what "steady, level flight" means —
constant altitude, constant speed.
```

### Annotated Example — What Happens When the Aircraft Climbs Instead

Level flight is the simple case. The moment an aircraft climbs, weight no longer points straight against lift alone — part of it now points backward along the flight path, working against thrust too. Resolving that is a direct application of vector components:

```
Climb angle: γ (gamma) — the angle between the flight path and the
horizontal.

Weight (W) still points straight down, but relative to the tilted
flight path, it splits into two components:
  W·cos(γ)  — the component still opposing LIFT
  W·sin(γ)  — the component now opposing THRUST, pulling the
              aircraft backward along its climb path

Steady climb force balance (verified against standard flight
mechanics references):
  L = W·cos(γ)              (lift needed is LESS than full weight
                              once climbing — cos(γ) < 1)
  T = D + W·sin(γ)           (thrust needed is MORE than just
                              overcoming drag — it must also fight
                              that backward weight component)

Worked numbers: a 10,000 N aircraft climbing at γ = 15°:
  W·cos(15°) = 10,000 × 0.966 = 9,660 N   → lift required
  W·sin(15°) = 10,000 × 0.259 = 2,590 N   → extra thrust required,
                                             on top of overcoming drag

This is the whole point of vector decomposition: the same 10,000 N
weight force demands a DIFFERENT amount of lift and a DIFFERENT
amount of thrust depending on the angle — you cannot answer "how
much lift/thrust is needed" without resolving the vector first.
```

## Try It (2 Minutes)

An aircraft weighing 20,000 N is climbing at a steady angle of γ = 30°. (cos 30° = 0.866, sin 30° = 0.5)

1. How much lift is required to sustain this climb?
2. How much of the weight is now acting backward along the flight path, which thrust has to additionally overcome?
3. If drag at this speed is 1,800 N, what total thrust is required?

You should land on: lift required = 20,000 × 0.866 = 17,320 N (less than the full weight); backward weight component = 20,000 × 0.5 = 10,000 N; total thrust required = drag + backward weight component = 1,800 + 10,000 = 11,800 N. Notice how much of the thrust requirement (10,000 of 11,800 N) is fighting gravity rather than drag — that's the direct cost of climbing, and it's the same vector-resolution skill you'll use again once Orbital Mechanics introduces resolving velocity vectors instead of force vectors.

## Study Resources
- **NASA Glenn Research Center — Beginner's Guide to Aeronautics** (grc.nasa.gov) — free, foundational, no-textbook-required explanations of the four forces of flight and climb performance
- **Anderson, *Introduction to Flight*** — the standard university-level aerospace engineering textbook; Chapters 1–2 cover exactly this foundational vector/Newton's-laws material
- **Khan Academy — Vectors and Newton's Laws** — free refresher if the vector-component math itself (not the aerospace application) needs review first
