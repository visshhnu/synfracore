# Aerospace Foundations — Troubleshooting

## "My vector component calculation gives the wrong sign"

Check your sign convention BEFORE computing anything, and stay consistent with it throughout the entire problem — "up" and "along the direction of travel" positive is the convention used throughout this guide (Overview's climb example, Fundamentals' component breakdown). A downward-pointing weight component or a backward-pointing drag force should be entered as negative under this convention; mixing conventions mid-calculation (starting with "up is positive" and switching to "down is positive" partway through) is the single most common source of a magnitude-correct, sign-wrong answer.

## "My work-energy theorem answer doesn't match a kinematics-equation answer for the same problem"

These two methods should always agree when both are applicable — if they don't, check for a units mismatch first (work in Joules requires force in Newtons and distance in meters, consistently), then check whether you correctly computed acceleration from F = ma before plugging it into a kinematics equation, since that's an extra step the work-energy theorem skips entirely (Intermediate's own Try It exercise walks through exactly this cross-check).

## "My Euler's-method numerical integration gives a noticeably different answer than the closed-form solution"

This is expected to some degree — Euler's method has real, quantifiable discretization error that grows with a larger time step (`dt`). If the difference is small (a fraction of a percent, as in Intermediate's own worked example), this is normal numerical error, not a bug. If the difference is large, the most common cause is too large a `dt` — try reducing it (e.g., from 0.1 to 0.01 to 0.001) and confirming the numerical answer converges toward the closed-form value as `dt` shrinks; if it doesn't converge at all, check the acceleration function `a(t)` itself for a coding error (a sign flip, a wrong coefficient) rather than assuming the integration method itself is broken.

## "I keep confusing centripetal and centrifugal — which one is 'real'?"

Centripetal is the real force/acceleration, always pointing TOWARD the center of the circular path — this is what Newton's laws, applied correctly from an inertial (outside, non-rotating) viewpoint, actually predict. Centrifugal is the FICTITIOUS, felt force pointing outward, which only appears when analyzing motion from WITHIN the rotating frame itself (Advanced's merry-go-round analogy). A quick way to check which one a problem is asking about: if you're computing the force needed to KEEP something moving in a circle, that's centripetal (real); if you're describing what someone INSIDE the rotating system feels, that's centrifugal (fictitious, but still a valid way to describe the felt experience).

## "My centripetal acceleration calculation seems too large or too small compared to intuition"

Double-check whether you're using v²/r or ω²·r correctly, and whether ω is genuinely in radians per second (not degrees per second, and not RPM without converting). A common mistake is plugging an RPM value directly into ω²·r without first converting RPM to rad/s (multiply RPM by 2π/60) — this produces a result that's wrong by a large, confusing factor, easy to mistake for a conceptual error rather than the actual unit-conversion mistake it usually is.

## "I applied τ = Iα but got a nonsensical (negative, or wildly large) angular acceleration"

Check that torque and moment of inertia are both computed about the SAME axis/pivot point — τ = r × F only gives the correct torque about the specific point r is measured FROM, and moment of inertia I is likewise defined relative to a specific axis. Mixing a torque computed about one point with a moment of inertia computed about a different point produces a physically meaningless result that can look like anything from a sign error to a wildly incorrect magnitude, depending on the specific mismatch.

## "My dot product (work) calculation gives zero when I expected a nonzero answer"

This is often correct, not a bug — the dot product is exactly zero when the two vectors are perpendicular (θ = 90°, cos(90°) = 0), which physically means a force doing zero work because none of it acts along the direction of motion (Fundamentals' own example: a force perpendicular to motion does zero work). Before assuming a calculation error, check whether the two vectors in your specific problem actually are perpendicular — if so, zero is the physically correct answer.
