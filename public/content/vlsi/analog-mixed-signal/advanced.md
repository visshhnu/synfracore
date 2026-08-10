# Analog & Mixed-Signal Design — Advanced

Overview's op-amp gain formulas assumed an IDEAL op-amp — infinite gain, infinite bandwidth, instantaneous response. Interview Q&A already named the "virtual short" idealization directly. This page quantifies the two most practically important ways real op-amps fall short of that ideal: limited bandwidth (which shrinks as gain increases, a direct, quantifiable tradeoff) and slew rate (a hard speed limit on how fast the output voltage can physically change).

**Analogy** — Gain-bandwidth tradeoff is a megaphone that can either amplify a whisper very loudly across a short range, or amplify it modestly across a much longer range — the megaphone has a fixed total "reach" budget, and turning up amplification (gain) directly shrinks how far (how high in frequency) it still works well. Slew rate is a completely different physical limit — the fastest an amplifier's output voltage can possibly move, full stop, regardless of gain — like a car's absolute top acceleration, which no amount of steering finesse can exceed.

## Gain-Bandwidth Product (GBW) — Gain and Bandwidth Trade Off Directly

```
A real op-amp has a GAIN-BANDWIDTH PRODUCT (GBW) — a roughly constant
number (for a given op-amp) representing the product of gain and the
frequency at which that gain is achievable:

  GBW = closed-loop gain x maximum usable frequency

Rearranged, this gives the actual practical constraint a circuit
designer works with:

  f_max = GBW / closed-loop gain

Since GBW is roughly FIXED for a given op-amp, requesting more gain
(a larger Rf/Rin ratio, from Overview's gain formulas) directly and
proportionally SHRINKS the maximum frequency that gain remains valid
for — there is no way to get high gain AND wide bandwidth
simultaneously from the same op-amp; it's a real, physical tradeoff.
```

### Annotated Example — Bandwidth at Two Different Gain Settings

An op-amp has a GBW of 1 MHz (a common, realistic value for a general-purpose op-amp).

```
At closed-loop gain = 10 (Overview's own Try It gain magnitude):
  f_max = 1,000,000 Hz / 10 = 100,000 Hz = 100 kHz

At closed-loop gain = 100 (a 10x higher gain setting):
  f_max = 1,000,000 Hz / 100 = 10,000 Hz = 10 kHz

Verified computationally: increasing gain by 10x (from 10 to 100)
reduced the usable bandwidth by exactly 10x (from 100 kHz to 10 kHz)
-- confirming GBW is genuinely constant for this op-amp, and that
gain and bandwidth trade off in exact inverse proportion, not just
approximately.
```

## Slew Rate — A Hard Speed Limit Independent of Gain

```
SLEW RATE (SR) is the maximum rate the op-amp's output voltage can
physically change, in volts per second (commonly specified in V/µs
on datasheets). Unlike GBW, slew rate is a hard physical limit that
applies regardless of the closed-loop gain configuration.

For a sine wave output of peak amplitude Vpeak at frequency f, the
maximum rate of change the sine wave itself demands is:

  max required slew rate = 2 x pi x f x Vpeak

If this exceeds the op-amp's actual SR spec, the output can no
longer track the ideal sine wave shape and becomes visibly distorted
(a triangle-wave-like shape instead of a smooth sine) -- this failure
mode is called SLEW-RATE LIMITING. Solving for the maximum frequency
an op-amp can output a given amplitude WITHOUT slew-rate limiting:

  f_max (slew-limited) = SR / (2 x pi x Vpeak)
```

### Annotated Example — Maximum Undistorted Frequency at a Given Amplitude

An op-amp has a slew rate of 0.5 V/µs (= 500,000 V/s), driving a 5V-peak sine wave output.

```
Given:  SR = 0.5 V/µs = 500,000 V/s, Vpeak = 5 V

f_max (slew-limited) = SR / (2 x pi x Vpeak)
                      = 500,000 / (2 x pi x 5)
                      = 500,000 / 31.42
                      = 15,915 Hz ≈ 15.9 kHz

Verified computationally: above roughly 15.9 kHz, THIS op-amp
cannot output a clean, undistorted 5V-peak sine wave -- not because
of gain-bandwidth limits (a separate constraint), but purely because
the output voltage physically cannot change fast enough to trace out
the sine wave's shape at that combination of amplitude and frequency.
```

## Try It (2 Minutes)

Using the same op-amp (SR = 0.5 V/µs), but driving a smaller-amplitude output — 2V-peak instead of 5V-peak.

1. What is the new maximum slew-rate-limited frequency?
2. Is it higher or lower than the 5V-peak case's 15.9 kHz?
3. What does this reveal about why a slew-rate-limited op-amp might work fine for a small-signal application but distort badly for a larger-amplitude one at the same frequency?

You should land on: f_max = 500,000 / (2π × 2) ≈ 39,789 Hz ≈ 39.8 kHz — meaningfully HIGHER than the 5V-peak case's 15.9 kHz, since a smaller amplitude sine wave requires a lower peak rate of change for the same frequency (the 2×π×f×Vpeak formula scales directly with Vpeak). This reveals a genuinely important practical design implication: the same op-amp, at the same frequency, can perform perfectly well driving a small-amplitude signal while badly distorting a larger-amplitude signal — slew-rate limiting isn't a fixed frequency ceiling in isolation, it's a joint limit on amplitude AND frequency together, which is exactly why op-amp datasheets specify slew rate as a single number but its real-world impact depends entirely on the specific amplitude a given application actually needs.

## Study Resources
- **Sedra & Smith, *Microelectronic Circuits*** — covers gain-bandwidth product and slew rate limitations in exactly this style
- **Analog Devices — "MT-053: GBW and Slew Rate" (Analog Dialogue tutorial series)** — free, practically oriented reference on both non-idealities covered above
- **Texas Instruments — Op-Amp Slew Rate application notes** — free reference material on slew-rate-limited distortion and practical op-amp selection
