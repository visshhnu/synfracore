# Spacecraft Systems & Mission Design — Advanced

Overview listed communications as a core spacecraft bus subsystem but didn't quantify it. This page builds a real link budget — the standard engineering tool for answering "will this radio link actually work across real distance," expressed in decibels (dB), which turns a chain of multiplications and divisions into simple addition and subtraction.

**Analogy** — A link budget is like a financial budget, but for signal strength instead of money: you start with how much signal "income" the transmitter provides (EIRP), subtract every real "expense" along the way (path loss over distance, cable losses), add back any "bonus" from the receiving antenna's gain, and check whether what's left over still clears the minimum "bill" the receiver needs to understand the signal at all (receiver sensitivity). If income minus expenses still exceeds the bill, with room to spare, the link "closes" — the mission's communications actually work.

## Why Decibels — Turning Multiplication Into Addition

```
Radio link calculations naturally involve multiplying and dividing
many very large and very small numbers (transmit power in watts,
path loss factors that can be a trillion-to-one or worse over long
distances). Decibels (dB) are a LOGARITHMIC scale specifically so
these multiplications become simple ADDITIONS:

  Power in dBW = 10 · log10(Power in Watts)

Once every quantity is in dB (or a dB-based unit like dBW or dBi),
an entire link budget becomes pure addition and subtraction --
this is the whole practical reason dB is used universally in
communications engineering, not an arbitrary convention.
```

## The Link Budget Equation

```
EIRP (Effective Isotropic Radiated Power, dBW) =
    Transmit power (dBW) + Transmit antenna gain (dBi)
    - Transmit line loss (dB)

Free Space Path Loss (FSPL, dB) -- how much signal strength is lost
simply from spreading out over distance:
    FSPL = 20·log10(distance_km) + 20·log10(frequency_MHz) + 32.44

Received power (dBW) =
    EIRP - FSPL + Receive antenna gain (dBi) - Receive line loss (dB)

Link margin (dB) = Received power (dBW) - Receiver sensitivity (dBW)

A POSITIVE link margin means the link closes (received signal
exceeds what the receiver needs); a NEGATIVE margin means it
doesn't -- the mission's communications would simply fail at that
distance/configuration, no matter how good the rest of the mission
design is.
```

### Annotated Example — A GEO Satellite Downlink

A GEO communications satellite (35,786 km altitude) transmits at 8,400 MHz (X-band) with 10 W of transmit power, a 30 dBi transmit antenna, and 1 dB of transmit line loss. The ground station has a 50 dBi receive antenna, 0.5 dB of receive line loss, and a receiver sensitivity threshold of -120 dBW.

```
Given:  d = 35,786 km, f = 8,400 MHz
        Pt = 10 W, Gt = 30 dBi, Lt = 1 dB
        Gr = 50 dBi, Lr = 0.5 dB, sensitivity = -120 dBW

Step 1 -- transmit power in dBW:
  Pt(dBW) = 10 · log10(10) = 10 dBW

Step 2 -- EIRP:
  EIRP = 10 + 30 - 1 = 39 dBW

Step 3 -- free space path loss:
  FSPL = 20·log10(35,786) + 20·log10(8,400) + 32.44
  FSPL = 91.08 + 78.49 + 32.44
  FSPL ≈ 202.0 dB

Step 4 -- received power:
  Rx power = 39 - 202.0 + 50 - 0.5 = -113.5 dBW

Step 5 -- link margin:
  Link margin = -113.5 - (-120) = +6.5 dB

Verified computationally: a POSITIVE +6.5 dB margin -- this link
closes, with a real, if modest, safety margin above the receiver's
minimum sensitivity threshold. This 6.5 dB margin is the actual
number a communications engineer would review to decide whether the
design has enough real-world safety margin (for rain fade, pointing
error, or component aging) or needs a stronger transmitter, bigger
antenna, or a more sensitive receiver.
```

## Try It (2 Minutes)

Using the same GEO scenario, but with a weaker transmitter — only 5 W instead of 10 W (everything else unchanged: Gt = 30 dBi, Lt = 1 dB, FSPL ≈ 202.0 dB, Gr = 50 dBi, Lr = 0.5 dB, sensitivity = -120 dBW).

1. Compute the new transmit power in dBW.
2. Compute the new EIRP, received power, and link margin.
3. Does this link still close? By how much did the margin change from the 10 W case's +6.5 dB, and does halving transmit power in Watts correspond to a simple, predictable change in dB?

You should land on: Pt(dBW) = 10·log10(5) ≈ 7.0 dBW; EIRP = 7.0 + 30 - 1 = 36.0 dBW; Rx power = 36.0 - 202.0 + 50 - 0.5 = -116.5 dBW; link margin = -116.5 - (-120) = +3.5 dB. The link still closes (positive margin), but with meaningfully less safety margin than the 10 W case. Notice the margin dropped by almost exactly 3 dB (6.5 to 3.5) when transmit power was HALVED — this isn't a coincidence: halving power is a factor of 2, and 10·log10(2) ≈ 3.01 dB, confirming the general rule that halving power always costs almost exactly 3 dB in any link budget, regardless of the specific mission's other numbers.

## Study Resources
- **Wertz & Larson, *Space Mission Analysis and Design (SMAD)*** — the standard reference for spacecraft link budget analysis
- **NASA — "Deep Space Network" technical resources** (nasa.gov) — free background on real link budget engineering for space communications
- **Pratt, Bostian & Allnutt, *Satellite Communications*** — a standard, more advanced reference for link budget analysis and RF link design
