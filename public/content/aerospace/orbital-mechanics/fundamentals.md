# Orbital Mechanics & Astrodynamics — Fundamentals

Overview covered Kepler's laws and circular orbital velocity — enough to describe a simple circular orbit's speed and period. This page covers how astrodynamicists precisely describe ANY orbit (not just circular ones), the velocity needed to leave an orbit entirely, and the two-burn maneuver — the Hohmann transfer — used to move a spacecraft from one orbit to another, which is where Propulsion's rocket equation gets used for real.

**Analogy** — Knowing "the satellite is in an elliptical orbit around Earth" is like knowing someone "lives somewhere in a big city" — technically true, but useless for actually finding them. The six classical orbital elements are the full street address: which specific ellipse (its size and shape), tilted which way in space, rotated which way within that tilt, and where exactly along the ellipse the object sits right now.

## The Six Classical Orbital Elements

```
SIZE AND SHAPE of the ellipse:
  a  (semi-major axis)   — half the ellipse's longest diameter;
                            sets the orbit's overall size and,
                            via Kepler's Third Law, its period
  e  (eccentricity)      — how "squashed" the ellipse is
                            e = 0        → perfect circle
                            0 < e < 1    → ellipse
                            e = 1        → parabolic escape path
                            e > 1        → hyperbolic escape path
                            (these last two aren't closed orbits at
                            all — the object leaves and never
                            returns; see escape velocity below)

ORIENTATION of the orbital plane in 3D space:
  i  (inclination)       — the tilt of the orbital plane relative
                            to the reference plane (Earth's equator,
                            for Earth orbits)
  Ω  (RAAN — right ascension of the ascending node) — WHERE around
                            the equator the orbital plane crosses
                            from south to north

ORIENTATION of the ellipse WITHIN that tilted plane:
  ω  (argument of periapsis) — which direction, within the orbital
                            plane, the closest point (periapsis)
                            points toward

POSITION of the object RIGHT NOW along its orbit:
  ν  (true anomaly)      — the object's current angular position
                            along the ellipse, measured from
                            periapsis

Six numbers, six independent pieces of information — together they
fully and uniquely describe both the shape/size of an orbit AND
exactly where an object sits on it at a given moment.
```

## Escape Velocity

```
v_escape = √(2μ / r)

Compare this directly to Overview's circular orbital velocity,
v = √(μ/r) — escape velocity is EXACTLY √2 times the circular
velocity at the same radius, every time, for any body:
  v_escape = √2 · v_circular

At Earth's surface (r = 6,378 km):
  v_circular  ≈ 7.905 km/s (the speed a surface-skimming circular
                orbit would need — not physically achievable at the
                surface due to the atmosphere and terrain, but
                mathematically the reference point)
  v_escape    ≈ 11.18 km/s (verified: this matches the commonly
                cited Earth escape velocity figure of approximately
                11.2 km/s)

Physically: escape velocity is the speed at which an object's
kinetic energy exactly cancels the gravitational potential energy
pulling it back — reach it, and the object never returns (e = 1,
a parabolic trajectory, from the eccentricity table above).
```

## The Hohmann Transfer — Moving Between Two Orbits

```
The most fuel-efficient way (in terms of total Δv, though not the
fastest in TIME) to move between two circular orbits, when both
orbits are coplanar, is a two-burn maneuver:

  BURN 1 — at the starting circular orbit, speed up just enough to
           enter an elliptical TRANSFER orbit whose low point
           (periapsis) touches the starting orbit and whose high
           point (apoapsis) touches the target orbit.
  COAST  — travel along the transfer ellipse, no thrust, exactly
           half an orbit (periapsis to apoapsis).
  BURN 2 — at apoapsis (now at the target orbit's altitude), speed
           up again to circularize into the target orbit.

Each burn's required Δv comes from the VIS-VIVA EQUATION, which
gives velocity at any point in an orbit given its semi-major axis:
  v² = μ · (2/r - 1/a)

Where a is the semi-major axis of the transfer ellipse itself:
  a_transfer = (r1 + r2) / 2   (average of the two orbit radii)
```

### Annotated Example — Hohmann Transfer from Low Earth Orbit to Geostationary Orbit

Transferring from the 400 km-altitude LEO orbit used in Overview (r1 = 6,778 km) to geostationary orbit (r2 = 42,164 km — verified: this is the standard, correctly cited GEO radius).

```
Given:  μ = 398,600 km³/s²
        r1 = 6,778 km (LEO)
        r2 = 42,164 km (GEO)
        a_transfer = (6,778 + 42,164) / 2 = 24,471 km

BURN 1 (at r1, entering the transfer ellipse):
  Circular velocity at r1:        v1 = √(μ/r1) = 7.669 km/s
                                   (same number as Overview's ISS
                                   example — same radius)
  Transfer-ellipse velocity at r1: v_t1 = √(μ·(2/r1 - 1/a_transfer))
                                   = 10.066 km/s
  Δv1 = v_t1 - v1 = 10.066 - 7.669 = 2.398 km/s

BURN 2 (at r2, circularizing into GEO):
  Transfer-ellipse velocity at r2: v_t2 = √(μ·(2/r2 - 1/a_transfer))
                                   = 1.618 km/s
  Circular velocity at r2:        v2 = √(μ/r2) = 3.075 km/s
  Δv2 = v2 - v_t2 = 3.075 - 1.618 = 1.457 km/s

TOTAL MISSION Δv REQUIRED:
  Δv_total = Δv1 + Δv2 = 2.398 + 1.457 = 3.854 km/s

This is the exact number a mission planner hands to Propulsion's
Tsiolkovsky rocket equation (Δv = Isp·g0·ln(m0/mf)) to check whether
a specific stage, with a specific Isp and mass ratio, can actually
deliver this mission. Propulsion's worked example used a stage
capable of roughly 5.4 km/s — comfortably more than the 3.854 km/s
this transfer requires, meaning that stage COULD complete this exact
LEO-to-GEO transfer with propellant to spare.
```

## Try It (2 Minutes)

A mission needs to transfer from the same LEO orbit (r1 = 6,778 km) to a lower target orbit than GEO — a circular orbit at r2 = 20,000 km. (a_transfer = (6,778 + 20,000)/2 = 13,389 km)

1. Using the vis-viva equation, is the required Δv for this transfer likely to be more or less than the LEO-to-GEO example's 3.854 km/s, given that the target orbit is much closer than GEO?
2. The precomputed answer for this transfer is Δv1 ≈ 1.704 km/s and Δv2 ≈ 1.288 km/s. What's the total Δv, and does it match your prediction in question 1?

You should land on: total Δv = 1.704 + 1.288 = 2.992 km/s — noticeably less than the 3.854 km/s LEO-to-GEO transfer, matching the intuition that a smaller change in orbit radius should generally cost less total Δv than a much larger one. This is exactly the kind of Δv comparison real mission planners do before committing to a specific target orbit — the orbit itself has a direct propellant cost, verifiable through Propulsion's rocket equation.

## Study Resources
- **Curtis, *Orbital Mechanics for Engineering Students*** — the standard reference for orbital elements, the vis-viva equation, and Hohmann transfers, source for the equations used throughout this page
- **NASA Glenn Research Center — Beginner's Guide to Orbits** (grc.nasa.gov) — free coverage of escape velocity and basic transfer concepts
- **NASA — geostationary orbit reference data** (nasa.gov) — source for the verified GEO radius (42,164 km) used in the worked example
