# Spacecraft Systems & Mission Design — Troubleshooting

## "My propellant mass fraction from the rocket equation comes out over 100%"

Check units consistency between Δv and Isp·g0 first (both must be in the same velocity units, typically m/s) — this exact issue was flagged in this guide's own Installation section. Beyond units, also confirm Δv is a genuinely achievable requirement for the Isp being used; an extremely high Δv budget combined with a low-Isp engine can mathematically require more propellant than any reasonable mass ratio allows, which is itself a real engineering finding (this engine/Δv combination isn't feasible), not necessarily a calculation error — cross-check against Propulsion Systems' own realistic Isp ranges before assuming the math is wrong.

## "My radiator area calculation seems abnormally large or small"

Check that temperature is in KELVIN, not Celsius — the Stefan-Boltzmann law's T⁴ term requires absolute temperature; using a Celsius value directly (which could even be negative, making T⁴ nonsensical for negative-base scenarios in code) produces a wildly incorrect result. Convert Celsius to Kelvin (add 273.15) before applying the formula, every time.

## "Doubling waste heat load didn't double my radiator area"

This is expected, not an error — area scales linearly with P (heat load) ONLY if temperature stays fixed; if you're comparing two scenarios where BOTH heat load and temperature changed (as in Intermediate's own annotated examples), the T⁴ term's much stronger influence means the two effects don't combine in a simple, linear, intuitive way. Always isolate one variable at a time (hold T fixed, vary only P) if you specifically want to confirm the linear P relationship in isolation.

## "My link budget shows a negative link margin, but I expected the link to close"

A negative margin is the calculation correctly reporting that the link, as configured, does NOT close — before assuming a calculation mistake, check each term's sign convention: FSPL should always be SUBTRACTED (it's a loss), while antenna gains should be ADDED. A common error is treating FSPL as already negative and then subtracting a negative value (which adds it back), effectively double-counting the loss in the wrong direction — or the reverse, accidentally adding path loss instead of subtracting it.

## "My decibel power conversion (10·log10(Watts)) gives an unexpected value"

Confirm you're using 10·log10 for POWER quantities (like transmit power in Watts), not 20·log10 — Advanced's own material uses 20·log10 specifically for FSPL because that term involves distance and frequency in a way that corresponds to a squared relationship in the underlying physics (power spreads over a growing spherical area). Power-to-dB conversions use the 10·log10 form; mixing up which quantities use 10· versus 20· is a common source of an answer that's roughly in the right neighborhood but numerically wrong by a factor of 2.

## "A halved transmit power didn't cost exactly 3 dB of link margin, like Advanced's material suggested"

The "-3 dB per halving" relationship is a close, useful rule of thumb (since 10·log10(2) ≈ 3.01 dB), but it's only EXACTLY 3 dB for an exact factor-of-2 power change — a slightly different ratio (say, reducing power by 45% instead of exactly 50%) won't produce exactly -3 dB, though it will be close. Treat "-3 dB per halving" as a fast mental-math check for sanity-checking a result, not a substitute for the actual logarithmic calculation when precision matters.
