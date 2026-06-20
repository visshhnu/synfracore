# Current Electricity

## Why This Chapter Matters
Current Electricity extends Class 10 concepts to JEE level — 8-12 marks. Kirchhoff's laws, Wheatstone bridge, potentiometer, and cell combinations are all tested in complex circuits.

## Core Concepts

### 1. Drift Velocity and Current
Free electrons drift with average velocity v_d under electric field.
I = nAev_d  (n=electron density, A=cross-section, e=1.6×10⁻¹⁹ C)
J = nev_d = σE  (current density, σ = conductivity)

### 2. Resistance and Resistivity
R = ρL/A  (ρ = resistivity, L = length, A = cross-section)
Temperature effect: ρ = ρ₀(1 + αΔT)  (metals: α>0, resistance increases with T)
Semiconductors: α<0 (resistance decreases with T)

### 3. EMF and Internal Resistance
EMF (ε): energy source (battery). Internal resistance (r).
Terminal voltage: V = ε - Ir (during discharge), V = ε + Ir (during charge)
Short circuit current: I_sc = ε/r

### 4. Kirchhoff's Laws
KVL (Voltage): Sum of voltage drops around any closed loop = 0
KCL (Current): Sum of currents at any junction = 0 (current in = current out)

Method: Assign currents, apply KCL at junctions, apply KVL around loops.

### 5. Wheatstone Bridge
Four resistors P, Q, R, S in bridge configuration.
Balanced condition (no current through galvanometer): P/Q = R/S
Used to measure unknown resistance accurately.

Meter bridge: practical application. L/(100-L) = R/S

### 6. Potentiometer
Wire of uniform resistance per unit length. Used to:
- Compare EMFs: ε₁/ε₂ = L₁/L₂ (balancing lengths)
- Measure internal resistance: r = R(L₁-L₂)/L₂
- Measure potential difference (no current drawn — accurate)

### 7. Cell Combinations
Series cells (n cells, each ε, r):
E_eq = nε, r_eq = nr, I = nε/(nr + R)

Parallel cells (n cells, each ε, r):
E_eq = ε, r_eq = r/n, I = ε/(r/n + R)

Series best when R >> r. Parallel best when R << r.

## PYQs
**2024:** Battery of EMF 12V and internal resistance 2Ω connected to external resistance 4Ω. Terminal voltage?
I = 12/(2+4) = 2A. V_terminal = 12 - 2×2 = 8V

**2023:** Potentiometer wire 10m, resistance 20Ω. Cell of EMF 5V, resistance 5Ω in main circuit. Potential gradient?
I = 5/(5+20) = 0.2A. Voltage across wire = 0.2×20 = 4V. Gradient = 4/10 = 0.4 V/m

**2022:** In Wheatstone bridge, P=10Ω, Q=20Ω, R=30Ω. Find S for balance.
P/Q = R/S → 10/20 = 30/S → S = 60Ω

## Revision Notes
```
DRIFT: I = nAev_d
RESISTIVITY: R = ρL/A
TEMPERATURE: ρ = ρ₀(1+αΔT) — metals increase, semiconductors decrease

KIRCHHOFF:
KCL: ΣI = 0 at junction (charge conservation)
KVL: ΣV = 0 in closed loop (energy conservation)

WHEATSTONE BRIDGE BALANCE: P/Q = R/S (no current through galvanometer)
POTENTIOMETER: ε₁/ε₂ = L₁/L₂ (no current — accurate measurement)

CELLS IN SERIES: E=nε, r=nr
CELLS IN PARALLEL: E=ε, r=r/n
```
