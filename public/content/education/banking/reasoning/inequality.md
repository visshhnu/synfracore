# Inequalities

## Why This Chapter Matters
Inequalities (symbol-based) appear in every Banking exam — 5 marks. Both direct and coded inequality questions need fast solving. Systematic approach is key.

**Analogy** — Think of chaining inequalities like linking arrows that all point the same direction to see the overall relationship. "A>B" and "B>C" are two arrows both pointing "greater than" — link them (A>B>C) and you can read off that A>C directly, the same way linking two "taller than" statements about three people lets you rank all three without measuring anyone new. The moment an arrow flips direction (a > suddenly followed by a <), the chain breaks — that break is exactly why "combining a strict and a non-strict inequality" needs care rather than blind chaining.

## Core Concepts

### 1. Basic Symbols
> (greater than), < (less than), = (equal to), ≥ (greater than or equal), ≤ (less than or equal)

### 2. Rules for Combining Inequalities

If A > B and B > C: then A > C (transitive)
If A > B and B = C: then A > C
If A = B and B > C: then A > C
If A ≥ B and B > C: then A > C
If A ≥ B and B ≥ C: then A ≥ C

**CANNOT COMBINE:** If A > B and C > B (B is not a bridge)

### 3. Conclusion Types
"A > B" is definitely true | "A < B" is definitely false
"A ≥ B" is true means A is greater than or equal (either OR relationship)
"Either A > B or A = B" — conclusion is "A ≥ B"

### 4. Coded Inequalities
Replace symbols with codes:
* means >, @ means <, # means =, $ means ≥, % means ≤
Decode first, then apply normal rules.

### 5. New Pattern
Given: A $ B (A ≥ B), B > C, C @ D (C < D), D # E (D = E)
Conclusions: (I) A > C (II) E > B (III) D < B

**Step-by-step:** A ≥ B > C < D = E
From A ≥ B > C: A > C (✓ conclusion I follows)
From B > C < D: can't compare B and D directly. Conclusion II (E > B): E = D > C but B > C too, can't determine E vs B. Doesn't follow.
Conclusion III (D < B): Same issue. Doesn't follow.

**Key:** Break the chain where inequality direction changes (< to > or > to <). Conclusions only follow within unbroken chains.

## Practice Problems

**Q1:** A > B ≥ C = D > E < F
(I) A > D? Yes — A > B ≥ C = D, so A > D. ✓
(II) F > C? Cannot determine — F > E but E < D = C, so F could be more or less than C. ✗
(III) B > E? Yes — B ≥ C = D > E, so B > E. ✓

**Q2 (Either-Or):** A ≥ B, B ≤ C, A > C?
A ≥ B, C ≥ B. Relation between A and C? Not determined.
But: "A > C OR A = C OR A < C" — so "A ≥ C" or "A ≤ C" — without more info, "Either I or II" can only be used when I and II are complementary.

## Previous Year Questions
**SBI PO 2023:** 5 statements, 5 conclusions. Coded with letters P@Q meaning P<Q.
**IBPS Clerk 2022:** "P ≥ Q > R = S < T ≤ U". Which conclusions follow?

## Revision Notes
```
TRANSITIVE RULE:
Same direction chain: A>B>C → A>C, A>C
Mixed direction: STOP — cannot conclude

CODED INEQUALITY:
1. Decode all symbols first
2. Write out the chain in standard notation
3. Apply transitive rules

EITHER-OR CASES:
Used when two conclusions together cover all possibilities
If (I) A>B and (II) A=B, then "Either I or II" if A≥B is given (but not alone)
Common: either I or II follows when they are complementary and one must be true

QUICK TIPS:
Break chain at direction change (> to < or < to >)
Same inequality can be strengthened: A≥B + B>C → A>C (not A≥C)
Weakened: A>B + B≥C → A>C still (because B≥C includes B=C, and A>B>C or A>B=C both give A>C)
```

## Try It (2 Minutes)

Given: A>B, B≥C, C>D. Before checking any rule, chain them yourself: A>B≥C>D. Can you conclude A>D? Walk through it: A is strictly greater than B, B is at least equal to C, C is strictly greater than D. Even in the "worst case" where B equals C exactly, you still get A>C (since A>B=C means A>C), and C>D, so A>C>D means A>D holds regardless. You've just verified the "weakened chain still yields the strict conclusion" rule by testing the edge case yourself, rather than trusting it as a memorized fact.
