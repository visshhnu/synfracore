# Probability (JEE Level)

## Why This Chapter Matters
Probability has 8-12 marks in JEE every year. Bayes' theorem, conditional probability, and probability distributions (binomial, Poisson) are tested beyond Class 10 level. This requires algebraic thinking.

## Core Concepts

### 1. Basic Probability
P(A) = n(A)/n(S)  (classical definition)
0 <= P(A) <= 1
P(A') = 1 - P(A)
P(A union B) = P(A) + P(B) - P(A intersection B)
P(A union B) = P(A) + P(B) if mutually exclusive (A intersection B = empty)

### 2. Conditional Probability
P(A|B) = P(A intersection B)/P(B)  [probability of A given B has occurred]

**Multiplication theorem:**
P(A intersection B) = P(A) x P(B|A) = P(B) x P(A|B)

**Independent events:**
P(A intersection B) = P(A) x P(B)
P(A|B) = P(A) [knowing B doesn't affect A]

### 3. Total Probability Theorem
If B1, B2, ..., Bn are mutually exclusive and exhaustive:
P(A) = sum P(A|Bi) x P(Bi)

### 4. Bayes' Theorem
P(Bi|A) = P(A|Bi) x P(Bi) / [sum over j of P(A|Bj) x P(Bj)]

### 5. Random Variables and Distributions

**Binomial Distribution:**
n independent trials, probability p of success in each.
P(X = r) = C(n,r) x p^r x (1-p)^(n-r)
Mean = np, Variance = np(1-p), SD = sqrt(np(1-p))

**Bernoulli trials:** n independent trials each with probability p (success) and q=1-p (failure).

## PYQs
**2024:** Three fair coins are tossed. Find probability of at least 2 heads.
P(X>=2) = P(X=2) + P(X=3) = C(3,2)(1/2)^3 + C(3,3)(1/2)^3 = 3/8 + 1/8 = 1/2

**2023:** Bag A: 3 red, 4 black. Bag B: 4 red, 3 black. One ball drawn from each. Find P(both same colour).
P(both red) = 3/7 x 4/7 = 12/49.
P(both black) = 4/7 x 3/7 = 12/49.
P(same colour) = 24/49.

**2022 (Bayes):** 3 urns A,B,C. A: 1W,2B; B: 2W,1B; C: 2W,2B. Ball drawn is white. P it's from B?
P(W|A) = 1/3, P(W|B) = 2/3, P(W|C) = 1/2. P(A)=P(B)=P(C)=1/3.
P(W) = 1/3(1/3+2/3+1/2) = 1/3 x 3/2 = 1/2.
P(B|W) = P(W|B)P(B)/P(W) = (2/3 x 1/3)/(1/2) = (2/9)/(1/2) = 4/9.

## MCQ Practice
Q1. P(A)=0.6, P(B)=0.4, P(A intersection B)=0.2. P(A union B) =
(A) 0.6 (B) 0.8 (C) 1.0 (D) 0.4
Answer: B [0.6+0.4-0.2 = 0.8]

Q2. Binomial distribution: n=5, p=0.4. Mean and variance?
Mean = np = 2. Variance = npq = 5x0.4x0.6 = 1.2.

Q3 (Hard). Two cards drawn without replacement from 52. P(both aces)?
P = 4/52 x 3/51 = 12/2652 = 1/221.

## Revision Notes
```
P(A|B) = P(AnB)/P(B)  [conditional]
INDEPENDENT: P(AnB) = P(A)xP(B)
TOTAL PROBABILITY: P(A) = sum P(A|Bi)P(Bi)
BAYES: P(Bi|A) = P(A|Bi)P(Bi)/P(A)

BINOMIAL DISTRIBUTION P(X=r) = C(n,r)p^r q^(n-r):
Mean = np | Variance = npq | q = 1-p
```
