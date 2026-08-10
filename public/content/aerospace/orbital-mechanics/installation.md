# Orbital Mechanics & Astrodynamics — Installation

## What You're Setting Up

Overview's circular orbital velocity and period equations are closed-form and hand-calculable. This section sets up a Python environment for those calculations, plus an introduction to GMAT (NASA's General Mission Analysis Tool) — the standard free, open-source tool for real mission design, going beyond this guide's idealized two-body examples into full mission trajectory design and optimization.

## Install Python

```bash
python3 --version
pip install numpy
```

## Verify Your Setup — Recompute Overview's ISS Example

This reproduces Overview's worked orbital velocity and period calculation (μ = 398,600 km³/s², r = 6,778 km).

```python
import math

MU_EARTH = 398600  # km^3/s^2

def orbital_velocity(r, mu=MU_EARTH):
    return math.sqrt(mu / r)

def orbital_period(r, mu=MU_EARTH):
    return 2 * math.pi * math.sqrt(r**3 / mu)

r = 6378 + 400  # Earth radius + ISS altitude, km
v = orbital_velocity(r)
T = orbital_period(r)
print(f"Orbital velocity = {v:.3f} km/s")
print(f"Orbital period = {T:.1f} s ({T/60:.1f} minutes)")
```

```
Expected output:
Orbital velocity = 7.669 km/s
Orbital period = 5553.5 s (92.6 minutes)

This matches Overview's hand-computed ~7.669 km/s and ~92.6 minutes
exactly, confirming your environment works and the formulas
transcribe to code identically.
```

## A Second Check — the Try It Satellite

Reproducing Overview's Try It exercise (700 km altitude) as a second, independent check:

```python
r2 = 6378 + 700
v2 = orbital_velocity(r2)
T2 = orbital_period(r2)
print(f"Orbital velocity = {v2:.3f} km/s")
print(f"Orbital period = {T2:.1f} s ({T2/60:.1f} minutes)")
```

```
Expected output:
Orbital velocity = 7.504 km/s
Orbital period = 5926.2 s (98.8 minutes)

Matches Overview's Try It answer (7.504 km/s, 98.8 minutes) exactly
— slower and longer-period than the lower ISS-altitude orbit,
consistent with Kepler's Third Law.
```

## Install GMAT for Real Mission Design

GMAT (General Mission Analysis Tool) is NASA's free, open-source, actively maintained tool for real space mission design, trajectory optimization, and navigation — used for actual NASA and industry mission planning, not just idealized textbook orbits.

```bash
# Download the current release (GMAT is distributed as OS-specific
# bundled installers) from either:
# https://sourceforge.net/projects/gmat/
# https://github.com/nasa/GMAT/releases
```

`(needs verification — recheck against current source: GMAT release versions and installer details change with each release cycle — confirm the current version and installation steps at the links above rather than assuming a fixed version number.)`

## A Note on Python Astrodynamics Libraries

If searching for a Python-native astrodynamics library beyond the basic formulas above, be aware that **poliastro — a once-popular pure-Python astrodynamics library — was archived and became unmaintained in October 2023.** `hapsira` is the actively maintained community fork that continues its development, validated against GMAT and other established astrodynamics software. If you encounter tutorials or examples referencing `poliastro` specifically, check whether they still work against the current package or whether the `hapsira` fork is the better current choice before relying on either for real work.

## Verify Everything Works

```bash
# 1. Confirm the ISS-example check prints 7.669 km/s and 92.6 minutes

# 2. Confirm the second check (700 km altitude) prints 7.504 km/s
#    and 98.8 minutes

# 3. Open GMAT, load one of its built-in mission example scripts
#    (GMAT ships with several), and run it — confirm it produces a
#    real propagated orbit/trajectory output, not just an error
```

## Common Setup Issues

**Computed velocity or period doesn't match the expected output**
Confirm `r` is computed as Earth's radius PLUS altitude, not altitude alone — this is the single most common mistake in orbital mechanics calculations generally (Overview's own example is explicit about this: r = 6,378 + 400 = 6,778 km, not just 400 km).

**GMAT installer fails or won't launch after installing**
Confirm your OS meets GMAT's current documented system requirements (listed in the release's own README) — GMAT is a substantial desktop application with real dependencies, and an installation failure is more often a missing system dependency than a corrupted download.

**Confusion between `poliastro` and `hapsira` package names in example code found online**
Since poliastro is archived (as of October 2023) but plenty of existing tutorials/StackOverflow answers still reference it by name, treat any `import poliastro` example found online as potentially outdated — check whether `hapsira` (the maintained fork) is the more current choice for the same functionality before installing either.

## What's Set Up

- **Python 3 + NumPy** — for orbital velocity/period calculations throughout this guide
- **GMAT** — for real mission trajectory design and optimization beyond this guide's idealized two-body examples

## Next Steps

Go to the **Fundamentals** section to continue building on Kepler's laws with orbital elements and elliptical (non-circular) orbits.
