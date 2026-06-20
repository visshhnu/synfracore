# Probability (Class 12)

## Why This Chapter Matters
Probability gives 8-10 marks in CBSE Class 12 boards. Conditional probability, Bayes' theorem, random variables, and Binomial distribution are all tested.

## Core Concepts

### 1. Conditional Probability
P(A|B) = P(A∩B)/P(B), provided P(B) ≠ 0.
"Probability of A given that B has occurred."

Properties:
P(S|B) = 1 | P(A'|B) = 1 - P(A|B)
P(A∪B|C) = P(A|C) + P(B|C) - P(A∩B|C)

### 2. Multiplication Theorem
P(A∩B) = P(A)·P(B|A) = P(B)·P(A|B)
For independent events: P(A∩B) = P(A)·P(B).
A and B independent ↔ P(A|B)=P(A) ↔ P(B|A)=P(B).

### 3. Total Probability Theorem
If B₁, B₂, ..., Bₙ are mutually exclusive and exhaustive events:
P(A) = P(A|B₁)P(B₁) + P(A|B₂)P(B₂) + ... + P(A|Bₙ)P(Bₙ)
= Σ P(A|Bᵢ)P(Bᵢ)

### 4. Bayes' Theorem
P(Bᵢ|A) = P(A|Bᵢ)P(Bᵢ) / Σⱼ P(A|Bⱼ)P(Bⱼ)
Used for "reverse" probability — given an event occurred, find which cause is most likely.

### 5. Random Variable
X is a random variable: assigns a numerical value to each outcome.
Probability distribution: table of X values and their probabilities.
ΣP(X=xᵢ) = 1 (probabilities must sum to 1).
E(X) = Mean = ΣxᵢP(xᵢ).
Var(X) = E(X²) - [E(X)]² = Σxᵢ²P(xᵢ) - (ΣxᵢP(xᵢ))².

### 6. Binomial Distribution
For n independent trials, each with success probability p, failure q=1-p:
P(X=r) = ⁿCᵣ pʳ qⁿ⁻ʳ (r = 0, 1, 2, ..., n)
Mean = np | Variance = npq | Standard deviation = √(npq).

## Board Examples

**Q1 (Bayes'):** Bag I has 3 red, 4 black. Bag II has 5 red, 6 black. One ball drawn from random bag is red. What is probability it came from Bag I?
P(I)=P(II)=1/2. P(Red|I)=3/7. P(Red|II)=5/11.
P(I|Red) = (3/7 × 1/2)/[(3/7 × 1/2) + (5/11 × 1/2)] = (3/7)/[(3/7)+(5/11)] = (33/77)/(33/77+35/77) = 33/68.

**Q2 (Binomial):** Probability a student passes = 0.6. If 5 students appear, find P(at least 3 pass).
P(X≥3) = P(X=3)+P(X=4)+P(X=5).
= ⁵C₃(0.6)³(0.4)² + ⁵C₄(0.6)⁴(0.4)¹ + ⁵C₅(0.6)⁵
= 10(0.216)(0.16) + 5(0.1296)(0.4) + 1(0.07776)
= 0.3456 + 0.2592 + 0.07776 = 0.68256.

## PYQs (CBSE)

**CBSE 2023:** A and B solve a problem independently. P(A solves)=3/5, P(B solves)=2/3. Find P(problem is solved).
P(A')=2/5, P(B')=1/3. P(not solved)=P(A')P(B')=2/5×1/3=2/15.
P(solved) = 1-2/15 = 13/15.

**CBSE 2022:** From a lot of 30 bulbs (6 defective), 4 bulbs drawn. Find probability that exactly one is defective.
P = C(6,1)×C(24,3)/C(30,4) = 6×2024/27405 = 12144/27405 = 4048/9135.

## Revision Notes
```
CONDITIONAL: P(A|B)=P(A∩B)/P(B)
INDEPENDENT: P(A∩B)=P(A)×P(B)

TOTAL PROBABILITY: P(A)=ΣP(A|Bᵢ)P(Bᵢ)
BAYES': P(Bᵢ|A)=P(A|Bᵢ)P(Bᵢ)/ΣP(A|Bⱼ)P(Bⱼ)

RANDOM VARIABLE:
E(X)=ΣxᵢP(xᵢ) | Var(X)=E(X²)-[E(X)]²

BINOMIAL:
P(X=r)=ⁿCᵣpʳqⁿ⁻ʳ where q=1-p
Mean=np | Variance=npq | SD=√(npq)
```
