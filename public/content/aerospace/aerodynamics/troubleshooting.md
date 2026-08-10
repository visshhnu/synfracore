# Aerodynamics — Troubleshooting

## "My computed lift value doesn't match a textbook or online example for the same aircraft"

Check units first — the lift equation (L = ½ρV²S·CL) requires SI units consistently (kg/m³ for density, m/s for velocity, m² for area) to produce Newtons directly; mixing in mph, feet, or slugs without converting is the single most common source of a wrong answer that "looks close but not quite right." Second, confirm which air density you're using — 1.225 kg/m³ is standard *sea-level* density; using it for a high-altitude scenario without adjusting will overpredict lift, since real air is thinner at altitude.

## "My Python thin-airfoil-theory result doesn't match Installation's expected 0.5483 for alpha=5°"

Almost always a radians-vs-degrees mistake — `CL = 2π·α` requires α in **radians**, not degrees. Passing `5` directly into `2 * math.pi * 5` instead of `2 * math.pi * math.radians(5)` gives a wildly wrong result (roughly 31.4 instead of 0.548) because it's treating 5 radians (about 286°) as the angle, not 5 degrees. This exact mistake — forgetting a degrees-to-radians conversion — is one of the most common real bugs in aerodynamics calculations generally, not specific to this one formula.

## "I computed a Mach number classification and it disagrees with what I expected for the flight regime"

Confirm you're using the *local* speed of sound, not the fixed sea-level value (343 m/s), if the scenario specifies an altitude or a different local speed of sound — Fundamentals' own annotated example uses 295 m/s specifically because it's colder at altitude, not the sea-level figure. Using 343 m/s for a high-altitude scenario will compute a Mach number that's too low, potentially misclassifying a transonic case as subsonic.

## "XFOIL/XFLR5 gives a different CL than my thin-airfoil-theory calculation for the same angle of attack"

Expected, not a bug (Installation's own troubleshooting note covers this) — thin airfoil theory assumes an idealized, infinitely thin, symmetric airfoil with no viscosity; XFOIL models the airfoil's actual thickness, camber, and a real boundary layer. The two should be close at small angles of attack for a thin, lightly-cambered airfoil, and diverge more for a thick or heavily cambered airfoil, or at higher angles approaching stall — treat thin airfoil theory as a sanity-check order-of-magnitude tool, not a substitute for XFOIL's more complete model.

## "My Prandtl-Glauert-corrected CL value seems to blow up or become extremely large"

Check the Mach number you're plugging in — as M approaches 1, `1 - M²` approaches zero, and dividing by a number close to zero produces a very large (or, past M=1, an undefined/imaginary) result. This is expected behavior of the formula's own math, not a calculation error — it's exactly why Advanced flags the Prandtl-Glauert correction as only valid up to roughly M = 0.7-0.8: the formula itself breaks down as a useful physical prediction well before M = 1, since it was never meant to model the transonic shockwave physics that actually takes over in that region.

## "I computed a swept-wing effective Mach number and it seems too low to be realistic"

Double check the sweep angle is measured correctly (from the perpendicular to the fuselage, not from the fuselage axis itself — a common definitional mix-up) and that you're using `cos()`, not `sin()`, in `M_effective = M_flight · cos(Λ)`. Using `sin()` by mistake would give the opposite effect (effective Mach increasing with sweep instead of decreasing), which is the reverse of the real physical relationship and usually the fastest way to catch this specific mistake — check whether your computed effective Mach is lower than the true flight Mach (correct) or higher (indicates the formula was applied backward).

## "My L/D-max calculation gives a CL* that doesn't match a real aircraft's actual cruise CL"

This is expected in some cases, not necessarily an error — real aircraft don't always cruise exactly at their L/D-max CL; cruise speed is chosen based on a broader set of tradeoffs (fuel efficiency at the specific cruise altitude and weight, engine efficiency at a given thrust setting, air traffic control speed constraints), not purely to maximize L/D. Treat CL* from the L/D-max derivation as the aerodynamically optimal point for range/efficiency in isolation, not a guaranteed match to any specific real aircraft's actual published cruise condition.
