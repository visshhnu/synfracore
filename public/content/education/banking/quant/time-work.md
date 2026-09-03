# Time and Work

## Why This Chapter Matters
Time and Work appears in 2-3 banking Quant questions, often combined with wage-distribution or pipes-and-cisterns variants — all of which reduce to the same underlying "rate" concept.

**Analogy** — Think of "1-day work" like an hourly output rate, the same way you'd describe a factory's production rate. If A finishes a job in 10 days, A's rate is 1/10 of the job per day — combining two people's work is just adding their rates, the same way two machines running in parallel add their hourly output. Pipes and wages are the identical idea in different clothing: an inlet pipe's rate adds, an outlet pipe's rate subtracts, and wage share is distributed in proportion to each person's rate — because rate IS contribution.

## Core Concepts

### 1. Basic Concept
If A can do work in n days, A's 1-day work = 1/n.
If A's 1-day work = 1/n, A completes work in n days.

### 2. Combined Work
If A does 1/a and B does 1/b per day:
Together: 1/a + 1/b per day.
Together time = ab/(a+b) days.

### 3. LCM Method (Efficient)
Take LCM of all given days as total work units.
Calculate per-day work for each person.
Work together per day = sum of individual work rates.
Days = Total work / combined rate.

### 4. Pipes and Cisterns
Inlet pipe: fills tank (positive work).
Outlet pipe: drains tank (negative work).
If inlet fills in a hours: rate = 1/a per hour.
If outlet drains in b hours: rate = -1/b per hour.
Combined rate = 1/a - 1/b per hour.

### 5. Work and Wages
Wages distributed in ratio of work done.
If A does work in m days and B in n days, ratio of work = n:m (inverse!).

## Practice Problems

**Q1:** A takes 12 days, B takes 18 days. Together?
Together = 12x18/(12+18) = 216/30 = 7.2 days.

**LCM method:** LCM(12,18) = 36. A does 3 units/day, B does 2 units/day. Together: 5 units/day. Time = 36/5 = 7.2 days.

**Q2:** A and B together complete in 8 days. A alone in 12 days. B alone?
B's rate = 1/8 - 1/12 = 3/24 - 2/24 = 1/24. B alone = 24 days.

**Q3:** Pipe A fills in 6 hours, Pipe B empties in 10 hours. Both open, time to fill?
Net rate = 1/6 - 1/10 = 5/30 - 3/30 = 2/30 = 1/15 per hour. Time = 15 hours.

## Previous Year Questions
**SBI PO 2023:** A can do a work in 15 days, B in 20 days. They start together, but B leaves after 5 days. How many more days for A alone?
Together 5 days: 5(1/15+1/20) = 5(7/60) = 35/60 = 7/12 of work done.
Remaining = 5/12. A alone: (5/12)/(1/15) = (5/12)x15 = 75/12 = 6.25 days.

**IBPS 2022:** Wages for A, B, C for 6, 8, 12 days work respectively is Rs 3300. Find A's share.
Work ratio = 1/6 : 1/8 : 1/12 = 4:3:2 (multiply by LCM=24).
A's share = 4/(4+3+2) x 3300 = 4/9 x 3300 = Rs 1466.67.

## Revision Notes
```
1-day work = 1/n if total days = n
Combined rate = sum of individual rates
Combined time = 1/(sum of rates)

LCM METHOD (recommended):
1. LCM of all days = total work units
2. Individual rate = LCM/days for each person
3. Combined rate = sum of rates
4. Time = Total/Combined

WAGES: distribute in ratio of work rates = n:m (inverse of days)

PIPES:
Inlet: +1/a per hour
Outlet: -1/b per hour
Net: 1/a - 1/b per hour
```

## Try It (2 Minutes)

A and B can finish a job in 10 and 15 days respectively; they work together but B leaves after 3 days. Before using shortcuts, reason step by step: combined rate = 1/10+1/15 = 1/6 per day, so in 3 days together they complete 3×(1/6) = 1/2 of the job. Remaining work = 1/2, and now only A continues at 1/10 per day, so A needs 1/2 ÷ 1/10 = 5 more days. Total: 3+5 = 8 days — notice this whole problem is just rate-addition and rate-based division, nothing beyond what "1-day work" already gave you.
