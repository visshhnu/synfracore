# Orbital Mechanics & Astrodynamics — Intermediate

Fundamentals' Hohmann transfer changes an orbit's SIZE (radius) while staying in the same orbital plane. This page covers the other fundamental kind of orbital change — a PLANE change (inclination change) — and shows why it's dramatically more expensive at low altitude than at high altitude, a real, practical reason real missions often combine plane changes with a Hohmann transfer's second burn rather than doing them separately.

**Analogy** — Changing an orbit's radius (Hohmann transfer) is like changing lanes on a straight highway — you speed up or slow down, and gradually merge to a different lane, but you're still driving in the same direction. A plane change is like turning onto a completely different road at an angle — no amount of speeding up or slowing down alone gets you there; you have to physically redirect your velocity vector itself, which costs dramatically more effort (Δv) the faster you're currently going, the same way a sharp turn is far more violent at highway speed than crawling through a parking lot.

## The Plane Change Formula

```
A pure plane change (changing inclination by Δi, at a point where
orbital speed is v, with no change in orbit SIZE) requires:

  Δv_plane = 2 · v · sin(Δi / 2)

This is fundamentally different from Hohmann's Δv (which changes
speed along the SAME direction) -- a plane change has to redirect
the ENTIRE velocity vector by angle Δi, which is why the formula
involves the vector geometry of two equal-magnitude velocities
separated by angle Δi (hence the sin(Δi/2) term, from the law of
cosines applied to two equal-length vectors).

CRITICAL INSIGHT: Δv_plane scales directly with v, the LOCAL orbital
speed at the point where the plane change happens. This means the
SAME angular plane change costs dramatically more Δv at a fast, low
orbit than at a slow, high orbit.
```

### Annotated Example — Plane Change at GEO vs. at LEO

Compare the Δv cost of a 5° plane change performed at GEO altitude (v ≈ 3.075 km/s) versus a 10° plane change performed at LEO altitude (v ≈ 7.669 km/s, Overview's ISS-altitude speed).

```
GEO plane change (5°, v = 3.075 km/s):
  Δv = 2 × 3.075 × sin(5°/2)
  Δv = 2 × 3.075 × sin(2.5°)
  Δv = 2 × 3.075 × 0.0436
  Δv ≈ 0.268 km/s

LEO plane change (10°, v = 7.669 km/s):
  Δv = 2 × 7.669 × sin(10°/2)
  Δv = 2 × 7.669 × sin(5°)
  Δv = 2 × 7.669 × 0.0872
  Δv ≈ 1.337 km/s

Verified computationally: even though the LEO example's angle (10°)
is only DOUBLE the GEO example's angle (5°), its Δv cost (1.337
km/s) is roughly FIVE TIMES higher -- not because the angle is
bigger, but because LEO's orbital speed is roughly 2.5× GEO's, and
that speed directly multiplies the plane-change cost. This is
exactly why real missions needing both a large radius change AND a
plane change (a satellite launched from a non-equatorial site into
GEO, for example) typically combine the plane change with the
Hohmann transfer's SECOND burn, at apoapsis -- where speed is at its
LOWEST point in the transfer, making the otherwise-expensive plane
change dramatically cheaper.
```

## Try It (2 Minutes)

A mission needs an 8° plane change. Compare performing it at LEO altitude (v = 7.669 km/s) versus at a much higher orbit where v = 2.0 km/s.

1. Compute the Δv cost at LEO altitude.
2. Compute the Δv cost at the higher, slower orbit.
3. By roughly what factor is the higher-orbit plane change cheaper?

You should land on: LEO: Δv = 2 × 7.669 × sin(4°) = 2 × 7.669 × 0.0698 ≈ 1.070 km/s. Higher orbit: Δv = 2 × 2.0 × sin(4°) = 2 × 2.0 × 0.0698 ≈ 0.279 km/s. The higher-orbit plane change is roughly 3.8× cheaper (1.070/0.279 ≈ 3.8) — directly proportional to the ratio of the two speeds (7.669/2.0 ≈ 3.8), confirming the formula's core insight: for the SAME angle, Δv cost scales linearly with local orbital speed, which is the entire reason altitude matters so much for plane-change economics.

## Study Resources
- **Curtis, *Orbital Mechanics for Engineering Students*** — the standard reference for plane-change maneuvers and combined maneuver strategies
- **NASA Glenn Research Center — Beginner's Guide to Orbits** (grc.nasa.gov) — free coverage of orbital maneuver types including plane changes
- **Vallado, *Fundamentals of Astrodynamics and Applications*** — a more advanced reference covering optimal combined-maneuver strategies (splitting a plane change across multiple burns) beyond this page's single-maneuver scope
