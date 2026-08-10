# Aerospace Careers & Exam Pathways — Intermediate

Fundamentals weighted STUDY TIME by exam marks. This page goes one step further: predicting an actual SCORE from an assumed accuracy rate, folding in the negative-marking penalty from Overview's ISRO example and Installation's break-even calculation into a single, reusable "effective scoring rate" — then applying it across all five of GATE AE's core sections at once.

**Analogy** — Study-time weighting (Fundamentals) tells you how to allocate your effort. Score prediction (this page) tells you what that effort is actually likely to produce, once negative marking has taken its cut — the difference between planning a budget and forecasting what you'll actually have left after taxes.

## From Accuracy to Effective Scoring Rate

```
If a candidate answers a FIXED accuracy rate of questions correctly
(say, 70% correct, 30% wrong, assuming every question in a section
is attempted), the negative marking (-1/3 for a wrong 1-mark
question, per Overview's marking scheme) discounts that raw accuracy
into an EFFECTIVE scoring rate:

  effective_rate = accuracy - (1 - accuracy)/3

This single number answers: "of the total marks available in a
section, what FRACTION does a candidate at this accuracy level
actually walk away with, after the negative-marking penalty is
applied to every wrong answer?"
```

### Annotated Example — Effective Rate at Three Accuracy Levels

```
Given:  accuracy levels of 50%, 70%, 80%

At 50% accuracy:
  effective_rate = 0.50 - (0.50)/3 = 0.50 - 0.1667 = 0.3333 (33.3%)

At 70% accuracy:
  effective_rate = 0.70 - (0.30)/3 = 0.70 - 0.10 = 0.60 (60%)

At 80% accuracy:
  effective_rate = 0.80 - (0.20)/3 = 0.80 - 0.0667 = 0.7333 (73.3%)

Verified computationally: notice the effective rate DROPS
disproportionately faster than accuracy at lower accuracy levels --
going from 80% to 50% accuracy (a 30-point drop) cuts the effective
rate from 73.3% to 33.3% (a 40-point drop) -- negative marking
punishes low accuracy harder than a simple percentage comparison
would suggest, which is exactly why guessing carelessly at low
confidence is so costly under this specific marking scheme.
```

## Predicting a Full Core-Section Score

Using Fundamentals' section weightage (Aerodynamics 22.5, Flight Mechanics 17, Structures 17.5, Propulsion 9, Space Dynamics 7 — the midpoint marks, summing to 73 of the 85 core marks) and a single assumed accuracy rate across all sections:

```
predicted_score = Σ (section_marks × effective_rate)
```

### Annotated Example — Predicting a Score at 70% Accuracy

```
Given:  effective_rate at 70% accuracy = 0.60 (from above)

  Aerodynamics:     22.5 × 0.60 = 13.5
  Flight Mechanics: 17.0 × 0.60 = 10.2
  Structures:       17.5 × 0.60 = 10.5
  Propulsion:        9.0 × 0.60 =  5.4
  Space Dynamics:    7.0 × 0.60 =  4.2

  Total predicted core score = 13.5+10.2+10.5+5.4+4.2 = 43.8 marks
  (out of the 73 core marks these five sections represent)

Verified computationally: at a uniform 70% accuracy across every
core section, a candidate would predict roughly 43.8 of the possible
73 core marks -- a genuinely useful planning number, since it
converts an abstract "I feel about 70% confident" self-assessment
into a concrete predicted mark total, which can then be compared
against a specific target (a PSU cutoff, an MTech admission
threshold) to see whether more preparation time is actually needed.
```

## Try It (2 Minutes)

Using the same five core sections, compute the predicted total core score at 55% accuracy instead of 70%.

1. Compute the effective rate at 55% accuracy.
2. Compute the predicted score for each section and the total.
3. Compare this total to the 70%-accuracy example's 43.8 — by roughly what factor did the total drop, and does that match the disproportionate-penalty pattern from the annotated effective-rate example?

You should land on: effective_rate at 55% = 0.55 - 0.45/3 = 0.55 - 0.15 = 0.40 (40%). Total predicted score = 73 × 0.40 = 29.2 marks — noticeably lower than 43.8, a drop of about 33%, even though accuracy itself only dropped from 70% to 55% (about 21%). This confirms the same disproportionate-penalty pattern from the annotated example: the gap between raw accuracy and effective scoring rate widens as accuracy drops, meaning a modest accuracy shortfall costs more in final score than it might intuitively seem to.

## Study Resources
- **GATE official syllabus PDF (current year's organizing institute)** — the authoritative source for exact current marking scheme details
- **Previous years' GATE AE question papers** — for calibrating a realistic personal accuracy estimate to plug into this model, rather than guessing a number
