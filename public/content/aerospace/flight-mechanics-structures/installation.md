# Flight Mechanics & Aircraft Structures — Installation

## What You're Setting Up

Overview's restoring-moment calculation (τ = r × F) is closed-form and hand-calculable. This section sets up a Python environment for stability-moment and static-margin calculations, plus OpenVSP — NASA's free, open-source parametric aircraft design tool, whose VSPAERO analysis module computes real stability derivatives for an actual 3D aircraft geometry, going well beyond this guide's simplified scalar-torque examples.

## Install Python

```bash
python3 --version
pip install numpy
```

## Verify Your Setup — Recompute Overview's Restoring Moment

This reproduces Overview's worked example (F = 400 N extra tail force, r = 6 m moment arm) in Python.

```python
def restoring_moment(r, F):
    return r * F

tau = restoring_moment(r=6, F=400)
print(f"Restoring moment = {tau} N·m")
```

```
Expected output: Restoring moment = 2400 N·m

Matches Overview's hand-computed 2,400 N·m exactly.
```

## A Second Check — Static Margin

A genuinely new calculation: static margin is the standard way real aircraft stability is quantified — the distance between the CG and the neutral point, expressed as a fraction (or percentage) of the mean aerodynamic chord (MAC).

```python
def static_margin(x_neutral_point, x_cg, chord):
    """
    x_neutral_point, x_cg: positions as a fraction of chord (0 = leading edge, 1 = trailing edge)
    chord: mean aerodynamic chord length (m)
    Returns: static margin as a fraction of chord, and as a physical distance
    """
    sm_fraction = x_neutral_point - x_cg
    sm_distance = sm_fraction * chord
    return sm_fraction, sm_distance

sm_frac, sm_dist = static_margin(x_neutral_point=0.35, x_cg=0.25, chord=2.0)
print(f"Static margin = {sm_frac*100:.1f}% MAC ({sm_dist:.2f} m)")
```

```
Expected output: Static margin = 10.0% MAC (0.20 m)

A POSITIVE static margin (neutral point AFT of CG, as here) confirms
the aircraft is longitudinally stable, consistent with Overview's
requirement that CG sit ahead of the neutral point. A typical
conventional aircraft is designed with a static margin in roughly
the 5-15% MAC range `(needs verification — recheck against current
source: exact typical/target static margin ranges vary significantly
by aircraft category and design philosophy — treat this as an
order-of-magnitude sanity check, not a fixed design target)` — a
NEGATIVE result here would mean the CG is behind the neutral point,
indicating instability, matching Overview's explanation of what
happens when CG crosses that boundary.
```

## Install OpenVSP for Real Aircraft Stability Analysis

OpenVSP is NASA's open-source parametric aircraft geometry tool; its VSPAERO module runs vortex-lattice/panel-method aerodynamic analysis and outputs real stability derivatives for an actual 3D aircraft model, rather than the simplified scalar-force examples used throughout this guide.

```bash
# Download the current build for your OS from the official releases:
# https://github.com/nasa/OpenVSP/releases
# (Windows, macOS, and Linux builds are provided)
```

`(needs verification — recheck against current source: OpenVSP release/build details change; confirm current download and build instructions directly at github.com/nasa/OpenVSP before relying on a specific version or install path.)`

## Verify Everything Works

```bash
# 1. Confirm the restoring-moment check prints exactly 2400 N·m

# 2. Confirm the static-margin check prints 10.0% MAC (0.20 m)

# 3. Open OpenVSP, load one of its built-in example aircraft models,
#    run a VSPAERO stability analysis, and confirm it produces a
#    stability-derivatives output file — this is the concrete proof
#    that "static margin and stability derivatives" are real,
#    computable outputs for an actual aircraft geometry, not just a
#    formula on paper
```

## Common Setup Issues

**Static margin comes out negative when a stable design was expected**
Double-check whether the neutral point and CG fractions are being subtracted in the right order — static margin is neutral-point-fraction MINUS CG-fraction (`x_np - x_cg`), not the reverse; swapping the order flips the sign and can make a genuinely stable configuration appear unstable in the calculation, even though the underlying design is fine.

**OpenVSP's VSPAERO analysis fails to converge or produces unrealistic stability derivatives**
Confirm the aircraft geometry model doesn't have obvious modeling errors first (disconnected surfaces, degenerate geometry) — VSPAERO's panel-method solver is sensitive to clean input geometry, and a convergence failure is more often a geometry problem than a genuine physical instability in the design being modeled.

## What's Set Up

- **Python 3 + NumPy** — for restoring-moment and static-margin calculations throughout this guide
- **OpenVSP (with VSPAERO)** — for real 3D aircraft geometry and stability-derivative analysis beyond this guide's simplified scalar examples

## Next Steps

Go to the **Fundamentals** section to continue building on the static-stability framework established here.
