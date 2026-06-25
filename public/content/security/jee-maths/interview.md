# JEE Mathematics Interview Q&A

**Q: What is the range of arcsin(x) and how does arcsin(sin(x)) differ from sin(arcsin(x))?**
Domain of arcsin: x ∈ [−1, 1]. Range: [−π/2, π/2].
sin(arcsin(x)) = x for all x ∈ [−1, 1]. (Always true within domain.)
arcsin(sin(x)) = x ONLY if x ∈ [−π/2, π/2]. Outside this principal range, arcsin returns the equivalent value within [−π/2, π/2]. Example: arcsin(sin(2π/3)) = arcsin(√3/2) = π/3, NOT 2π/3.

**Q: How do you determine if three lines are concurrent?**
Three lines a₁x + b₁y + c₁ = 0, a₂x + b₂y + c₂ = 0, a₃x + b₃y + c₃ = 0 are concurrent if and only if:
|a₁ b₁ c₁|
|a₂ b₂ c₂| = 0
|a₃ b₃ c₃|
Alternatively: find the intersection point of any two lines and verify it satisfies the third.

**Q: Explain Bayes' theorem with a real-world example.**
P(A|B) = P(B|A)·P(A) / P(B), where P(B) = ΣP(B|Aᵢ)·P(Aᵢ) (total probability).
Medical example: Disease prevalence 1%, test sensitivity 99%, specificity 95%.
P(disease|positive test) = (0.99×0.01) / (0.99×0.01 + 0.05×0.99) = 0.0099/0.0594 ≈ 16.7%.
Key insight: Even with a highly accurate test, positive predictive value is low when disease is rare. Bayesian reasoning is essential for correctly interpreting test results.

**Q: What is L'Hôpital's rule and when is it applied?**
For indeterminate forms 0/0 or ∞/∞: lim[x→a] f(x)/g(x) = lim[x→a] f'(x)/g'(x), provided the right-hand limit exists.
Other indeterminate forms (0×∞, ∞−∞, 0⁰, ∞⁰, 1^∞) must first be converted to 0/0 or ∞/∞ using logarithms or algebraic manipulation. Can be applied repeatedly if still indeterminate after one application.

**Q: State the fundamental theorem of calculus.**
Part 1: If F(x) = ∫ₐˣ f(t)dt and f is continuous, then F'(x) = f(x). Differentiation undoes integration.
Part 2: If F'(x) = f(x), then ∫ₐᵇ f(x)dx = F(b) − F(a). Evaluate definite integrals using antiderivatives without summing infinite rectangles. These two parts establish that differentiation and integration are inverse operations.

**Q: What is the eccentricity of each conic section?**
Circle: e = 0
Ellipse: 0 < e < 1 (e = √(1−b²/a²) for x²/a²+y²/b²=1, a>b; or c/a where c=focal distance)
Parabola: e = 1 (every point equidistant from focus and directrix)
Hyperbola: e > 1 (e = √(1+b²/a²); greater e = more "open" hyperbola)
As e→0: ellipse approaches circle. As e→∞: hyperbola branches approach the asymptotes.

**Q: What are the key properties of definite integrals?**
1. ∫ₐᵇ f(x)dx = −∫ᵦᵃ f(x)dx (direction reversal changes sign)
2. ∫ₐᵃ f(x)dx = 0 (zero width interval)
3. ∫ₐᵇ f(x)dx = ∫ₐᶜ f(x)dx + ∫ᶜᵇ f(x)dx (additivity over intervals)
4. King's property: ∫₀ᵃ f(x)dx = ∫₀ᵃ f(a−x)dx
5. Even function: ∫₋ₐᵃ f(x)dx = 2∫₀ᵃ f(x)dx
6. Odd function: ∫₋ₐᵃ f(x)dx = 0
Properties 4-6 are essential for simplifying JEE definite integral problems.

**Q: What is the principle of mathematical induction?**
Two-step proof method for statements P(n) true for all positive integers n.
Base case: Prove P(1) is true (or P(0), depending on the statement).
Inductive step: Assume P(k) is true (induction hypothesis), then prove P(k+1) is true.
Conclusion: P(n) is true for all n ≥ 1 (or starting value).
Analogy: Like an infinite chain of dominoes — if the first falls (base case) and each falling domino knocks the next (inductive step), all dominos fall.
Example: Prove sum of first n natural numbers = n(n+1)/2.
Base: n=1: 1 = 1(2)/2 = 1 ✓
Inductive step: Assume 1+2+...+k = k(k+1)/2. Then 1+2+...+k+(k+1) = k(k+1)/2 + (k+1) = (k+1)(k+2)/2 ✓

**Q: What is De Moivre's theorem and how is it applied?**
(cos θ + i sin θ)ⁿ = cos nθ + i sin nθ for any integer n. In polar form: if z = r(cos θ + i sin θ), then zⁿ = rⁿ(cos nθ + i sin nθ). Applications: finding nth roots of complex numbers, proving trigonometric identities (express sin nθ and cos nθ in terms of sin θ and cos θ), summing trigonometric series. Example of nth roots: nth roots of unity are e^(2πik/n) for k = 0, 1, ..., n-1, equally spaced on unit circle.

**Q: What is the dot product and cross product and when is each used?**
Dot product (scalar product): a·b = |a||b|cosθ. Result is a scalar. Use for: finding angle between vectors, checking perpendicularity (a·b = 0 → perpendicular), projections, work done (W = F·d).
Cross product (vector product): a×b = |a||b|sinθ n̂. Result is a vector perpendicular to both a and b. Magnitude = area of parallelogram formed by a and b. Use for: finding normal to a plane, torque (τ = r×F), angular momentum (L = r×p), checking parallelism (a×b = 0 → parallel). Right-hand rule determines direction of cross product.
