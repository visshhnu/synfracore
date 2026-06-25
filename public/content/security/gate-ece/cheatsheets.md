# GATE ECE Cheatsheet

## Key Formulas

### Network Theory
```
KVL: ΣV = 0 (around any closed loop)
KCL: ΣI = 0 (at any node)
Thevenin: Vth = Voc, Rth = Voc/Isc
Norton: In = Isc, Rn = Rth
Power AC: P = Vrms × Irms × cosφ
Impedance: Z = R + jX; |Z| = √(R²+X²)
Resonance: ω₀ = 1/√(LC); Q = ω₀L/R
```

### Transform Pairs
| Signal | Laplace | Fourier |
|--------|---------|---------|
| δ(t) | 1 | 1 |
| u(t) | 1/s | πδ(f)+1/(j2πf) |
| e^{-at}u(t) | 1/(s+a) | 1/(a+j2πf) |
| cos(ω₀t) | s/(s²+ω₀²) | [δ(f-f₀)+δ(f+f₀)]/2 |

### Modulation Bandwidth
| Type | Bandwidth |
|------|----------|
| AM | 2W |
| DSB-SC | 2W |
| SSB | W |
| FM (Carson's rule) | 2(Δf + W) |

### Control Systems
```
2nd order: ωn (natural), ζ (damping)
Overdamped: ζ>1 | Critically: ζ=1 | Underdamped: 0<ζ<1
Overshoot: e^{-πζ/√(1-ζ²)} × 100%
Settling (2%): 4/(ζωn)
Gain Margin: at phase = -180°
Phase Margin: at |G(jω)| = 1
```

### Semiconductor
```
NMOS saturation: ID = (μnCox/2)(W/L)(VGS-Vth)²
gm = 2ID/(VGS-Vth) = √(2μnCox(W/L)ID)
BJT active: IC = IS × e^(VBE/VT), VT = kT/q ≈ 26mV
β = IC/IB; α = IC/IE; β = α/(1-α)
```

## Subject-wise Weightage (approx)
| Subject | Marks |
|---------|-------|
| Engineering Maths | 13 |
| Networks | 10 |
| Electronic Devices | 8 |
| Analog Circuits | 10 |
| Digital Circuits | 8 |
| Signals & Systems | 10 |
| Control Systems | 8 |
| Communications | 10 |
| EM Theory | 9 |

## Key Physical Constants
- c = 3×10^8 m/s | ε₀ = 8.85×10^-12 F/m | μ₀ = 4π×10^-7 H/m
- q = 1.6×10^-19 C | kT/q ≈ 26 mV at 300K | h = 6.626×10^-34 J·s

## Boolean Algebra Laws
```
De Morgan: (A+B)' = A'B' | (AB)' = A'+B'
Consensus: AB + A'C + BC = AB + A'C
Duality: swap AND↔OR and 0↔1
```
