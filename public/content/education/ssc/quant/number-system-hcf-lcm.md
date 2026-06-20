# Number System, HCF and LCM

## Why This Chapter Matters
Number system is the foundation of SSC CGL Tier 1 and Tier 2 quantitative aptitude — 3-5 questions every paper. HCF, LCM, divisibility rules, and number properties are tested directly and as part of word problems.

## Core Concepts

### 1. Types of Numbers
Natural numbers: 1, 2, 3, ... (positive integers)
Whole numbers: 0, 1, 2, 3, ... (natural + zero)
Integers: ...-3, -2, -1, 0, 1, 2, 3...
Rational: p/q where q≠0 (includes decimals, fractions)
Irrational: cannot be expressed as p/q (√2, √3, π)
Real numbers: rational + irrational
Prime numbers: divisible only by 1 and itself (2 is the only even prime)
Composite numbers: more than 2 factors

### 2. Divisibility Rules
÷2: last digit even | ÷3: sum of digits divisible by 3
÷4: last 2 digits divisible by 4 | ÷5: ends in 0 or 5
÷6: divisible by both 2 and 3 | ÷7: complex rule (rarely tested directly)
÷8: last 3 digits divisible by 8 | ÷9: sum of digits divisible by 9
÷10: ends in 0 | ÷11: alternating digit sum difference divisible by 11
÷25: last 2 digits divisible by 25

### 3. HCF (Highest Common Factor)
HCF = largest number dividing all given numbers exactly.

**Methods:**
Prime factorisation: factorise each number → HCF = product of common prime factors with lowest powers.
Example: HCF(36, 48) → 36=2²×3², 48=2⁴×3 → HCF=2²×3=12

Division method (Euclid): divide larger by smaller → remainder becomes divisor → repeat.
HCF(48,36): 48=1×36+12 → 36=3×12+0 → HCF=12

### 4. LCM (Lowest Common Multiple)
LCM = smallest number divisible by all given numbers.

**Formula:** LCM × HCF = Product of two numbers (for exactly TWO numbers only)
LCM(a,b) = a×b / HCF(a,b)

**Prime factorisation:** LCM = product of all prime factors with highest powers.
LCM(36,48): 36=2²×3², 48=2⁴×3 → LCM=2⁴×3²=144

### 5. Important Properties
If HCF of a,b is H, then a=Hx, b=Hy where HCF(x,y)=1.
HCF always divides LCM. LCM is always a multiple of HCF.
HCF(a,b,c) divides each of a, b, c.

### 6. Word Problems Pattern
**"Find largest number that divides x, y, z leaving remainder r each time"**
→ HCF of (x-r), (y-r), (z-r)

**"Find largest number dividing x leaving remainder p, y leaving remainder q"**
→ HCF of (x-p) and (y-q)

**"Find smallest number divisible by x, y, z"** → LCM(x,y,z)

**"Find smallest number that when divided by x, y, z leaves remainder r"**
→ LCM(x,y,z) + r

**"Bells ring at intervals of x, y, z minutes. When do they ring together?"**
→ LCM(x,y,z) minutes after they ring together

## Solved Examples

**Q1:** Find HCF and LCM of 12, 18, 24.
12=2²×3, 18=2×3², 24=2³×3
HCF=2×3=6 | LCM=2³×3²=72

**Q2:** The largest number that divides 245 and 1029 leaving remainder 5 each:
Numbers: 245-5=240, 1029-5=1024. HCF(240,1024).
240=2⁴×3×5, 1024=2¹⁰. HCF=2⁴=16.

**Q3:** Three bells ring at intervals of 9, 12, 15 minutes. If they ring together at 8 AM, when next?
LCM(9,12,15)=180 minutes=3 hours. Next: 11 AM.

## PYQs (SSC CGL)

**SSC CGL 2023:** HCF of two numbers is 11, LCM is 7700. One number is 275. Find the other.
Other = HCF×LCM/First = 11×7700/275 = 308.

**SSC CGL 2022:** Find least number when divided by 5, 6, 7, 8 leaves remainder 3 in each case.
LCM(5,6,7,8)=840. Required=840+3=843.

**SSC CHSL 2022:** Which of the following is divisible by 11? 
(A) 246521 (B) 415624 (C) 135792 (D) 358946
Alternating sum: (A) 2-2+5-6+4-2=1 ✗ (B) 4-2+6-5+1-4=0 ✓. Answer: B.

## MCQ Practice

**Q1.** LCM of two numbers is 2310, HCF is 30. One number is 210. Other is?
(A) 230 (B) 330 ✓ (C) 120 (D) 310
[2310×30/210 = 330]

**Q2.** Greatest number dividing 29, 37, 53 leaving same remainder:
Differences: 37-29=8, 53-37=16, 53-29=24. HCF(8,16,24)=8. Answer: 8.

**Q3 (Hard).** A number when divided by 5 leaves 3, by 7 leaves 4. Find smallest such number.
Want: N≡3(mod5) and N≡4(mod7). Try N=5k+3: k=0→3, k=1→8, k=2→13, k=3→18, k=4→23, k=5→28, k=6→33 ✓ (33÷7=4r5 ✗), k=7→38 ✓ (38÷7=5r3 ✗). 
Systematic: LCM(5,7)=35. Check 38: 38÷5=7r3✓, 38÷7=5r3✗. 53: 53÷5=10r3✓, 53÷7=7r4✓. Answer: 53.

## Revision Notes
```
DIVISIBILITY QUICK RULES:
÷3: digit sum ÷3 | ÷9: digit sum ÷9 | ÷11: alternating sum ÷11
÷4: last 2 digits | ÷8: last 3 digits | ÷25: last 2 digits

HCF: product of COMMON factors with LOWEST powers
LCM: product of ALL factors with HIGHEST powers
HCF × LCM = product of two numbers (for 2 numbers only)

WORD PROBLEM PATTERNS:
Largest divisor leaving same remainder r from x,y,z → HCF(x-r, y-r, z-r)
Smallest multiple + remainder r → LCM + r
Bells/signals together → LCM of intervals
```
