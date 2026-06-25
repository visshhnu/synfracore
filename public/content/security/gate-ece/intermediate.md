# GATE ECE Intermediate Topics

## Signals and Systems — Key Results

### Fourier Transform Pairs
| Signal | FT |
|--------|-----|
| rect(t/T) | T sinc(fT) |
| sinc(2Wt) | (1/2W) rect(f/2W) |
| δ(t) | 1 |
| e^{-at}u(t) | 1/(a+j2πf) |
| cos(2πf₀t) | (δ(f-f₀) + δ(f+f₀))/2 |

### Sampling Theorem
- Nyquist rate = 2 × maximum frequency
- Aliasing: occurs when sampled below Nyquist rate
- Reconstruction: ideal lowpass filter with bandwidth = Nyquist frequency

## Control Systems — Stability Analysis

### Routh-Hurwitz Criterion
For characteristic polynomial a₀s^n + a₁s^(n-1) + ... + aₙ = 0:
- All coefficients must be positive (necessary)
- Build Routh array; count sign changes in first column = number of RHP poles

### Bode Plot Basics
- **Gain Margin**: Additional gain before instability at phase crossover frequency
- **Phase Margin**: Additional phase before instability at gain crossover frequency
- Stable system: GM > 0 dB, PM > 0°

### Root Locus Rules
1. Starts at poles (K=0), ends at zeros (K=∞)
2. Symmetric about real axis
3. Real axis portion: left of odd count of poles+zeros
4. Asymptote angles: (2k+1)×180° / (P-Z)
5. Centroid: (Σpoles - Σzeros) / (P-Z)

## Electronic Devices — MOSFET

### NMOS Regions
- **Cutoff**: VGS < Vth → ID = 0
- **Linear (Triode)**: VGS > Vth, VDS < VGS-Vth → ID = k[(VGS-Vth)VDS - VDS²/2]
- **Saturation**: VGS > Vth, VDS ≥ VGS-Vth → ID = k/2 × (VGS-Vth)²

### Small Signal Model
- gm = 2ID/(VGS-Vth) [transconductance]
- ro = VA/ID [output resistance]

## Analog Circuits — Op-Amp Applications
```
Inverting: Vout = -(Rf/R1) × Vin
Non-inverting: Vout = (1 + Rf/R1) × Vin
Integrator: Vout = -(1/RC) ∫ Vin dt
Differentiator: Vout = -RC × dVin/dt
Difference: Vout = (Rf/R1)(V2 - V1)
```

## Communications — Noise Performance
- **SNR**: Signal power / Noise power (often in dB)
- **Figure of Merit**: SNR_output / SNR_input
- DSB-SC: Figure of merit = 1
- SSB: Figure of merit = 1
- AM (full): < 1 (carrier power wasted)
- FM: > 1 (wideband FM has capture effect)

## Electromagnetics — Transmission Lines
- Characteristic impedance: Z₀ = √(L/C) per unit length
- Reflection coefficient: Γ = (ZL - Z₀)/(ZL + Z₀)
- Standing Wave Ratio: SWR = (1+|Γ|)/(1-|Γ|)
- Matched load: ZL = Z₀, Γ = 0, SWR = 1
