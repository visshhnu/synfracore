# GATE ECE — Cheatsheet

## Key Formulas Quick Reference

### Network Analysis
```
Thevenin: Vth = Voc, Rth = Voc/Isc
Norton: In = Isc, Rn = Rth
Max Power Transfer: RL = Rth, Pmax = Vth²/4Rth

AC: Z = R + jωL - j/(ωC)
Resonance: ωr = 1/√(LC)
Q-factor: Q = ωrL/R = 1/(ωrRC)
```

### Electronic Devices
```
Diode: I = Is(e^(V/nVT) - 1), VT = kT/q = 26mV @ 300K
BJT: IC = βIB, IE = IC + IB = (1+β)IB
     α = β/(1+β), β = α/(1-α)
MOSFET linear: IDS = μnCox(W/L)[(VGS-VT)VDS - VDS²/2]
MOSFET saturation: IDS = μnCox(W/2L)(VGS-VT)²
```

### Signals and Systems
```
Fourier: X(f) = ∫x(t)e^(-j2πft)dt
Convolution: y(t) = x(t)*h(t) = ∫x(τ)h(t-τ)dτ
Parseval's: ∫|x(t)|²dt = ∫|X(f)|²df
Energy: E = ∫|x(t)|²dt
Power (periodic): P = (1/T)∫|x(t)|²dt
```

### Control Systems
```
Closed-loop TF: T(s) = G(s)/[1+G(s)H(s)]
Steady-state errors:
  Type 0: Kp = G(0), ess = R/(1+Kp)
  Type 1: Kv = lim(sG(s)), ess = R/Kv
  Type 2: Ka = lim(s²G(s)), ess = R/Ka
Routh stability: all left column elements > 0
```

### Communications
```
AM BW = 2W, FM BW ≈ 2(Δf+W) [Carson]
FM deviation: Δf = kf × max|m(t)|
BPSK: Pe = Q(√(2Eb/N0))
QPSK: Pe = Q(√(2Eb/N0)) same as BPSK!
Shannon: C = B log₂(1+SNR) bits/sec
```

### Electromagnetic Theory
```
Maxwell's equations (differential form):
∇·D = ρv        (Gauss's law)
∇·B = 0         (no magnetic monopoles)
∇×E = -∂B/∂t   (Faraday's law)
∇×H = J + ∂D/∂t (Ampere's law)

Wave equation: ∇²E = με ∂²E/∂t²
Skin depth: δ = √(2/ωμσ)
```

## GATE ECE Previous Year Hot Topics
- Network theorems (Thevenin, Norton, Superposition): every year
- MOSFET: Q-point, small-signal analysis: 2-3 questions
- Bode plots / Root locus: 1-2 questions
- Z-transform / DFT: 1-2 questions
- Digital modulation BER: 1 question
- Antenna parameters (gain, directivity, beamwidth): 1 question
