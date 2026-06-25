# JEE Physics Intermediate

## Waves and Oscillations

### Simple Harmonic Motion (SHM)
```
x = A cos(ωt + φ)     [displacement]
v = -Aω sin(ωt + φ)   [velocity]
a = -ω²x              [acceleration, toward mean]
vmax = Aω;  amax = Aω²
T = 2π/ω;  Spring: ω=√(k/m);  Pendulum: ω=√(g/L)
Total energy E = ½kA² = ½mω²A² (constant)
KE = ½mω²(A²-x²);  PE = ½mω²x²
```

### Wave Motion
```
y = A sin(kx - ωt)  [progressive wave, +x direction]
k = 2π/λ;  ω = 2πf;  v = ω/k = fλ
Intensity ∝ A² ∝ f²
Standing wave: y = 2A cos(kx) sin(ωt)
String harmonics: fn = n/(2L) × √(T/μ)
```

## Ray Optics

### Mirror and Lens Formulas
Sign convention (Cartesian): distances measured from pole; incident light travels left to right.
```
Mirror: 1/v + 1/u = 1/f = 2/R
Lens: 1/v - 1/u = 1/f
Magnification (mirror): m = -v/u
Magnification (lens): m = v/u
Lens maker: 1/f = (n-1)(1/R₁ - 1/R₂)
Power P = 1/f (in meters) → diopters
P_combined = P₁ + P₂ + ... (in contact)
```

### Total Internal Reflection
- Occurs when light goes from denser to rarer medium
- Critical angle θc: sin θc = n₂/n₁ (n₁ > n₂)
- TIR when θ > θc: used in optical fibers, prisms

## Thermodynamics

### Processes for Ideal Gas (PV = nRT)
```
Isothermal: T constant → PV = const; W = nRT ln(V₂/V₁)
Isobaric: P constant → V/T = const; W = PΔV = nRΔT
Isochoric: V constant → W = 0; Q = ΔU = nCvΔT
Adiabatic: Q = 0; PV^γ = const; TV^(γ-1) = const
γ = Cp/Cv = (f+2)/f where f = degrees of freedom
Monatomic: f=3, γ=5/3; Diatomic: f=5, γ=7/5
```

### Efficiency
```
Carnot efficiency: η = 1 - T_cold/T_hot (maximum possible)
Heat engine: η = W/Q_hot = (Q_hot - Q_cold)/Q_hot
Refrigerator COP = Q_cold/W = T_cold/(T_hot - T_cold) [Carnot]
```

## Magnetism

### Biot-Savart and Ampere
```
dB = (μ₀/4π) × I dl × r̂ / r²
Straight wire: B = μ₀I/(2πd)  [distance d from wire]
Circular loop center: B = μ₀I/(2R)
Solenoid inside: B = μ₀nI  [n = turns per length]
Ampere's law: ∮ B·dl = μ₀I_enclosed
```

### Faraday and Induction
```
Flux: Φ = BA cosθ
Faraday: EMF = -dΦ/dt = -N dΦ/dt (N turns)
Lenz: induced current opposes change in flux
Motional EMF: ε = Bvl (conductor moving in field)
Self-inductance: ε = -L dI/dt; Solenoid: L = μ₀n²Al
Mutual inductance: ε₂ = -M dI₁/dt
```
