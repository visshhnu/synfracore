# GATE ECE — Advanced

## Advanced Topics

### Signals and Systems
```
Fourier Transform pairs (must memorize):
- rect(t) ↔ sinc(f)
- δ(t) ↔ 1
- e^(-at)u(t) ↔ 1/(a+j2πf)
- cos(2πf₀t) ↔ [δ(f-f₀) + δ(f+f₀)]/2

Laplace Transform:
- Region of Convergence (ROC) determines causality/stability
- System stable ↔ poles in left half of s-plane
- Transfer function H(s) = Y(s)/X(s)

Z-Transform:
- z = e^(sT) where T = sampling period
- Stability: poles inside unit circle
- DFT: X[k] = Σx[n]e^(-j2πkn/N)
- FFT: O(N log N) vs DFT's O(N²)
```

### Control Systems
```
Transfer function and block diagrams:
- Closed-loop TF: C(s)/R(s) = G(s)/[1+G(s)H(s)]
- Steady-state errors: position, velocity, acceleration error constants

Stability analysis:
- Routh-Hurwitz: all coefficients positive AND Routh array elements positive
- Bode plot: gain margin, phase margin
  - Gain margin: 20log₁₀|G(jω)| at phase crossover frequency
  - Phase margin: 180° + ∠G(jω) at gain crossover frequency
- Nyquist criterion: encirclements of -1+j0 point
- Root locus: poles move from open-loop poles to open-loop zeros as K→∞
```

### Communications
```
Analog Modulation:
- AM: s(t) = [1 + m(t)]Ac cos(2πfct), BW = 2W, efficiency depends on modulation index
- FM: s(t) = Ac cos[2πfct + 2πkf∫m(τ)dτ], BW = 2(Δf+W) [Carson's rule]
- PM: phase proportional to message signal

Digital Modulation:
- ASK: amplitude varies with bits
- FSK: frequency varies (BW = 2Δf + 2W)
- BPSK: BW = 2/Tb, Pe = Q(√(2Eb/N0))
- QPSK: same BW as BPSK, twice the bit rate
- QAM: M-QAM, log₂(M) bits per symbol

Shannon's theorem:
- Channel capacity: C = B log₂(1 + SNR)
- B = bandwidth, SNR = signal-to-noise ratio
```

## High-Yield Numerical Practice

Focus on these question types (appear every year):
1. Finding Q-point for BJT/MOSFET circuits
2. Bode plot gain/phase margin calculation
3. Fourier/Laplace/Z-transform pairs and properties
4. SNR and BER calculations for digital modulation
5. Steady-state error for different system types and input signals
