# Vectors and 3D Geometry

## Why This Chapter Matters
Vectors and 3D Geometry is high-weightage in JEE — 8-12 marks. Direction cosines, dot product, cross product, equations of lines and planes, and distances are all tested.

## Core Concepts

### 1. Vectors
Vector a = a1 i + a2 j + a3 k where i, j, k are unit vectors along x, y, z axes.
Magnitude: |a| = sqrt(a1^2 + a2^2 + a3^2)
Unit vector: a_hat = a/|a|

### 2. Direction Cosines and Ratios
Direction cosines (l, m, n): cosines of angles with x, y, z axes.
l = a1/|a|, m = a2/|a|, n = a3/|a|
l^2 + m^2 + n^2 = 1 (always)

Direction ratios: any multiples of (l, m, n). e.g., (a1, a2, a3).

### 3. Dot Product (Scalar Product)
a . b = |a||b|cos(theta) = a1b1 + a2b2 + a3b3
cos(theta) = (a.b)/(|a||b|)
Perpendicular vectors: a.b = 0
Parallel vectors: a x b = 0

### 4. Cross Product (Vector Product)
a x b = |a||b|sin(theta) n_hat (n perpendicular to both)
|a x b| = area of parallelogram formed by a and b
|a x b|/2 = area of triangle

In component form:
a x b = | i  j  k  |
        | a1 a2 a3 |
        | b1 b2 b3 |
= i(a2b3-a3b2) - j(a1b3-a3b1) + k(a1b2-a2b1)

### 5. Scalar Triple Product
[a, b, c] = a.(b x c) = |a1 a2 a3; b1 b2 b3; c1 c2 c3| (determinant)
Volume of parallelepiped = |[a, b, c]|
Coplanar vectors: [a, b, c] = 0

### 6. Lines in 3D

**Vector form:** r = a + t*b (point a, direction b, parameter t)
**Cartesian form:** (x-x1)/l = (y-y1)/m = (z-z1)/n

**Shortest distance between skew lines:**
d = |(a2-a1).(b1 x b2)| / |b1 x b2|

### 7. Planes

**Vector form:** r . n = d (n = normal vector, d = constant)
**Cartesian form:** ax + by + cz = d

**Distance from point (x1,y1,z1) to plane ax+by+cz+d=0:**
dist = |ax1 + by1 + cz1 + d| / sqrt(a^2+b^2+c^2)

**Angle between planes:** cos(theta) = |n1.n2|/(|n1||n2|)

## PYQs
**2024:** Find unit vector perpendicular to both a=2i+j+k and b=i-j+k.
a x b = |i j k; 2 1 1; 1 -1 1| = i(1+1) - j(2-1) + k(-2-1) = 2i - j - 3k
|a x b| = sqrt(4+1+9) = sqrt(14)
Unit vector = (2i-j-3k)/sqrt(14)

**2023:** Find angle between lines with direction ratios (1,2,2) and (2,2,-1).
cos(theta) = (1x2+2x2+2x(-1))/(sqrt(1+4+4) x sqrt(4+4+1)) = (2+4-2)/(3x3) = 4/9.
theta = cos^-1(4/9)

**2022:** Find distance between parallel planes 2x+y-2z-4=0 and 4x+2y-4z-8=0.
Second plane: 2x+y-2z-4=0 (same as first, identical planes! Distance = 0)

## Revision Notes
```
DOT PRODUCT: a.b = a1b1+a2b2+a3b3 = |a||b|cos(theta)
CROSS PRODUCT: |axb| = |a||b|sin(theta); gives vector perpendicular to both

PERPENDICULAR: a.b = 0
PARALLEL: axb = 0

TRIPLE PRODUCT [a,b,c]: equals determinant; = 0 if coplanar

LINE: r = a + t*b | Cartesian: (x-x1)/l = (y-y1)/m = (z-z1)/n
PLANE: r.n = d | Cartesian: ax+by+cz = d

DISTANCE point to plane: |ax1+by1+cz1+d|/sqrt(a^2+b^2+c^2)
```
