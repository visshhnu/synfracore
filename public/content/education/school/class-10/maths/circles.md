# Circles

## Why This Chapter Matters

Circles is one of the favourite chapters for CBSE board exam questions — 5-8 marks every year. Tangent theorems (especially "tangent from external point") are asked in every exam. Proofs are compulsory for Long Answer questions.

## Prerequisites

- Basic circle concepts — radius, diameter, chord, arc (Class 9)
- Pythagoras theorem (Chapter 6)
- Triangle congruence (SAS, RHS) — Class 9

---

## Core Concepts

### 1. Tangent to a Circle

A **tangent** to a circle is a line that **touches the circle at exactly one point**.

The point where the tangent meets the circle is called the **point of tangency** (or point of contact).

**Number of tangents from different positions:**
- Point INSIDE circle: **0 tangents** possible
- Point ON circle: **1 tangent** (perpendicular to radius at that point)
- Point OUTSIDE circle: **2 tangents** possible

---

### 2. Theorem 1 — Tangent ⊥ Radius (Most Important!)

**Statement:** The tangent at any point of a circle is **perpendicular** to the radius through the point of contact.

If O is the centre, P is the point of contact, and TP is the tangent:
**OP ⊥ TP** (OP is perpendicular to TP)

**Proof outline:**
- Assume tangent is NOT perpendicular — some other line OQ would be shortest distance
- But OQ has to cross inside the circle → contradicts tangent touching at only one point
- Therefore, radius must be perpendicular to tangent □

---

### 3. Theorem 2 — Tangent from External Point

**Statement:** The lengths of the two tangents drawn from an external point to a circle are **equal**.

If PA and PB are tangents from external point P to circle with centre O:
**PA = PB**

**Proof:**
In △OAP and △OBP:
- OA = OB (radii)
- OP = OP (common)
- ∠OAP = ∠OBP = 90° (radius ⊥ tangent)
→ △OAP ≅ △OBP (RHS)
→ **PA = PB** □

**Additional results from this proof:**
- ∠OPA = ∠OPB (OP bisects angle between tangents)
- ∠AOP = ∠BOP (OP bisects angle between radii to tangent points)

---

## Solved Examples

### Example 1
**Q:** A tangent PQ at point P of a circle of radius 5 cm meets a line through centre O at Q, such that OQ = 13 cm. Find PQ.

OQ = 13, OP = 5 (radius), ∠OPQ = 90°
By Pythagoras: PQ = √(OQ² − OP²) = √(169 − 25) = √144 = **12 cm**

### Example 2
**Q:** Two concentric circles with radii 5 cm and 3 cm. Find the length of chord of larger circle that is tangent to the smaller circle.

Let chord AB of larger circle be tangent to smaller circle at P.
OP ⊥ AB (radius to tangent) → OP = 3 cm, OA = 5 cm
AP = √(25 − 9) = 4 cm
AB = 2 × AP = **8 cm**

### Example 3 — Classic Perimeter Problem
**Q:** From external point A, tangents AB and AC are drawn to a circle. BC is a chord. If AB = 4 cm, find perimeter of △ABC.

By tangent theorem: DB = DF and EC = EF (tangent from same external points D, E on BC)
Perimeter = AB + BC + AC = AB + BD + DC + AC = AB + BF + CF + AC = AB + AC + AC + AB... 

Simpler version: Perimeter = 2 × (length of tangent) = 2 × 4 = **8 cm**

---

## PYQs

### 2023
**Q:** In figure, PQ is tangent to circle with centre O at Q. If ∠PQO = x° and ∠QPO = y°, prove that x − y = 90°.
*∠OQP = 90° (radius ⊥ tangent), in △OQP: ∠QOP + x + y = 180°, but also x = 90° + y (exterior angle), so x − y = 90°*

### 2022
**Q:** Prove that tangent to a circle is perpendicular to the radius at point of contact.
*(Full formal proof required)*

### 2021
**Q:** From external point P, two tangents PA and PB are drawn. O is centre. Prove that AB ⊥ OP.
*△OAP ≅ △OBP (proved), so OP bisects ∠APB. Using this, show AB ⊥ OP*

### 2020
**Q:** Two tangents TP and TQ are drawn from external point T. Prove TP = TQ and ∠PTQ = 2∠OPQ.
*(Standard proof + angle relationship)*

---

## MCQ Practice

**Q1.** Number of tangents that can be drawn to a circle from a point inside it:
(A) 0 ✓ (B) 1 (C) 2 (D) Infinite

**Q2.** If tangent from external point has length 8 cm and radius is 6 cm, distance from external point to centre:
(A) 5 cm (B) 10 ✓ (C) 14 (D) √28
*[d² = 8² + 6² = 100 → d = 10]*

**Q3 (Hard).** AB is chord of circle with centre O. P is external point. PA and PB are tangents. Show ∠APB + ∠AOB = 180°.
*∠OAP = ∠OBP = 90°, so in quadrilateral OAPB: ∠APB + ∠AOB = 360° − 180° = 180°*

---

## Revision Notes

```
KEY THEOREMS:
1. Tangent ⊥ Radius at point of contact
2. Tangents from external point are equal in length

Number of tangents:
  Inside circle → 0
  On circle → 1
  Outside circle → 2

For tangent problems, look for right angles (radius ⊥ tangent)
Then apply Pythagoras!

∠OPA = ∠OPB (OP bisects angle between tangents from P)
```

**Common Mistakes:**
❌ Assuming all chords bisect each other — only diameters do
❌ Forgetting ∠OAP = 90° when PA is tangent and OA is radius
❌ Using equal tangent theorem without justification in proof

## Related Topics
- Chapter 12 — Areas Related to Circles
- Chapter 6 — Triangles (proofs use triangle congruence)
- JEE: Circle equations, common tangents, chord of contact
