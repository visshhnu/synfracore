# Thermodynamics

## Why This Chapter Matters
Thermodynamics is tested in JEE every year — 6-10 marks. The four laws, processes (isothermal/adiabatic/isochoric/isobaric), Carnot engine efficiency, and first law application in problems are all tested.

## Core Concepts

### 1. Zeroth Law
If A is in thermal equilibrium with C, and B is in equilibrium with C, then A and B are in equilibrium.
This defines temperature as the property that is equal when two systems are in equilibrium.

### 2. First Law of Thermodynamics
ΔU = Q - W
Q = heat added to system, W = work done BY system, ΔU = change in internal energy

Sign conventions:
Q positive: heat flows INTO system
W positive: work done BY system (expansion)
W negative: work done ON system (compression)

Work done in process: W = ∫P dV (area under P-V diagram)

### 3. Thermodynamic Processes

**Isothermal (T = constant):**
For ideal gas: PV = constant (Boyle's Law)
Internal energy of ideal gas: ΔU = 0 (depends only on T)
Q = W = nRT ln(V₂/V₁)

**Adiabatic (Q = 0, no heat exchange):**
PV^γ = constant  where γ = Cp/Cv (ratio of specific heats)
TV^(γ-1) = constant | T P^(1-γ)/γ = constant
W = -ΔU = nCv(T₁-T₂) = (P₁V₁ - P₂V₂)/(γ-1)

**Isochoric (V = constant):**
W = 0 (no work done)
Q = ΔU = nCv ΔT

**Isobaric (P = constant):**
W = PΔV = nRΔT
Q = nCp ΔT
ΔU = nCv ΔT

### 4. Specific Heats of Ideal Gas
Cv = (f/2)R  where f = degrees of freedom
Cp = Cv + R = (f/2 + 1)R
γ = Cp/Cv = (f+2)/f

For monatomic gas (He, Ar): f=3, Cv=3R/2, γ=5/3
For diatomic gas (O₂, N₂): f=5, Cv=5R/2, γ=7/5

### 5. Carnot Engine (Most Important!)
Carnot engine: most efficient possible heat engine between two temperatures.
Efficiency: η = 1 - T_cold/T_hot = W/Q_hot

COP of Carnot refrigerator: COP = T_cold/(T_hot - T_cold) = Q_cold/W

Key points:
- Carnot efficiency depends ONLY on temperatures (not working substance)
- No real engine can exceed Carnot efficiency
- Carnot cycle: isothermal expansion → adiabatic expansion → isothermal compression → adiabatic compression

### 6. Second Law
Kelvin-Planck: No engine operating in cycle can entirely convert heat to work.
Clausius: Heat cannot flow spontaneously from cold to hot body.
Entropy: S never decreases in isolated system (ΔS ≥ 0)

## Solved Examples

Q1: Heat engine takes 800 J from source at 500K, gives 200 J to sink at 300K. Is it possible?
Carnot efficiency = 1 - 300/500 = 0.4 = 40%. Max work = 0.4×800 = 320 J.
Actual work = 800-200 = 600 J. 600 > 320. IMPOSSIBLE (violates second law).

Q2: One mole of ideal gas (γ=5/3) expands adiabatically. T changes from 400K to 300K. Work done?
W = nCv(T₁-T₂) = 1 × (3R/2) × (400-300) = 150R = 150 × 8.314 = 1247 J

Q3: Carnot engine between 600K and 300K. Efficiency?
η = 1 - 300/600 = 50%

## PYQs

**2024:** 1 mole ideal monoatomic gas goes from (P₀,V₀) to (2P₀,2V₀) in two steps: first isothermal to (P₀/2, 2V₀), then isochoric to (2P₀, 2V₀). Total heat absorbed?
Isothermal: Q₁ = W₁ = nRT ln(2V₀/V₀) = RT₀ ln2 (T₀=P₀V₀/R)
Isochoric: W=0, Q₂ = ΔU = nCv ΔT = (3R/2)×(4T₀-T₀) = 9RT₀/2
Total Q = RT₀ ln2 + 9RT₀/2 = RT₀(ln2 + 4.5)

**2023:** Carnot engine efficiency is 40%. If source temperature increases by 20%, what is new efficiency?
η₁ = 1 - T_c/T_h = 0.4 → T_c/T_h = 0.6 → T_c = 0.6T_h
New T_h' = 1.2T_h. New η = 1 - T_c/(1.2T_h) = 1 - 0.6/1.2 = 1 - 0.5 = 50%

## Revision Notes
```
FIRST LAW: ΔU = Q - W  (Q in, W by system)

PROCESSES:
Isothermal: T=const, ΔU=0, Q=W=nRT ln(V₂/V₁)
Adiabatic: Q=0, PV^γ=const, W=nCv(T₁-T₂)
Isochoric: V=const, W=0, Q=ΔU=nCvΔT
Isobaric: P=const, Q=nCpΔT, W=PΔV=nRΔT

SPECIFIC HEATS:
Monoatomic: Cv=3R/2, Cp=5R/2, γ=5/3
Diatomic: Cv=5R/2, Cp=7R/2, γ=7/5
Relation: Cp - Cv = R (Mayer's relation)

CARNOT:
η = 1 - T_cold/T_hot = W/Q_hot
COP (refrigerator) = T_cold/(T_hot-T_cold)
No real engine ≥ Carnot efficiency
```
