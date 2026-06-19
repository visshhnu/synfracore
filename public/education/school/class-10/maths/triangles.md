# Triangles

## Why This Chapter Matters

This is one of the largest chapters in Class 10 — and one of the highest-mark chapters in board exams (8-12 marks typically). Basic Proportionality Theorem and its converse, similarity criteria, and Pythagoras theorem are tested every year. Proofs are asked in Long Answer questions.

## Prerequisites

- Basic properties of triangles (Class 7-9)
- Angle sum property, exterior angle
- Congruence of triangles (SAS, ASA, SSS, RHS) — Class 9
- Basic area concepts

---

## Core Concepts

### 1. Basic Proportionality Theorem (BPT) / Thales Theorem

**Statement:** If a line is drawn parallel to one side of a triangle, it divides the other two sides in the **same ratio**.

If DE ∥ BC in △ABC, then:
$$\frac{AD}{DB} = \frac{AE}{EC}$$

**Converse:** If a line divides two sides of a triangle in the same ratio, it is parallel to the third side.

**Memory:** BPT → the line parallel to one side creates equal ratios on the other two sides.

---

### 2. Similarity of Triangles

Two triangles are **similar** if:
1. Their corresponding angles are equal, AND
2. Their corresponding sides are in the same ratio (proportional)

Notation: △ABC ~ △DEF means:
- ∠A = ∠D, ∠B = ∠E, ∠C = ∠F
- AB/DE = BC/EF = CA/FD

---

### 3. Criteria for Similarity

#### AA (Angle-Angle) Similarity
If two angles of one triangle are equal to two angles of another triangle, the triangles are similar.

*Since angle sum = 180°, if two pairs of angles are equal, the third pair is automatically equal.*

#### SSS (Side-Side-Side) Similarity
If the three pairs of corresponding sides are proportional:
AB/DE = BC/EF = CA/FD → △ABC ~ △DEF

#### SAS (Side-Angle-Side) Similarity
If one pair of corresponding angles is equal AND the sides including those angles are proportional:
AB/DE = AC/DF and ∠A = ∠D → △ABC ~ △DEF

---

### 4. Ratio of Areas of Similar Triangles

$$\frac{\text{Area of }\triangle ABC}{\text{Area of }\triangle DEF} = \left(\frac{AB}{DE}\right)^2 = \left(\frac{BC}{EF}\right)^2 = \left(\frac{CA}{FD}\right)^2$$

**Key point:** The ratio of areas of similar triangles = **square of the ratio of corresponding sides** (NOT the ratio itself!)

---

### 5. Pythagoras Theorem

**Statement:** In a right-angled triangle, the square of the hypotenuse = sum of squares of the other two sides.

If ∠B = 90° in △ABC:
$$AC^2 = AB^2 + BC^2$$

**Converse (equally important!):** If in a triangle, the square of one side equals the sum of squares of the other two sides, then the angle opposite the first side is 90°.

**Proof of Pythagoras (using similarity — must know for board):**
- Draw BD ⊥ AC where ∠B = 90° in △ABC
- △ADB ~ △ABC (AA: ∠A common, ∠ADB = ∠ABC = 90°) → AD/AB = AB/AC → AB² = AD × AC
- △BDC ~ △ABC (AA: ∠C common, ∠BDC = ∠ABC = 90°) → DC/BC = BC/AC → BC² = DC × AC
- Adding: AB² + BC² = AC(AD + DC) = AC × AC = AC² □

---

## Solved Examples

### Example 1 — BPT
**Q:** In △ABC, DE ∥ BC. If AD = 4 cm, DB = 3 cm, AE = 6 cm, find EC.

By BPT: AD/DB = AE/EC
4/3 = 6/EC → EC = **4.5 cm**

### Example 2 — Similarity (AA)
**Q:** In △ABC, ∠A = 60°, ∠B = 80°. In △PQR, ∠Q = 80°, ∠R = 40°. Are they similar?

△ABC: ∠A = 60°, ∠B = 80°, ∠C = 40°
△PQR: ∠P = 60°, ∠Q = 80°, ∠R = 40°
All three angles match → **△ABC ~ △PQR** (by AAA/AA)

### Example 3 — Areas
**Q:** Areas of two similar triangles are 81 cm² and 49 cm². If altitude of first = 4.5 cm, find altitude of second.

(h₁/h₂)² = 81/49 → h₁/h₂ = 9/7 → 4.5/h₂ = 9/7 → h₂ = **3.5 cm**

---

## PYQs

### 2023
**Q:** In △PQR, QM ⊥ PR and PM × MR = QM². Prove that ∠PQR = 90°.
*Using the given condition and similarity of triangles △PQM ~ △QRM*

### 2022
**Q:** BL and CM are medians of right-angled △ABC (∠A = 90°). Prove: 4(BL² + CM²) = 5BC²
*Using Pythagoras in △ABL, △ACM, and △ABC*

### 2021
**Q:** State and prove the Basic Proportionality Theorem.
*(Standard proof required — draw diagram, use area of triangles)*

### 2020
**Q:** Sides of two similar triangles are in ratio 3:7. Ratio of their areas:
9:49 ✓ (square of side ratio)

---

## MCQ Practice

**Q1.** In similar triangles, ratio of corresponding sides = 2:3. Ratio of areas:
(A) 2:3 (B) 4:9 ✓ (C) 8:27 (D) 3:2

**Q2.** In △ABC, D divides AB such that AD/DB = 3/5. If BC = 4 cm, find DE ∥ BC:
DE = (AD/(AD+DB)) × BC = 3/8 × 4 = **1.5 cm** ✓

**Q3 (Hard).** ABC and BDE are two equilateral triangles where D is midpoint of BC. Ratio Area(ABC):Area(BDE):
BD = BC/2, so ratio of sides = 2:1 → ratio of areas = **4:1**

---

## Revision Notes

```
BPT: DE ∥ BC → AD/DB = AE/EC

Similarity Criteria:
  AA  → Two angles equal
  SSS → Three sides proportional
  SAS → One angle equal + including sides proportional

Area Ratio = (Side Ratio)²

Pythagoras Theorem:
  ∠B = 90° → AC² = AB² + BC²
  Converse: if AC² = AB² + BC², then ∠B = 90°

Common Pythagorean Triplets: (3,4,5), (5,12,13), (8,15,17), (7,24,25)
```

**Common Mistakes:**
❌ Ratio of areas = ratio of sides (wrong! it's the SQUARE of the ratio)
❌ Writing SSS similarity condition wrong (must be PROPORTIONAL, not equal)
❌ Not using the converse of BPT when proving lines are parallel

## Related Topics
- Chapter 7 — Coordinate Geometry (distance formula uses Pythagoras)
- Chapter 8 — Trigonometry (right triangles)
- JEE: Advanced triangle geometry, cevians, Stewart's theorem
