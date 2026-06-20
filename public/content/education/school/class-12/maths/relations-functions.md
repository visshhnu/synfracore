# Relations and Functions

## Why This Chapter Matters
Relations and Functions is the foundation of Class 12 Maths and the first chapter in NCERT. Board exams test definitions, types of functions, composition, and inverse — 5-8 marks every year.

## Core Concepts

### 1. Types of Relations
A relation R from set A to set B is a subset of A × B.

**Empty relation:** R = {} (no element of A is related to any element of B)
**Universal relation:** R = A × B (every element related to every other)
**Identity relation:** R = {(a,a) : a ∈ A}

**Equivalence relation:** Must satisfy all three:
- Reflexive: (a,a) ∈ R for all a ∈ A
- Symmetric: (a,b) ∈ R → (b,a) ∈ R
- Transitive: (a,b) ∈ R and (b,c) ∈ R → (a,c) ∈ R

### 2. Types of Functions
**One-one (Injective):** f(a) = f(b) → a = b. No two elements map to same image.
Test: different inputs give different outputs.

**Onto (Surjective):** Every element of codomain has a pre-image. Range = Codomain.

**Bijective:** Both one-one AND onto. Has inverse function.

**Into:** Some elements of codomain have NO pre-image (range ≠ codomain).

### 3. Composition of Functions
(gof)(x) = g(f(x)) — apply f first, then g.
Order matters: gof ≠ fog generally.
If f: A→B and g: B→C, then gof: A→C.

### 4. Inverse Functions
f⁻¹ exists only if f is bijective.
If f(x) = y then f⁻¹(y) = x.
Domain of f⁻¹ = Range of f. Range of f⁻¹ = Domain of f.
f⁻¹(f(x)) = x and f(f⁻¹(x)) = x.

### 5. Binary Operations
A binary operation * on set A: * : A × A → A.
Commutative: a * b = b * a.
Associative: (a * b) * c = a * (b * c).
Identity element e: a * e = e * a = a.
Inverse of a: a * a⁻¹ = e.

## Board Questions

**Q1:** Show that f: R→R defined by f(x) = 2x+3 is bijective.
One-one: f(a)=f(b) → 2a+3=2b+3 → a=b ✓
Onto: For any y∈R, x=(y-3)/2 ∈ R gives f(x)=y ✓. Bijective.

**Q2:** If f(x)=x²+4 and g(x)=2x-1, find gof(x) and fog(x).
gof(x)=g(f(x))=g(x²+4)=2(x²+4)-1=2x²+7.
fog(x)=f(g(x))=f(2x-1)=(2x-1)²+4=4x²-4x+5.

**Q3:** Is f: N→N defined by f(n)=n² one-one? Onto?
One-one: f(1)=f(-1)=1 but 1≠-1... but domain is N. In N: f(a)=f(b)→a²=b²→a=b (since both positive) ✓ One-one.
Onto? f(N)={1,4,9,16...}≠N (2 has no pre-image). NOT onto.

## PYQs (CBSE)

**CBSE 2023:** Let R be relation on Z defined by R={(a,b): a-b is divisible by 5}. Show R is equivalence.
Reflexive: a-a=0 divisible by 5 ✓.
Symmetric: a-b divisible by 5 → b-a=-(a-b) also divisible by 5 ✓.
Transitive: a-b div by 5, b-c div by 5 → a-c=(a-b)+(b-c) div by 5 ✓. Equivalence relation.

**CBSE 2022:** f: R→R, f(x)=3-4x. Find f⁻¹.
Let y=3-4x → 4x=3-y → x=(3-y)/4. So f⁻¹(y)=(3-y)/4 or f⁻¹(x)=(3-x)/4.

## Revision Notes
```
RELATION TYPES:
Reflexive: (a,a)∈R | Symmetric: (a,b)→(b,a) | Transitive: (a,b)+(b,c)→(a,c)
Equivalence = Reflexive + Symmetric + Transitive

FUNCTION TYPES:
One-one(Injective): f(a)=f(b)→a=b
Onto(Surjective): Range=Codomain
Bijective: One-one + Onto (invertible)

COMPOSITION: gof(x)=g(f(x)) — right to left
INVERSE: exists only for bijective functions

BINARY OPERATION:
Commutative: a*b=b*a
Associative: (a*b)*c=a*(b*c)
Identity e: a*e=e*a=a
```
