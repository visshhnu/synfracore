# Spacecraft Systems & Mission Design — Overview

**Before you start:** [Orbital Mechanics & Astrodynamics](/academies/aerospace/orbital-mechanics/overview) and [Propulsion Systems](/academies/aerospace/propulsion-systems/overview) are assumed — this page reuses their worked figures directly.

Orbital Mechanics gave you the physics of getting from one orbit to another and computed a real LEO-to-GEO transfer costing 3.854 km/s of Δv. This page is where that number stops being a physics exercise and becomes an engineering input: what a real spacecraft is actually built of, and how its full mission Δv budget — not just one transfer — gets assembled.

**Analogy** — A spacecraft is like a delivery truck built around whatever cargo it's carrying: the payload (the actual mission instrument — a camera, an antenna, a science experiment) is the cargo, and everything else — power, navigation, communications, structure — is the truck itself, existing purely to keep that cargo alive, pointed the right way, and in contact with the ground. Engineers call this supporting structure the spacecraft "bus," deliberately borrowing the same word as a delivery vehicle.

## The Spacecraft Bus: Core Subsystems

```conceptgrid
{
  "boxes": [
    { "title": "Power", "description": "Solar panels + batteries -- generate and store power through eclipse", "color": "amber" },
    { "title": "ADCS", "description": "Attitude Determination and Control -- keeps the spacecraft pointed correctly", "color": "blue" },
    { "title": "Thermal Control", "description": "Radiators, insulation, heaters -- survives sunlight/shadow extremes", "color": "red" },
    { "title": "C&DH", "description": "Onboard computer -- executes commands, manages data, fault detection", "color": "purple" }
  ]
}
```

```
POWER            — solar panels generate power while in sunlight;
                    batteries store it for use during eclipse
                    (when Earth blocks the Sun) or peak demand.

ADCS (Attitude Determination and Control System) — keeps the
                    spacecraft pointed correctly: solar panels
                    toward the Sun, antenna toward Earth, payload
                    toward its target. Uses sensors (star trackers,
                    Sun sensors) to determine orientation and
                    actuators (reaction wheels, small thrusters) to
                    correct it.

THERMAL CONTROL  — space alternates between intense direct sunlight
                    and extreme cold in shadow; this subsystem keeps
                    every component within its safe operating
                    temperature range using radiators, insulation,
                    and heaters.

COMMUNICATIONS   — the link to ground control: transmits telemetry
                    (spacecraft health data) and payload data down,
                    receives commands up.

C&DH (Command and Data Handling) — the onboard computer: executes
                    commands, manages data flow between subsystems,
                    handles onboard fault detection.

STRUCTURE        — the physical frame holding everything together,
                    engineered to survive the specific launch loads
                    covered in Flight Mechanics & Structures'
                    load-factor content, plus the different loads of
                    the space environment itself.

PROPULSION (spacecraft-level, NOT the launch vehicle) — smaller
                    engines for station-keeping and attitude
                    adjustments once already in orbit. This is a
                    distinct system from the launch vehicle's main
                    propulsion (Propulsion Systems' thrust/Isp
                    content) — see the mission Δv budget below for
                    why that distinction matters.

PAYLOAD          — the actual reason the mission exists: a camera,
                    a communications relay, a science instrument.
                    Everything above exists to support this one
                    subsystem.
```

