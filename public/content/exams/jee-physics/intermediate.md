# JEE Physics Intermediate Topics

## Rotational Mechanics (High Importance)

```
KEY CONCEPTS:
  Moment of Inertia (I): I = Σmr² (discrete) | I = ∫r²dm (continuous)
  
  Standard MI values:
    Solid sphere about diameter: I = 2mr²/5
    Hollow sphere about diameter: I = 2mr²/3
    Solid cylinder about axis: I = mr²/2
    Thin ring about axis: I = mr²
    Rod about centre: I = mL²/12 | about end: I = mL²/3
  
  Parallel axis theorem: I = Icm + md²
  Perpendicular axis theorem (lamina): Iz = Ix + Iy

  Torque: τ = r × F = Iα
  Angular momentum: L = Iω | dL/dt = τ
  Conservation of L: when τ_external = 0

ROLLING MOTION:
  Rolling without slipping: v = rω (constraint)
  Total KE = Translational KE + Rotational KE
    = ½mv² + ½Iω² = ½mv²(1 + I/mr²)
  
  Acceleration on incline:
    a = g sinθ / (1 + I/mr²)
    Ring < Cylinder < Sphere (least a to most a, i.e., ring slowest down incline)

TYPICAL PROBLEMS:
  Toppling condition: normal force moves to edge when CG tilts beyond base
  Angular impulse: J = τ·Δt = ΔL (analogous to linear impulse)
```

## Electromagnetic Induction

```
FARADAY'S LAW: EMF = -dΦ/dt where Φ = B·A·cos θ (flux)
LENZ'S LAW: induced current opposes the change in flux

MOTIONAL EMF: ε = BLv (rod of length L moving at velocity v in field B)

SELF INDUCTANCE: L = NΦ/I | ε = -L dI/dt
  Inductor energy: U = ½LI²
  
RL CIRCUIT:
  Growth: I = (V/R)(1 - e^(-t/τ)) where τ = L/R
  Decay: I = I₀e^(-t/τ)

AC CIRCUITS:
  XL = ωL | XC = 1/(ωC) | Z = √(R² + (XL-XC)²)
  Power: P = VrmsIrms cos φ where cos φ = R/Z (power factor)
  Resonance: XL = XC → ω₀ = 1/√(LC) → Z = R (minimum, purely resistive)
  At resonance: current maximum, power maximum, voltage across L and C can exceed supply
```

## Study Resources
- **DC Pandey Electricity and Magnetism** — for class 12 topics, excellent problems
- **HC Verma Exercise problems** — all must be solved (use solutions for guidance)
- **JEE Advanced PYQ** — 2010-2024, difficulty level guide
- **NPTEL Physics** — IIT Kharagpur free lecture series
