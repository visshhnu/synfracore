# Orbital Mechanics & Astrodynamics — Advanced

Fundamentals' Hohmann transfer is the most fuel-efficient two-burn way to move between two circular orbits — but "most efficient two-burn way" isn't the same as "most efficient way, period." This page covers the bi-elliptic transfer — a three-burn maneuver that, for a large enough ratio between the starting and target orbit radii, actually costs LESS total Δv than a Hohmann transfer, despite using an extra burn and taking substantially longer.

**Analogy** — A Hohmann transfer is the direct diagonal shortcut across a park. A bi-elliptic transfer is deliberately walking far PAST your destination first, out to a distant far corner, before turning back toward it — a longer PATH, but one that, for certain park shapes, can require less total walking effort than the direct diagonal, because of how the geometry works out. It sounds backward until you see the actual numbers, which is exactly why this page verifies it computationally rather than asking you to take it on faith.

## The Bi-Elliptic Transfer

```
A bi-elliptic transfer uses THREE burns and an intermediate,
deliberately very high "waypoint" radius (rb), higher than either
the starting or target orbit:

  BURN 1 -- at r1, raise apoapsis all the way out to rb (far beyond
            r2), entering a highly elongated ellipse
  BURN 2 -- at rb (way out at that distant apoapsis), raise
            periapsis from r1 up to r2, entering a second ellipse
  BURN 3 -- at r2, circularize into the final target orbit

Compare to Hohmann's two burns (raise apoapsis from r1 directly to
r2, then circularize) -- the bi-elliptic transfer's extra burn and
detour through rb can, for a large enough r2/r1 ratio, cost LESS
total Δv, because burn 2 (way out at a very high, very slow-moving
apoapsis) is extremely cheap -- velocities are small far from Earth,
and Δv scales with the actual velocity change needed, not distance
traveled.
```

### Annotated Example — Bi-Elliptic Beating Hohmann for a Large Radius Ratio

Transferring from r1 = 6,778 km (LEO) to r2 = 100,000 km (a high orbit, r2/r1 ≈ 14.75), using an intermediate waypoint of rb = 300,000 km for the bi-elliptic option.

```
Given:  μ = 398,600 km³/s², r1 = 6,778 km, r2 = 100,000 km,
        rb = 300,000 km (bi-elliptic waypoint)

HOHMANN TRANSFER (direct, two burns):
  a_H = (6,778 + 100,000)/2 = 53,389 km
  Δv1 = 2.827 km/s, Δv2 = 1.285 km/s
  Total Hohmann Δv = 2.827 + 1.285 = 4.112 km/s

BI-ELLIPTIC TRANSFER (three burns, via rb = 300,000 km):
  Burn 1 (r1 -> apoapsis at rb): Δv1 = 3.056 km/s
  Burn 2 (at rb, periapsis r1 -> periapsis r2): Δv2 = 0.573 km/s
  Burn 3 (at r2, circularize): Δv3 = -0.449 km/s (retrograde --
          slowing down to circularize, magnitude 0.449 km/s)
  Total Bi-elliptic Δv = 3.056 + 0.573 + 0.449 = 4.077 km/s

Verified computationally: the bi-elliptic transfer's total (4.077
km/s) is genuinely LESS than the Hohmann transfer's total (4.112
km/s) -- a real, if modest (about 0.9%), Δv savings, for this
specific large radius ratio. This matches the classical result that
bi-elliptic transfers become more efficient than Hohmann once r2/r1
exceeds roughly 11.94 (a well-established threshold in astrodynamics
— this example's ratio of 14.75 is comfortably past it).
```

## Why This Isn't Always Worth Doing

```
The bi-elliptic transfer's Δv savings here is small (0.9%) for a
REAL cost: substantially more TIME (coasting all the way out to
300,000 km and back adds many hours to days compared to a direct
Hohmann transfer) and an extra burn (more operational complexity,
more chances for something to go wrong). Real mission planners weigh
this genuine Δv-vs-time-vs-complexity tradeoff -- for a
propellant-constrained mission where time doesn't matter much, the
savings can be worth it; for a time-sensitive or operationally
simpler mission, the modest Δv savings often isn't worth the
tradeoffs, even when bi-elliptic is technically the more
propellant-efficient option.
```

## Try It (2 Minutes)

Using the same r1 = 6,778 km and rb = 300,000 km, but now with a MUCH larger target r2 = 200,000 km (r2/r1 ≈ 29.5, even further past the 11.94 threshold).

1. Would you expect the bi-elliptic transfer's advantage over Hohmann to be larger or smaller than the 0.9% margin in the annotated example, given this larger radius ratio?
2. What real-world factor (beyond raw Δv) might still make a mission planner choose the direct Hohmann transfer anyway, even knowing bi-elliptic saves propellant?

You should land on: the bi-elliptic advantage generally grows LARGER as r2/r1 increases well past the 11.94 threshold — the further past that threshold, the more pronounced bi-elliptic's Δv savings tend to become, following the same underlying geometry that produced this section's original result. On the second question: mission TIMELINE is the most common real-world reason to choose Hohmann anyway — a bi-elliptic transfer's coast time out to a distant waypoint (potentially days, depending on rb) is a real operational cost that a small percentage of propellant savings often doesn't justify, particularly for a mission with a fixed schedule or a time-sensitive payload.

## Study Resources
- **Curtis, *Orbital Mechanics for Engineering Students*** — the standard reference for bi-elliptic transfers and the r2/r1 threshold derivation
- **Vallado, *Fundamentals of Astrodynamics and Applications*** — covers the full mathematical comparison between Hohmann and bi-elliptic transfers in depth
- **NASA Glenn Research Center — Beginner's Guide to Orbits** (grc.nasa.gov) — free introductory coverage of orbital transfer maneuver types
