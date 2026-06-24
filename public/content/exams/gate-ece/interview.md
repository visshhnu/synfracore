# GATE ECE Interview Preparation (PSU and M.Tech)

## PSU Interviews (DRDO, BEL, BHEL, ISRO, BSNL)

```
COMMON TECHNICAL QUESTIONS:

NETWORKS:
  Q: What is the significance of Thevenin's theorem?
  A: Simplifies complex circuits to a voltage source and series resistance.
     Makes load analysis much easier — change load without re-solving the network.

  Q: Define Q factor of a resonant circuit.
  A: Q = f₀/BW = ω₀L/R = (1/R)√(L/C). High Q means narrow bandwidth, sharper resonance.
     Practical inductors have Q of 10-200; crystals have Q of 10,000+.

SIGNALS AND SYSTEMS:
  Q: What is aliasing and how is it prevented?
  A: Aliasing occurs when a signal is sampled below Nyquist rate (fs < 2fmax).
     Spectral copies overlap, causing distortion. Prevented by:
     1. Low-pass anti-aliasing filter before ADC
     2. Oversampling (fs >> 2fmax)

  Q: What is the difference between energy signal and power signal?
  A: Energy signal: finite total energy, zero average power (pulse, finite duration)
     Power signal: infinite energy, finite non-zero average power (periodic signal)
     Signal cannot be both simultaneously.

ELECTRONIC DEVICES:
  Q: What happens at the PN junction under reverse bias?
  A: Depletion region widens, barrier potential increases, very small reverse saturation
     current flows (due to minority carriers). At breakdown voltage: Zener (< 5.5V,
     tunneling) or avalanche multiplication (> 5.5V) causes sharp current increase.

CONTROL SYSTEMS:
  Q: What is steady-state error and how is it reduced?
  A: Difference between desired and actual output in steady state.
     For step input: ess = 1/(1+Kp) where Kp = position error constant
     Reduced by: increasing open-loop gain, or adding integral (I) control

COMMUNICATIONS:
  Q: Why is FM preferred over AM for broadcast?
  A: FM has better noise immunity (noise mainly affects amplitude, not frequency).
     FM provides higher fidelity (wider bandwidth used productively).
     FM is less affected by multipath propagation.
     Trade-off: FM uses more bandwidth (Carson's rule BW = 2(Δf + fm))
```

## M.Tech Interview at IITs/NITs

```
FOCUS AREAS:
  Your GATE weak areas (they will probe these)
  Your undergraduate project (explain clearly, justify choices)
  Research interests (read 2-3 recent papers in your area)
  Why this institute and this lab/professor

COMMON M.TECH INTERVIEW QUESTIONS:
  Explain your B.Tech project in 2 minutes
  What area do you want to work in for M.Tech?
  Difference between FPGA and ASIC — when to use which?
  What is VLSI design flow? (Specification → RTL → Synthesis → PnR → Fabrication)
  Explain any one recent paper in your interest area

SOFT SKILLS:
  Be honest if you do not know — show reasoning ability instead
  Draw diagrams — ECE is visual, diagrams impress panelists
  Link theory to practical applications (ISRO uses X, DRDO uses Y)
```

## Study Resources
- **GATE Forum / GATE Overflow** — peer discussions and previous interview experiences
- **PSU Placement Paper Archives** (freshersworld, indiabix) — company-specific questions
- **IIT department websites** — research areas of individual professors before interview
- **IEEE Spectrum / Electronics For You** — stay updated on industry trends
