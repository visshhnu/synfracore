# Units and Dimensions

## Why This Chapter Matters
Units and Dimensions is always the first chapter of JEE Physics and appears every year — 4-6 marks. Dimensional analysis to check formulas, find unknown quantities, and convert units is a must-know skill.

## Core Concepts

### 1. SI Units (Seven Fundamental Units)
Length: metre (m) | Mass: kilogram (kg) | Time: second (s)
Current: ampere (A) | Temperature: kelvin (K) | Amount: mole (mol) | Luminosity: candela (cd)

All other units (derived units) are built from these.

### 2. Dimensional Formula
Expresses a physical quantity in terms of fundamental dimensions:
M (mass), L (length), T (time), A (current), K (temperature)

| Quantity | Dimensional Formula | SI Unit |
|---|---|---|
| Force | M¹L¹T⁻² | Newton (N) |
| Energy/Work | M¹L²T⁻² | Joule (J) |
| Power | M¹L²T⁻³ | Watt (W) |
| Pressure | M¹L⁻¹T⁻² | Pascal (Pa) |
| Velocity | M⁰L¹T⁻¹ | m/s |
| Acceleration | M⁰L¹T⁻² | m/s² |
| Momentum | M¹L¹T⁻¹ | kg·m/s |
| Impulse | M¹L¹T⁻¹ | N·s |
| Gravitational constant G | M⁻¹L³T⁻² | N·m²/kg² |
| Planck's constant h | M¹L²T⁻¹ | J·s |
| Charge | M⁰L⁰T¹A¹ | Coulomb (C) |
| Resistance | M¹L²T⁻³A⁻² | Ohm (Ω) |

### 3. Principle of Homogeneity
In any valid physical equation, dimensions on both sides must be equal.
Used to: CHECK if formula is correct | DERIVE relationships | FIND unknown powers.

### 4. Dimensional Analysis — Finding Relations
If a quantity depends on others: Q = k × a^x × b^y × c^z
Write dimensional equations, compare powers of M, L, T on both sides to find x, y, z.

Example: Time period of simple pendulum T depends on length l, mass m, gravity g.
T = k × l^a × m^b × g^c
[T] = [L]^a [M]^b [LT⁻²]^c
T¹ = L^(a+c) M^b T^(-2c)
b=0, -2c=1→c=-1/2, a+c=0→a=1/2
T = k√(l/g) ✓ [matches actual formula T=2π√(l/g)]

### 5. Significant Figures
Rules: All non-zero digits significant. Zeros between sig figs: significant.
Leading zeros (0.00X): NOT significant. Trailing zeros after decimal: significant.
Example: 3.040 has 4 sig figs. 0.0034 has 2 sig figs. 5600 has 2 sig figs (ambiguous).

### 6. Error Analysis
Absolute error: Δa = |measured - true|
Relative error: Δa/a
Percentage error: (Δa/a) × 100

For product/quotient: relative errors ADD.
For sum/difference: absolute errors ADD.
For power: if Z = a^n, ΔZ/Z = n(Δa/a)

## Solved Examples

Q1: Check dimensional validity of: v² = u² + 2as
[v²] = L²T⁻² | [u²] = L²T⁻² | [2as] = L/T² × L = L²T⁻² ✓ All terms match.

Q2: Find dimensions of (a/b) in van der Waals equation (P + a/V²)(V - b) = RT
P has dim M¹L⁻¹T⁻². a/V² must have same dim as P.
[a] = [P][V²] = M¹L⁻¹T⁻² × L⁶ = M¹L⁵T⁻²
[b] has same dim as V: L³. [a/b] = M¹L²T⁻². 

Q3: Length measured as 5.32 ± 0.02 cm and width as 3.14 ± 0.01 cm. Area?
Area = 5.32 × 3.14 = 16.70 cm²
Relative error in area = 0.02/5.32 + 0.01/3.14 = 0.00376 + 0.00318 = 0.00694
Absolute error = 16.70 × 0.00694 = 0.116 ≈ 0.12 cm²
Area = 16.70 ± 0.12 cm²

## PYQs

**2024:** Which of following has same dimensions as Planck's constant?
Angular momentum L = mvr = kg·m/s × m = M¹L²T⁻¹ = same as h. Answer: Angular momentum.

**2023:** Using dimensional analysis, find the formula for viscous force on a sphere moving through liquid.
F depends on: radius r, velocity v, coefficient of viscosity η (dim: M¹L⁻¹T⁻¹)
F = k η^a r^b v^c. [MLT⁻²] = [ML⁻¹T⁻¹]^a [L]^b [LT⁻¹]^c
a=1, b=1, c=1. F = kηrv (Stokes' law: F = 6πηrv)

**2022:** If force F = at + bt², find dimensions of a and b.
F = at: [a] = F/t = MLT⁻³
F = bt²: [b] = F/t² = MLT⁻⁴

## Revision Notes
```
FUNDAMENTAL UNITS: m, kg, s, A, K, mol, cd

KEY DIMENSIONAL FORMULAS:
Force: MLT⁻²  |  Energy: ML²T⁻²  |  Power: ML²T⁻³
Pressure: ML⁻¹T⁻²  |  G: M⁻¹L³T⁻²  |  h: ML²T⁻¹

PRINCIPLE OF HOMOGENEITY: same dimensions on both sides

ERROR RULES:
Product/Quotient: relative errors add
Sum/Difference: absolute errors add
Power (Z=aⁿ): ΔZ/Z = n·Δa/a

SIGNIFICANT FIGURES:
Non-zero digits: always significant
Zeros between sig figs: significant
Leading zeros: NOT significant
Trailing zeros after decimal: significant
```
