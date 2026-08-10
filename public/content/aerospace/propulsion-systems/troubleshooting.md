# Propulsion Systems — Troubleshooting

## "My rocket equation Δv comes out negative or nonsensical"

Check that m0 (wet mass) is genuinely larger than mf (dry mass) — the equation Δv = Isp · g0 · ln(m0/mf) requires m0 > mf for a positive, physically meaningful result, since ln of a number less than 1 is negative. If your inputs have this backward (dry mass accidentally larger, or the two values swapped), you'll get a negative Δv, which is the calculation correctly telling you something is wrong with the inputs, not a sign that the formula itself is broken.

## "My multi-stage Δv total seems too low compared to a single-stage calculation with the same total propellant"

This would actually be the SURPRISING, wrong-looking result — Intermediate's own worked example shows staging should produce MORE total Δv than an equivalent single stage, not less, because later stages don't have to carry earlier stages' dead structural mass. If your multi-stage total comes out lower, check whether you accidentally included an earlier stage's dry mass in a later stage's m0 — this is the single most common multi-stage calculation mistake, and it directly cancels out the entire benefit staging is supposed to provide.

## "Specific impulse and exhaust velocity calculations don't match published values for a real engine"

Check units carefully first — Isp is in seconds, but that's Isp = Ve/g0, meaning it only makes direct sense as "seconds" because of the g0 unit-conversion constant in the denominator; don't accidentally treat Isp as if it were directly a velocity or a time duration in some other physical sense. Also confirm you're comparing sea-level Isp against sea-level published specs, or vacuum Isp against vacuum specs — Advanced's own material shows the same engine genuinely performs differently at sea level versus vacuum, so comparing mismatched conditions will produce a real, expected discrepancy that isn't a calculation error.

## "My full thrust equation (with the pressure term) gives a LOWER thrust in vacuum than at sea level"

This is backward from the expected pattern and signals a sign error — check that you're computing `(Pe - P0)`, not `(P0 - Pe)`. With correctly signed inputs, the pressure term should generally become MORE positive (or less negative) as P0 decreases toward vacuum, since a lower ambient pressure means less "push-back" against the nozzle's exhaust — if your result shows the opposite trend, the sign convention has likely been flipped somewhere in the calculation.

## "Thrust-to-weight ratio and specific impulse seem to be pulling in opposite directions in a design tradeoff"

This is a genuinely real, expected tension, not a contradiction to resolve — a high-Isp engine (like ion/electric propulsion, per Fundamentals' typical ranges) often produces very LOW absolute thrust, meaning a poor T/W ratio, which is exactly why electric propulsion is used for in-space maneuvers (where T/W just needs to exceed whatever residual forces are acting, often near zero) rather than for launch from a planetary surface (where T/W must exceed 1.0 against real gravity). Treat "high Isp" and "high T/W" as two separate, sometimes competing design goals rather than assuming a better engine should excel at both simultaneously.

## "A worked example's numbers don't obviously connect back to Spacecraft Systems' Δv budget"

Confirm which SIDE of the Δv budget you're computing — Propulsion Systems' rocket-equation calculations here answer "how much Δv CAN this stage/engine achieve, given its mass ratio and Isp," while Spacecraft Systems' Δv budget answers "how much Δv does a specific MISSION require." These are two different questions that happen to use compatible units (m/s) and are meant to be compared against each other (does the achievable Δv meet or exceed the required Δv), not treated as the same calculation.
