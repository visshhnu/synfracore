# Propulsion Systems — Installation

## What You're Setting Up

Overview's thrust equation (F = ṁ·Δv) is closed-form and hand-calculable. This section sets up a Python environment for thrust and specific-impulse calculations, plus NASA's CEA (Chemical Equilibrium with Applications) — the standard free tool for computing real propellant performance (exhaust velocity, chamber temperature) from actual propellant chemistry, going beyond this guide's simplified momentum-equation examples.

## Install Python

```bash
python3 --version
pip install numpy
```

## Verify Your Setup — Recompute Overview's Rocket Thrust Example

This reproduces Overview's worked thrust calculation (ṁ = 8 kg/s, Δv = 2,500 m/s) in Python.

```python
def thrust(mdot, delta_v):
    return mdot * delta_v

F = thrust(mdot=8, delta_v=2500)
print(f"Thrust = {F} N")
```

```
Expected output: Thrust = 20000 N

This matches Overview's hand-computed 20,000 N exactly, confirming
your environment works and the formula transcribes to code
identically.
```

## A Second Check — Specific Impulse

A genuinely new calculation: specific impulse (Isp) is the standard measure of propulsion efficiency — how much thrust is produced per unit weight of propellant consumed per second. Higher Isp means more thrust for the same propellant flow rate.

```python
def specific_impulse(F, mdot, g0=9.80665):
    return F / (mdot * g0)

Isp = specific_impulse(F=20000, mdot=8)
print(f"Specific impulse = {Isp:.1f} seconds")
```

```
Expected output: Specific impulse = 254.9 seconds

This is a real, meaningful number to sanity-check against: 254.9
seconds is in the realistic range for a chemical rocket engine
(typical chemical rockets run roughly 250-450 seconds depending on
propellant combination) `(needs verification — recheck against
current source: exact typical ranges vary by propellant type and
engine design — treat this as an order-of-magnitude sanity check,
not a precise claim about any specific real engine)`. If your
computed Isp came out at, say, 25 or 2,500 seconds, that would be a
strong signal of a units or formula error, not a real engine
characteristic.
```

## Install NASA CEA for Real Propellant Performance

CEA computes real propellant combustion chemistry (equilibrium composition, chamber temperature, exhaust velocity) from actual propellant properties — going beyond this guide's simplified momentum equation into the chemistry that actually determines a real engine's Δv in the first place.

```bash
# CEA is distributed via NASA's open-source GitHub repository
git clone https://github.com/nasa/cea.git
cd cea
# Follow the repository's own build instructions — CEA's build
# process is actively maintained and documented directly in the repo
```

`(needs verification — recheck against current source: CEA's build/install instructions are maintained directly at github.com/nasa/cea and nasa.github.io/cea — confirm current steps there rather than assuming a fixed set of commands, since the tool underwent a full modernization rewrite and build steps may continue to evolve.)`

## Verify Everything Works

```bash
# 1. Confirm the thrust check prints exactly 20000 N

# 2. Confirm the specific-impulse check prints 254.9 seconds

# 3. Confirm CEA builds successfully per its repository's own
#    instructions, and can run a basic example case from its
#    documentation
```

## Common Setup Issues

**Computed thrust is off by orders of magnitude**
Almost always a units mix-up — confirm mass flow rate is in kg/s (not, say, kg/hour or lb/s) and velocity is in m/s (not km/h or mph) before applying F = ṁ·Δv; this equation only produces Newtons directly when both inputs are in consistent SI units.

**Specific impulse comes out unrealistically low or high**
Check whether `g0` (standard gravity, 9.80665 m/s²) was included in the denominator — Isp is defined in seconds specifically because of this division by g0; omitting it, or using a different gravitational constant (like a Mars or Moon surface value) without intending to, produces a value that looks like Isp but isn't the standard sea-level-Earth definition used throughout this guide and most propulsion references.

**CEA fails to build from source**
Confirm you have the compiler toolchain CEA's own repository documentation specifies as a prerequisite — this varies by platform and is documented directly in the repo's build instructions; don't assume a generic C/Fortran compiler setup is automatically sufficient without checking the repo's current requirements first.

## What's Set Up

- **Python 3 + NumPy** — for thrust and specific-impulse calculations throughout this guide
- **NASA CEA** — for real propellant-chemistry-based performance calculations beyond the simplified momentum equation

## Next Steps

Go to the **Fundamentals** section to continue building on the thrust equation with jet-engine-specific and rocket-specific performance metrics.
