# Current Electricity (Class 12)

## Why This Chapter Matters
Current electricity gives 7-10 marks in CBSE Class 12. Ohm's law, Kirchhoff's laws, Wheatstone bridge, potentiometer, and meter bridge are standard board questions.

## Core Concepts

### 1. Current and Resistance
Electric current I = Q/t = nAev_d (n=electron density, A=area, v_d=drift velocity).
Ohm's Law: V = IR (for ohmic conductors).
Resistance R = ρL/A (ρ=resistivity, L=length, A=cross-section).
Resistivity varies with temperature: ρ = ρ₀(1+αΔT). For metals, α>0 (resistance increases with temperature).

### 2. EMF and Internal Resistance
EMF ε = energy supplied per unit charge by cell.
Terminal voltage: V = ε - Ir (during discharge). V = ε + Ir (during charging).
Short circuit: I = ε/r (R=0). Open circuit: V = ε (I=0).

### 3. Combination of Resistors
Series: Rₑq = R₁+R₂+...+Rₙ. Same current through all.
Parallel: 1/Rₑq = 1/R₁+1/R₂+...+1/Rₙ. Same voltage across all.
For two parallel: Rₑq = R₁R₂/(R₁+R₂).

### 4. Kirchhoff's Laws
**KCL (Junction rule):** Sum of currents entering = sum leaving. (Charge conservation).
**KVL (Loop rule):** Sum of potential drops around closed loop = 0. (Energy conservation).

Method: Assign currents (direction assumed). Apply KCL at junctions. Apply KVL around loops. Solve simultaneous equations.

### 5. Wheatstone Bridge
Four resistors P, Q, R, S in bridge. Galvanometer between junctions BD.
Balanced (no current in galvanometer): P/Q = R/S.
Used for accurate measurement of unknown resistance.

**Meter bridge:** Practical Wheatstone bridge.
R/S = l/(100-l) where l = balancing length.
Unknown resistance: X = R(100-l)/l or use P/Q=R/X depending on configuration.

### 6. Potentiometer
Uniform resistance wire. Measures potential difference and EMF accurately.
Key property: No current flows in the branch being measured at balance (accurate unlike voltmeter).

Comparison of EMFs: ε₁/ε₂ = l₁/l₂.
Measurement of internal resistance: r = R(l₁-l₂)/l₂.
Potential gradient = emf of driver / total length of wire.

## Board Examples

**Q1:** In a potentiometer, wire is 2m long, resistance 4Ω. External resistance 4Ω in series with 2V battery. Find potential gradient.
Total R = 4+4 = 8Ω. Current I = 2/8 = 0.25A. Voltage across wire = 0.25×4 = 1V.
Potential gradient = 1V/2m = 0.5 V/m.

**Q2:** A cell of EMF 1.5V has internal resistance 1Ω. Balanced length = 120cm when compared against standard cell (EMF=1.2V) at 100cm. Verify.
ε₁/ε₂ = l₁/l₂ → 1.5/1.2 = 120/100 = 1.25/1 = 1.25. ✓ Verified.

## PYQs (CBSE)

**CBSE 2023:** State Kirchhoff's laws. Use them to find current through each branch of given circuit.
[Apply KCL at junctions, KVL around loops, solve system of equations]

**CBSE 2022:** A battery of EMF 12V and internal resistance 4Ω is connected to external resistance 8Ω. Find terminal voltage and power dissipated in external resistance.
I = 12/(4+8) = 1A. V_terminal = 12-1×4 = 8V. P_external = I²×8 = 1×8 = 8W.

## Revision Notes
```
R=ρL/A | ρ increases with T for metals
V=ε-Ir (discharging) | V=ε+Ir (charging)

COMBINATIONS:
Series: R=R₁+R₂ | Same current, V divided
Parallel: 1/R=1/R₁+1/R₂ | Same voltage, I divided

KIRCHHOFF:
KCL: ΣI_in = ΣI_out (at junction)
KVL: ΣV = 0 (around closed loop)

WHEATSTONE BRIDGE (balanced): P/Q = R/S
METER BRIDGE: R/X = l/(100-l)
POTENTIOMETER: ε₁/ε₂ = l₁/l₂ | r = R(l₁-l₂)/l₂
No current at balance = accurate measurement
```
