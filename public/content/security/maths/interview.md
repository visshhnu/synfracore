# Mathematics Interview Q&A

**Q: Prove that √2 is irrational.**
Proof by contradiction. Assume √2 = p/q in lowest terms (gcd(p,q) = 1).
Then 2 = p²/q², so p² = 2q². Thus p² is even, so p is even (odd² is odd). Write p = 2k.
Then (2k)² = 2q² → 4k² = 2q² → q² = 2k² → q² is even → q is even.
But both p and q are even contradicts gcd(p,q) = 1. Contradiction. ∴ √2 is irrational. □

**Q: Fundamental theorem of calculus — state and explain.**
Part 1: If F(x) = ∫ₐˣ f(t)dt with f continuous, then F'(x) = f(x). Differentiation undoes integration.
Part 2: If F'(x) = f(x), then ∫ₐᵇ f(x)dx = F(b) − F(a). Evaluate definite integrals exactly using antiderivatives, bypassing the limit-of-Riemann-sums process. Establishes that differentiation and integration are inverse operations.

**Q: Probability — at least one head in 3 coin flips?**
P(at least 1 head) = 1 − P(no heads) = 1 − (½)³ = 1 − 1/8 = 7/8.
Complementary method is almost always simpler for "at least one" problems.

**Q: Explain Bayes' theorem with an example.**
P(A|B) = P(B|A) × P(A) / P(B). Updates prior probability using new evidence.
Example: Test 95% accurate; disease prevalence 1%.
P(disease|positive) = (0.95 × 0.01) / (0.95×0.01 + 0.05×0.99) ≈ 16%.
Counterintuitive: even a 95% accurate test gives only 16% probability of disease if prevalence is 1%. Used in medical diagnosis, spam filters, and machine learning (Naive Bayes).

**Q: What are eigenvalues and why are they important?**
For matrix A, eigenvalue λ satisfies Av = λv for non-zero vector v (eigenvector). Find by solving det(A − λI) = 0 (characteristic polynomial).
Applications: Principal Component Analysis (directions of maximum variance), differential equations (stability analysis and solutions), Google PageRank, quantum mechanics (observable measurements are eigenvalues), vibration analysis (natural frequencies), diagonalisation (A = PDP⁻¹ simplifies matrix powers).

**Q: State the Pythagorean theorem and give a proof.**
In right triangle with legs a, b and hypotenuse c: a² + b² = c².
Proof (Bhaskara / rearrangement): Take a square of side c. Inside, arrange 4 identical right triangles (legs a, b). The inner figure is a square of side (a−b) or a tilted square of side c.
Alternate: (a+b)² = 4 × (½ab) + c² → a² + 2ab + b² = 2ab + c² → c² = a² + b². □

**Q: Permutation vs combination?**
Permutation nPr = n!/(n−r)!: ordered selections — ORDER MATTERS. Arrangements.
Combination nCr = n!/(r!(n−r)!): unordered selections — ORDER DOESN'T MATTER. Choices.
Relation: nPr = r! × nCr (permutation = combination × arrangements of selected items).
Rule: If you ask "how many ways to ARRANGE?" → permutation. "How many ways to CHOOSE?" → combination.
Example: 3 officers from 10 (president, VP, secretary) = permutation ¹⁰P₃ = 720. 3-member committee from 10 = combination ¹⁰C₃ = 120.

**Q: What is the difference between continuous and differentiable functions?**
Continuous at x=a: lim(x→a) f(x) = f(a) — the function has no breaks or jumps.
Differentiable at x=a: f'(a) = lim(h→0) [f(a+h) - f(a)]/h exists — function has a well-defined tangent.
Key theorem: Differentiable → Continuous (always). But Continuous → NOT necessarily differentiable.
Classic example: f(x) = |x| is continuous at x=0 but NOT differentiable there (left derivative = -1, right derivative = +1, no single tangent slope).

**Q: What is a prime number and state the fundamental theorem of arithmetic?**
A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself. Examples: 2, 3, 5, 7, 11, 13, ... (2 is the only even prime).
Fundamental Theorem of Arithmetic: Every integer greater than 1 can be expressed as a product of prime numbers in exactly one way (up to ordering). This unique prime factorisation is the foundation of number theory. Examples: 12 = 2² × 3; 360 = 2³ × 3² × 5. Used in: computing LCM and HCF, RSA cryptography (difficulty of factoring large numbers), modular arithmetic.

**Q: What is a vector space and what are its axioms?**
A vector space V over a field F (usually ℝ or ℂ) is a set with two operations: vector addition and scalar multiplication, satisfying 8 axioms: commutativity and associativity of addition, existence of zero vector (identity), existence of additive inverse, distributivity of scalar over vector addition, distributivity of scalar over field addition, associativity of scalar multiplication, scalar identity (1·v = v). Examples: ℝⁿ (n-dimensional real vectors), set of polynomials of degree ≤ n, set of continuous functions on [a,b].

**Q: What is the difference between permutation and combination? Give a real example.**
Permutation: ordered selection — order MATTERS. nPr = n!/(n-r)!. Example: 3 prizes (1st, 2nd, 3rd) from 10 students — different orderings give different outcomes → ¹⁰P₃ = 720.
Combination: unordered selection — order DOESN'T MATTER. nCr = n!/(r!(n-r)!). Example: 3-member committee from 10 — any grouping of the same 3 people is the same committee → ¹⁰C₃ = 120. Relationship: nPr = r! × nCr (permutations = combinations × arrangements of selected items). Memory rule: if you ask 'how many arrangements?' → permutation. 'How many groups/selections?' → combination.

**Q: What is a function and what are its properties?**
A function f: A → B is a rule that assigns to each element of set A exactly ONE element of set B. Domain = set A (all valid inputs). Codomain = set B (all possible outputs). Range = actual set of outputs f produces (subset of codomain). Properties: Injective (one-to-one): different inputs → different outputs (no two elements map to the same output). Surjective (onto): every element of codomain is mapped to by at least one input (range = codomain). Bijective: both injective and surjective — has a well-defined inverse function. A function with an inverse must be bijective.

**Q: What is the fundamental theorem of algebra?**
Every polynomial of degree n ≥ 1 with complex coefficients has exactly n complex roots (counting multiplicity). Equivalently: a polynomial of degree n can be factored into exactly n linear factors over ℂ. Implications: a degree-3 polynomial always has 3 roots (some may be complex); a degree-4 polynomial always has 4 roots; real polynomials of odd degree ALWAYS have at least one real root (complex roots of real polynomials come in conjugate pairs). Example: x² + 1 = 0 has no real roots but two complex roots (i and -i).

**Q: What is a set and what are the basic set operations?**
A set is a well-defined collection of distinct objects (elements). Notation: {1, 2, 3} or {x : x is a prime}. Basic operations: Union (A ∪ B): elements in A OR B (or both). Intersection (A ∩ B): elements in BOTH A AND B. Complement (A'): elements NOT in A (relative to universal set U). Difference (A - B): elements in A but NOT in B. Symmetric difference (A Δ B): elements in A or B but NOT both. De Morgan's laws: (A ∪ B)' = A' ∩ B'; (A ∩ B)' = A' ∪ B'. These underpin logic, probability, database queries, and digital circuits.
