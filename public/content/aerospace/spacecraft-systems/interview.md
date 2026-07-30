# Spacecraft Systems & Mission Design — Interview Q&A

## Common Questions and Answers

**Q: What's the difference between the "payload" and the "bus" on a spacecraft?**

A: The payload is the actual reason the mission exists — a camera, a communications relay, a science instrument — the thing that produces the mission's real output. The bus is everything else: power, attitude control, thermal management, communications, command and data handling, structure, and propulsion. The bus exists purely to keep the payload alive, correctly oriented, and in contact with the ground; it produces no mission value on its own, the same way a delivery truck's engine and chassis don't matter to the customer, only the cargo does.

---

**Q: Why does a spacecraft need both solar panels AND batteries, not just one or the other?**

A: Solar panels only generate power while the spacecraft is in sunlight, but most orbits pass through eclipse — a period where Earth blocks the Sun — for some fraction of every orbit. During eclipse, solar panels produce nothing, so the spacecraft has to run entirely on stored battery power. Solar panels alone can't cover the eclipse periods, and batteries alone would drain permanently with no way to recharge; the two subsystems are complementary, not redundant with each other.

---

**Q: Why is launch-to-orbit propulsion handled by a separate vehicle instead of just being part of the spacecraft?**

A: The Δv required just to reach low Earth orbit from the ground — roughly 9.4 km/s, once gravity and drag losses are included — is enormous compared to what a spacecraft needs for the rest of its mission (a few km/s at most for orbital transfers and station-keeping). Carrying enough propellant for the full 9.4 km/s launch job as part of the spacecraft itself, without staging, would make the vehicle overwhelmingly propellant and structure rather than payload — Propulsion's staging discussion is exactly why a separate, staged launch vehicle drops that massive propellant/structure burden before the spacecraft is even in orbit, rather than the spacecraft dragging launch-stage mass along for its entire operational life.

---

**Q: What does ADCS (Attitude Determination and Control System) actually do, and why does it matter this much?**

A: It keeps the spacecraft correctly oriented — solar panels facing the Sun to generate power, antennas facing Earth to communicate, payload instruments facing their intended target. It works in two parts: sensors (star trackers, Sun sensors) that determine which way the spacecraft is currently pointed, and actuators (reaction wheels, small thrusters) that correct its orientation when it drifts. Without functioning ADCS, a spacecraft can lose power (panels facing the wrong way), lose communication (antenna facing the wrong way), or fail its mission entirely (payload pointed at the wrong target) even if every other subsystem works perfectly.

---

**Q: Why does a satellite need ongoing station-keeping propellant instead of just staying where it's placed?**

A: Orbits aren't perfectly stable over long timescales — perturbations from the Sun and Moon's gravity, and from Earth's slightly non-spherical shape, gradually drift a satellite away from its assigned orbital position. For a geostationary satellite specifically, this shows up mainly as a slow drift in inclination (needing correction roughly every two weeks) and a smaller longitude drift. Left uncorrected, the satellite would drift out of its useful position entirely — station-keeping propellant exists specifically to counteract this ongoing drift for the mission's full operational life, which is why it scales directly with design life, unlike the one-time orbital transfer cost.

---

**Q: When mission planners increase a satellite's design life from, say, 10 to 15 years, what actually has to change in the spacecraft's design?**

A: Primarily, more station-keeping propellant has to be carried, since that cost scales linearly with mission duration (roughly 50 m/s per year for a GEO satellite) — a longer design life directly means more propellant mass at launch, which per the rocket equation means a larger, heavier, more expensive vehicle for the same dry mass and payload. The one-time costs, like the orbital transfer itself, don't change at all with design life. This is exactly why "how long should this mission last" is a real design trade-off with a calculable propellant and cost impact, not just a marketing number.

## Study Resources
- **Wertz & Larson, *Space Mission Analysis and Design (SMAD)*** — the standard reference for spacecraft subsystem design and mission Δv budgeting referenced throughout this Q&A set
- **NASA — "State of the Art of Small Spacecraft Technology"** (nasa.gov) — free, regularly updated overview of how these subsystems are implemented in real missions
