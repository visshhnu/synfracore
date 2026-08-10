# Spacecraft Systems & Mission Design — Installation

## What You're Setting Up

Overview's mission Δv budget (summing transfer and station-keeping phases) is closed-form and hand-calculable. This section sets up a Python environment for Δv-budget and propellant-mass calculations, connecting this guide's Δv figures to Propulsion Systems' rocket equation — a preview of what Fundamentals in this guide does more formally.

## Install Python

```bash
python3 --version
pip install numpy
```

## Verify Your Setup — Recompute Overview's Mission Δv Budget

This reproduces Overview's worked example (3,854 m/s transfer + 50 m/s/year station-keeping over 10 years).

```python
def mission_delta_v(transfer_dv, station_keeping_rate, design_life_years):
    station_keeping_dv = station_keeping_rate * design_life_years
    total_dv = transfer_dv + station_keeping_dv
    return station_keeping_dv, total_dv

sk_dv, total_dv = mission_delta_v(transfer_dv=3854, station_keeping_rate=50, design_life_years=10)
print(f"Station-keeping Δv = {sk_dv} m/s")
print(f"Total spacecraft Δv = {total_dv} m/s")
```

```
Expected output:
Station-keeping Δv = 500 m/s
Total spacecraft Δv = 4354 m/s

Matches Overview's hand-computed 4,354 m/s exactly.
```

## A Second Check — From Δv Budget to Propellant Mass Fraction

A genuinely new calculation, previewing what Fundamentals does formally: given a Δv budget, the rocket equation (Propulsion Systems' subject) determines what fraction of the spacecraft's mass has to be propellant to achieve it.

```python
import math

def propellant_mass_fraction(delta_v, isp, g0=9.80665):
    mass_ratio = math.exp(delta_v / (isp * g0))
    prop_fraction = 1 - (1 / mass_ratio)
    return mass_ratio, prop_fraction

# Using the 4354 m/s spacecraft Δv budget above, with a representative
# bipropellant apogee motor Isp of 300 seconds
mass_ratio, prop_frac = propellant_mass_fraction(delta_v=4354, isp=300)
print(f"Mass ratio = {mass_ratio:.3f}")
print(f"Propellant mass fraction = {prop_frac*100:.1f}%")
```

```
Expected output:
Mass ratio = 4.393
Propellant mass fraction = 77.2%

This is a real, meaningful engineering result: roughly 77% of the
spacecraft's mass (at the start of its propulsive life, before any
station-keeping burns) has to be propellant just to achieve THIS
mission's Δv budget — a concrete, numeric illustration of why
mission Δv budgeting (this guide) and propellant sizing (Propulsion
Systems' rocket equation, formalized further in this guide's own
Fundamentals) are treated as central design drivers, not afterthought
calculations.
```

## Verify Everything Works

```bash
# 1. Confirm the mission-Δv-budget check prints 500 m/s and 4354 m/s

# 2. Confirm the propellant-mass-fraction check prints a mass ratio
#    of 4.393 and a propellant fraction of 77.2%
```

## Common Setup Issues

**Propellant mass fraction comes out unrealistically low (near 0%) or impossibly high (over 100%)**
Check that Δv and Isp·g0 are in consistent units — Δv here is in m/s and Isp·g0 (with g0 = 9.80665 m/s²) is also in m/s, so the ratio inside the exponential is dimensionless; mixing km/s for Δv with an m/s-based Isp·g0 term (or vice versa) produces a nonsensical result. A propellant fraction over 100% specifically signals a units mismatch, not a real engineering outcome — mass fraction is mathematically bounded below 100% for any finite Isp and finite Δv.

**Total Δv budget doesn't match a real published spacecraft figure**
This is expected — real spacecraft Δv budgets include margin (extra Δv reserved for contingencies, mission extensions, or off-nominal orbit insertion) beyond the theoretical minimum this guide's simplified calculation produces. Treat this guide's Δv budget as the baseline theoretical minimum, not a complete real-mission specification.

## What's Set Up

- **Python 3 + NumPy** — for Δv-budget and propellant-mass calculations throughout this guide

## Next Steps

Go to the **Fundamentals** section, which formalizes the propellant-mass-fraction preview above into the full spacecraft subsystem mass budget.
