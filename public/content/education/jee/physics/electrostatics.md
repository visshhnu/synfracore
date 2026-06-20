# Electrostatics

## Why This Chapter Matters
Electrostatics is one of the biggest JEE chapters — 10-15 marks. Coulomb's law, electric field, Gauss's law, potential, and capacitors are all heavily tested. Strong fundamentals here are essential.

## Core Concepts

### 1. Coulomb's Law
Force between two charges q₁ and q₂ separated by distance r:
F = kq₁q₂/r² = q₁q₂/(4πε₀r²)
k = 9×10⁹ N·m²/C² | ε₀ = 8.85×10⁻¹² C²/N·m²
Superposition: net force = vector sum of all individual forces

### 2. Electric Field
E = F/q₀ (force per unit positive charge)
Due to point charge: E = kQ/r² (radially outward for +Q)
Field lines: start at +, end at -. Denser lines = stronger field. Never cross.

### 3. Gauss's Law (KEY!)
∮E⃗·dA⃗ = Q_enclosed/ε₀

Applications (for symmetric charge distributions):
Infinite line charge (λ C/m): E = λ/(2πε₀r)
Infinite sheet (σ C/m²): E = σ/(2ε₀) (uniform, same both sides)
Solid sphere (R, total Q): 
  Outside (r>R): E = kQ/r² (same as point charge)
  Inside (r<R, uniform): E = kQr/R³ (proportional to r)
  Inside conductor: E = 0

### 4. Electric Potential
V = W/q₀ (work done to bring unit +charge from ∞ to point)
Due to point charge: V = kQ/r (scalar, can be +/-)
Relation: E = -dV/dr (E = -∇V)

Equipotential surfaces: V = constant. E is perpendicular to them.
Work done moving charge on equipotential = 0.

Potential at point due to multiple charges: V = ΣkQᵢ/rᵢ (algebraic sum, no vector!)

### 5. Capacitors
C = Q/V (capacitance = charge / voltage). Unit: Farad (F).
Parallel plate: C = ε₀A/d (A = area, d = separation)
With dielectric (κ): C = κε₀A/d (capacitance increases by factor κ)

Series: 1/C_eff = 1/C₁ + 1/C₂ + ...
Parallel: C_eff = C₁ + C₂ + ...

Energy stored: U = ½CV² = Q²/2C = QV/2

### 6. Conductors and Earthing
In electrostatic equilibrium:
E = 0 inside conductor. All charge on surface.
E at surface = σ/ε₀ (perpendicular to surface).
Earthing: potential becomes 0 (charge flows to/from earth).

## Solved Examples

Q1: Two charges +4μC and -2μC separated by 6 cm. Find point where E=0.
E₁ = E₂. For point outside (beyond -2μC, on the far side):
k(4)/(r+6)² = k(2)/r² → (r+6)² = 2r² → r²-12r-36=0 → r=6(1+√3) cm ≈ 16.4 cm

Q2: Find potential energy of system of 3 charges: q at (0,0), q at (a,0), q at (0,a)
U = k[q²/a + q²/a + q²/(a√2)] = kq²/a [2 + 1/√2]

Q3: Two capacitors 3μF and 6μF in series connected to 90V battery. Find charge and voltage on each.
C_series = (3×6)/(3+6) = 2μF. Q = CV = 2×90 = 180 μC (same on both)
V₃ = Q/C₃ = 180/3 = 60V. V₆ = 180/6 = 30V. Total = 90V ✓

## PYQs

**2024:** Electric field inside a uniformly charged spherical shell?
E = 0 (by Gauss's law — no charge enclosed inside)

**2023:** Capacitor of 6μF connected to 100V battery. Battery disconnected, then dielectric (κ=2) inserted. New voltage and energy?
Q = 6×100 = 600 μC (constant after disconnection). C_new = 12 μF.
V_new = Q/C_new = 600/12 = 50V.
U_initial = ½×6×10⁻⁶×10000 = 0.03 J. U_final = ½×12×10⁻⁶×2500 = 0.015 J.
Energy DECREASES (absorbed by dielectric).

**2022:** Electric potential V = 5x² - 10. Find electric field at x=2.
E = -dV/dx = -10x. At x=2: E = -20 V/m (negative means field in -x direction)

## Revision Notes
```
COULOMB: F = kq₁q₂/r²  (k = 9×10⁹)
FIELD due to point charge: E = kQ/r²

GAUSS'S LAW: ∮E·dA = Q_enc/ε₀
Line charge: E = λ/(2πε₀r)
Sheet: E = σ/2ε₀
Outside sphere: E = kQ/r²
Inside uniform sphere: E = kQr/R³
Inside conductor: E = 0

POTENTIAL: V = kQ/r  E = -dV/dr
Superposition: V = Σ kQᵢ/rᵢ (scalar sum!)

CAPACITORS:
C = ε₀A/d | With dielectric: C = κε₀A/d
Series: 1/C = Σ1/Cᵢ | Parallel: C = ΣCᵢ
Energy: U = ½CV² = Q²/2C

EARTHING: V=0, charge redistributes
```
