# Mathematics Fundamentals

## Number Theory

### Types of Numbers
- Natural: 1, 2, 3, ... | Whole: 0, 1, 2, ... | Integers: ...-2,-1,0,1,2,...
- Rational: p/q where p,q integers, q≠0 (terminating or repeating decimals)
- Irrational: cannot be expressed as p/q (π, √2, e)
- Real: rational ∪ irrational | Complex: a+bi where i=√(-1)

### Divisibility and Primes
- Divisibility rules: 2 (even), 3 (digit sum ÷3), 4 (last 2 digits), 5 (0 or 5 ending), 9 (digit sum ÷9), 11 (alternating digit sum ÷11)
- HCF (GCD): highest common factor; use Euclid's algorithm
- LCM: lowest common multiple; LCM × HCF = product of two numbers
- Prime: exactly two factors (1 and itself); primes up to 50: 2,3,5,7,11,13,17,19,23,29,31,37,41,43,47

### Modular Arithmetic
- a ≡ b (mod m) means m divides (a-b)
- Properties: addition, subtraction, multiplication preserve congruence
- Fermat's little theorem: aᵖ⁻¹ ≡ 1 (mod p) for prime p, gcd(a,p)=1

## Algebra

### Equations and Inequalities
- Linear: ax + b = 0 → x = -b/a
- Quadratic: ax²+bx+c = 0; discriminant D=b²-4ac; x=(-b±√D)/2a
  - D>0: two real roots | D=0: one real root | D<0: complex roots
- Systems: substitution, elimination, matrix methods

### Functions
- Domain: valid inputs | Range: valid outputs
- Types: linear f(x)=mx+b, quadratic f(x)=ax²+bx+c, exponential f(x)=aˣ, logarithmic f(x)=log_a(x)
- Composition: (f∘g)(x) = f(g(x))
- Inverse: f⁻¹ swaps domain and range; iff f is bijective

### Polynomials
- Degree n polynomial: aₙxⁿ + ... + a₁x + a₀
- Fundamental theorem of algebra: degree-n polynomial has n roots (in ℂ)
- Factor theorem: (x-r) is factor iff r is a root
- Remainder theorem: f(a) = remainder when f(x) divided by (x-a)

## Geometry

### Triangles
- Sum of interior angles = 180°
- Congruence: SSS, SAS, ASA, AAS, RHS
- Similarity: AA, SAS, SSS; corresponding sides proportional
- Pythagorean theorem: a²+b²=c² for right triangle
- Area: ½bh; Heron's: √(s(s-a)(s-b)(s-c)) where s=(a+b+c)/2

### Circles
- Circumference: 2πr; Area: πr²
- Chord, arc, sector, segment, tangent, secant
- Tangent perpendicular to radius at point of tangency
- Angle in semicircle = 90° (Thales' theorem)

### Coordinate Geometry
- Distance: √((x₂-x₁)²+(y₂-y₁)²)
- Midpoint: ((x₁+x₂)/2, (y₁+y₂)/2)
- Slope: m=(y₂-y₁)/(x₂-x₁); parallel: m₁=m₂; perpendicular: m₁m₂=-1

## Statistics
- Mean = Σx/n; Median (middle value); Mode (most frequent)
- Range = max-min; Variance = Σ(x-mean)²/n; SD = √Variance
- Probability: P(A) = favorable outcomes/total outcomes; 0≤P≤1