## The Full Mission Δv Budget — Not Just One Transfer

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Phase 1: Launch", "sublabel": "~9.4 km/s -- launch vehicle's job, not the spacecraft's", "color": "red" },
    { "label": "Phase 2: Orbital Transfer", "sublabel": "e.g. 3.854 km/s LEO-to-GEO Hohmann transfer", "color": "amber" },
    { "label": "Phase 3: Station-Keeping", "sublabel": "~50 m/s/year -- spacecraft's own onboard propulsion", "color": "green" }
  ]
}
```

```
A real mission's total Δv requirement is the SUM of several distinct
phases, each handled by a DIFFERENT propulsion system:

  PHASE 1 — Launch (surface to LEO): ~9.4 km/s (verified figure —
            noticeably more than the ~7.8 km/s orbital velocity
            alone, due to gravity losses during ascent and
            atmospheric drag). This is the LAUNCH VEHICLE's job —
            handled by staged rocket engines (Propulsion Systems'
            staging content), NOT carried by the spacecraft itself.

  PHASE 2 — Orbital transfer (e.g., LEO to GEO): the 3.854 km/s
            computed in Orbital Mechanics' worked Hohmann transfer
            example — reused here directly, not recalculated. This
            is typically handled by either the launch vehicle's
            upper stage or the spacecraft's own onboard apogee
            motor, depending on mission design.

  PHASE 3 — Station-keeping (ongoing, for the mission's operational
            life): a GEO satellite needs roughly 50 m/s of Δv per
            year (verified figure) to counteract perturbations from
            the Sun/Moon's gravity and Earth's slightly non-uniform
            shape, which would otherwise drift the satellite out of
            its assigned position. This is entirely the
            SPACECRAFT's own onboard propulsion — no launch vehicle
            or upper stage is involved once the mission is
            operational.

The key engineering insight: the SPACECRAFT itself only has to be
designed to carry the propellant for Phases 2 and 3, not Phase 1 —
which is why Propulsion Systems' staging discussion matters so much:
without staging dropping dead mass, no single vehicle could
efficiently carry enough propellant for all three phases in one
stage.
```

### Annotated Example — A Full Spacecraft-Level Δv Budget

A GEO communications satellite: LEO-to-GEO transfer (from Orbital Mechanics, reused directly) plus a 10-year design life.

```
Given:  Δv_transfer = 3,854 m/s (Orbital Mechanics' worked LEO→GEO
                       Hohmann transfer — NOT recalculated here)
        Station-keeping rate = 50 m/s/year (verified)
        Design life = 10 years

Apply:  Δv_station-keeping = 50 × 10 = 500 m/s
        Δv_spacecraft total = Δv_transfer + Δv_station-keeping
        Δv_spacecraft total = 3,854 + 500
        Δv_spacecraft total = 4,354 m/s (4.354 km/s)

Notice this 4.354 km/s is the SPACECRAFT's own propulsion budget —
it does NOT include the ~9.4 km/s launch-to-LEO figure, because that
phase belongs to the launch vehicle, not the satellite. Fundamentals
uses this 4.354 km/s figure directly to size how much propellant the
spacecraft itself needs to carry, via Propulsion's rocket equation.
```

## Try It (2 Minutes)

A different GEO satellite is designed for a 15-year operational life instead of 10, using the same LEO-to-GEO transfer (3,854 m/s) and the same 50 m/s/year station-keeping rate.

1. Compute the station-keeping Δv for the full 15-year life.
2. Compute the total spacecraft-level Δv budget.
3. Does a longer design life mainly increase the Phase 2 (transfer) cost, the Phase 3 (station-keeping) cost, or both — and why?

You should land on: Δv_station-keeping = 50 × 15 = 750 m/s; total = 3,854 + 750 = 4,604 m/s. A longer design life ONLY increases the Phase 3 station-keeping cost — Phase 2's transfer Δv is a one-time cost paid once, at the start of the mission, completely independent of how long the satellite operates afterward. This is exactly the kind of mission-design trade-off engineers weigh: a longer design life directly costs more propellant mass, which Fundamentals will show has a real, calculable weight and cost impact via the rocket equation.

## Study Resources
- **Wertz & Larson, *Space Mission Analysis and Design (SMAD)*** — the standard reference for spacecraft subsystems and mission Δv budgeting
- **NASA — "State of the Art of Small Spacecraft Technology"** (nasa.gov) — free, regularly updated overview of subsystem technology, useful context for how these subsystems are actually implemented today
- **ESA — geostationary station-keeping technical notes** — source for verifying the ~50 m/s/year station-keeping figure used above
