# Aerospace Foundations — Intermediate

Fundamentals gave you the kinematics equations for CONSTANT acceleration (v = v0 + at) and introduced the dot product's physical meaning as work. This page connects those into the work-energy theorem — a genuinely different way to solve a motion problem, useful specifically when force varies with distance rather than time — and then breaks the "constant acceleration" assumption entirely, using numerical integration to handle the far more realistic case where acceleration changes continuously.

**Analogy** — Fundamentals' kinematics equations are like knowing a car's exact, fixed speed for an entire trip: multiply by time, get distance, done. The work-energy theorem is like knowing instead how much gas was burned (energy expended) without needing to know the exact speed at every moment — a different, sometimes easier, path to the same kind of answer. Numerical integration (this page's second half) is for the realistic case where the car's speed is constantly changing in a way with no simple formula — instead of solving it in one clean equation, you take the trip in thousands of tiny, nearly-constant-speed steps and add them all up, which is exactly what a computer (and this page's Python example) does automatically.

## The Work-Energy Theorem

```
Fundamentals introduced the dot product's meaning as WORK:
  W = F · d = |F|·|d|·cos(θ)

The work-energy theorem connects total work done on an object
DIRECTLY to its change in kinetic energy, without needing to know
acceleration or time at all:
  W = ΔKE = ½mv_f² - ½mv_i²

This matters because it's a genuinely different tool than Fundamentals'
kinematics equations — useful specifically when you know FORCE and
DISTANCE but not time, or when force itself varies along the path
(where F = ma's instantaneous form is harder to apply directly than
integrating force over distance).
```

### Annotated Example — Finding Final Speed from Work Alone

A 2,000 kg vehicle experiences a net force of 5,000 N over a straight-line displacement of 200 m, starting from rest.

```
Given:  F = 5,000 N, d = 200 m, m = 2,000 kg, v_i = 0

Step 1 — compute work done:
  W = F · d = 5,000 × 200 = 1,000,000 J (1 MJ)

Step 2 — apply the work-energy theorem to solve for v_f:
  W = ½mv_f² - ½mv_i²
  1,000,000 = ½(2,000)v_f² - 0
  1,000,000 = 1,000 · v_f²
  v_f² = 1,000
  v_f = √1,000 = 31.62 m/s

Verified computationally: solving directly for v_f from the work-
energy relationship gives 31.62 m/s. Notice this required knowing
only force and distance -- not acceleration or time at all -- which
is precisely the situation where this theorem is the more direct
tool than Fundamentals' v = v0 + at.
```

## Try It (2 Minutes)

A 500 kg vehicle experiences a net force of 2,000 N over a displacement of 50 m, starting from rest.

1. Compute the work done.
2. Use the work-energy theorem to find the final velocity.
3. If you were instead given this vehicle's constant acceleration and the same distance, could you have used Fundamentals' kinematics equations to find the same answer? What would you need to know that you don't need here?

You should land on: W = 2,000 × 50 = 100,000 J; v_f² = 2W/m = 200,000/500 = 400, so v_f = √400 = 20 m/s. Yes, Fundamentals' kinematics equations could reach the same answer, but only if you first computed acceleration (a = F/m = 2,000/500 = 4 m/s²) and then used v² = v0² + 2ad — an extra step the work-energy theorem skips entirely by working with energy directly instead of acceleration and time.

## Numerical Integration — When Acceleration Isn't Constant

```
Fundamentals' kinematics equations (v = v0 + at, x = x0 + v0t + ½at²)
ONLY work for constant acceleration -- a genuine simplification, since
real thrust decreases as propellant mass depletes, real drag changes
with speed, and real gravity changes with altitude.

For acceleration that varies with time, a(t), the exact relationship
is still v(t) = v0 + ∫a(t)dt -- but this integral doesn't always have
a clean closed-form answer. NUMERICAL INTEGRATION solves this by
breaking time into many small steps and approximating the integral
as a sum:
  v_new = v_old + a(t) · dt   (repeated for each small time step dt)

This is called EULER'S METHOD -- the simplest numerical integration
technique, and the direct computational version of "add up acceleration
over many tiny time slices" that a closed-form integral does exactly,
in the limit as dt approaches zero.
```

### Annotated Example — Integrating a Time-Varying Acceleration

A rocket motor's acceleration decreases linearly as propellant burns: a(t) = 40 - 2t (m/s²), from t = 0 to t = 6 seconds, starting from rest.

```python
dt = 0.01
t, v = 0, 0
while t < 6:
    a = 40 - 2 * t
    v += a * dt
    t += dt
print(f"v(6) = {v:.2f} m/s")
```

```
Expected output: v(6) = 204.06 m/s

This case actually HAS a clean closed-form answer (verified
independently): a(t) = 40 - 2t integrates to v(t) = 40t - t²,
so v(6) = 40(6) - 6² = 240 - 36 = 204 m/s exactly -- the numerical
method's 204.06 m/s is very close (the small 0.06 m/s difference is
discretization error, from using small-but-not-infinitesimal steps
of dt = 0.01 s). This closed-form case is deliberately chosen so
the numerical method's accuracy can be checked directly against a
known-exact answer -- in a REAL scenario (genuinely irregular thrust
curves, drag that depends on a changing atmospheric density), no
closed-form answer would exist at all, and the numerical method would
be the only practical way to get an answer.
```

## Try It (2 Minutes)

Using the same Euler's-method approach, a different acceleration profile is a(t) = 30 - 3t (m/s²), from t = 0 to t = 5 seconds, starting from rest.

1. Write out (or run) the Euler's method loop for this new a(t).
2. What closed-form function does a(t) = 30 - 3t integrate to, and what does it predict for v(5)?
3. Do the numerical and closed-form answers agree closely?

You should land on: a(t) = 30 - 3t integrates to v(t) = 30t - 1.5t², so v(5) = 30(5) - 1.5(25) = 150 - 37.5 = 112.5 m/s exactly. Running the Euler's method loop with dt = 0.01 produces a value very close to 112.5 m/s (within a small fraction of a percent) — confirming the same pattern as the annotated example: Euler's method closely approximates the true, closed-form answer when one exists, and is the tool of choice when it doesn't.

## Study Resources
- **Anderson, *Introduction to Flight*** — covers the work-energy theorem in the context of aircraft/rocket performance
- **Paul's Online Math Notes — Numerical Integration** (tutorial.math.lamar.edu) — free reference on Euler's method and its accuracy tradeoffs
- **NASA Glenn Research Center — Beginner's Guide to Rockets** (grc.nasa.gov) — covers real, non-constant thrust profiles that motivate why numerical methods matter in practice
