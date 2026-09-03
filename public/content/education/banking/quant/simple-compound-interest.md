# Simple and Compound Interest

## Why This Chapter Matters
SI/CI questions appear in 2-4 banking Quant questions per paper, and the underlying compounding concept also shows up disguised inside population-growth and depreciation word problems.

**Analogy** — Think of Simple Interest like flat rent that's always calculated on the same original amount, and Compound Interest like a snowball rolling downhill, picking up more snow (and more surface area to pick up even more) as it goes. SI pays interest only ever on the original Principal — the base never changes. CI pays interest on Principal PLUS all interest already earned so far, so each period's interest becomes part of the next period's base — exactly why CI overtakes SI increasingly with each additional year, even at an identical rate.

## Core Concepts

### 1. Simple Interest (SI)
SI = P x R x T / 100
Amount = P + SI = P(1 + RT/100)

P = Principal, R = Rate per annum, T = Time in years.

### 2. Compound Interest (CI)
Amount A = P(1 + R/100)^T  (compounded annually)
CI = A - P

Compounded half-yearly: A = P(1 + R/200)^(2T)
Compounded quarterly: A = P(1 + R/400)^(4T)

### 3. CI - SI Difference
For 2 years: CI - SI = P(R/100)^2
For 3 years: CI - SI = P(R/100)^2 x (R/100 + 3)

### 4. Effective Rate
Effective annual rate = (1 + r/n)^n - 1 (r = nominal rate, n = compounding periods per year)

### 5. Rule of 72
Money doubles in approximately 72/R years (at R% per annum compound interest).

## Practice Problems

**Q1:** SI on Rs 5000 at 8% for 3 years?
SI = 5000 x 8 x 3/100 = Rs 1200.

**Q2:** CI on Rs 10000 at 10% for 2 years?
A = 10000(1.1)^2 = 12100. CI = 2100.

**Q3:** In what time does Rs 4000 become Rs 4800 at 10% SI?
SI = 800. 800 = 4000 x 10 x T/100 -> T = 2 years.

**Q4:** CI - SI difference for Rs 8000, 5% for 2 years?
CI - SI = P(R/100)^2 = 8000 x (0.05)^2 = 8000 x 0.0025 = Rs 20.

## Previous Year Questions
**SBI Clerk 2023:** At what rate SI, Rs 2000 becomes Rs 2800 in 4 years?
SI = 800. 800 = 2000 x R x 4/100 -> R = 10% per annum.

**IBPS PO 2022:** CI on a sum at 20% for 3 years is Rs 728. Find sum.
728 = P[(1.2)^3 - 1] = P[1.728-1] = 0.728P -> P = Rs 1000.

## Revision Notes
```
SI = PRT/100  |  Amount = P + SI = P(1+RT/100)
CI: A = P(1+R/100)^T  |  CI = A - P

DIFFERENCE (2 years): CI - SI = P(R/100)^2
DIFFERENCE (3 years): CI - SI = P(R/100)^2(3 + R/100)

Half-yearly: A = P(1+R/200)^(2T)
Quarterly: A = P(1+R/400)^(4T)

RULE OF 72: Doubling time ≈ 72/R years

## Try It (2 Minutes)

₹5000 at 10% for 2 years — calculate SI and CI separately, year by year, without the formula shortcut. Year 1: both give ₹500 interest (10% of ₹5000) — identical so far. Year 2: SI still gives ₹500 (always 10% of the original ₹5000), but CI gives 10% of ₹5500 (last year's total) = ₹550. Confirm the gap (₹50) matches the CI-SI difference formula: P(R/100)² = 5000×(0.1)² = ₹50. Notice the two methods agree exactly in Year 1 and only diverge from Year 2 onward — that's the moment compounding actually starts.
```
