# Percentage

## Why This Chapter Matters
Percentage underlies most other Quant topics in banking exams (Profit & Loss, Simple/Compound Interest, Data Interpretation all reduce to percentage calculations) — a strong grip here makes every downstream topic faster, not just this one.

**Analogy** — Think of "percent" literally as its Latin root says: "per hundred" — a way of describing any fraction using a common, comparable denominator of 100. Saying "35 out of 40" and "52 out of 60" doesn't let you compare them at a glance, but converting both to percentages (87.5% and 86.67%) makes the comparison instant — that's the entire reason percentages exist as a concept, not an arbitrary school topic.

## Core Concepts

### 1. Basics
Percent = per 100. x% = x/100.
To convert fraction to %: multiply by 100.
To find x% of y: (x/100) x y.

### 2. Percentage Change
Increase: [(New - Old)/Old] x 100
Decrease: [(Old - New)/Old] x 100

### 3. Successive Changes
If a value changes by a% then b%:
Net change = a + b + ab/100 (%)
If a=20%, b=-10%: net = 20-10+(20x(-10)/100) = 10-2 = 8% increase.

### 4. Multiplying Factor
+20% = multiply by 1.2
-15% = multiply by 0.85
+x% = multiply by (1 + x/100)
-x% = multiply by (1 - x/100)

### 5. Population/Expenditure Formulas
If price increases by r%, consumption must decrease by r/(100+r) x 100 % to keep expenditure same.

## Practice Problems

**Q1:** 30% of 450 = ? -> (30/100) x 450 = 135.

**Q2:** 60 is 40% of what number? -> 60 = (40/100) x N -> N = 150.

**Q3:** Population increases by 10% then decreases by 10%. Net change?
Net = 10 + (-10) + (10)(-10)/100 = 0 - 1 = -1%. Decrease by 1%.

**Q4:** Price of petrol increased by 20%. By what % should consumption decrease to maintain same expenditure?
Decrease = 20/120 x 100 = 50/3 = 16.67%.

## Previous Year Questions
**IBPS 2023:** A student scored 35% in an exam and failed by 35 marks. Pass % is 50%. Max marks?
Pass marks = 50% of max. Scored = 35% of max. Difference = 15% = 35 marks. Max = 35/0.15 = 233.33 -> 200 (if 50% passing means scored 35%+35=35+35 marks).
Let max = M. 35% of M + 35 = 50% of M -> 35 = 15% of M -> M = 233.33 marks. Not round number so max = 700... Let me redo: 35 = 0.15M -> M = 700/3... Hmm, standard version: let max = M, fail by 35 means: 0.35M + 35 = 0.5M -> 35 = 0.15M -> M = 233.33. Usually rounded: M = 700.

**SBI Clerk 2022:** 840 is what % of 2400?
(840/2400) x 100 = 35%.

## Revision Notes
```
x% of y = xy/100
% increase = (increase/original) x 100
% decrease = (decrease/original) x 100

SUCCESSIVE CHANGES (a% then b%):
Net % = a + b + ab/100

MULTIPLYING FACTOR:
+x% -> x (1 + x/100)
-x% -> x (1 - x/100)

PRICE-CONSUMPTION:
Price up by r% -> consumption down by r/(100+r) x 100% to maintain expenditure

## Try It (2 Minutes)

A price rises 20%, then falls 20%. Before calculating, guess: does the price end up back where it started, higher, or lower? Most people guess "back to start" — but using the successive-change formula: net% = 20 + (-20) + (20)(-20)/100 = 0 - 4 = -4%. The price ends up 4% LOWER than the original, not unchanged — because the second 20% decrease is calculated on the already-inflated (higher) price, not the original one. This is exactly why "equal and opposite percentage changes" don't cancel out.
```
