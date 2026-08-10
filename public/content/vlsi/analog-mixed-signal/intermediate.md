# Analog & Mixed-Signal Design — Intermediate

Overview mentioned filtering as one of the op-amp's core applications without quantifying it. This page builds the simplest real filter — a single-pole RC low-pass filter — and computes the two numbers that define it: cutoff frequency, and how sharply the filter attenuates signals above that cutoff. Both connect directly to the resistor/capacitor components this technology's op-amp circuits already use.

**Analogy** — An RC low-pass filter is a bouncer at a club door who lets slow-moving (low-frequency) signals through easily but makes fast-moving (high-frequency) signals wait — not an abrupt cutoff at one exact frequency, but a gradual, predictable "the faster you're moving, the harder it gets to enter" rule. The cutoff frequency is the point where the bouncer starts noticeably turning people away; well above it, entry is much harder, but never zero — it's a gradual rolloff, not a wall.

## The RC Low-Pass Filter — Cutoff Frequency

```
A single resistor and capacitor, arranged with the capacitor across
the output, forms the simplest possible low-pass filter. Its cutoff
frequency (the point where output amplitude has dropped to about
70.7% of its low-frequency value, a standard reference point called
the -3 dB point) is:

  fc = 1 / (2 x pi x R x C)

Below fc, the filter passes signals through with little attenuation.
Above fc, attenuation increases steadily -- specifically at a rate
of -20 dB per decade (a 10x increase in frequency) for this simplest,
single-pole filter design.
```

### Annotated Example — Computing a Filter's Cutoff Frequency

An RC low-pass filter with R = 10 kΩ and C = 100 nF.

```
Given:  R = 10,000 ohm, C = 100 x 10^-9 F = 100 nF

fc = 1 / (2 x pi x R x C)
   = 1 / (2 x pi x 10,000 x 100x10^-9)
   = 1 / (2 x pi x 0.001)
   = 159.15 Hz

Verified computationally: this specific R/C combination sets the
cutoff at approximately 159.15 Hz -- signals well below this (say,
a 20 Hz audio bass note) pass through with little attenuation, while
signals well above it get progressively suppressed.
```

## Rolloff — How Sharply Attenuation Increases Above Cutoff

```
For a single-pole RC filter, the transfer function magnitude is:

  |H(f)| = 1 / sqrt(1 + (f/fc)^2)

At f = fc exactly, |H(fc)| = 1/sqrt(2) ≈ 0.707 (the -3 dB point, by
definition). At f = 10 x fc (one decade above cutoff), the rolloff
approaches its asymptotic -20 dB/decade rate closely enough to be
treated as -20 dB for practical purposes.
```

### Annotated Example — Attenuation One Decade Above Cutoff

Using the same filter (fc = 159.15 Hz), evaluate attenuation at f = 1,591.5 Hz (10 x fc).

```
|H(f)| = 1 / sqrt(1 + (10)^2)
       = 1 / sqrt(1 + 100)
       = 1 / sqrt(101)
       = 0.0995

In dB: 20 x log10(0.0995) = -20.04 dB

Verified computationally: at exactly one decade above cutoff,
attenuation is -20.04 dB -- confirming the standard "-20 dB per
decade" rule of thumb for a single-pole filter directly from the
transfer function, rather than needing to memorize the rule
separately from where it actually comes from.
```

## Try It (2 Minutes)

A different RC low-pass filter uses R = 4.7 kΩ and C = 220 nF.

1. What is this filter's cutoff frequency?
2. At 10x this cutoff frequency, what is the approximate attenuation in dB (using the same -20 dB/decade behavior confirmed above)?
3. Would doubling R (to 9.4 kΩ, C unchanged) raise or lower the cutoff frequency, and by roughly what factor?

You should land on: fc = 1/(2π × 4,700 × 220×10⁻⁹) ≈ 154.0 Hz; at 10× this cutoff (≈1,540 Hz), attenuation is approximately -20 dB, the same universal single-pole behavior confirmed in the annotated example, independent of the specific R/C values chosen. Doubling R would LOWER the cutoff frequency, by a factor of 2 (since fc is inversely proportional to R, doubling R halves fc) — a direct, useful design lever: larger resistor or capacitor values push the cutoff frequency lower, and smaller values push it higher.

## Study Resources
- **Sedra & Smith, *Microelectronic Circuits*** — covers RC filter design, cutoff frequency, and Bode plot analysis in this same style
- **Analog Devices — "MT-201: Analog Filters" (Analog Dialogue tutorial series)** — free, practically oriented reference on filter design fundamentals
- **All About Circuits — RC Filter Calculator and Theory** (allaboutcircuits.com) — free reference and interactive calculator for the cutoff-frequency formula used above
