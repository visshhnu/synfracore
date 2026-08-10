# Flight Mechanics & Aircraft Structures — Troubleshooting

## "My load factor calculation gives a number less than 1 for a banked turn"

Check that you're computing n = 1/cos(φ), not cos(φ) directly — since cos(φ) is always less than or equal to 1 for any real bank angle, its reciprocal is always greater than or equal to 1, which is the physically correct direction (load factor increases with bank angle, never decreases below 1 for a level, coordinated turn). A result less than 1 signals the reciprocal was dropped somewhere in the calculation, not a genuine low-load-factor turn.

## "My stall speed calculation using Vs(n) = Vs0·√n gives a smaller number than Vs0"

This should never happen for n ≥ 1 (any real, level-or-turning flight condition) — √n is always ≥ 1 for n ≥ 1, so Vs(n) should always be greater than or equal to Vs0. A smaller result means either n was computed incorrectly (possibly inverted, per the load-factor troubleshooting above) or the square root was accidentally applied as a division rather than a multiplication.

## "My maneuvering speed (Va) doesn't match a real aircraft's published Va in its flight manual"

This guide's Va = Vs0·√n_max is the underlying physical derivation, not necessarily the exact certified value published for a specific real aircraft — real published Va figures may incorporate additional certification-specific margins or rounding conventions beyond this simplified formula. Treat this guide's calculation as the correct conceptual relationship (and a reasonable estimate), not a substitute for a specific aircraft's actual flight manual figure when real operational decisions are involved.

## "My phugoid period estimate seems wildly different from a real aircraft's actual reported phugoid behavior"

Lanchester's approximation (Advanced) is explicitly a simplified, speed-only estimate — it deliberately ignores wing loading, pitching moment of inertia, and other real aircraft-specific parameters that a full dynamic-stability analysis (solving the aircraft's actual equations of motion) would include. A rough estimate diverging somewhat from a specific real aircraft's precisely measured or simulated phugoid period is expected, not a sign of a calculation error — treat Lanchester's approximation as a fast, order-of-magnitude sanity check, not a substitute for a full dynamic analysis.

## "I can't tell whether an oscillation I'm analyzing is the phugoid mode or the short-period mode"

Check the timescale and what's actually changing. The phugoid is SLOW (tens of seconds or more) with speed and altitude visibly changing while angle of attack stays roughly constant; the short-period mode is FAST (a few seconds or less) with angle of attack changing significantly while speed and altitude stay roughly constant. If you're unsure, the timescale alone is usually the fastest way to distinguish them — a multi-cycle oscillation lasting a minute or more is almost certainly the phugoid, not the short-period mode.

## "A structural load-factor check passes, but I'm not sure the turn is actually flyable"

Remember that Fundamentals/Intermediate together check two SEPARATE things: whether the load factor is structurally within limits (Fundamentals' n_max comparison), AND whether the wing can actually generate the required lift without stalling first (Intermediate's Vs(n) check) — passing one doesn't automatically mean the other is satisfied. A turn can be well within structural limits (low n relative to n_max) while still being aerodynamically infeasible at a given speed if that speed is below the turn's own stall speed Vs(n) — always check both, not just the structural limit alone.
