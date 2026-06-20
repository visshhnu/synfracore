# Rotational Motion

## Why This Chapter Matters
Rotation is a high-weightage JEE topic — 8-12 marks. Moment of inertia, torque, angular momentum, and rolling motion are all tested. This chapter has many analogies with linear motion.

## Core Concepts

### Linear vs Rotational Analogies
| Linear | Rotational |
|---|---|
| Mass m | Moment of Inertia I |
| Force F | Torque τ |
| Velocity v | Angular velocity ω |
| Acceleration a | Angular acceleration α |
| Momentum p=mv | Angular momentum L=Iω |
| KE=½mv² | KE=½Iω² |
| F=ma | τ=Iα |

### Moment of Inertia (I)
I = Σmᵢrᵢ² (sum of mass × distance² from axis)

Common values (mass M, dimension given):
Ring (radius R, about center): I = MR²
Disc (radius R, about center): I = MR²/2
Solid sphere (about diameter): I = 2MR²/5
Hollow sphere (about diameter): I = 2MR²/3
Rod (length L, about center): I = ML²/12
Rod (length L, about end): I = ML²/3

**Parallel axis theorem:** I = I_cm + Md²
(I about any axis = I about parallel axis through CM + Md² where d = distance between axes)

**Perpendicular axis theorem** (for flat plates only):
I_z = I_x + I_y (I about axis ⊥ to plate = sum of I about two axes in plane)

### Torque
τ = r × F = rF sinθ (in 2D)
τ = Iα (Newton's second law for rotation)
Net torque = 0 → angular acceleration = 0 → constant angular velocity

### Angular Momentum
L = Iω = r × p
τ = dL/dt
Conservation of angular momentum: if τ_net = 0, L = constant
Applications: ice skater pulling arms in (I decreases → ω increases to keep L constant)

### Rolling Motion
For rolling without slipping: v = Rω (contact point has zero velocity)
Total KE = ½mv² + ½Iω² = ½mv²(1 + I/mR²)
For solid sphere: total KE = ½mv²(1 + 2/5) = 7mv²/10
For disc: total KE = ½mv²(1 + 1/2) = 3mv²/4
For ring: total KE = ½mv²(1 + 1) = mv²

Acceleration down incline: a = g sinθ/(1 + I/mR²)
Solid sphere rolls faster than disc which rolls faster than ring (least I fraction → most a)

## PYQs
**2024:** Solid cylinder (mass M, radius R) rolls without slipping. Ratio of rotational to total KE?
KE_rot/KE_total = (½Iω²)/(½mv² + ½Iω²) = (I/mR²)/(1 + I/mR²) = (1/2)/(1+1/2) = 1/3

**2023:** Disc of mass M radius R. Moment of inertia about tangential axis in plane of disc?
I_diameter = MR²/4. I_tangent = I_diameter + MR² = 5MR²/4 (parallel axis theorem)

**2022:** Child of mass m sits at edge of rotating disc (I₀, ω₀). Disc + child: final ω?
L = I₀ω₀ = (I₀ + mR²)ω → ω = I₀ω₀/(I₀ + mR²)

## Revision Notes
```
KEY MOMENTS OF INERTIA:
Ring: MR² | Disc: MR²/2 | Solid sphere: 2MR²/5
Hollow sphere: 2MR²/3 | Rod (center): ML²/12

PARALLEL AXIS: I = I_cm + Md²
PERPENDICULAR AXIS (flat bodies): I_z = I_x + I_y

TORQUE: τ = Iα = r×F
ANGULAR MOMENTUM: L = Iω, conserved if τ_net = 0

ROLLING (no slip): v = Rω
Total KE = ½mv²(1 + I/mR²)
Acceleration on incline = g sinθ/(1 + I/mR²)
Sphere > Disc > Ring (down an incline speed)
```
