# JEE Physics — Complete Preparation Guide

Physics is the most conceptual subject in JEE. Students who understand the physics score well; students who memorise formulas struggle. This guide covers every chapter with the right depth, common traps, and problem-solving frameworks.

## Exam Weightage

```
Topic                           JEE Main    JEE Advanced
Mechanics (total)                ~35%         ~32%
  Kinematics                      5%           4%
  Newton's Laws + Friction        7%           6%
  Work Energy Power               5%           5%
  Rotation                        8%           8%
  Gravitation                     5%           4%
  Fluid Mechanics                 5%           5%

Electromagnetism (total)         ~30%         ~30%
  Electrostatics                  8%           8%
  Current Electricity             7%           6%
  Magnetism + EMI                10%          10%
  AC Circuits                     5%           6%

Modern Physics                   ~12%         ~12%
Waves + Optics                   ~15%         ~16%
Thermodynamics                   ~8%          ~10%
```

## Mechanics

### Kinematics
```
Equations of motion (uniform acceleration):
  v = u + at
  s = ut + ½at²
  v² = u² + 2as
  s_nth = u + a(2n-1)/2

Projectile motion:
  Horizontal: x = u cosθ · t      (constant velocity)
  Vertical:   y = u sinθ · t - ½gt² (accelerated)
  
  Time of flight: T = 2u sinθ/g
  Max height:     H = u²sin²θ/2g
  Range:          R = u²sin2θ/g
  Max range at θ = 45°: R_max = u²/g
  
  Complementary angles give same range:
    θ and (90°-θ) have equal horizontal range
  
Relative velocity:
  v_AB = v_A - v_B  (velocity of A with respect to B)
  River boat: Boat at angle θ upstream to cross perpendicular
    θ = sin⁻¹(v_river/v_boat)
    Time = width / v_boat cosθ
```

### Newton's Laws
```
Key concepts GATE and JEE Advanced target:
  Pseudo force: In accelerating frame, F_pseudo = -ma (in direction opposite to acceleration)
  Elevator problems: N = m(g ± a)  [+ going up, - going down]
  
  Normal force ≠ mg in general
  Normal force = component of net force perpendicular to surface

Friction:
  Static: f_s ≤ μ_s N (static friction adjusts up to maximum)
  Kinetic: f_k = μ_k N (constant once sliding begins)
  μ_k < μ_s always
  
  Friction provides centripetal force on circular curves
  Max speed on banked road: v = √(rg · tan θ) without friction
  
Spring problems:
  F = kx, PE = ½kx²
  Springs in series: 1/k_eq = 1/k₁ + 1/k₂ (weaker spring)
  Springs in parallel: k_eq = k₁ + k₂ (stiffer)
```

### Rotation — JEE's Hardest Mechanics Topic
```
Moment of inertia:
  Point mass: I = mr²
  Solid cylinder: I = ½mr²
  Hollow cylinder: I = mr²
  Solid sphere: I = 2mr²/5
  Hollow sphere: I = 2mr²/3
  Rod about centre: I = mL²/12
  Rod about end: I = mL²/3
  
Parallel axis theorem: I = I_cm + md²
Perpendicular axis theorem: I_z = I_x + I_y (only for laminas/flat objects)

Torque and angular acceleration:
  τ = Iα  (analogous to F = ma)
  τ = r × F

Rolling without slipping:
  v_cm = ωR  (constraint equation)
  Total KE = ½mv² + ½Iω² = ½mv²(1 + I/mR²)
  For solid sphere: KE = ½mv²(1 + 2/5) = 7mv²/10
  
  Acceleration on incline: a = g sinθ/(1 + I/mR²)
  Solid sphere rolls fastest down incline (lowest I/mR²)
```

## Electrostatics
```
Coulomb's law: F = kq₁q₂/r²   k = 9×10⁹ N·m²/C²

Electric field:
  Point charge: E = kq/r²
  Infinite wire: E = λ/2πε₀r
  Infinite plane: E = σ/2ε₀  (independent of distance!)
  Inside conductor: E = 0
  
Gauss's law: ∮E·dA = Q_enc/ε₀
  Most powerful tool for symmetric charge distributions
  
Electric potential:
  V = kq/r (point charge)
  V is scalar, E is vector: E = -dV/dr
  Work done = q(V_A - V_B)
  
Capacitors:
  C = Q/V = ε₀A/d (parallel plate)
  Series: 1/C_eq = 1/C₁ + 1/C₂
  Parallel: C_eq = C₁ + C₂
  Energy stored: U = ½CV² = Q²/2C
  
  Dielectric: C = κC₀ (κ = dielectric constant)
  
Conductor in field: Charges redistribute until E=0 inside
  Cavity inside conductor: E=0 (shielding)
  Field just outside conductor: E = σ/ε₀
```

