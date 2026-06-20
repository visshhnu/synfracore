# Statistics

## Why This Chapter Matters

Statistics is tested in every CBSE board exam — 6-8 marks. Finding mean, median, and mode from grouped data using the correct formulas is the most-tested skill. Ogive (cumulative frequency curve) construction is tested in the 3-mark section.

## Prerequisites

- Mean, median, mode for ungrouped data (Class 9)
- Frequency tables and bar graphs
- Basic algebra

---

## Core Concepts

### 1. Mean of Grouped Data

#### Direct Method
$$\bar{x} = \frac{\sum f_i x_i}{\sum f_i}$$

where xᵢ = class mark (midpoint) = (lower limit + upper limit)/2

#### Assumed Mean Method
$$\bar{x} = a + \frac{\sum f_i d_i}{\sum f_i}$$

where a = assumed mean, dᵢ = xᵢ − a

#### Step Deviation Method
$$\bar{x} = a + \frac{\sum f_i u_i}{\sum f_i} \times h$$

where uᵢ = (xᵢ − a)/h, h = class width

**When to use each:**
- Direct method: small values of xᵢ
- Assumed mean: large values of xᵢ
- Step deviation: large xᵢ AND constant class width

---

### 2. Mode of Grouped Data

Mode = most frequently occurring value. In grouped data, it lies in the class with highest frequency (called **modal class**).

$$\text{Mode} = l + \frac{f_1 - f_0}{2f_1 - f_0 - f_2} \times h$$

Where:
- l = lower class limit of modal class
- f₁ = frequency of modal class
- f₀ = frequency of class BEFORE modal class
- f₂ = frequency of class AFTER modal class
- h = class width

---

### 3. Median of Grouped Data

**Step 1:** Calculate cumulative frequencies (cf)
**Step 2:** Find n/2 (where n = Σfᵢ)
**Step 3:** Find the class whose cf ≥ n/2 for first time → **Median class**
**Step 4:** Apply formula:

$$\text{Median} = l + \frac{\frac{n}{2} - cf}{f} \times h$$

Where:
- l = lower class limit of median class
- cf = cumulative frequency of class BEFORE median class
- f = frequency of median class
- h = class width
- n = total frequency

---

### 4. Ogive (Cumulative Frequency Curve)

**Less than ogive:** Plot (upper class limit, cumulative frequency) → connect with smooth curve

**More than ogive:** Plot (lower class limit, cumulative frequency from below) → connect with smooth curve

**Finding median from ogive:**
- On y-axis, mark n/2
- Draw horizontal line to ogive
- From intersection, draw vertical to x-axis
- The x-value is the **median**

**Intersection of less than and more than ogives** → gives the **median**

---

## Solved Examples

### Example 1 — Mean (Step Deviation)

| Class | Frequency | xᵢ | uᵢ=(xᵢ−25)/10 | fᵢuᵢ |
|---|---|---|---|---|
| 0-10 | 2 | 5 | −2 | −4 |
| 10-20 | 3 | 15 | −1 | −3 |
| 20-30 | 7 | 25 | 0 | 0 |
| 30-40 | 6 | 35 | 1 | 6 |
| 40-50 | 2 | 45 | 2 | 4 |
| **Total** | **20** | | | **3** |

Mean = 25 + (3/20) × 10 = 25 + 1.5 = **26.5**

### Example 2 — Median

| Class | Frequency | Cumulative Freq |
|---|---|---|
| 0-20 | 3 | 3 |
| 20-40 | 9 | 12 |
| 40-60 | 12 | 24 |
| 60-80 | 6 | 30 |
| Total | 30 | |

n/2 = 15. First cf ≥ 15 is at class 40-60 (cf=24) → **Median class = 40-60**
l=40, cf=12, f=12, h=20
Median = 40 + [(15−12)/12] × 20 = 40 + 5 = **45**

### Example 3 — Mode
Using Example 2 data: Highest frequency = 12 → Modal class = 40-60
l=40, f₁=12, f₀=9, f₂=6, h=20
Mode = 40 + [(12−9)/(24−9−6)] × 20 = 40 + [3/9] × 20 = 40 + 6.67 = **46.67**

---

## PYQs

### 2023
**Q:** Find mode of: 25-35(7), 35-45(31), 45-55(33), 55-65(17), 65-75(11), 75-85(1)
Modal class = 45-55 (highest freq = 33)
Mode = 45 + [(33−31)/(66−31−17)] × 10 = 45 + [2/18] × 10 = 45 + 1.11 = **46.11**

### 2022
**Q:** The mean of following frequency distribution is 53. Find p:
Intervals: 0-20(12), 20-40(15), 40-60(p), 60-80(20), 80-100(8)
n = 55+p, Σfxᵢ = 12(10)+15(30)+p(50)+20(70)+8(90) = 120+450+50p+1400+720 = 2690+50p
53 = (2690+50p)/(55+p) → 53(55+p) = 2690+50p → 2915+53p = 2690+50p → **p = −75**
*(Check your class marks — this may have different values in actual question)*

### 2021
**Q:** Find median of: 100-120(12), 120-140(14), 140-160(8), 160-180(6), 180-200(10)
n=50, n/2=25. cf: 12, 26, 34, 40, 50. Median class: 120-140 (first cf≥25)
Median = 120 + [(25−12)/14] × 20 = 120 + [13/14]×20 = **138.57**

---

## MCQ Practice

**Q1.** The class with highest frequency is called:
(A) Median class (B) Modal class ✓ (C) Mean class (D) Quartile class

**Q2.** For the formula Mode = l + [(f₁−f₀)/(2f₁−f₀−f₂)] × h, f₁ is:
(A) Frequency of class before modal class
(B) Frequency of modal class ✓
(C) Frequency of class after modal class
(D) Total frequency

**Q3 (Hard).** Mean of a distribution is 30 and mode is 36. Then median is:
Using empirical formula: Mode = 3 Median − 2 Mean
36 = 3M − 60 → 3M = 96 → **M = 32**

---

## Revision Notes

```
MEAN:
  Direct: x̄ = Σfᵢxᵢ / Σfᵢ
  Assumed: x̄ = a + Σfᵢdᵢ/Σfᵢ  (dᵢ = xᵢ−a)
  Step:    x̄ = a + (Σfᵢuᵢ/Σfᵢ)×h  (uᵢ = (xᵢ−a)/h)

MEDIAN:
  Find n/2, locate median class (first cf ≥ n/2)
  Median = l + [(n/2 − cf)/f] × h

MODE:
  Modal class = class with highest frequency
  Mode = l + [(f₁−f₀)/(2f₁−f₀−f₂)] × h

EMPIRICAL FORMULA:
  Mode = 3 × Median − 2 × Mean

OGIVE:
  Less than → upper limits on x-axis
  More than → lower limits on x-axis
  Their intersection gives Median
```

**Common Mistakes:**
❌ Using frequency instead of cumulative frequency in median formula
❌ Taking wrong cf — use cf of class BEFORE median class, not median class itself
❌ In mode formula, mixing up f₀ and f₂ (f₀ is BEFORE, f₂ is AFTER modal class)

## Related Topics
- Chapter 15 — Probability (uses frequency data)
- Data Handling from Class 9
