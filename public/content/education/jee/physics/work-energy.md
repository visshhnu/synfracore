# Work, Energy and Power

## Why This Chapter Matters
Work-Energy theorem is one of the most powerful tools in JEE mechanics — 6-10 marks. Conservation of energy, collisions, and spring problems are tested every year. The theorem often gives the fastest solution.

## Core Concepts

### 1. Work Done by a Force
W = F · d · cos(θ)   where θ = angle between F and displacement
W = F⃗ · s⃗ (dot product)

Work is a scalar. Can be positive (force in direction of motion), negative (opposing motion), or zero (perpendicular force like normal force).

Work done by variable force: W = ∫F·dx (area under F-x graph)

### 2. Kinetic Energy and Work-Energy Theorem
KE = ½mv²
Work-Energy Theorem: W_net = ΔKE = KE_final - KE_initial
This applies regardless of the path — only depends on initial and final states.

### 3. Potential Energy
Gravitational PE: U = mgh (taking reference at some height)
Spring PE: U = ½kx² (k = spring constant, x = extension/compression)
Elastic PE: ½kx² (conservative force — path independent)

### 4. Conservation of Mechanical Energy
In absence of non-conservative forces (friction):
KE + PE = constant
½mv₁² + mgh₁ = ½mv₂² + mgh₂

If friction/air resistance present: KE + PE + W_friction = 0 (energy dissipated)

### 5. Power
P = W/t = F·v·cos(θ) = F⃗·v⃗
Unit: Watt (W) = J/s. 1 HP = 746 W.
Average power = Total work / Total time
Instantaneous power = dW/dt = F·v

### 6. Collisions
**Elastic collision:** Both KE and momentum conserved.
For m₁ hitting stationary m₂:
v₁' = (m₁-m₂)/(m₁+m₂) × u₁
v₂' = 2m₁/(m₁+m₂) × u₁

Special cases: m₁=m₂ → v₁'=0, v₂'=u₁ (velocity exchange)

**Perfectly inelastic:** Bodies stick together. Only momentum conserved.
(m₁+m₂)v = m₁u₁ + m₂u₂
KE lost = ½μ(u₁-u₂)² where μ = m₁m₂/(m₁+m₂) (reduced mass)

**Coefficient of restitution (e):**
e = relative speed after / relative speed before = (v₂'-v₁')/(u₁-u₂)
Elastic: e=1. Perfectly inelastic: e=0.

### 7. Spring Problems
Spring constant k. Natural length L₀. Extension x.
Force: F = -kx (restoring force, Hooke's Law)
PE = ½kx²
If two springs in series: 1/k_eff = 1/k₁ + 1/k₂
If two springs in parallel: k_eff = k₁ + k₂

## Solved Examples

Q1: Ball of mass 2 kg dropped from 5 m. Speed just before hitting ground?
Energy conservation: mgh = ½mv² → v = √(2gh) = √(100) = 10 m/s

Q2: 2 kg block compresses spring (k=1000 N/m) by 0.1 m on frictionless floor. Initial speed?
½mv² = ½kx² → mv² = kx² → v = x√(k/m) = 0.1√(500) = 0.1×22.36 = 2.24 m/s

Q3: 4 kg ball at 5 m/s hits 2 kg stationary ball (elastic). Final velocities?
v₁' = (4-2)/(4+2) × 5 = 5/3 m/s
v₂' = 2×4/(4+2) × 5 = 20/3 m/s

## PYQs

**2024:** Block slides down frictionless incline of height h and collides with spring of constant k. Max compression?
At bottom: v = √(2gh). ½mv² = ½kx² → x = √(mv²/k) = √(2mgh/k)

**2023:** Two identical balls, one moving at v collides perfectly inelastically with stationary ball. Energy lost?
Combined mass = 2m moving at v/2. KE_initial = ½mv². KE_final = ½(2m)(v/2)² = ¼mv².
Energy lost = ½mv² - ¼mv² = ¼mv²

**2022:** Spring of k=100 N/m compressed by 10 cm attached to 2 kg block. Speed when at natural length?
½kx² = ½mv² → v = x√(k/m) = 0.1√(50) ≈ 0.71 m/s

## Revision Notes
```
WORK: W = Fd cosθ  |  Variable force: W = ∫F dx (area under F-x graph)

WORK-ENERGY THEOREM: W_net = ΔKE = ½mv_f² - ½mv_i²

CONSERVATION OF ENERGY (no friction):
KE + PE = constant
½mv² + mgh = constant

SPRING: F = kx, PE = ½kx²
Series: 1/k_eff = 1/k₁ + 1/k₂
Parallel: k_eff = k₁ + k₂

COLLISIONS:
Elastic (e=1): KE + momentum conserved
Inelastic (e<1): only momentum conserved
Perfectly inelastic (e=0): bodies stick, max KE loss

ELASTIC: m₁ hits stationary m₂:
v₁' = (m₁-m₂)u/(m₁+m₂)  |  v₂' = 2m₁u/(m₁+m₂)
Special: m₁=m₂ → exchange velocities!
```
