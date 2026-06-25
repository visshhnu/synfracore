# GATE ECE Advanced Topics

## Advanced Signals and Systems

### Discrete-Time Systems
- Z-transform: X(z) = Σ x[n] z^(-n)
- ROC determines stability and causality
- Inverse Z-transform: partial fractions or power series
- Difference equations → Z-domain analysis

### Filter Design
- IIR filters: Butterworth, Chebyshev, Elliptic — recursive, efficient
- FIR filters: Linear phase, always stable — non-recursive
- Bilinear transformation: maps analog to digital filter

## Advanced Control Systems

### State Space Representation
- ẋ = Ax + Bu, y = Cx + Du
- Controllability: rank[B AB A²B...] = n
- Observability: rank[C CA CA²...]^T = n
- State feedback: u = -Kx (pole placement)

### Digital Control
- Sampling and hold
- Z-domain transfer function
- Jury stability criterion (discrete equivalent of Routh)

## RF and Microwave

### Transmission Line Smith Chart
- Normalize impedances by Z₀
- Clockwise rotation = moving toward generator
- Full rotation = λ/2 along line
- Used for: impedance matching, finding Γ, SWR

### Antenna Parameters
- **Radiation Resistance**: Equivalent resistance dissipating radiated power
- **Directivity**: Power density vs isotropic radiator
- **Gain** = Directivity × Efficiency
- **Effective Aperture**: Ae = λ²G/(4π)
- Friis transmission: Pr = Pt Gt Gr (λ/4πR)²

## Information Theory

### Entropy and Channel Capacity
- H(X) = -Σ p(x) log₂ p(x) bits
- Mutual Information: I(X;Y) = H(X) - H(X|Y)
- Channel Capacity: C = max_{p(x)} I(X;Y)
- AWGN Channel: C = B log₂(1 + SNR) [Shannon-Hartley]

### Source and Channel Coding
- Huffman coding: optimal prefix code, achieves entropy
- Hamming distance: number of bit positions differing
- (n,k) code: n bits total, k data bits, n-k parity bits
- Minimum distance d_min ≥ 2t+1 to correct t errors

## Advanced Analog Circuits

### Phase-Locked Loop (PLL)
Components: Phase Detector + Loop Filter + VCO
Applications: frequency synthesis, clock recovery, FM demodulation.
Lock range vs capture range.

### Switched-Mode Power Supplies
- Buck: step-down, duty cycle D = Vout/Vin
- Boost: step-up, D = 1 - Vin/Vout
- Buck-Boost: inverting, D = Vout/(Vin+Vout)
