# Electric Charges and Fields

## Why This Chapter Matters
Electrostatics is the first chapter of Class 12 Physics and one of the highest-weightage sections — 8-10 marks in boards and similar in JEE. Coulomb's law, electric field, Gauss's law, and potential are all tested.

## Core Concepts

### 1. Electric Charge
Properties: quantised (q = ne, n = integer, e = 1.6×10⁻¹⁹C), conserved (net charge constant), additive.
Two types: positive (+) and negative (-). Like charges repel, unlike attract.

### 2. Coulomb's Law
F = kq₁q₂/r² = q₁q₂/4πε₀r²
k = 9×10⁹ N·m²/C², ε₀ = 8.85×10⁻¹² C²/N·m² (permittivity of free space).
Vector form: Force is along line joining charges.
In medium: F = q₁q₂/4πεr² where ε = ε₀εᵣ (εᵣ = relative permittivity/dielectric constant).
F_medium = F_vacuum/εᵣ.

Superposition: Net force = vector sum of individual forces.

### 3. Electric Field
E = F/q₀ (force per unit positive test charge).
Due to point charge: E = kQ/r² (direction: radially outward for +Q).

Field lines:
- Start at positive, end at negative charge.
- Never cross each other.
- Perpendicular to conductor surface.
- Density of lines = field strength.

### 4. Electric Flux and Gauss's Law
Electric flux: Φ = E⃗·A⃗ = EA cosθ. Unit: N·m²/C.
Gauss's Law: ∮E⃗·dA⃗ = Q_enclosed/ε₀.

Applications:
Infinite line charge (λ C/m): E = λ/2πε₀r.
Infinite sheet (σ C/m²): E = σ/2ε₀ (uniform, both sides).
Spherical shell (charge Q, radius R):
  Outside (r>R): E = kQ/r² (same as point charge).
  Inside (r<R): E = 0.
Solid sphere (uniform charge density):
  Outside: E = kQ/r².
  Inside: E = kQr/R³ (proportional to r).

### 5. Electric Potential
V = W/q₀ (work done to bring unit + charge from ∞ to point).
Due to point charge: V = kQ/r (scalar, can be +/-).
Relation: E = -dV/dr, E⃗ = -∇V.

Equipotential surfaces: V = constant. E⊥ equipotential. No work done moving charge on equipotential.
For point charge: equipotentials are spheres.

Potential energy of system:
Two charges: U = kq₁q₂/r.
Three charges: U = k(q₁q₂/r₁₂ + q₂q₃/r₂₃ + q₁q₃/r₁₃).

## Board Examples

**Q1:** Two charges +4μC and -2μC separated by 0.5m. Find E and V at midpoint.
At midpoint (0.25m from each):
E₁ = k×4×10⁻⁶/(0.25)² = 9×10⁹×4×10⁻⁶/0.0625 = 576000 N/C (toward -2μC)
E₂ = k×2×10⁻⁶/(0.25)² = 288000 N/C (also toward -2μC, away from +4μC, so same direction)
Net E = 576000+288000 = 864000 N/C.
V₁ = k×4×10⁻⁶/0.25 = 144000 V. V₂ = k×(-2×10⁻⁶)/0.25 = -72000 V.
Net V = 144000-72000 = 72000 V = 72 kV.

## PYQs (CBSE)

**CBSE 2023:** Define electric flux. Write Gauss's law. Using Gauss's law, derive E for uniformly charged infinite plane sheet.
Electric flux = total number of field lines passing through a surface = ∮E⃗·dA⃗.
Gauss's law: ∮E⃗·dA⃗ = Q_enc/ε₀.
For sheet: Gaussian surface = cylinder. E passes through both flat faces (area A each).
Φ = 2EA = σA/ε₀ → E = σ/2ε₀.

**CBSE 2022:** What is the work done in moving a charge of 2C from one point to another on an equipotential surface of 10V?
W = q×ΔV = 2×0 = 0 J (potential difference on same equipotential = 0).

## Revision Notes
```
COULOMB: F=kq₁q₂/r², k=9×10⁹, In medium: divide by εᵣ
ELECTRIC FIELD: E=F/q₀, Point charge E=kQ/r²
SUPERPOSITION applies to both F and E (vector sum)

GAUSS'S LAW: ∮E·dA = Q_enc/ε₀
Line charge: E=λ/2πε₀r | Sheet: E=σ/2ε₀
Outside sphere: E=kQ/r² | Inside hollow sphere: E=0
Inside solid sphere: E=kQr/R³

POTENTIAL: V=kQ/r (scalar sum for multiple charges)
E=-dV/dr | Equipotential: V=const, E⊥surface
Work on equipotential = 0
PE of two charges: U=kq₁q₂/r
```
