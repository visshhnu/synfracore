# Aptitude Fundamentals

## Why This Chapter Matters
Quantitative aptitude tests are used by every major company (TCS, Infosys, Wipro, Accenture, Capgemini, Amazon, Google) in their hiring process. Combined with verbal and logical reasoning, aptitude decides campus placement shortlisting.

## Core Topics

### 1. Number System and Divisibility
All the SSC number system concepts apply here.
Additional: Unit digit patterns for competitive coding assessments.
Unit digit of powers: 2¹=2,2²=4,2³=8,2⁴=6 (cycle 4). 3¹=3,3²=9,3³=7,3⁴=1 (cycle 4).
General: find n mod 4, then use cycle.

### 2. Percentage and Profit-Loss
Same formulas as SSC. Key addition for placements:
Compound growth: Final = Initial × (1+r)ⁿ
Population growth/depreciation problems very common in TCS, Infosys.

### 3. Ratio and Proportion
a:b = c:d → ad = bc (cross multiplication)
If a:b = 2:3 and b:c = 4:5, find a:b:c.
b is common: multiply to get b=12. a:b:c = 8:12:15.

Partnerships: profit ratio = capital × time ratio.
Equal time: profit ratio = capital ratio.

### 4. Average
Average = Sum / Count
Weighted average = (Σwᵢxᵢ) / (Σwᵢ)

If average of n numbers is A, and one number is replaced by x:
New average = A + (x - replaced number)/n

**Age problems:**
If average age of group increases by k when someone joins:
New person's age = old average + (group size + 1) × k

### 5. Permutation and Combination
nPr = n!/(n-r)! | nCr = n!/r!(n-r)!
Arrangements of n things = n! | With repetitions allowed = nⁿ
Circular arrangement = (n-1)!
Selecting r from n = nCr

**Applications:**
Passwords (with/without repetition)
Handshakes: n people, each shakes with every other = nC2 = n(n-1)/2
Teams selection: choose r from n = nCr

### 6. Probability
P(A) = Favourable outcomes / Total outcomes
P(A') = 1 - P(A)
P(A or B) = P(A) + P(B) - P(A and B)
P(A and B) = P(A) × P(B) if independent

**Common problems:**
Cards: 52 cards, 4 suits (13 each), 2 colours (26 each)
Dice: 6 faces. Two dice: 36 total outcomes.
Balls from bag: combination problems.

### 7. Geometry Basics
Areas: triangle = ½bh | circle = πr² | rectangle = lw | trapezium = ½(a+b)h
Volumes: cube = a³ | cuboid = lwh | cylinder = πr²h | cone = ⅓πr²h | sphere = 4πr³/3
Pythagoras: a²+b²=c². Triplets: 3-4-5, 5-12-13, 8-15-17.
Properties of triangles: angle sum=180°, exterior angle=sum of non-adjacent interior angles.

## Company-Wise Patterns

**TCS (National Qualifier Test):**
Number system, percentage, time-work, speed-distance, quadratic equations.
3 sections: Verbal, Reasoning, Numerical. 65 questions, 90 min.

**Infosys:**
Cryptarithmetic (letter+number puzzles), data interpretation, verbal.
Slightly harder than TCS. 35-40 questions, 95 min.

**Wipro (WILP/NLTH):**
Quant + Verbal + Logical. Standard aptitude level.

**Amazon/Google/Microsoft (off-campus):**
Focus on DSA (Data Structures and Algorithms) over aptitude.
Aptitude used only for initial screening.

## Important Shortcuts

**Time and Work:** A and B together = ab/(a+b). Remember this.
**Train problems:** Distance = Speed × Time. Train crossing pole = train length.
**Age:** Present age trick — assume present age, work backwards.
**Mixtures:** Alligation shortcut — cheaper:dearer = (dearer-mean):(mean-cheaper).

## PYQs (TCS/Infosys Pattern)

**Q1 (TCS 2023):** A man walks 3 km east, 4 km north. Distance from start?
√(9+16) = √25 = 5 km.

**Q2 (Infosys 2023):** If 2 men do work in 8 days, 4 men do same in?
Man-days = 16. 4 men: 16/4=4 days.

**Q3 (Wipro 2022):** Two numbers in ratio 3:5. Sum=96. Larger number?
3x+5x=96 → x=12. Larger=5×12=60.

## Revision Notes
```
NUMBER: Unit digit cycles (2→2,4,8,6; 3→3,9,7,1; 4→4,6; 7→7,9,3,1; 8→8,4,2,6)
AVERAGE: New avg = old avg + (new-old avg)/(count+1) when adding one item
PROBABILITY: P(A or B) = P(A)+P(B)-P(A∩B) | Independent: P(A∩B)=P(A)×P(B)
GEOMETRY: Know all area + volume formulas | Pythagorean triplets: 3-4-5, 5-12-13
PARTNERSHIP: Profit ratio = Capital × Time ratio
```
