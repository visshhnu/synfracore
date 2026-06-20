# Magnetic Effects of Current

## Why This Chapter Matters
Magnetics is a major JEE chapter — 10-14 marks. Biot-Savart law, Ampere's law, force on current, and moving charges in magnetic fields are all tested with numerical problems.

## Core Concepts

### 1. Biot-Savart Law
dB = (μ₀/4π)(Idl × r̂)/r²
μ₀ = 4π×10⁻⁷ T·m/A

Key results:
At center of circular loop (radius R, current I): B = μ₀I/2R
On axis of loop at distance x: B = μ₀IR²/[2(R²+x²)^(3/2)]
Infinite straight wire at distance d: B = μ₀I/2πd
Finite wire (angles α₁, α₂): B = μ₀I(sinα₁+sinα₂)/4πd

Direction: Right-hand rule. Curl fingers in direction of current → thumb points along B.

### 2. Ampere's Circuital Law
∮B⃗·dl⃗ = μ₀I_enclosed

Applications:
Infinite solenoid (n turns/m, current I): B = μ₀nI (inside), B = 0 (outside)
Toroid (N turns, mean radius R): B = μ₀NI/2πR (inside), B = 0 (outside)

### 3. Force on Current-Carrying Conductor
F = IL × B = BIL sinθ
Maximum when I ⊥ B (sinθ=1). Zero when I ∥ B.
Direction: Fleming's Left Hand Rule (or F = IL⃗ × B⃗)

Force per unit length between parallel wires (separation d):
F/L = μ₀I₁I₂/2πd
Same direction currents → attract. Opposite → repel.

### 4. Force on Moving Charge (Lorentz Force)
F = q(v⃗ × B⃗) = qvB sinθ
Magnetic force does NO work (always ⊥ to velocity)
→ Speed unchanged, direction changes → circular motion

For charge q in magnetic field B (velocity v):
Radius: r = mv/qB
Time period: T = 2πm/qB (independent of speed! — used in cyclotron)

### 5. Cyclotron
Charged particles accelerated in D-shaped magnets.
Resonance condition: frequency of AC = cyclotron frequency = qB/2πm
Max KE: KE_max = q²B²R²/2m (R = max radius)
Limitation: at high speeds, relativistic mass increase changes cyclotron frequency → resonance lost.

### 6. Magnetic Dipole
Bar magnet / current loop = magnetic dipole
Dipole moment: m = NIA (N=turns, I=current, A=area)
Torque in uniform B: τ = m × B = mB sinθ
Potential energy: U = -m·B = -mB cosθ

## PYQs
**2024:** Proton (mass m, charge q) enters magnetic field B perpendicular to it at speed v. Radius?
r = mv/qB

**2023:** Two long parallel wires carry currents I and 2I in same direction, separated by 3 cm. Force per unit length?
F/L = μ₀I(2I)/2πd = μ₀(2I²)/2π(0.03) = force per unit length (attractive)

**2022:** Magnetic field at center of square loop (side a, current I)?
Square has 4 sides. Each side at distance a/2 from center.
B from each side: μ₀I sin45°×2/(4π×a/2) = μ₀I√2/πa... [each side contributes]
Total: B = 4 × μ₀I sinα/(πa) = 2√2μ₀I/πa

## Revision Notes
```
BIOT-SAVART: dB = μ₀Idl sinθ/4πr²
Circular loop center: B = μ₀I/2R
Infinite wire: B = μ₀I/2πd

AMPERE: ∮B·dl = μ₀I
Solenoid inside: B = μ₀nI  (n = turns/length)
Outside: B = 0

FORCE ON WIRE: F = BIL sinθ (Left-Hand Rule)
PARALLEL WIRES: F/L = μ₀I₁I₂/2πd (same dir → attract)

LORENTZ: F = qvB sinθ (no work done by B)
CIRCULAR MOTION: r = mv/qB, T = 2πm/qB (T independent of speed!)

CYCLOTRON FREQUENCY: f = qB/2πm
```
