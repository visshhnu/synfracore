# Flight Mechanics & Aircraft Structures — Intermediate

Fundamentals showed that load factor increases stall speed's structural loading indirectly — but it didn't yet connect load factor to the actual stall SPEED itself. This page makes that connection directly: stall speed increases with load factor, which is exactly why a steep turn is dangerous at low speed, and introduces maneuvering speed (Va) — the single speed value that protects an aircraft's structure by letting it stall before it overstresses.

**Analogy** — Think of stall speed at 1g as a fixed "floor" speed below which the wing simply can't generate enough lift, full stop. Load factor in a turn raises that floor — the harder you're maneuvering, the higher the minimum speed needed to keep flying at all. Maneuvering speed (Va) is the specific speed set as a safety design point: fly at or below Va, and if you pull too hard, the wing runs out of lift (stalls) before the airframe runs out of structural strength — a built-in "the wing gives up before the airplane breaks" safety margin.

## Stall Speed Increases With Load Factor

```
Aerodynamics' 1g stall speed (Vs0) is defined at n = 1 (level
flight). In a turn or any maneuver where load factor n > 1, the
wing needs MORE lift for the SAME weight, which (since L = ½ρV²S·CL
and CL is capped at its stall value) means stall now happens at a
HIGHER speed:

  Vs(n) = Vs0 · √n

This is a direct, structural consequence of Fundamentals' n = L/W --
if you need n times more lift, and CL is already at its maximum
(stall) value, the ONLY way to get more lift left is more speed
(since L scales with V², stall speed scales with √n, not n itself).
```

### Annotated Example — Stall Speed in Fundamentals' 60° Turn

An aircraft has a 1g stall speed of 45 m/s. Using Fundamentals' 60° banked turn (n = 2.00), find the new stall speed.

```
Given:  Vs0 = 45 m/s, n = 2.00 (from Fundamentals' 60° bank example)

Apply:  Vs(n) = Vs0 · √n
        Vs(2.00) = 45 × √2.00
        Vs(2.00) = 45 × 1.4142
        Vs(2.00) = 63.64 m/s

Verified computationally: this aircraft, which stalls at 45 m/s in
level flight, stalls at 63.64 m/s while banked 60° -- a genuine,
significant increase. This is exactly why a steep turn performed too
slowly is dangerous: the pilot may be flying comfortably above the
LEVEL-FLIGHT stall speed while unknowingly being below the actual,
higher stall speed the turn itself now requires.
```

## Maneuvering Speed (Va) — Structural Protection Built Into a Speed Limit

```
Maneuvering speed (Va) is defined as the stall speed AT the
aircraft's certified maximum load factor (n_max, from Fundamentals'
category limits):

  Va = Vs0 · √n_max

Flying AT OR BELOW Va means: if the pilot pulls hard enough to
demand more than n_max, the wing stalls (loses lift) BEFORE the
airframe reaches its structural limit load -- the aircraft "gives
up" aerodynamically before it would be damaged structurally.

Flying ABOVE Va removes this protection: the wing can generate
enough lift to exceed n_max WITHOUT stalling first, meaning a hard
enough control input above Va can structurally overload the
airframe before any stall warning occurs -- this is exactly why Va
is such a heavily emphasized number in pilot training for
turbulence and abrupt maneuvering.
```

### Annotated Example — Computing Maneuvering Speed

The same 45 m/s (Vs0) Normal-category aircraft from above, with n_max = 3.8 (Fundamentals' Normal category limit).

```
Given:  Vs0 = 45 m/s, n_max = 3.8

Apply:  Va = Vs0 · √n_max
        Va = 45 × √3.8
        Va = 45 × 1.9494
        Va = 87.72 m/s

Verified computationally: below 87.72 m/s, this aircraft will stall
before it can be maneuvered hard enough to exceed its +3.8g
structural limit -- above 87.72 m/s, that protection no longer
holds, and an abrupt full-deflection control input (or severe
turbulence) COULD structurally overload the aircraft before it
stalls.
```

## Try It (2 Minutes)

A different Normal-category aircraft has Vs0 = 50 m/s and n_max = 3.8.

1. Compute this aircraft's maneuvering speed (Va).
2. Separately, if this same aircraft banks into a turn producing n = 2.5, what is its stall speed in that specific turn?
3. Is the turn-induced stall speed from part 2 higher or lower than Va from part 1 — and does that comparison matter?

You should land on: Va = 50 × √3.8 = 50 × 1.9494 = 97.47 m/s. Turn stall speed at n = 2.5: Vs(2.5) = 50 × √2.5 = 50 × 1.5811 = 79.06 m/s — LOWER than Va's 97.47 m/s. This comparison matters because it confirms the turn itself (n = 2.5) stays within the aircraft's structural envelope relative to Va — the turn-induced stall speed only needs to be compared against Va specifically when checking whether a maneuver's OWN required load factor might approach or exceed n_max, not as a general rule that turn stall speed and Va are always closely related numbers.

## Study Resources
- **Anderson, *Introduction to Flight*** — covers stall speed variation with load factor and maneuvering speed derivation in the V-n diagram chapter
- **14 CFR Part 23.335, "Design airspeeds"** (ecfr.gov) — the regulatory definition of maneuvering speed
- **NASA Glenn Research Center — Beginner's Guide to Aeronautics, "V-n Diagram"** (grc.nasa.gov) — free coverage connecting stall speed, load factor, and structural limits into a single diagram
