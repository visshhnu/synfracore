# Analog & Mixed-Signal Design — Installation

## What You're Setting Up

Overview's op-amp gain equations are closed-form and hand-calculable. This section sets up a Python-based op-amp gain calculator, plus ngspice — the standard free, open-source, actively maintained SPICE circuit simulator, for actually simulating real op-amp circuits rather than only computing their ideal gain by formula.

## Install Python

```bash
python3 --version
```

No extra packages needed for the gain calculator.

## Verify Your Setup — Recompute Overview's Op-Amp Gain Examples

This reproduces Overview's worked inverting and non-inverting gain calculations.

```python
def inverting_gain(Rf, Rin, Vin):
    return -(Rf / Rin) * Vin

def noninverting_gain(Rf, Rin, Vin):
    return (1 + Rf / Rin) * Vin

Vout_inv = inverting_gain(Rf=10_000, Rin=1_000, Vin=0.5)
Vout_noninv = noninverting_gain(Rf=9_000, Rin=1_000, Vin=1.0)

print(f"Inverting amplifier: Vout = {Vout_inv:.1f} V")
print(f"Non-inverting amplifier: Vout = {Vout_noninv:.1f} V")
```

```
Expected output:
Inverting amplifier: Vout = -5.0 V
Non-inverting amplifier: Vout = 10.0 V

Matches Overview's hand-computed results exactly -- the inverting
configuration's negative sign and the non-inverting configuration's
positive sign are both confirmed directly.
```

## A Second Check — the Try It Circuit

Reproducing Overview's Try It exercise (Rf = 20 kΩ, Rin = 2 kΩ, Vin = 0.3 V):

```python
Vout_tryit = inverting_gain(Rf=20_000, Rin=2_000, Vin=0.3)
print(f"Try It circuit: Vout = {Vout_tryit:.1f} V")
```

```
Expected output: Try It circuit: Vout = -3.0 V

Matches Overview's Try It answer exactly -- gain magnitude of 10,
inverted, confirming the same sign-flip pattern as the annotated
-5.0 V example.
```

## Install ngspice for Real Circuit Simulation

ngspice is a free, open-source, actively maintained SPICE circuit simulator — build the actual inverting-amplifier circuit from Overview (op-amp plus two resistors) and simulate its real behavior, rather than only computing the ideal gain formula.

```bash
# Linux (Debian/Ubuntu)
sudo apt install ngspice

# macOS (Homebrew)
brew install ngspice

# Windows — download the current release from ngspice.sourceforge.io
```

`(needs verification — recheck against current source: exact current ngspice version changes with each release — confirm at ngspice.sourceforge.io before assuming a specific version number.)`

## A Simple ngspice Netlist — the Inverting Amplifier

```
* Inverting amplifier: Rf=10k, Rin=1k, Vin=0.5V
* (matches Overview's annotated example)
Vin  in  0  DC 0.5
Rin  in  invnode  1k
Rf   invnode  out  10k
Eopamp out 0 0 invnode 100000
.op
.print op v(out)
.end
```

```bash
ngspice -b inverting_amp.cir
```

```
Expected output (from the .print op directive): v(out) should
report approximately -5.0 V, matching the Python calculation and
Overview's hand-computed result -- confirming a REAL simulated
circuit (using a simplified high-gain-dependent-source op-amp model,
Eopamp) produces the same answer as the idealized formula, which
assumes an ideal (infinite-gain) op-amp.
```

`(needs verification — recheck against current source: exact ngspice netlist syntax for behavioral/dependent sources can vary by version — confirm the current `E` source syntax against ngspice's own manual if this exact netlist doesn't run as shown.)`

## Verify Everything Works

```bash
# 1. Confirm the Python gain calculator prints -5.0 V and 10.0 V

# 2. Confirm the Try It check prints -3.0 V

# 3. Confirm the ngspice simulation reports v(out) close to -5.0 V
#    for the same inverting-amplifier circuit
```

## Common Setup Issues

**Python gain calculator gives a positive result for the inverting configuration**
Check the formula's negative sign — `inverting_gain` must include the explicit `-` in `-(Rf / Rin) * Vin`; omitting it produces a magnitude-correct but sign-wrong result, which defeats the entire point of distinguishing inverting from non-inverting configurations.

**ngspice simulation result doesn't closely match the ideal formula's -5.0 V**
Check the op-amp's modeled open-loop gain (the `100000` in the `Eopamp` dependent-source line above) — a real op-amp has finite (though very high) open-loop gain, and the ideal formula assumes infinite gain; a very low modeled gain value will produce a real, visible deviation from the ideal formula's prediction, which is itself a genuine and useful observation about where the ideal-op-amp assumption breaks down, not necessarily a simulation error.

**ngspice command not found after installing**
Confirm the install actually completed (`dpkg -l | grep ngspice` on Debian/Ubuntu) — a failed package install due to a network issue during `apt update` is a more common cause than a PATH problem specifically for ngspice.

## What's Set Up

- **Python 3** — for op-amp gain calculations throughout this guide
- **ngspice** — for real circuit-level simulation of op-amp configurations beyond the ideal gain formula

## Next Steps

Go to the **Fundamentals** section to continue with ADC/DAC quantization error, computed with real numbers.
