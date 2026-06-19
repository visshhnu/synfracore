# Pair of Linear Equations in Two Variables

## Why This Chapter Matters

Linear equations in two variables appear in every CBSE Class 10 board exam — typically 6-8 marks worth of questions. Word problems from this chapter test real application skills. The graphical interpretation is also directly tested.

## Prerequisites

- Linear equations in one variable (Class 8)
- Coordinate geometry basics — plotting points (x, y)
- Solving simple equations

---

## Core Concepts

### 1. Linear Equation in Two Variables

Form: **ax + by + c = 0** where a and b are NOT both zero.

Examples: 2x + 3y − 6 = 0, x − y = 5, 3x = 7y

Each equation has **infinitely many solutions** — any point on its graph satisfies it.

---

### 2. Pair of Linear Equations (System)

Two equations in the same two variables:
```
a₁x + b₁y + c₁ = 0
a₂x + b₂y + c₂ = 0
```

### 3. Graphical Method and Types of Solutions

Each equation → a straight line. Two lines can:

| Situation | Condition | Solution | Lines |
|---|---|---|---|
| Intersect at ONE point | a₁/a₂ ≠ b₁/b₂ | Unique solution | Intersecting |
| Same line (coincident) | a₁/a₂ = b₁/b₂ = c₁/c₂ | Infinitely many | Coincident |
| Parallel (no intersection) | a₁/a₂ = b₁/b₂ ≠ c₁/c₂ | No solution | Parallel |

**Consistent pair** = has at least one solution (case 1 or 2)
**Inconsistent pair** = has no solution (case 3)

---

### 4. Algebraic Methods

#### Substitution Method
1. Express one variable in terms of the other from equation 1
2. Substitute in equation 2 to get one variable
3. Back-substitute to find the other

**Example:** 2x + y = 9 ... (1) | x − y = 0 ... (2)
From (2): x = y
Substitute in (1): 2y + y = 9 → 3y = 9 → y = 3
→ x = 3
**Solution: (3, 3)**

#### Elimination Method
1. Multiply equations to make coefficients of one variable equal
2. Add or subtract to eliminate that variable
3. Solve for remaining variable, back-substitute

**Example:** 3x + 4y = 10 ... (1) | 2x − 3y = 1 ... (2)
Multiply (1) by 3: 9x + 12y = 30
Multiply (2) by 4: 8x − 12y = 4
Add: 17x = 34 → x = 2
From (1): 6 + 4y = 10 → y = 1
**Solution: (2, 1)**

#### Cross-Multiplication Method
For a₁x + b₁y + c₁ = 0 and a₂x + b₂y + c₂ = 0:
$$\frac{x}{b_1c_2 - b_2c_1} = \frac{y}{c_1a_2 - c_2a_1} = \frac{1}{a_1b_2 - a_2b_1}$$

---

## Solved Examples

### Example 1 — Checking Type
**Q:** Is the pair 2x + 3y = 7, 4x + 6y = 14 consistent?

a₁/a₂ = 2/4 = 1/2 | b₁/b₂ = 3/6 = 1/2 | c₁/c₂ = 7/14 = 1/2

Since all three ratios are equal → **Infinitely many solutions (coincident lines)**

### Example 2 — Word Problem
**Q:** Five years ago, Nuri was thrice as old as Sonu. Ten years later, Nuri will be twice as old. How old are they?

Let current ages: Nuri = x, Sonu = y
Five years ago: x − 5 = 3(y − 5) → x − 3y = −10 ... (1)
Ten years later: x + 10 = 2(y + 10) → x − 2y = 10 ... (2)

Subtract (1) from (2): y = 20
From (2): x = 10 + 40 = 50

**Nuri is 50, Sonu is 20.**

---

## PYQs

### 2023
Find the pair of linear equations consistent or not: 3x + y = 5, 6x + 2y = 10
→ 3/6 = 1/3 = 1/2 = 1/2 → All equal → **Infinitely many solutions**

### 2022
Solve: x/a + y/b = 2, ax − by = a² − b²
Solution: x = a, y = b

### 2021
For what value of k do the equations 3x − y − 5 = 0 and 6x − 2y − k = 0 have infinitely many solutions?
→ 3/6 = −1/−2 = −5/−k → 1/2 = 1/2 = 5/k → **k = 10**

---

## MCQ Practice

**Q1.** The pair 3x + 2y = 5, 2x − 3y = 7 has:
(A) No solution (B) One solution ✓ (C) Many solutions (D) Two solutions
*[3/2 ≠ 2/−3 → intersecting lines]*

**Q2.** For inconsistent pair: a₁/a₂ = b₁/b₂ ≠ c₁/c₂ — the lines are:
(A) Intersecting (B) Coincident (C) Parallel ✓ (D) All of these

**Q3 (Hard).** The father's age is 3 times the son's. 4 years hence, twice father's age equals 5 times son's. Their present ages:
Let son = x, father = 3x. After 4 yrs: 2(3x+4) = 5(x+4) → 6x+8 = 5x+20 → **x = 12, father = 36**

---

## Revision Notes

```
Types of pair:
  a₁/a₂ ≠ b₁/b₂           → Unique solution (intersecting)
  a₁/a₂ = b₁/b₂ = c₁/c₂   → Infinite solutions (coincident)
  a₁/a₂ = b₁/b₂ ≠ c₁/c₂   → No solution (parallel)

Methods:
  Substitution  → express one variable, substitute
  Elimination   → make coefficients equal, add/subtract
  Graphical     → find intersection point visually
  
Word problems: Always define variables clearly before forming equations.
```

**Common Mistakes:**
❌ Not checking ratio of c when testing for parallel/coincident
❌ In word problems, writing equations for the wrong condition (past vs future)

## Related Topics
- Chapter 4 — Quadratic Equations
- Chapter 6 — Triangles (similar triangles use ratio conditions)
