# Vectors and 3D Geometry

## Why This Chapter Matters
Vectors and 3D Geometry carry 10-12 marks in CBSE Class 12 boards. Direction cosines, equations of lines and planes, and angle between them are standard 5-mark questions.

## Vectors

### 1. Types and Operations
Vector: magnitude + direction. Denoted a⃗ or **a**.
Position vector of point P(x,y,z): OP⃗ = xi + yj + zk. |OP⃗| = √(x²+y²+z²).

**Addition:** a⃗+b⃗ (parallelogram/triangle law)
**Scalar multiplication:** ka⃗ (scales magnitude, reverses direction if k<0)
**Unit vector:** â = a⃗/|a⃗|. |â| = 1.

### 2. Dot Product (Scalar Product)
a⃗·b⃗ = |a⃗||b⃗|cosθ = a₁b₁+a₂b₂+a₃b₃
θ = angle between vectors. cosθ = a⃗·b⃗/(|a⃗||b⃗|)
Perpendicular vectors: a⃗·b⃗ = 0 (θ=90°)
Parallel vectors: a⃗·b⃗ = |a⃗||b⃗| (θ=0°) or -|a⃗||b⃗| (θ=180°)
a⃗·a⃗ = |a⃗|²

### 3. Cross Product (Vector Product)
a⃗×b⃗ = |a⃗||b⃗|sinθ n̂ (n̂ = unit vector perpendicular to both, right-hand rule)
|a⃗×b⃗| = |a⃗||b⃗|sinθ
Parallel vectors: a⃗×b⃗ = 0⃗

|i  j  k |
|a₁ a₂ a₃| (expand along row 1)
|b₁ b₂ b₃|

= i(a₂b₃-a₃b₂) - j(a₁b₃-a₃b₁) + k(a₁b₂-a₂b₁)

Area of parallelogram = |a⃗×b⃗|
Area of triangle = ½|a⃗×b⃗|

### 4. Scalar Triple Product
[a⃗ b⃗ c⃗] = a⃗·(b⃗×c⃗) = determinant with rows a, b, c.
Volume of parallelepiped = |[a⃗ b⃗ c⃗]|
Coplanar vectors: [a⃗ b⃗ c⃗] = 0

## 3D Geometry

### 5. Direction Cosines and Ratios
Direction cosines (l, m, n) of line: cosines of angles with x, y, z axes.
l²+m²+n² = 1.
Direction ratios (a, b, c): any multiples of direction cosines.
l/a = m/b = n/c = ±1/√(a²+b²+c²)

### 6. Equation of Line
**Through point (x₁,y₁,z₁) with direction ratios (a,b,c):**
Cartesian: (x-x₁)/a = (y-y₁)/b = (z-z₁)/c
Vector: r⃗ = (x₁i+y₁j+z₁k) + λ(ai+bj+ck) = a⃗ + λb⃗

**Through two points A(x₁,y₁,z₁) and B(x₂,y₂,z₂):**
(x-x₁)/(x₂-x₁) = (y-y₁)/(y₂-y₁) = (z-z₁)/(z₂-z₁)

**Angle between two lines:**
cosθ = |a₁a₂+b₁b₂+c₁c₂|/√(a₁²+b₁²+c₁²)·√(a₂²+b₂²+c₂²)
Perpendicular: a₁a₂+b₁b₂+c₁c₂ = 0
Parallel: a₁/a₂ = b₁/b₂ = c₁/c₂

**Distance between skew lines:**
d = |[(a⃗₂-a⃗₁) b⃗₁ b⃗₂]|/|b⃗₁×b⃗₂|

### 7. Equation of Plane
**Normal form:** ax+by+cz = d (a,b,c = direction ratios of normal)
**Point-normal form:** a(x-x₁)+b(y-y₁)+c(z-z₁) = 0
**Three-point form:** use determinant.
**Intercept form:** x/a+y/b+z/c = 1

**Vector form:** r⃗·n̂ = d

**Angle between two planes:**
cosθ = |a₁a₂+b₁b₂+c₁c₂|/√(a₁²+b₁²+c₁²)·√(a₂²+b₂²+c₂²)

**Angle between line and plane:**
sinθ = |al+bm+cn|/√(a²+b²+c²)·√(l²+m²+n²)

**Distance from point (x₁,y₁,z₁) to plane ax+by+cz+d=0:**
dist = |ax₁+by₁+cz₁+d|/√(a²+b²+c²)

## Board Examples

**Q1:** Find angle between lines (x-1)/2 = (y-2)/3 = (z-3)/4 and (x+1)/1 = (y-3)/2 = (z-5)/(-1).
cosθ = |2×1+3×2+4×(-1)|/√(4+9+16)·√(1+4+1) = |2+6-4|/√29·√6 = 4/√174.
θ = cos⁻¹(4/√174).

**Q2:** Find distance from point (1,2,3) to plane 2x-y+z=4.
dist = |2(1)-1(2)+1(3)-4|/√(4+1+1) = |2-2+3-4|/√6 = |-1|/√6 = 1/√6 = √6/6.

## PYQs (CBSE)

**CBSE 2023:** Find equation of plane through (1,2,3) with normal vector 2i-3j+k.
2(x-1)-3(y-2)+1(z-3)=0 → 2x-3y+z = 2-6+3 = -1 → 2x-3y+z+1=0.

**CBSE 2022:** If a⃗=i+2j+3k and b⃗=3i-j+2k, find a⃗×b⃗.
|i  j  k|
|1  2  3| = i(4-(-3))-j(2-9)+k(-1-6) = 7i+7j-7k = 7(i+j-k).
|3 -1  2|

## Revision Notes
```
DOT PRODUCT: a⃗·b⃗ = |a||b|cosθ = a₁b₁+a₂b₂+a₃b₃
Perpendicular: a⃗·b⃗=0 | Parallel: a⃗×b⃗=0⃗

CROSS PRODUCT: |a⃗×b⃗| = |a||b|sinθ
Area of parallelogram = |a⃗×b⃗| | Triangle = ½|a⃗×b⃗|
Scalar triple product [a⃗b⃗c⃗]=0 → coplanar

LINE: r⃗=a⃗+λb⃗ | (x-x₁)/a=(y-y₁)/b=(z-z₁)/c
PLANE: r⃗·n̂=d | ax+by+cz=d
Angle between planes: use dot product of normals
Distance point to plane: |ax₁+by₁+cz₁+d|/√(a²+b²+c²)
```
