# Kinematics

## Why This Chapter Matters
Kinematics is the foundation of all mechanics — tested in JEE every year with 6-10 marks. Equations of motion, projectile, relative motion, and graph interpretation are all tested.

## Core Concepts

### 1. Basic Definitions
Displacement: vector from initial to final position (can be negative)
Distance: total path length (always positive)
Velocity: rate of change of displacement (vector)
Speed: rate of change of distance (scalar)
Acceleration: rate of change of velocity (vector)

Average velocity = Total displacement / Total time
Instantaneous velocity = ds/dt (limit as Δt→0)

### 2. Equations of Motion (Uniform Acceleration)
v = u + at
s = ut + ½at²
v² = u² + 2as
s_n = u + a(2n-1)/2  [distance in nth second]

u = initial velocity, v = final velocity, a = acceleration, t = time, s = displacement

### 3. Motion Under Gravity
Free fall (taking downward as positive): a = g = 9.8 m/s² ≈ 10 m/s²
For upward throw: a = -g (deceleration)
Time to reach max height: t = u/g
Max height: H = u²/2g
Time of flight (up and back): T = 2u/g

### 4. Projectile Motion
Horizontal: constant velocity, no acceleration. x = u·cos(θ)·t
Vertical: free fall. y = u·sin(θ)·t - ½gt²

Key formulas:
Time of flight: T = 2u·sin(θ)/g
Range: R = u²sin(2θ)/g → Max range at θ = 45°
Max height: H = u²sin²(θ)/2g
At max height: velocity = u·cos(θ) (horizontal only, vertical = 0)

Equation of trajectory: y = x·tan(θ) - gx²/[2u²cos²(θ)] → parabola

### 5. Relative Motion
Velocity of A relative to B: v_AB = v_A - v_B
If A moves at v_A and B at v_B (same direction): relative = v_A - v_B
If opposite directions: relative = v_A + v_B

River crossing: if river width = d, river speed = v_r, boat speed = v_b:
Shortest time: boat heads straight across, T = d/v_b, drifts downstream
Shortest path: boat aims upstream, effective speed = √(v_b² - v_r²)

### 6. Graph Interpretation
s-t graph: slope = velocity. Curved = acceleration. Straight = uniform velocity.
v-t graph: slope = acceleration. Area under = displacement.
a-t graph: area under = change in velocity.

## Solved Examples

Q1: Ball thrown up at 20 m/s. Max height? Time to reach max height?
At max height, v=0. v² = u² - 2gH → 0 = 400 - 20H → H = 20 m
t = u/g = 20/10 = 2 s

Q2: Projectile at 30 m/s at 60°. Range and max height?
R = u²sin(120°)/g = 900 × (√3/2)/10 = 45√3 ≈ 77.9 m
H = u²sin²(60°)/2g = 900 × (3/4)/20 = 33.75 m

Q3: Two trains A (50 km/h) and B (80 km/h) moving in same direction. Relative speed?
v_AB = 80 - 50 = 30 km/h (A sees B moving at 30 km/h away)

## PYQs

**2024:** A ball is dropped from 80 m height. After 2 s, another ball is thrown down at u. They reach ground together. Find u.
First ball: 80 = ½g(t)² → t = 4 s. Second ball travels for 4-2=2 s.
80 = u(2) + ½g(4) → 80 = 2u + 20 → u = 30 m/s

**2023:** Range of projectile is same at 15° and 75°. Find ratio of their max heights.
R same because sin(2×15°)=sin(30°)=sin(150°)=sin(2×75°) ✓
H₁/H₂ = sin²(15°)/sin²(75°) = tan²(15°) = (2-√3)² = 7-4√3

**2022:** v-t graph is straight line from (0,0) to (t,v). What is displacement?
Area under v-t graph = ½ × t × v = ½vt (triangle)

## Revision Notes
```
EQUATIONS OF MOTION (uniform acceleration):
v = u + at
s = ut + ½at²
v² = u² + 2as
s_nth = u + a(2n-1)/2

PROJECTILE (angle θ, initial speed u):
Time of flight: T = 2u sinθ/g
Range: R = u² sin2θ/g  (max at θ=45°)
Max height: H = u² sin²θ/2g
At max height: v = u cosθ (horizontal)

FREE FALL: g = 10 m/s² (usually in JEE)
Up: H = u²/2g, T_up = u/g
Total T = 2u/g

RELATIVE VELOCITY: v_AB = v_A - v_B

GRAPHS:
s-t: slope = v | v-t: slope = a, area = s | a-t: area = Δv
```
