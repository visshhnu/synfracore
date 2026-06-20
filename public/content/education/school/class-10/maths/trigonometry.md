# Introduction to Trigonometry

## Why This Chapter Matters

Trigonometry is tested EVERY year — typically 8-12 marks in boards. Trig ratios, identities, and complementary angles all appear regularly. The identities are especially important as they require proof and simplification skills. Chapter 9 (Applications) is a continuation.

## Prerequisites

- Right-angled triangles and their properties
- Pythagorean theorem (Chapter 6)
- Basic algebra — simplification and factoring

---

## Core Concepts

### 1. Trigonometric Ratios

For a right-angled triangle with angle θ (theta):

```
           Hypotenuse (H)
          /|
         / |
        /  | Opposite (O) — side opposite to θ
       /θ  |
      /____| 
  Adjacent (A) — side adjacent to θ
```

| Ratio | Formula | Memory Aid |
|---|---|---|
| sin θ | O/H | "Some Old Houses" |
| cos θ | A/H | "Can Also Help" |
| tan θ | O/A | "Through All Hardships" |
| cosec θ | H/O = 1/sin θ | Reciprocal of sin |
| sec θ | H/A = 1/cos θ | Reciprocal of cos |
| cot θ | A/O = 1/tan θ | Reciprocal of tan |

**Important:** tan θ = sin θ / cos θ | cot θ = cos θ / sin θ

---

### 2. Trigonometric Ratios of Standard Angles

| Angle | 0° | 30° | 45° | 60° | 90° |
|---|---|---|---|---|---|
| sin | 0 | 1/2 | 1/√2 | √3/2 | 1 |
| cos | 1 | √3/2 | 1/√2 | 1/2 | 0 |
| tan | 0 | 1/√3 | 1 | √3 | Undefined |
| cosec | Undef | 2 | √2 | 2/√3 | 1 |
| sec | 1 | 2/√3 | √2 | 2 | Undef |
| cot | Undef | √3 | 1 | 1/√3 | 0 |

**Memory for sin:** 0, 1/2, 1/√2, √3/2, 1 → divide √(0,1,2,3,4) by 2
**cos is reverse of sin:** 1, √3/2, 1/√2, 1/2, 0

---

### 3. Trigonometric Identities (Most Important for Board!)

**Identity 1:** sin²θ + cos²θ = **1**

Derived forms:
- sin²θ = 1 − cos²θ
- cos²θ = 1 − sin²θ

**Identity 2:** 1 + tan²θ = **sec²θ**

Derived forms:
- tan²θ = sec²θ − 1
- sec²θ − tan²θ = 1

**Identity 3:** 1 + cot²θ = **cosec²θ**

Derived forms:
- cot²θ = cosec²θ − 1
- cosec²θ − cot²θ = 1

**How to prove an identity:** Take one side (usually LHS), simplify step by step until you reach RHS. Never operate on both sides simultaneously.

---

### 4. Complementary Angles

Two angles are complementary if their sum = 90°.

If θ is an angle, its complement is (90° − θ).

**Key relationships:**
```
sin(90° − θ) = cos θ      cos(90° − θ) = sin θ
tan(90° − θ) = cot θ      cot(90° − θ) = tan θ
sec(90° − θ) = cosec θ    cosec(90° − θ) = sec θ
```

**Trick:** sin↔cos, tan↔cot, sec↔cosec swap with complementary angles.

---

## Solved Examples

### Example 1 — Finding All Ratios
**Q:** If sin A = 3/4, find all other trigonometric ratios.

sin A = O/H = 3/4 → Opposite = 3, Hypotenuse = 4
By Pythagoras: Adjacent = √(16−9) = √7

cos A = √7/4 | tan A = 3/√7 | cosec A = 4/3 | sec A = 4/√7 | cot A = √7/3

### Example 2 — Proving Identity
**Q:** Prove: (sinθ + cosecθ)² + (cosθ + secθ)² = 7 + tan²θ + cot²θ

**LHS** = sin²θ + 2sinθcosecθ + cosec²θ + cos²θ + 2cosθsecθ + sec²θ
= (sin²θ + cos²θ) + 2(1) + cosec²θ + 2(1) + sec²θ
= 1 + 4 + (1 + cot²θ) + (1 + tan²θ)
= 7 + tan²θ + cot²θ = **RHS** □

### Example 3 — Complementary Angles
**Q:** Evaluate: tan 65° / cot 25°

cot 25° = cot(90° − 65°) = tan 65°
→ tan 65° / tan 65° = **1**

---

## PYQs

### 2023
**Q:** If cosecθ = 13/12, find sinθ + cosθ.
sinθ = 12/13, cosθ = √(1 − 144/169) = 5/13
sinθ + cosθ = 12/13 + 5/13 = **17/13**

### 2022
**Q:** Prove: (1 + cotA − cosecA)(1 + tanA + secA) = 2
*LHS: multiply out, use identities, simplify to 2*

### 2021
**Q:** If tanθ + 1/tanθ = 2, find tan²θ + 1/tan²θ
(tanθ + 1/tanθ)² = 4 → tan²θ + 2 + 1/tan²θ = 4 → **tan²θ + 1/tan²θ = 2**

### 2020
**Q:** Evaluate: sin²25° + sin²65° + √3 tan5°·tan85°
= sin²25° + cos²25° + √3·tan5°·cot5° = 1 + √3·1 = **1 + √3**

---

## MCQ Practice

**Q1.** If sinA = 1/2, then 3cosA − 4cos³A =
(A) 1 (B) 0 ✓ (C) 1/2 (D) √3/2
*[A = 30°, 3cos30° − 4cos³30° = 3(√3/2) − 4(3√3/8) = 3√3/2 − 3√3/2 = 0]*

**Q2.** sec²10° − cot²80° =
(A) 0 (B) 1 ✓ (C) −1 (D) 2
*[cot80° = cot(90°−10°) = tan10°, so sec²10° − tan²10° = 1]*

**Q3 (Hard).** If cosθ + cos²θ = 1, then sin¹²θ + 3sin¹⁰θ + 3sin⁸θ + sin⁶θ + 2sin⁴θ + 2sin²θ − 2 = ?
*[cosθ = 1 − cos²θ = sin²θ, so cos²θ = sin⁴θ, then simplify using substitution: answer = 1]*

---

## Revision Notes

```
SOHCAHTOA:
  sin = Opp/Hyp    cos = Adj/Hyp    tan = Opp/Adj

Three Fundamental Identities:
  sin²θ + cos²θ = 1
  1 + tan²θ = sec²θ
  1 + cot²θ = cosec²θ

Complementary Angle pairs (add to 90°):
  sin ↔ cos  |  tan ↔ cot  |  sec ↔ cosec

Standard angles: 0, 30, 45, 60, 90 degrees
sin: 0, 1/2, 1/√2, √3/2, 1
cos: 1, √3/2, 1/√2, 1/2, 0
```

**Identity Proof Strategy:**
1. Take more complex side (usually LHS)
2. Convert everything to sin and cos if stuck
3. Use identities to simplify
4. Never cross-multiply or add to both sides

**Common Mistakes:**
❌ sin²θ + cos²θ = 1, NOT 2
❌ sin(A+B) ≠ sinA + sinB
❌ Forgetting absolute value for: √(sin²θ) = |sinθ|, not just sinθ

## Related Topics
- Chapter 9 — Applications of Trigonometry (heights & distances)
- Chapter 12 — Areas Related to Circles (sector formulas use angle)
- JEE: Trigonometric equations, inverse trigonometry, graphs