## Current Electricity
```
Ohm's law: V = IR, R = ρL/A

Kirchhoff's Laws (KCL and KVL):
  KCL: ΣI_in = ΣI_out at any junction
  KVL: ΣV = 0 around any closed loop
  
  Loop sign convention: 
    Go through battery from - to +: add EMF
    Go through resistor in direction of current: subtract IR
  
Wheatstone bridge balanced: P/Q = R/S → no current through galvanometer

Potentiometer:
  Measures EMF without drawing current (high accuracy)
  Works on null deflection principle
  
Colour code for resistors:
  Black Brown Red Orange Yellow Green Blue Violet Grey White
  0     1     2   3      4      5     6    7      8    9
  Tolerance: Gold ±5%, Silver ±10%
  
Power: P = IV = I²R = V²/R
Cells in series: EMF adds, internal resistance adds
Cells in parallel: EMF same, internal resistance reduces
```

## Modern Physics — High Scoring, Conceptual
```
Photoelectric effect:
  KE_max = hf - φ  (φ = work function)
  Threshold frequency: f₀ = φ/h
  Stopping potential: eV₀ = KE_max
  
  Einstein's insight: Light behaves as particles (photons)
  Energy of photon: E = hf = hc/λ
  h = 6.63×10⁻³⁴ J·s

de Broglie wavelength:
  λ = h/p = h/mv

Bohr's model of hydrogen:
  Radius: r_n = 0.53n² Å
  Energy: E_n = -13.6/n² eV
  Speed: v_n = 2.18×10⁶/n m/s
  
  Spectral series:
    Lyman: n→1 (UV)
    Balmer: n→2 (visible)
    Paschen: n→3 (IR)

Radioactivity:
  N = N₀e^(-λt)
  Half-life: T₁/₂ = ln2/λ = 0.693/λ
  Activity: A = λN
  
  α decay: Z-2, A-4
  β⁻ decay: Z+1, A same
  γ decay: Z same, A same (energy release only)

Nuclear binding energy:
  BE = Δm × c²  (Δm = mass defect)
  Fission: Heavy nucleus splits (U-235, Pu-239) → energy released
  Fusion: Light nuclei combine (H isotopes) → more energy per unit mass
```

## Optics
```
Ray optics:
  Mirror formula: 1/v + 1/u = 1/f
  Lens formula: 1/v - 1/u = 1/f
  Magnification: m = -v/u (mirror), +v/u (lens)
  
  Sign convention: Object on left, distances right = positive
  
  Power of lens: P = 1/f(metres), unit = Dioptre
  Lenses in contact: P_eq = P₁ + P₂
  
  Snell's law: n₁ sinθ₁ = n₂ sinθ₂
  Critical angle: sin C = 1/n (for total internal reflection)
  
Wave optics — Young's double slit:
  Path difference: Δ = d sinθ ≈ yd/D
  Bright fringes: Δ = nλ
  Dark fringes: Δ = (2n-1)λ/2
  Fringe width: β = λD/d
  
  Increasing D: Fringe width increases
  Increasing d: Fringe width decreases
  Submerge in water: λ_water = λ_air/n → fringe width decreases
```

## Previous Year Pattern — What Advanced Tests
```
JEE Advanced Physics characteristics:
  Conceptual reasoning over formula plugging
  Multiple correct options — partial marking for wrong option
  Integer answer type — no negative marking

Common Advanced-only topics:
  - Electromagnetic induction with moving circuits
  - Rotation with friction (complex constraint problems)  
  - Interference with thin films
  - Non-uniform electric fields
  - RC/RL transient circuits

Strategy:
  Main: 3 full topics mastered > 8 half-mastered
  Advanced: Focus on Mechanics + Electromagnetism (60% weightage)
  Must solve: HC Verma (conceptual foundation) + DC Pandey (variety)
  Past papers: 2005-2024 JEE Advanced mandatory
```
