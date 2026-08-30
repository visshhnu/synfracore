# Orbital Mechanics & Astrodynamics — Overview

**Before you start:** [Aerospace Foundations](/academies/aerospace/aerospace-foundations/overview) (vectors, Newton's laws) is assumed — the aeronautical technologies (Aerodynamics, Propulsion, Flight Mechanics) are useful context but not strictly required for this astronautical branch.

Everything so far in this academy has been about flight within the atmosphere. This is where the "space" branch starts: how an object stays in orbit at all, described first by Johannes Kepler nearly 400 years before the first satellite ever flew, and still exactly how mission planners calculate real orbits today.

**Analogy** — Picture someone on a playground swing holding a rope with a weight on the end, reeling the rope in and letting it out as the weight swings around them. Reel the rope in (get closer) and the weight whips around fast; let it out (get farther) and it drifts slowly. A planet or satellite does the same thing on its elliptical path around a central body — moving fast when close, slow when far — and Kepler's Second Law is just the precise statement of HOW MUCH faster or slower: exactly enough that a line from the central body to the orbiting object sweeps out equal areas in equal time, everywhere on the orbit.

## Kepler's Three Laws

```conceptgrid
{
  "boxes": [
    { "title": "First Law", "description": "Orbits are ellipses -- the central body sits at one focus, not the center", "color": "blue" },
    { "title": "Second Law", "description": "Equal areas swept in equal time -- fastest at perigee, slowest at apogee", "color": "purple" },
    { "title": "Third Law", "description": "T^2 proportional to a^3 -- farther orbits take dramatically longer", "color": "green" }
  ]
}
```

```
FIRST LAW — orbits are ellipses, not circles, with the central body
  (Earth, the Sun, etc.) at one FOCUS of the ellipse, not the
  center. A circular orbit is just the special case where the
  ellipse's two foci coincide.

SECOND LAW — a line from the central body to the orbiting object
  sweeps out equal areas in equal time. This is why an object moves
  fastest at PERIGEE (closest point, for Earth orbits) and slowest
  at APOGEE (farthest point) — not a coincidence, but a direct
  consequence of this law (and, physically, of conservation of
  angular momentum).

THIRD LAW — the square of the orbital period is proportional to the
  cube of the semi-major axis:
    T² = (4π² / μ) · a³
  Where μ (mu) is the central body's standard gravitational
  parameter (μ = G·M — Earth's value, μ = 398,600 km³/s², is used
  throughout this page). This is why farther orbits take
  dramatically longer to complete than close ones — not linearly
  longer, but by a cube-root relationship.
```

## Circular Orbital Velocity — The Foundational Equation

```
For the special case of a CIRCULAR orbit at radius r from the
center of the body being orbited:
  v = √(μ / r)

And the corresponding orbital period:
  T = 2π · √(r³ / μ)

Why an orbiting object doesn't need continuous thrust to "stay up":
this is genuinely just Foundations' F = ma applied to free-fall. The
object IS constantly falling toward Earth under gravity — but it's
also moving sideways fast enough that the curve of its fall matches
the curve of the Earth falling away beneath it. It never gets
closer, never needs an engine running, because it's in continuous
free-fall along a curved path, not "floating."
```

### Annotated Example — A Real Low Earth Orbit

The International Space Station orbits at roughly 400 km altitude (its actual altitude varies over time due to atmospheric drag and periodic reboosts — this is a representative figure, not a fixed constant; needs verification against current tracking data for an exact live value).

```
Given:  μ (Earth) = 398,600 km³/s²
        Earth radius = 6,378 km
        Altitude = 400 km
        r = 6,378 + 400 = 6,778 km

Apply:  v = √(μ / r)
        v = √(398,600 / 6,778)
        v = √58.81
        v ≈ 7.669 km/s

Period: T = 2π · √(r³ / μ)
        T = 2π · √(6,778³ / 398,600)
        T ≈ 5,554 s ≈ 92.6 minutes

Verified against published figures: real ISS orbital speed is
reported at approximately 7.67 km/s with a period of roughly 92.4
minutes — the small difference from this idealized calculation
(92.6 vs 92.4 min) reflects that this is a simplified circular-orbit
model using round input numbers, not the ISS's exact real-time orbit
(which is elliptical to a small degree and continuously perturbed).
```

## Try It (2 Minutes)

A satellite orbits Earth in a circular orbit at 700 km altitude (r = 6,378 + 700 = 7,078 km).

1. Compute its orbital velocity using v = √(μ/r).
2. Compute its orbital period using T = 2π·√(r³/μ), and convert to minutes.
3. Is this satellite moving faster or slower than the ISS-altitude example above — does that match Kepler's Third Law's prediction that higher orbits take longer (and therefore, for a roughly similar-shaped orbit, move slower)?

You should land on: v = √(398,600/7,078) ≈ 7.504 km/s; T ≈ 5,926 s ≈ 98.8 minutes. This satellite is slower and takes longer to complete an orbit than the ISS example (7.504 km/s and 98.8 min, vs. 7.669 km/s and 92.6 min) — consistent with Kepler's Third Law: a larger semi-major axis (higher altitude) means a longer period, and for circular orbits that also means a lower orbital speed.

## Study Resources
- **NASA Glenn Research Center — Beginner's Guide to Orbits** (grc.nasa.gov) — free, foundational coverage of Kepler's laws and circular orbital velocity
- **Curtis, *Orbital Mechanics for Engineering Students*** — the standard university-level astrodynamics textbook, source for the equations used throughout this technology
- **NASA — International Space Station facts page** (nasa.gov) — for current ISS altitude/speed figures if a live, up-to-date number is needed rather than this page's representative example
