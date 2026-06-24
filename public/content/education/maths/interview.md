# Engineering Mathematics Interview Questions

## Linear Algebra Interview Questions

**Q: What are eigenvalues and eigenvectors? Give a real-world example.**

A: If A is a square matrix, λ is an eigenvalue and v is the corresponding eigenvector if Av = λv — the matrix transforms v by just scaling it (no rotation). Real-world example: Google's PageRank algorithm finds the dominant eigenvector of the web link matrix. In PCA (Principal Component Analysis), eigenvalues represent variance explained by each principal component, and eigenvectors define the directions of maximum variance.

---

**Q: When does a system of linear equations Ax = b have no solution, one solution, or infinitely many?**

A: No solution: rank(A) ≠ rank([A|b]) — the system is inconsistent. Exactly one solution: rank(A) = rank([A|b]) = n (number of unknowns) — the matrix has full column rank. Infinitely many solutions: rank(A) = rank([A|b]) < n — there are free variables (underdetermined system).

---

**Q: What is the difference between a permutation and a combination?**

A: A permutation is an ordered arrangement — the order matters. ⁿPᵣ = n!/(n-r)! ways to choose r items from n in a specific order. A combination is an unordered selection — order does not matter. ⁿCᵣ = n!/[r!(n-r)!] ways to choose r items from n. Example: forming a 4-digit PIN is a permutation (1234 ≠ 4321). Choosing 3 people for a committee from 10 is a combination (same 3 people regardless of selection order).

---

**Q: What is the Central Limit Theorem?**

A: The Central Limit Theorem states that the distribution of the sample mean of n independent, identically distributed random variables approaches a normal distribution as n → ∞, regardless of the original distribution's shape. This is why the normal distribution appears everywhere — averages of large samples are approximately normal. Practically: if we take many samples of size ≥ 30, the distribution of sample means follows N(μ, σ²/n) where μ and σ are the population mean and standard deviation.

---

**Q: What is the difference between a graph and a tree?**

A: A tree is a special case of a graph. A graph G = (V, E) is a collection of vertices and edges with no required structure. A tree is a connected, acyclic undirected graph — it has exactly n-1 edges for n vertices and there is exactly one path between any two vertices. A forest is a set of disjoint trees (acyclic, possibly disconnected graph). Every tree is a graph, but not every graph is a tree.

---

**Q: What is Bayes' theorem and when do you use it?**

A: Bayes' theorem: P(A|B) = P(B|A) × P(A) / P(B). It updates our prior belief P(A) after observing evidence B to get posterior belief P(A|B). Use it when: you have prior knowledge about a hypothesis, you observe new evidence, and you want to update your belief. Classic use cases: spam filter (P(spam|contains "money")), medical diagnosis (P(disease|positive test)), classification in Naive Bayes classifiers.

## Quick Reference
```
MATRIX RANK: number of linearly independent rows or columns
DETERMINANT: det(AB) = det(A)×det(B) | det(Aᵀ) = det(A) | det(A⁻¹) = 1/det(A)
EIGENVALUES: sum = trace | product = determinant
GRAPH EULER PATH: exists iff exactly 0 or 2 vertices of odd degree
GRAPH HAMILTONIAN: no simple necessary and sufficient condition (NP-complete)
PROBABILITY: P(A∪B) = P(A)+P(B)-P(A∩B) | P(A∩B) = P(A)×P(B) iff independent
```


## Additional Notes

Cloud and infrastructure tools evolve rapidly. Always cross-reference with the official documentation for the most current commands and best practices.

### Key Principles
- Start with fundamentals before advanced configurations
- Practice in a sandbox environment before applying to production
- Understand the underlying concepts, not just the commands
- Join community forums and follow official release notes for updates
- Certifications validate knowledge — consider pursuing relevant credentials to demonstrate expertise

### Recommended Learning Path
1. Complete official documentation and getting started guides
2. Practice with hands-on labs and sandbox environments
3. Build real projects to solidify understanding
4. Study for and obtain relevant certifications
5. Contribute to open-source projects or write blog posts to deepen knowledge

### Community Resources
- Official documentation is always the authoritative source
- GitHub repositories often contain real-world examples and configurations
- Stack Overflow and community forums help with specific problems
- YouTube tutorials provide visual walkthroughs for complex topics
- Local meetups and online communities connect you with practitioners

