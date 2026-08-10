# Aerodynamics — Installation

## What You're Setting Up

Most of this guide's worked examples (Overview's lift equation, Fundamentals' Mach number classification) are closed-form and computable by hand or calculator — no software is strictly required to follow along. This section sets up two things that make the material easier to explore beyond the textbook examples: a Python environment for computing and plotting lift/drag curves across a range of conditions, and XFOIL/XFLR5, the standard free airfoil-analysis tool, for going beyond the hand-calculable examples into real airfoil geometry.

## Install Python and the Scientific Stack

```bash
# Confirm Python 3 is available
python3 --version

# Install the packages used throughout this guide's computed examples
pip install numpy scipy matplotlib
```

`(needs verification — recheck against current source: exact current version numbers for numpy/scipy/matplotlib change frequently; the install commands above will pull whatever is current, which is what you want — don't pin to a specific old version without reason.)`

## Verify Your Setup — Recompute Overview's Lift Example

This reproduces Overview's worked lift calculation (S = 20 m², V = 60 m/s, ρ = 1.225 kg/m³, CL = 0.5) in Python, so you can confirm your environment works *and* see the exact formula as code.

```python
def lift(rho, V, S, CL):
    return 0.5 * rho * V**2 * S * CL

L = lift(rho=1.225, V=60, S=20, CL=0.5)
print(f"Lift = {L} N")
```

```
Expected output: Lift = 22050.0 N

This matches Overview's hand-computed 22,050 N exactly — confirming
both that your Python environment is working correctly and that the
formula, transcribed into code, behaves identically to the algebra
worked by hand.
```

## A Second Check — Thin Airfoil Theory

A useful, genuinely new (not just a repeat of Overview) verification: thin airfoil theory predicts CL = 2π·α for a thin, symmetric airfoil at small angles of attack (α in radians, not degrees — a common early mistake).

```python
import math

def cl_thin_airfoil(alpha_deg):
    alpha_rad = math.radians(alpha_deg)
    return 2 * math.pi * alpha_rad

for alpha in [5, 8]:
    print(f"alpha = {alpha} deg -> CL = {cl_thin_airfoil(alpha):.4f}")
```

```
Expected output:
alpha = 5 deg -> CL = 0.5483
alpha = 8 deg -> CL = 0.8773

Notice CL scales linearly with alpha here (doubling-ish alpha from
5 to 8 degrees increases CL by a similar proportion) — this linear
region is exactly why Overview described CL as increasing "roughly
linearly at first" as angle of attack increases, before stall
breaks that linearity.
```

This CL = 2π·α result is a real, standard aerodynamics prediction (not a toy example) — it's the small-angle, thin-airfoil approximation that real airfoil analysis (XFOIL, below) refines with actual airfoil geometry and viscous effects.

## Install XFOIL / XFLR5 for Real Airfoil Analysis

XFOIL (Mark Drela, MIT) is the standard free tool for 2D airfoil analysis — given an airfoil's shape coordinates plus Reynolds and Mach number, it computes the pressure distribution and resulting lift/drag characteristics using panel methods and a boundary-layer model, going well beyond thin airfoil theory's small-angle approximation. XFLR5 wraps XFOIL in a graphical interface and adds 3D wing analysis.

```bash
# XFLR5 (recommended starting point — GUI wraps XFOIL directly)
# Download the current build for your OS from:
# https://sourceforge.net/projects/xflr5/

# XFOIL itself (command-line, for scripted/batch analysis)
# Linux: often available via package manager or build from source
sudo apt install xfoil    # Debian/Ubuntu, if packaged for your release

# macOS
brew install xfoil
```

`(needs verification — recheck against current source: XFOIL packaging availability varies by Linux distribution and release; if not packaged, build from source following the instructions at MIT's XFOIL page (web.mit.edu/drela/Public/web/xfoil/) — confirm current build instructions there rather than assuming a fixed set of steps.)`

## Verify Everything Works

```bash
# 1. Confirm the Python lift-equation check above prints exactly
#    22050.0 N

# 2. Confirm the thin-airfoil-theory check prints CL values matching
#    0.5483 and 0.8773 (within rounding)

# 3. Open XFLR5, load a standard airfoil (NACA 0012 is a common
#    starting point, built into XFLR5's own database), and run a
#    single-point analysis at a chosen Reynolds number and angle of
#    attack — confirm it produces a CL value, and that CL increases
#    with angle of attack in the low-alpha range, consistent with
#    the linear trend from the thin-airfoil-theory check above
```

## Common Setup Issues

**`pip install` fails or installs to the wrong Python version**
Confirm `pip` and `python3` point to the same installation (`pip --version` shows the Python version it's tied to) — a common issue on systems with multiple Python installations is installing packages against a different interpreter than the one actually being run.

**XFOIL/XFLR5 analysis doesn't converge at high angle of attack**
This is often not a setup problem — XFOIL's boundary-layer model has real, known difficulty converging near and past stall (the exact high-α region where Overview's flow separation happens), since the underlying panel-method-plus-boundary-layer approach starts breaking down exactly where the real physics gets most nonlinear. Treat non-convergence near stall as an expected limitation of the tool in that regime, not necessarily a configuration mistake.

**Computed CL from thin airfoil theory doesn't match XFOIL's result for the same airfoil/angle**
Expected, not a bug — thin airfoil theory assumes an idealized thin, symmetric airfoil with no viscous effects and only holds well at small angles; XFOIL models real airfoil thickness, camber, and viscosity. The two are expected to diverge, more so at higher angles of attack or for a thick/cambered airfoil — thin airfoil theory is a first-order approximation, XFOIL a much more complete model.

## What's Installed

- **Python 3 + NumPy/SciPy/Matplotlib** — for computing and plotting the closed-form equations used throughout this guide
- **XFOIL and/or XFLR5** — for real airfoil geometry analysis beyond thin airfoil theory's small-angle approximation

## Next Steps

Go to the **Fundamentals** section to compute Mach number classifications and Reynolds numbers using the same Python setup established here.
