# Coordinate Geometry — Straight Lines and Circles

## Why This Chapter Matters
Coordinate geometry is one of the highest-weightage JEE topics — 8-12 marks per paper covering straight lines, circles, and conic sections. The chapter demands speed and formula recall. Master this for guaranteed marks.

## Prerequisites
- Class 10 Coordinate Geometry (distance, section, area formulas)
- Class 10 Trigonometry (tan of angles)
- Quadratic equations (for finding intersection points)

---

## Core Concepts

### 1. Straight Lines

**Slope (m) = tan(theta)** where theta = angle with positive x-axis
m = (y2 - y1)/(x2 - x1)

**Equations of a line:**
- Slope-intercept: y = mx + c
- Point-slope: y - y1 = m(x - x1)
- Two-point: (y - y1)/(y2 - y1) = (x - x1)/(x2 - x1)
- Intercept form: x/a + y/b = 1
- Normal form: x cos alpha + y sin alpha = p
- General form: ax + by + c = 0

**Distance formulas:**
Distance from point (x1, y1) to line ax + by + c = 0:
d = |ax1 + by1 + c| / sqrt(a^2 + b^2)

Distance between parallel lines ax + by + c1 = 0 and ax + by + c2 = 0:
d = |c1 - c2| / sqrt(a^2 + b^2)

**Angle between two lines with slopes m1 and m2:**
tan(theta) = |(m1 - m2)/(1 + m1.m2)|

Parallel: m1 = m2 | Perpendicular: m1.m2 = -1

### 2. Circle

**Standard equation:** x^2 + y^2 = r^2 (centre at origin, radius r)
**General equation:** x^2 + y^2 + 2gx + 2fy + c = 0
Centre = (-g, -f), Radius = sqrt(g^2 + f^2 - c)

**Condition:** g^2 + f^2 - c > 0 for real circle

**Circle through 3 points:** Substitute each point into general equation -> solve 3 simultaneous equations.

### 3. Tangent to Circle

**From point on circle (x1, y1):**
Tangent to x^2 + y^2 = r^2: xx1 + yy1 = r^2
Tangent to general circle: xx1 + yy1 + g(x+x1) + f(y+y1) + c = 0

**Length of tangent from external point (x1, y1) to circle x^2 + y^2 + 2gx + 2fy + c = 0:**
L = sqrt(x1^2 + y1^2 + 2gx1 + 2fy1 + c)

**Condition for line y = mx + c to be tangent to x^2 + y^2 = r^2:**
c^2 = r^2(1 + m^2) i.e., c = +/- r*sqrt(1 + m^2)

### 4. Important Results

**Angle bisectors of lines a1x + b1y + c1 = 0 and a2x + b2y + c2 = 0:**
(a1x + b1y + c1)/sqrt(a1^2+b1^2) = +/-(a2x + b2y + c2)/sqrt(a2^2+b2^2)

**Locus problems:** Express geometric condition algebraically.

---

## Solved Examples

### Example 1 — Distance
**Q:** Find the distance from (2, -3) to 3x - 4y + 5 = 0.
d = |3(2) - 4(-3) + 5| / sqrt(9 + 16) = |6 + 12 + 5| / 5 = 23/5 = **4.6 units**

### Example 2 — Circle
**Q:** Find centre and radius of x^2 + y^2 - 6x + 4y - 12 = 0.
General form: 2g = -6 -> g = -3; 2f = 4 -> f = 2; c = -12
Centre = (-g, -f) = **(3, -2)**
Radius = sqrt(9 + 4 + 12) = sqrt(25) = **5 units**

### Example 3 — Tangent from External Point
**Q:** Length of tangent from (4, 3) to circle x^2 + y^2 = 25.
L = sqrt(16 + 9 - 25) = sqrt(0) = 0
Point is ON the circle, so tangent length = 0. (Check: 16 + 9 = 25 ✓)

---

## PYQs (JEE Main)

**2024:** The distance between two parallel lines 3x + 4y - 8 = 0 and 3x + 4y + 3 = 0:
d = |(-8) - 3| / sqrt(9 + 16) = 11/5 = **2.2 units**

**2023:** If the line 2x - 3y + k = 0 is tangent to x^2 + y^2 = 9:
Distance from (0,0) to line = radius
|k| / sqrt(4 + 9) = 3 -> |k| = 3*sqrt(13) -> k = +/-3*sqrt(13)

**2022:** Centre of circle passing through (0,0), (2,0), (0,2):
General: x^2 + y^2 + 2gx + 2fy + c = 0
(0,0): c = 0; (2,0): 4 + 4g = 0 -> g = -1; (0,2): 4 + 4f = 0 -> f = -1
Centre = (-g, -f) = **(1, 1)**, r = sqrt(1+1) = sqrt(2)

---

## MCQ Practice

**Q1.** Slope of line perpendicular to 3x - 4y + 7 = 0:
(A) 3/4 (B) -4/3 (C) 4/3 (D) -3/4
Answer: B [-4/3, since slope of given line = 3/4, perpendicular = -4/3]

**Q2.** The angle between lines y = 2x + 1 and y = 3x + 2:
tan(theta) = |(3-2)/(1+6)| = 1/7 -> theta = arctan(1/7)
Answer: arctan(1/7)

**Q3 (Hard).** Number of tangent from (5, 0) to circle x^2 + y^2 = 9:
Distance from (5,0) to centre (0,0) = 5 > 3 (radius)
External point -> **2 tangents**

---

## Revision Notes

```
LINE EQUATIONS:
y = mx + c (slope-intercept)
y - y1 = m(x - x1) (point-slope)
x/a + y/b = 1 (intercept form)
ax + by + c = 0 (general)

DISTANCE FORMULAS:
Point (x1,y1) to line ax+by+c=0: |ax1+by1+c|/sqrt(a^2+b^2)
Between parallel lines ax+by+c1=0 and ax+by+c2=0: |c1-c2|/sqrt(a^2+b^2)

SLOPES:
Parallel: m1 = m2
Perpendicular: m1.m2 = -1
Angle between: tan(theta) = |(m1-m2)/(1+m1.m2)|

CIRCLE x^2 + y^2 + 2gx + 2fy + c = 0:
Centre = (-g, -f), Radius = sqrt(g^2 + f^2 - c)

TANGENT FROM EXTERNAL POINT:
Length = sqrt(S1) where S1 = value of circle equation at that point

CONDITION FOR TANGENT y=mx+c to x^2+y^2=r^2:
c^2 = r^2(1+m^2)
```

## Related Topics
- Class 10: Distance/Section/Area formulas (prerequisites)
- JEE: Parabola, Ellipse, Hyperbola (conics)
- Complex Numbers (Argand plane is a coordinate system)
