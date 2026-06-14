# GATE ECE — Intermediate

## Core Technical Topics

### Network Analysis
```
Key concepts:
- KVL (Kirchhoff's Voltage Law): ΣV around loop = 0
- KCL (Kirchhoff's Current Law): ΣI at node = 0
- Thevenin's theorem: Replace network with Vth and Rth
- Norton's theorem: Replace with In and Rn
- Superposition: Analyze one source at a time
- Maximum Power Transfer: RL = Rth for max power
- Two-port networks: Z, Y, h, ABCD parameters

AC circuits:
- Impedance: Z = R + jX, |Z| = √(R² + X²)
- Resonance: ωr = 1/√(LC), Q factor
- Power factor: PF = cos(θ) = R/|Z|
```

### Electronic Devices
```
Key concepts:
- PN junction: built-in potential, depletion width, V-I characteristics
- Diode equation: I = Is(e^(V/VT) - 1), VT = 26mV at room temp
- BJT: α = IC/IE, β = IC/IB, Q-point analysis
- MOSFET: threshold voltage, linear/saturation regions
  - IDS = (μnCox W/L)[(VGS-VT)VDS - VDS²/2] (linear)
  - IDS = (μnCox W/2L)(VGS-VT)² (saturation)
- CMOS: complementary NMOS+PMOS, static power = 0, dynamic power = CV²f
```

### Digital Circuits
```
Boolean algebra:
- De Morgan's: (A+B)' = A'.B', (A.B)' = A'+B'
- SOP and POS minimization: Karnaugh maps (up to 4 variables)

Sequential circuits:
- SR flip-flop, D flip-flop, JK flip-flop
- Registers, counters (synchronous vs asynchronous)
- Setup time, hold time, propagation delay

Combinational:
- Multiplexer, demultiplexer, encoder, decoder
- Adders: half adder, full adder, ripple carry, look-ahead carry
```

## Practice Strategy

For GATE ECE, numerical problems are critical. Practice:
1. 10+ problems per topic per day
2. Previous year GATE ECE papers (2010-2024)
3. GATE Overflow website — every question with detailed solutions
