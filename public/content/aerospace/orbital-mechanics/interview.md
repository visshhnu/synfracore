# Orbital Mechanics & Astrodynamics — Interview Q&A

## Common Questions and Answers

**Q: Why doesn't a satellite in orbit need its engine running to stay up?**

A: A satellite in orbit is genuinely in continuous free-fall — gravity is pulling it toward Earth the whole time, exactly as Foundations' F = ma would predict for any falling object. What keeps it from actually hitting the ground is that it's also moving sideways fast enough that the curve of its fall matches the curve of the Earth's surface falling away beneath it. It never needs thrust to "hold itself up" because it isn't fighting gravity — it's falling continuously along a path that happens to be a closed curve around the planet.

---

**Q: Why are orbits ellipses instead of circles?**

A: Kepler's First Law establishes that orbits are ellipses with the central body at one focus, not the center — a circle is simply the special case where the ellipse's eccentricity is zero. Physically, any combination of orbital speed and direction that doesn't produce exactly the right speed for a perfect circle at that radius will naturally produce some degree of ellipse instead; a perfect circular orbit is actually the more special, harder-to-achieve case, not the default.

---

**Q: What's the practical difference between orbital velocity and escape velocity?**

A: Orbital velocity (specifically circular orbital velocity, v = √(μ/r)) is the speed needed to stay in a closed loop around a body at a given radius, neither climbing away nor falling in. Escape velocity (v = √(2μ/r)) is exactly √2 times that — the speed at which an object's kinetic energy is enough to completely overcome the body's gravitational pull, so it leaves and never comes back, following a parabolic (or, above escape velocity, hyperbolic) trajectory rather than a closed ellipse.

---

**Q: Why do orbital mechanics need six numbers (the orbital elements) just to describe one orbit?**

A: Because fully specifying an orbit in three-dimensional space requires answering several independent questions: how big and how elongated is the ellipse (semi-major axis and eccentricity — 2 numbers), how is the orbital plane tilted in space (inclination and RAAN — 2 more), which direction within that tilted plane does the ellipse point (argument of periapsis — 1 more), and where exactly is the object right now along that path (true anomaly — the 6th). Each answers a genuinely different question; dropping any one of them leaves the orbit's description incomplete.

---

**Q: Why does a Hohmann transfer use two separate burns instead of one continuous burn?**

A: A Hohmann transfer is specifically optimized to minimize total propellant use (Δv), not travel time, and the two-impulsive-burn shape is what achieves that minimum for a transfer between two circular, coplanar orbits. The first burn only changes the orbit's shape (from circular to an elliptical transfer orbit) — coasting along that ellipse costs no propellant at all, exactly like a thrown ball coasting under gravity between the throw and the catch. The second burn, at the far end, circularizes into the new target orbit. A single continuous burn covering the same distance would generally require more total Δv to achieve the same result.

---

**Q: What makes geostationary orbit special, and why is it at exactly one specific altitude (about 35,786 km / 42,164 km radius)?**

A: A geostationary orbit is a circular equatorial orbit whose period exactly matches Earth's rotation period (one sidereal day) — so from the ground, a satellite there appears to hang motionless in the sky, which is extremely valuable for communications and weather satellites. Because Kepler's Third Law fixes a specific relationship between orbital period and semi-major axis (T² = 4π²a³/μ), matching Earth's exact rotation period pins down one specific radius — you can't choose an arbitrary altitude and still get a 24-hour period; the physics only allows one.

## Study Resources
- **NASA Glenn Research Center — Beginner's Guide to Orbits** (grc.nasa.gov) — free source for the free-fall, orbital-velocity, and escape-velocity explanations above
- **Curtis, *Orbital Mechanics for Engineering Students*** — standard reference for orbital elements and Hohmann transfer mechanics referenced throughout this Q&A set
