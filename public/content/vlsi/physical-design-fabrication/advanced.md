# Physical Design & Fabrication — Advanced

Every page so far in this technology optimized for one goal: timing (making the chip fast enough). Interview Q&A's own PPA framing already named the other two axes — Power and Area — without quantifying either. This page closes that gap for Power: the actual formula physical designers use to estimate dynamic power consumption, and why voltage has an outsized effect on it compared to every other variable in the formula.

**Analogy** — A car's fuel consumption scales roughly linearly with how far you drive and how heavy the car is — double the distance, roughly double the fuel. But speed has a DISPROPORTIONATE effect: pushing through more air resistance at higher speed costs fuel efficiency at something closer to a squared relationship, not a linear one. Voltage in a chip's power equation behaves exactly like that speed term — a modest voltage change produces a much larger power change than a similarly modest change to any other single variable in the formula.

## The Dynamic Power Formula

```
Dynamic power (power consumed by transistors actually SWITCHING, as
opposed to static/leakage power consumed even when idle) is
estimated as:

  P_dynamic = alpha x C x V^2 x f

  where:
    alpha = activity factor -- the fraction of the total switched
            capacitance that ACTUALLY toggles per clock cycle
            (real logic doesn't switch every gate every cycle;
            alpha is typically well under 1, often around 0.1-0.3
            for general logic)
    C     = total switched capacitance (farads) -- how much
            capacitance is being charged/discharged, related to
            Fundamentals' wire-RC material and standard-cell load
    V     = supply voltage (volts)
    f     = clock frequency (Hz) -- directly connects to every
            timing-closure calculation from Overview and this page's
            own Intermediate section

Notice V is SQUARED, while alpha, C, and f are each only LINEAR
terms -- this is the mathematical reason voltage scaling is such an
effective (and heavily used) power-reduction technique in real chip
design.
```

### Annotated Example — Computing Dynamic Power for a Logic Block

A logic block has 2 nF of total switched capacitance, operates at 1 GHz, runs at 0.8 V supply voltage, with a realistic activity factor of 0.2 (20% of the switched capacitance toggles per cycle, on average).

```
Given:  alpha = 0.2, C = 2 nF = 2 x 10^-9 F, V = 0.8 V, f = 1 GHz = 1 x 10^9 Hz

P = alpha x C x V^2 x f
  = 0.2 x (2 x 10^-9) x (0.8)^2 x (1 x 10^9)
  = 0.2 x (2 x 10^-9) x 0.64 x (1 x 10^9)
  = 0.256 W
  = 256 mW

Verified computationally: this logic block consumes approximately
256 mW of dynamic power at 0.8V/1GHz -- a real, budgetable number a
physical designer would check against the chip's overall power
budget (a battery-powered device's total power envelope, or a
data-center chip's thermal design power) before committing to this
configuration.
```

## Voltage Scaling — Quantifying the Squared Relationship

```
Reducing supply voltage is one of the most effective single power-
reduction levers precisely because of the V^2 term -- but it isn't
free: lower voltage also increases gate delay (transistors switch
more slowly at lower voltage), directly hurting the timing-closure
margins from Overview and Intermediate. This is the real PPA
tradeoff (Interview Q&A) playing out concretely: a voltage reduction
that saves meaningful power may force a corresponding reduction in
maximum clock frequency to keep timing closure intact.
```

### Annotated Example — Power Savings From a Modest Voltage Reduction

Using the same block (alpha=0.2, C=2nF, f=1GHz), but reducing supply voltage from 0.8V to 0.7V (a 12.5% voltage reduction).

```
P_new = 0.2 x (2 x 10^-9) x (0.7)^2 x (1 x 10^9)
      = 0.2 x (2 x 10^-9) x 0.49 x (1 x 10^9)
      = 0.196 W
      = 196 mW

Power reduction = (256 - 196) / 256 x 100 = 23.44%

Verified computationally: a 12.5% voltage reduction (0.8V -> 0.7V)
produced a 23.44% power reduction -- nearly DOUBLE the percentage
change, in the power's favor, directly because of the V^2 term.
This is the real, quantified reason voltage scaling is prioritized
over comparable percentage changes to activity factor or
capacitance, both of which would only produce a proportional
(not amplified) power change.
```

## Try It (2 Minutes)

Using the same block at the original 0.8V, compute the dynamic power if activity factor alone were reduced from 0.2 to 0.15 (a 25% reduction in alpha, larger in percentage terms than the 12.5% voltage reduction above), with C, V, and f unchanged.

1. What is the new dynamic power?
2. What is the percentage power reduction from the original 256 mW?
3. Compare this percentage reduction to the 23.44% achieved by only a 12.5% voltage reduction — does this confirm or contradict the claim that voltage has a disproportionate effect on power?

You should land on: P_new = 0.15 × 2×10⁻⁹ × 0.64 × 1×10⁹ = 0.192 W = 192 mW. Percentage reduction = (256−192)/256×100 = 25% — which exactly matches alpha's own 25% reduction, confirming activity factor scales power LINEARLY (a 25% cut in alpha gives exactly a 25% cut in power). This confirms the claim: the earlier 12.5% voltage reduction produced a 23.44% power reduction (nearly double its own percentage), while this 25% activity-factor reduction produced exactly a 25% power reduction (a 1-to-1 match) — voltage's squared relationship genuinely amplifies its effect on power in a way linear terms like alpha, C, and f simply do not.

## Study Resources
- **Weste & Harris, *CMOS VLSI Design*** — the standard reference for dynamic and static power estimation, covered in this same style
- **Rabaey, Chandrakasan & Nikolic, *Digital Integrated Circuits*** — a standard deeper reference for power-aware design and voltage scaling techniques
- **VLSI Universe / ChipEdge — Low Power Design tutorials** — free, practically oriented walkthroughs of power estimation and voltage/frequency scaling
