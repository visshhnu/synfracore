# Analog & Mixed-Signal Design — Troubleshooting

## "My computed cutoff frequency doesn't match what I measure on a real (or simulated) filter"

Confirm both R and C are in base SI units (ohms and farads) before applying the formula — a common error is leaving C in nF or µF without converting to farads first, which produces a cutoff frequency off by a factor of 1,000 or 1,000,000. Also confirm which component of the RC pair the output is actually measured across — a low-pass configuration (output across the capacitor) and a high-pass configuration (output across the resistor) use the same cutoff-frequency formula but produce opposite frequency-response shapes.

## "My filter's attenuation at 10x the cutoff frequency isn't exactly -20 dB"

This is expected, not an error — Intermediate's annotated example computed -20.04 dB, not exactly -20.00 dB, because the exact transfer function `1/sqrt(1+(f/fc)^2)` only APPROACHES the idealized -20 dB/decade asymptote; it's extremely close one decade out but converges even more tightly at two or three decades above cutoff. Treat "-20 dB/decade" as the accurate asymptotic rule, and expect small, decreasing deviations near the cutoff frequency itself.

## "My gain-bandwidth calculation gives a maximum frequency that seems too low for my application"

Confirm which gain to use in the GBW formula — it's the actual CLOSED-LOOP gain of the specific configuration (Overview's Rf/Rin-derived gain), not the op-amp's own open-loop gain (which is typically extremely high, in the tens of thousands or more, and is a different, unrelated number). Using open-loop gain in the f_max = GBW/gain formula will produce a nonsensically tiny bandwidth.

## "My circuit works fine in simulation but shows visible sine-wave distortion on real hardware at high amplitude"

Check the signal against the slew-rate-limited maximum frequency formula from Advanced, using the ACTUAL peak amplitude of the real signal — a simulation using an idealized op-amp model (like Installation's simplified `Eopamp` dependent-source netlist) may not model slew-rate limiting at all, so a design that looks clean in that simulation can still hit a real op-amp's physical slew-rate ceiling on actual hardware.

## "Reducing my signal's amplitude fixed a distortion problem, but I don't understand why"

This is directly explained by Advanced's Try It finding: slew-rate-limited maximum frequency is inversely proportional to amplitude — a smaller-amplitude signal requires a lower peak rate of change to trace out the same frequency, so it can stay within the op-amp's slew-rate limit at a frequency where a larger-amplitude signal would visibly distort. This isn't a coincidental fix; it's the direct, predictable consequence of the `f_max = SR / (2π × Vpeak)` relationship.

## "My ADC/DAC quantization error (Fundamentals) seems unrelated to this page's filter and slew-rate material — are they connected?"

Not directly for a single calculation, but they DO interact in a real mixed-signal system: an anti-aliasing filter (an RC low-pass filter, exactly this page's Intermediate material) is commonly placed BEFORE an ADC specifically to remove high-frequency content the ADC can't correctly sample — a completely different purpose from reducing quantization error itself, but a real, standard part of the same signal chain Overview and Fundamentals introduced.
