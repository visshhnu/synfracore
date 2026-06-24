# GATE ECE Intermediate Preparation

## Subject-wise Study Strategy

```
NETWORKS — IMPORTANT TOPICS:
  Mesh and node analysis: systematic method for complex circuits
  Thevenin/Norton: simplify circuit to equivalent source
    Vth = open circuit voltage | Rth = resistance with sources zeroed
    IN = short circuit current | RN = Rth (same value)
  
  Maximum power transfer: R_load = Rth (for AC: Z_load = Z_th*)
  
  Laplace in circuits:
    Resistor: R | Inductor: sL + initial condition | Capacitor: 1/sC
    Solve circuit in s-domain, inverse Laplace for time domain response

CONTROL SYSTEMS — KEY FORMULAS:
  Closed loop TF: C(s)/R(s) = G(s) / [1 + G(s)H(s)]
  
  Time domain specs for second-order:
    Damping ratio ξ | Natural frequency ωn
    Rise time | Peak time | Settling time | Overshoot
  
  Stability from Bode:
    Gain margin: GM = -|G(jω)| at phase crossover (phase = -180°)
    Phase margin: PM = ∠G(jω) + 180° at gain crossover (|G|=1=0dB)
    Stable if GM > 0 dB and PM > 0°

DIGITAL CIRCUITS — K-MAP MINIMISATION:
  2-variable: 4 cells | 3-variable: 8 cells | 4-variable: 16 cells
  Group: 1,2,4,8 (powers of 2)
  Identify: SOP (sum of minterms) or POS (product of maxterms)
  Essential prime implicants must be included
  
  SOP to NAND-NAND: apply De Morgan's theorem
  POS to NOR-NOR: dual of SOP minimisation

SIGNALS AND SYSTEMS — KEY PROPERTIES:
  Fourier Transform pairs (must memorise):
    rect(t/T) ↔ T.sinc(fT) | δ(t) ↔ 1 | e^(-at)u(t) ↔ 1/(a+j2πf)
    cos(2πf₀t) ↔ ½[δ(f-f₀)+δ(f+f₀)] | sin(2πf₀t) ↔ j/2[δ(f+f₀)-δ(f-f₀)]
  
  Convolution in time ↔ Multiplication in frequency
  Multiplication in time ↔ Convolution in frequency (duality)
```

## Solved Problem Strategy

```
GATE APPROACH FOR ECE:
  1-mark questions: 65 questions × 1 = 65 marks
  2-mark questions: 30 questions × 2 = 60 marks + general aptitude 15 marks
  Total: 100 marks, 3 hours

  Easy 1-mark questions: attempt all
  Numerical Answer Type (NAT): no negative marking — always attempt
  MCQ 1-mark: skip if less than 70% confident (1/3 negative)
  MCQ 2-mark: skip if less than 60% confident (2/3 negative)

SECTION-WISE TIME ALLOCATION:
  GA (General Aptitude): 20-25 minutes (easy, high ROI)
  Math: 30-35 minutes
  Networks + Devices: 40-45 minutes
  Signals + Control: 35-40 minutes
  Analog + Digital: 30-35 minutes
  Communications + EM: 30-35 minutes
```

## Study Resources
- **GATE ECE Topicwise Solved Papers 2010-2024** — mandatory, all publishers
- **Haykin Communication Systems** — for communications in depth
- **Nillson and Riedel Electric Circuits** — for network analysis
- **Boylestad Introductory Circuit Analysis** — alternative network reference
