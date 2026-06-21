# Linear Programming

## Why This Chapter Matters
Linear Programming gives 5-6 marks in CBSE Class 12 boards — one full question. Formulation of LPP, graphical method, corner points, and identifying feasible region are the standard question types.

## Core Concepts

### 1. Key Terms
**Objective function:** Linear function Z = ax+by to be maximised or minimised.
**Decision variables:** x and y (unknowns).
**Constraints:** Linear inequalities that x and y must satisfy.
**Non-negativity constraints:** x ≥ 0, y ≥ 0 (usually given).
**Feasible region:** Set of all points satisfying all constraints. Can be bounded or unbounded.
**Feasible solution:** Any point in the feasible region.
**Optimal solution:** Point in feasible region where Z is maximum or minimum.

### 2. Fundamental Theorem
If an optimal solution exists, it occurs at a corner point (vertex) of the feasible region.
Method: Find all corner points → evaluate Z at each → identify max/min.

### 3. Graphical Method — Steps
1. Convert inequalities to equations, draw boundary lines.
2. Identify which side of each line the inequality includes (test point (0,0)).
3. Shade feasible region (common shaded area satisfying ALL constraints).
4. Find corner points (intersections of boundary lines).
5. Evaluate Z at each corner point.
6. Identify maximum or minimum Z value.

### 4. Special Cases
**No solution (infeasible):** If feasible region is empty.
**Unbounded feasible region:** Maximum may not exist for maximisation; check if any corner gives better value.
**Multiple optimal solutions:** If Z is equal at two adjacent corner points, then every point on that edge is also optimal.

## Standard Board Problem Types

### Type 1 — Manufacturing (most common)
"A factory produces x units of A and y units of B. Time constraint, material constraint, profit function. Maximise profit."

### Type 2 — Diet/Nutrition
"Food X contains p units of protein and q units of fat. Minimise cost subject to nutritional constraints."

### Type 3 — Transport
"Minimise transportation cost subject to supply and demand constraints."

## Solved Example

**Problem:** Maximise Z = 5x+4y subject to:
x+y ≤ 5, 10x+6y ≤ 45, x ≥ 0, y ≥ 0.

**Step 1:** Draw x+y=5 and 10x+6y=45.
x+y=5: passes (0,5) and (5,0).
10x+6y=45: passes (4.5,0) and (0,7.5).

**Step 2:** Both inequalities are "≤" — region below/left of each line.
Test (0,0): 0+0≤5 ✓ and 0≤45 ✓. So region towards origin is feasible.

**Step 3:** Corner points:
O = (0,0). A = (4.5,0). B = intersection of lines. C = (0,5).
Intersection: x+y=5 and 10x+6y=45.
From first: y=5-x. Sub: 10x+6(5-x)=45 → 4x=15 → x=3.75, y=1.25. B=(3.75,1.25).

**Step 4:** Evaluate Z=5x+4y:
Z(0,0)=0. Z(4.5,0)=22.5. Z(3.75,1.25)=18.75+5=23.75. Z(0,5)=20.

**Maximum Z = 23.75 at (3.75,1.25).**

## PYQs (CBSE)

**CBSE 2023:** Maximise Z = 3x+2y subject to x+2y≤10, 3x+y≤15, x≥0, y≥0.
Corner points: (0,0), (5,0), (4,3), (0,5).
Z values: 0, 15, 18, 10. **Maximum Z=18 at (4,3).**

**CBSE 2022:** A manufacturer produces two types of products. Type A needs 2 hours on machine 1 and 1 hour on machine 2. Type B needs 1 hour each. Machine 1 available 300 hrs, machine 2 available 250 hrs. Profit: A→Rs 60, B→Rs 40. Maximise profit.
Let x = units of A, y = units of B.
Maximise Z=60x+40y; constraints: 2x+y≤300, x+y≤250, x≥0, y≥0.
Corner points: (0,0),(150,0),(50,200),(0,250). Z: 0,9000,11000,10000. Max at (50,200)→Z=11000.

## Revision Notes
```
LPP STEPS:
1. Define variables
2. Write objective function (Z = ax+by)
3. Write constraints (linear inequalities)
4. Plot constraints, shade feasible region
5. Find corner points (solve pairs of equations)
6. Evaluate Z at all corners
7. Identify max/min

THEOREM: Optimal value always at corner point (if exists)

SPECIAL:
Unbounded region: check if max/min is achievable
No feasible region: no solution
Two corners give equal Z: entire edge between them is optimal
```
