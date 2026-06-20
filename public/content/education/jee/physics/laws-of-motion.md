# Laws of Motion

## Why This Chapter Matters
Newton's Laws is one of the highest-scoring JEE topics — 8-12 marks. FBD (Free Body Diagrams), friction, circular motion dynamics, and pseudo-force problems are tested every year.

## Core Concepts

### 1. Newton's Three Laws

**First Law (Inertia):** A body remains at rest or uniform motion unless acted on by external net force.
Inertia = resistance to change. More mass = more inertia.

**Second Law (F = ma):**
Net force = mass × acceleration
F_net = ma (vector equation)
If multiple forces: vector sum = F_net. ΣF = ma.

**Third Law (Action-Reaction):**
For every action, there is an equal and opposite reaction.
F_AB = -F_BA (act on DIFFERENT bodies — never cancel each other)

### 2. Free Body Diagram (FBD)
Isolate a body. Draw ALL forces acting ON it:
- Weight (mg) downward
- Normal force (N) perpendicular to surface
- Tension (T) along string
- Friction (f) opposing motion
- Applied force (F)

Resolve forces. Apply ΣFx = max, ΣFy = may.

### 3. Friction
Static friction (f_s): prevents motion. f_s ≤ μ_s × N
Kinetic friction (f_k): during motion. f_k = μ_k × N (constant)
Always: μ_k < μ_s (kinetic friction < static friction)
μ = coefficient of friction (depends on surfaces, NOT area of contact, NOT normal force)

### 4. Atwood Machine
Two masses m₁ and m₂ over frictionless pulley (m₁ > m₂):
Acceleration: a = (m₁ - m₂)g/(m₁ + m₂)
Tension: T = 2m₁m₂g/(m₁ + m₂)

### 5. Circular Motion — Dynamics
For circular motion, centripetal force is needed:
F_c = mv²/r = mω²r (directed toward center)

Provided by: tension (for ball on string), normal force (for car on curved road), gravity (for satellite), friction (for car on flat road turning).

Banked road (no friction): tan(θ) = v²/rg → optimal banking angle
With friction: v_max = √[rg(tan θ + μ)/(1 - μ tan θ)]

### 6. Pseudo Force (Non-Inertial Frames)
In accelerating frame (acceleration a₀), a pseudo force F = -ma₀ acts on every mass m.
Direction: opposite to frame's acceleration.
Useful for: problems in lifts, accelerating cars, rotating frames.

Lift problems:
Apparent weight in lift accelerating up: N = m(g + a)
Apparent weight in lift accelerating down: N = m(g - a)
Free fall (a = g): N = 0 (weightlessness)

## Solved Examples

Q1: Block of mass 10 kg on rough surface (μ=0.3). Force of 50 N applied. Find acceleration.
N = mg = 100 N. Friction = μN = 30 N. Net force = 50-30 = 20 N.
a = 20/10 = 2 m/s²

Q2: Two blocks m₁=3 kg and m₂=5 kg connected by string over pulley. Acceleration?
a = (5-3)×10/(5+3) = 20/8 = 2.5 m/s²
T = 2×3×5×10/(3+5) = 300/8 = 37.5 N

Q3: Car of mass 1000 kg takes circular turn of radius 100 m at 20 m/s on flat road. Friction needed?
F_c = mv²/r = 1000×400/100 = 4000 N
Friction provides centripetal force: f = 4000 N
μ = f/N = 4000/10000 = 0.4

## PYQs

**2024:** Block on incline at angle θ. When does it just start sliding?
At threshold: mg sinθ = μ mg cosθ → tan θ = μ → θ = arctan(μ)

**2023:** Monkey of mass m hanging on rope. Rope can withstand Tmax. Min acceleration at which monkey must climb so rope doesn't break?
T - mg = ma → a = (Tmax - mg)/m (climbing up)
Actually: if monkey climbs up, tension increases. Max T: monkey accelerates down.
T = m(g - a). For rope not to break: T < Tmax → a > g - Tmax/m

**2022:** A ball of mass m tied to string of length l, rotated in vertical circle. Minimum speed at top?
At top: mg + T = mv²/r. Minimum when T=0: v_min = √(gr)

## Revision Notes
```
NEWTON'S LAWS:
1st: Inertia (net F=0 → constant velocity)
2nd: F_net = ma (vector)
3rd: F_AB = -F_BA (on different bodies!)

FBD STEPS:
1. Isolate body
2. Draw weight (mg↓), Normal (⊥surface), Tension (along string), Friction (opposing motion)
3. Resolve and apply ΣF = ma

FRICTION:
Static: f_s ≤ μ_s N (up to limiting value)
Kinetic: f_k = μ_k N (constant during motion)
μ_k < μ_s always

CIRCULAR MOTION:
F_centripetal = mv²/r = mω²r (toward center)
On flat road: friction provides F_c
On banked road (no friction): tanθ = v²/rg

LIFT:
Going up / decelerating down: N = m(g+a)
Going down / decelerating up: N = m(g-a)
Free fall: N = 0
```
