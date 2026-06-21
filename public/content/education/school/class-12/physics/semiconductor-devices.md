# Semiconductor Electronics

## Why This Chapter Matters
Semiconductor chapter gives 7-8 marks in CBSE Class 12. p-n junction, rectifier circuits, transistors, and logic gates are all standard board questions.

## Core Concepts

### 1. Energy Bands
**Conductor:** Valence band and conduction band overlap. Free electrons always available.
**Insulator:** Large energy gap (>3eV). Electrons can't cross to conduction band.
**Semiconductor:** Small energy gap (~1eV for Si, ~0.7eV for Ge). At room temperature, some electrons cross.

Intrinsic semiconductor: pure. Equal electrons and holes.
n-type: doped with pentavalent (P, As, Sb) → extra electrons as majority carriers.
p-type: doped with trivalent (B, Al, In) → extra holes as majority carriers.

### 2. p-n Junction
Formed when p-type and n-type semiconductors are joined.
**Depletion region:** At junction, electrons from n-side recombine with holes from p-side → region depleted of free carriers. Creates a built-in electric field (n→p direction).
**Potential barrier:** ~0.3V (Ge), ~0.7V (Si). Must overcome this for current to flow.

**Forward bias:** + to p-side, - to n-side. Depletion region narrows. Current flows easily (above threshold voltage).
**Reverse bias:** + to n-side, - to p-side. Depletion region widens. Only small reverse saturation current flows. At high reverse voltage → breakdown.

### 3. Rectifiers
**Half-wave rectifier:** One diode. Current flows only in positive half cycle.
Output frequency = input frequency. Ripple factor = 1.21.

**Full-wave rectifier:**
Centre-tap: Two diodes. Each conducts in alternate half cycles.
Bridge rectifier: Four diodes. More efficient.
Output frequency = 2 × input frequency. Ripple factor = 0.48.

**Filter capacitor:** Smoothens pulsating DC by storing charge during peaks.

### 4. Transistor
Three-layer sandwich: n-p-n or p-n-p. Three regions: Emitter (E), Base (B), Collector (C).
Base is thin and lightly doped.

**Transistor as amplifier (common emitter):**
Input: small signal between Base-Emitter. Output: amplified signal between Collector-Emitter.
Current gain β = ΔI_C/ΔI_B (typically 20-200).
I_E = I_B + I_C. I_C = βI_B.

**Transistor as switch:**
Cutoff: V_BE < 0.7V → no current, transistor OFF.
Saturation: large V_BE → transistor fully ON.
Digital circuits: transistor switches between cutoff and saturation.

### 5. Logic Gates
Basic gates from transistors (NAND, NOR) → used to make all other gates.

| Gate | Symbol | Expression | Truth Table |
|---|---|---|---|
| AND | A·B or AB | A·B | 11→1, others→0 |
| OR | A+B | A+B | 00→0, others→1 |
| NOT | Ā or A' | Ā | 1→0, 0→1 |
| NAND | (AB)' | Complement of AND | 11→0, others→1 |
| NOR | (A+B)' | Complement of OR | 00→1, others→0 |
| XOR | A⊕B | AB'+A'B | Same inputs→0, different→1 |

**Universal gates:** NAND and NOR can implement ANY Boolean function.
NOT from NAND: connect both inputs together.
AND from NAND: NAND followed by NOT.
OR from NAND: NOT both inputs, then NAND.

## Board Examples

**Q1:** Draw circuit of full-wave bridge rectifier. How does output frequency compare to input?
[4 diodes in bridge configuration]. Output frequency = 2 × input frequency (both half cycles rectified).

**Q2:** A transistor has β=100. If I_B=50μA, find I_C and I_E.
I_C = β×I_B = 100×50 = 5000μA = 5mA.
I_E = I_B+I_C = 50μA+5mA = 5.05mA.

## PYQs (CBSE)

**CBSE 2023:** Draw truth table for NAND gate. Show that NAND is a universal gate by implementing NOT, AND, OR from NAND gates only.
NAND: 00→1, 01→1, 10→1, 11→0.
NOT: A NAND A = Ā (connect both inputs).
AND: NAND(A,B) then NOT = (AB)'' = AB.
OR: NAND(Ā,B̄) = (Ā·B̄)' = A+B (De Morgan's).

**CBSE 2022:** What is the function of depletion layer in p-n junction? In which bias does it widen?
Depletion layer creates potential barrier preventing unrestricted current flow. It widens in REVERSE bias.

## Revision Notes
```
ENERGY BANDS:
Conductor: overlapping bands | Insulator: >3eV gap | Semiconductor: ~1eV gap
n-type: pentavalent dopant (extra e⁻) | p-type: trivalent dopant (extra holes)

p-n JUNCTION:
Depletion region: charge-depleted zone at junction
Forward bias: narrows depletion, current flows
Reverse bias: widens depletion, no current (till breakdown)

RECTIFIERS:
Half-wave: 1 diode, output freq=input freq, ripple=1.21
Full-wave bridge: 4 diodes, output freq=2×input, ripple=0.48

TRANSISTOR:
β=I_C/I_B | I_E=I_B+I_C | Amplifier (common emitter)
Switch: cutoff(OFF) ↔ saturation(ON)

LOGIC GATES:
NAND and NOR: universal gates (can make any other gate)
XOR: different inputs→1, same→0
De Morgan: (AB)'=A'+B' | (A+B)'=A'·B'
```
