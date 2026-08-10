# Orbital Mechanics & Astrodynamics — Troubleshooting

## "My plane-change Δv calculation gives a negative or nonsensical result"

Check that Δi is entered as a positive angle and that you're computing sin(Δi/2), not sin(Δi) directly — the formula Δv = 2v·sin(Δi/2) requires halving the angle before taking the sine, a detail that's easy to drop. Also confirm Δi is in the same angular unit your calculator/code expects (radians for Python's `math.sin`, not degrees) — passing a degree value directly into a function expecting radians is one of the most common angle-related bugs across this entire academy, not unique to this formula.

## "A plane change at a higher, slower orbit costs MORE than the same angle at a lower, faster orbit"

This is backward from the expected relationship and signals an error — Intermediate's core result is that Δv_plane scales directly with local orbital speed v, so a SLOWER orbit (higher altitude) should always produce a CHEAPER plane change for the same angle, all else equal. If your result shows the opposite, double check which velocity value (LEO's ~7.7 km/s vs. GEO's ~3.1 km/s, for instance) was actually plugged into which calculation — a swapped velocity value is the most likely cause.

## "My bi-elliptic transfer total comes out HIGHER than the equivalent Hohmann transfer"

This is expected for a SMALL r2/r1 ratio (below roughly 11.94) — Advanced's own material is explicit that bi-elliptic only beats Hohmann past that threshold; below it, Hohmann genuinely is the more efficient choice, and a bi-elliptic total exceeding Hohmann's in that regime is the CORRECT result, not a calculation error. Check your actual r2/r1 ratio before assuming something went wrong.

## "My vis-viva equation gives a negative number under the square root"

Check that a (semi-major axis) is genuinely larger than r/2 at the point being evaluated — the vis-viva equation v² = μ(2/r - 1/a) requires 2/r > 1/a for a physically valid (bound, elliptical) orbit at that radius; if you're evaluating a radius outside the actual bounds of the ellipse being described (for instance, accidentally using a periapsis-only semi-major axis to evaluate a point beyond the ellipse's actual apoapsis), the equation can produce a negative value under the square root, which correctly signals the input combination doesn't describe a valid point on that specific ellipse.

## "My computed orbital elements don't uniquely match a satellite's actual tracked position"

The six classical orbital elements (Fundamentals) describe an IDEALIZED two-body orbit — a real satellite's actual position is also affected by perturbations (atmospheric drag at low altitude, Earth's non-spherical mass distribution, solar/lunar gravity) that this academy's introductory two-body treatment doesn't model. A computed idealized orbit diverging somewhat from a real tracked position over time is expected, not a sign that the orbital elements were computed incorrectly — full perturbation modeling is a more advanced topic beyond this guide's scope.

## "I'm not sure whether to use the Hohmann transfer formula or the multi-stage Δv budgeting from Spacecraft Systems for a specific problem"

These answer different questions at different points in a mission's planning: Hohmann/bi-elliptic transfer calculations (this guide) determine how much Δv a SPECIFIC orbital maneuver requires; Spacecraft Systems' Δv budget sums MULTIPLE maneuvers (launch, transfer, station-keeping) into a mission's total requirement. If you're computing the cost of one specific orbit change, use this guide's transfer equations; if you're summing an entire mission's propulsive requirements, that's Spacecraft Systems' Overview.
