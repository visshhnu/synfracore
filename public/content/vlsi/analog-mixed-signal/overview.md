# Analog & Mixed-Signal Design — Overview

**Before you start:** [Digital Logic & Design Fundamentals](/academies/vlsi/digital-logic-fundamentals/overview) is assumed — the digital-track technologies (HDL, RTL, Verification, Physical Design) are useful context but not strictly required, since this is a parallel branch.

Every technology since Digital Logic & Design Fundamentals — HDL, RTL Design, Functional Verification, Physical Design — has stayed on the digital side: signals that only ever sit at 0 or 1. Real-world signals (sound, temperature, voltage from a sensor) don't work that way — they vary continuously. Analog & Mixed-Signal Design branches off directly from Digital Logic Fundamentals rather than continuing the digital chain, because it needs that same foundation (Boolean 0/1 thinking, binary number representation) but applies it to a genuinely different problem: circuits that process continuous voltages, and the boundary components (ADCs and DACs) that translate between the continuous analog world and the discrete digital world every other technology in this academy assumes.

**Analogy** — A digital signal is a light switch: fully on or fully off, nothing in between, exactly the 0/1 world Digital Logic Fundamentals introduced. An analog signal is a dimmer switch: it can sit at any brightness level continuously, not just two fixed states. An ADC (Analog-to-Digital Converter) is what happens when you photograph the dimmer switch's position and round it to the nearest notch on a numbered dial — you lose some precision (rounding to the nearest notch), but you now have a number a digital circuit can actually store and compute with, connecting the continuous dimmer-switch world back to the 0/1 world every other technology in this academy operates in.

## Why This Track Branches Off Here, Not Later

```
Digital Logic & Design Fundamentals gave two things this technology
still needs directly:
  BOOLEAN 0/1 THINKING     — reused specifically at the ADC/DAC
                              boundary, where a continuous voltage
                              gets mapped to a binary code
  NUMBER SYSTEMS (BINARY)  — reused directly: an N-bit ADC produces
                              exactly the kind of N-bit binary code
                              from Digital Logic Fundamentals'
                              conversion examples, just now derived
                              from a real physical voltage instead
                              of a decimal-to-binary exercise

Everything HDL, RTL Design, Functional Verification, and Physical
Design added after that point — flip-flops, FSMs, testbenches,
synthesis, routing — assumes signals are ALREADY digital. Analog
design doesn't build on any of that; it's a parallel track that
shares only the Digital Logic Fundamentals baseline, which is why
this academy's dependency order places it here, branching off
immediately after (1) rather than continuing through (2)-(5).
```

## The Operational Amplifier (Op-Amp) — The Core Analog Building Block

```
An op-amp is the analog equivalent of a universal gate (NAND/NOR
from Digital Logic Fundamentals) -- a single building block that,
wired differently, implements a wide range of different functions:
amplification, filtering, summing, buffering.

Two of the most common configurations:

INVERTING AMPLIFIER            NON-INVERTING AMPLIFIER
  Vout = -(Rf / Rin) x Vin       Vout = (1 + Rf / Rin) x Vin
  Output is INVERTED             Output is SAME polarity as input
  (opposite sign) from input     (never negative gain)
  Gain set entirely by the       Gain set entirely by the same
  ratio of two resistors --      resistor ratio, offset by 1 --
  no other component values      again, entirely resistor-ratio
  matter for the gain itself     controlled
```

```conceptgrid
{
  "boxes": [
    { "title": "Inverting Amplifier", "description": "Vout = -(Rf/Rin) x Vin -- output polarity flips", "color": "blue" },
    { "title": "Non-Inverting Amplifier", "description": "Vout = (1 + Rf/Rin) x Vin -- same polarity as input", "color": "purple" }
  ]
}
```

### Annotated Example — Computing Op-Amp Gain

**Inverting amplifier**: Rf = 10 kΩ, Rin = 1 kΩ, Vin = 0.5 V

```
Vout = -(Rf / Rin) x Vin
     = -(10,000 / 1,000) x 0.5
     = -(10) x 0.5
     = -5.0 V
```

**Non-inverting amplifier**: Rf = 9 kΩ, Rin = 1 kΩ, Vin = 1.0 V

```
Vout = (1 + Rf / Rin) x Vin
     = (1 + 9,000/1,000) x 1.0
     = (1 + 9) x 1.0
     = 10.0 V
```

Verified computationally: the inverting configuration produces exactly -5.0 V (negative, confirming the inversion), and the non-inverting configuration produces exactly 10.0 V (positive, confirming no inversion) — both derived purely from resistor ratios, which is the entire practical appeal of op-amp circuits: gain is set by cheap, precise, easily-manufactured resistors rather than by the op-amp's own internal characteristics, which can vary between individual chips.

## ADC and DAC — The Bridge Between Analog and Digital

```
An N-bit ADC divides its reference voltage range into 2^N discrete
steps, and outputs the N-bit binary CODE (Digital Logic
Fundamentals' number-system vocabulary, applied here) corresponding
to which step the input voltage falls into.

A DAC does the reverse: given an N-bit binary code, it outputs the
corresponding analog voltage step.

Neither conversion is perfect -- rounding a continuous voltage to
the nearest discrete step always loses some precision, called
QUANTIZATION ERROR, covered with real numbers on the Fundamentals
page.
```

## Try It (2 Minutes)

Using the same inverting-amplifier formula above, an op-amp circuit has Rf = 20 kΩ, Rin = 2 kΩ, and Vin = 0.3 V.

1. What is the gain magnitude (Rf/Rin)?
2. What is Vout?
3. Is the output inverted (opposite sign) or same-sign as the input?

You should land on: gain magnitude = 20,000/2,000 = 10; Vout = -(10) × 0.3 = -3.0 V; the output is inverted (negative), since a positive 0.3 V input produces a negative 3.0 V output — exactly the defining behavior of the inverting configuration, the same sign-flip pattern confirmed in the -5.0 V annotated example above.

## Study Resources
- **Sedra & Smith, *Microelectronic Circuits*** — the standard university-level textbook covering op-amp configurations and analog fundamentals
- **Analog Devices — "MT-044: Op Amp Fundamentals" (Analog Dialogue tutorial series)** — free, practically oriented reference on op-amp gain equations
- **Cadence Community — "Is Anyone Designing AMS at 28nm?"** (community.cadence.com) — industry discussion of why analog design and process-node choice differ from digital, referenced further on the Interview page
