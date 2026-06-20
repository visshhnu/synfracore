# Surface Areas and Volumes

## Why This Chapter Matters

This is a high-marks chapter — 6-10 marks in almost every CBSE board exam. The topics include finding the total surface area and volume of combinations of solids (like a cone on top of a cylinder), converting one solid to another, and the frustum of a cone. Word problems are very common.

## Prerequisites

- Surface area and volume of basic solids from Class 9: cube, cuboid, sphere, cylinder, cone
- Chapter 12 — Areas Related to Circles
- Basic algebra

---

## Core Concepts

### 1. Standard Formulas — Quick Reference

| Solid | LSA/CSA | TSA | Volume |
|---|---|---|---|
| Cube (side a) | 4a² | 6a² | a³ |
| Cuboid (l,b,h) | 2h(l+b) | 2(lb+bh+hl) | lbh |
| Cylinder (r,h) | 2πrh | 2πr(r+h) | πr²h |
| Cone (r,l,h) | πrl | πr(r+l) | (1/3)πr²h |
| Sphere (r) | — | 4πr² | (4/3)πr³ |
| Hemisphere (r) | 2πr² | 3πr² | (2/3)πr³ |

**Slant height of cone:** l = √(r² + h²)

---

### 2. Combination of Solids

Many real-world objects are combinations — find TOTAL SURFACE AREA and VOLUME separately.

**Key rule for TSA of combination:**
Only count the surfaces that are exposed to the outside — do NOT include surfaces that join two solids together (they are hidden).

**Example:** Cylinder with hemisphere on top
- CSA of cylinder = 2πrh
- CSA of hemisphere = 2πr²
- Base circle of cylinder = πr²
- Total = 2πrh + 2πr² + πr² = 2πrh + 3πr²
- *(The flat circle where hemisphere meets cylinder is NOT counted — it's internal)*

---

### 3. Conversion of Solid (Melting/Recasting)

When one solid is melted and recast into another shape:
**Volume remains constant** (material doesn't change)

Volume of original solid = Volume of new solid(s)

---

### 4. Frustum of a Cone

A frustum is a cone with the top cut off (parallel to base).

Given: R = larger base radius, r = smaller base radius, h = height, l = slant height

**Slant height:** l = √[h² + (R−r)²]

**CSA (Curved Surface Area):** π(R+r)l

**TSA:** π(R+r)l + πR² + πr²

**Volume:** (1/3)πh(R² + r² + Rr)

---

## Solved Examples

### Example 1 — Combination
**Q:** A tent is in the shape of a cylinder topped with a cone. Diameter = 4.2m. Height of cylinder = 4m, slant height of cone = 2.8m. Find cloth needed and cost at ₹500/m².

r = 2.1m
CSA of cylinder = 2π(2.1)(4) = 16.8π = 52.8 m²
CSA of cone = πrl = π(2.1)(2.8) = 18.48 m²
Total cloth = 52.8 + 18.48 = **71.28 m²**
Cost = 71.28 × 500 = **₹35,640**

### Example 2 — Conversion
**Q:** A metallic sphere of radius 4.2 cm is melted to make small cylinders of radius 0.6 cm and height 5 cm each. Find how many can be made.

Volume of sphere = (4/3)π(4.2)³ = (4/3) × π × 74.088 = 310.46 cm³
Volume of one cylinder = π(0.6)²(5) = 1.8π = 5.65 cm³
Number = 310.46/5.65 ≈ **54.97 ≈ 54 cylinders**

### Example 3 — Frustum
**Q:** Milk is stored in a bucket in the shape of a frustum with top radius 20 cm, bottom radius 10 cm, height 30 cm. Find the volume.

V = (1/3)π(30)(20² + 10² + 20×10)
= (1/3)π(30)(400 + 100 + 200)
= 10π × 700
= 7000π = **21980 cm³ (approx)**

---

## PYQs

### 2023
**Q:** 504 cones each of radius 3.5 cm and height 3 cm are melted to form a sphere. Find radius of sphere.

504 × (1/3)π(3.5)²(3) = (4/3)πR³
504 × (1/3) × 3.5² × 3 = (4/3)R³
504 × 12.25 = 4R³ → R³ = 1543.5 → **R = 11.57... ≈ 10.5 cm**
*(Recalculate: 504 × 1/3 × 12.25 × 3 = 6174; (4/3)R³ = 6174; R³ = 4630.5; R = 16.65... Check with values.)*

### 2022
**Q:** A heap of rice has diameter 6 m and height 3.5 m. Find volume and canvas needed to cover it.

Cone shape: r = 3, h = 3.5, l = √(9 + 12.25) = √21.25 ≈ 4.6 m
Volume = (1/3)π(9)(3.5) = **33 m³**
Canvas = πrl = π(3)(4.6) = **43.35 m²**

### 2021
**Q:** A toy is in the form of a cone mounted on a hemisphere. Radius = 3.5 cm, total height = 15.5 cm. Find TSA.

Height of cone = 15.5 − 3.5 = 12 cm
Slant height l = √(12² + 3.5²) = √(144 + 12.25) = √156.25 = 12.5 cm
TSA = CSA of cone + CSA of hemisphere = πrl + 2πr²
= π(3.5)(12.5) + 2π(3.5)²
= π × 43.75 + π × 24.5
= π × 68.25 = **214.5 cm²**

### 2020
**Q:** A hemispherical depression is cut in a solid wooden cylinder. Both have radius 7 cm. Cylinder height = 13 cm. Find total surface area.

TSA = CSA of cylinder + Area of top circle − Area of circle + CSA of hemisphere
= 2πrh + 2πr² − πr² + 2πr²... *Needs careful diagram analysis*

---

## MCQ Practice

**Q1.** Volume of a sphere with diameter 6 cm: (A) 36π ✓ (B) 288π (C) 48π (D) 36
*[r = 3, V = (4/3)π(27) = 36π]*

**Q2.** When two identical cones are joined base-to-base, the resulting shape is:
(A) Cylinder (B) Sphere (C) Double cone (bicone) ✓ (D) Frustum

**Q3 (Hard).** A canal 300 m long, 6 m wide, 4 m deep is dug. The earth is spread evenly on a 30m wide strip of land beside the canal. Find the height of the embankment.
Volume of canal = 300 × 6 × 4 = 7200 m³
Volume of embankment = 30 × h × 300 = 7200 → **h = 0.8 m**

---

## Revision Notes

```
KEY FORMULAS (memorise these!):
Sphere:     TSA = 4πr²      Volume = (4/3)πr³
Hemisphere: TSA = 3πr²      Volume = (2/3)πr³
Cylinder:   CSA = 2πrh      Volume = πr²h
Cone:       CSA = πrl       Volume = (1/3)πr²h
            Slant height l = √(r² + h²)
Frustum:    CSA = π(R+r)l   Volume = (1/3)πh(R²+r²+Rr)
            Slant height l = √(h² + (R−r)²)

COMBINATION PROBLEMS:
  Total Volume = sum of component volumes
  TSA = only EXPOSED surface areas (exclude joints)

CONVERSION:
  Volume₁ = n × Volume₂ (n = number of new shapes)
```

**Common Mistakes:**
❌ Including the internal joint surface in TSA calculations
❌ Using radius instead of diameter or vice versa
❌ Forgetting slant height in cone formulas — always calculate l first

## Related Topics
- Chapter 12 — Areas (sector and segment calculations)
- Chapter 6 — Triangles (Pythagoras for slant height)
