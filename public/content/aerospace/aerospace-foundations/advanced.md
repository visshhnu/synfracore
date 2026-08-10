# Aerospace Foundations — Advanced

Every calculation so far has implicitly assumed an INERTIAL reference frame — one that isn't itself accelerating or rotating, where Newton's laws apply directly in their simplest form. This page introduces what changes in a ROTATING (non-inertial) frame — the frame an object moving in a circle actually experiences — and why this matters directly for orbital mechanics, aircraft turns, and pilot/astronaut G-force training.

**Analogy** — Standing still on solid ground is an inertial frame — drop a ball, it falls straight down, exactly as F = ma predicts with no surprises. Standing on a spinning merry-go-round is a rotating, non-inertial frame — drop the same ball, and from YOUR spinning point of view, it seems to curve away, as if some mysterious outward force were pushing it, even though no such force is actually acting on the ball. That apparent, not-really-there force is what physicists call a "fictitious force" (centrifugal force is the most common example) — it's not a real force, it's what accounting for your own rotation looks like from the inside.

## Centripetal Acceleration — the Real Force Behind Circular Motion

```
An object moving in a circle at constant SPEED is still ACCELERATING
-- not because its speed is changing, but because its DIRECTION is
constantly changing, and acceleration is any change in velocity
(a vector), not just a change in speed.

CENTRIPETAL ACCELERATION -- always points TOWARD the center of the
circle, magnitude:
  a_c = v² / r        (in terms of speed v and radius r)
  a_c = ω² · r         (in terms of angular velocity ω and radius r)
  v = ω · r             (relates the two forms)

This is a REAL acceleration, requiring a REAL force (centripetal
force, F = m·a_c) to actually produce it -- gravity, for an orbiting
satellite (Orbital Mechanics' entire subject); lift's horizontal
component, for a banked aircraft turn (Flight Mechanics' subject);
the mechanical arm, for a human centrifuge.
```

## The Rotating-Frame Illusion: Centrifugal "Force"

```
From an INERTIAL (outside, non-rotating) viewpoint: an object in
circular motion is being pulled INWARD by a real centripetal force
-- nothing pushes it outward.

From the ROTATING frame's OWN viewpoint (e.g., a pilot's perspective
inside a turning aircraft, or a person on a centrifuge): it FEELS
like an outward force is pressing them against the outer wall/seat.
This felt force is called CENTRIFUGAL force -- it is not a real,
separately-acting force; it's the fictitious force that has to be
added to make Newton's laws appear to work correctly when analyzing
motion FROM WITHIN a rotating frame, rather than from an inertial
one outside it.

Both descriptions are self-consistent and give the same physical
predictions -- they're just different bookkeeping choices for the
same real physics, exactly the way choosing a different coordinate
system doesn't change the underlying physical answer.
```

### Annotated Example — A Human Centrifuge for G-Force Training

A pilot-training centrifuge has an arm radius of 8 m, spinning at a constant angular velocity of 3 rad/s.

```
Given:  r = 8 m, ω = 3 rad/s

Step 1 -- tangential speed:
  v = ω · r = 3 × 8 = 24 m/s

Step 2 -- centripetal acceleration:
  a_c = ω² · r = 3² × 8 = 9 × 8 = 72 m/s²

Step 3 -- express as a multiple of standard gravity (g = 9.81 m/s²),
the standard way G-force is reported:
  G's = a_c / g = 72 / 9.81 = 7.34 g

Verified computationally: a pilot in this centrifuge experiences
7.34 times their normal body weight, pressed outward against their
seat -- a real, physically demanding acceleration used specifically
because it simulates the sustained G-forces of a high-performance
aircraft's hard turn or a spacecraft's launch/re-entry, both of which
this academy's later technologies (Flight Mechanics, Spacecraft
Systems) return to in their own specific contexts. `(needs
verification — recheck against current source: real human centrifuge
training programs' typical operating G-levels vary by program and
purpose — treat 7.34g here as a representative, physically realistic
value for this worked example, not a fixed industry-standard figure)`
```

## Try It (2 Minutes)

A different centrifuge has an arm radius of 10 m, spinning at 2.5 rad/s.

1. Compute the tangential speed.
2. Compute the centripetal acceleration.
3. Express the result in g's, and compare it to the 7.34g annotated example — is this centrifuge configuration more or less demanding?

You should land on: v = 2.5 × 10 = 25 m/s; a_c = 2.5² × 10 = 6.25 × 10 = 62.5 m/s²; G's = 62.5/9.81 = 6.37g — LESS demanding than the annotated example's 7.34g, despite this centrifuge having a LARGER radius, because angular velocity is squared in the centripetal acceleration formula while radius only appears to the first power — a smaller angular velocity has an outsized effect on reducing the resulting G-force, even with a longer arm.

## Study Resources
- **Anderson, *Introduction to Flight*** — covers reference frames and centripetal acceleration in the context of aircraft turning performance
- **NASA — "Human Centrifuge" resources** (nasa.gov) — background on real G-force training and its physiological purpose, connecting directly to this page's worked example
- **Marion & Thornton, *Classical Dynamics of Particles and Systems*** — the standard, more advanced reference for rotating reference frames and fictitious forces (centrifugal, Coriolis) if deeper mathematical treatment is needed later
