# Medical Coding Guidelines — Intermediate Application

Fundamentals taught the OGCR's grammar — combination codes and "Use additional code" notes. This page applies that literacy to the two places guideline misapplication most often becomes a compliance problem: Excludes1/Excludes2 conflicts, and sequencing decisions that involve more than one condition competing for the same slot. Both build directly toward Advanced's compliance/audit content — a coder who gets these wrong isn't just imprecise, they're producing exactly the documentation pattern RAC auditors are trained to flag.

**Analogy** — An Excludes note is like a guest list rule at a door. Excludes1 is a hard rule: "these two names can never both be on tonight's list — pick one." Excludes2 is a softer rule: "these are just two different people who happen to have similar names — one being on the list doesn't block the other." Treating an Excludes2 note like an Excludes1 note means turning away a guest who was allowed in; treating an Excludes1 note like an Excludes2 note means letting in a pair who should never be admitted together. Both are guideline violations, in opposite directions.

## Excludes1 — Pure Excludes, Worked Conflict Resolution

```
Excludes1 = "NOT CODED HERE" — the excluded code and the code above
the note describe conditions that cannot both be true for the same
patient at the same time. Report ONE, never both.

Worked example:
Documentation: patient has a documented history of Type 1 diabetes,
and today's note also says "type 2 diabetes" — likely a
documentation error, not two real diagnoses.

E10.-  Type 1 diabetes mellitus
E11.-  Type 2 diabetes mellitus
       ↑ Excludes1 relationship: type 1 and type 2 are, by
         definition, mutually exclusive forms of the same disease —
         a patient has one or the other, not both.

Resolution: this is NOT a coding decision to make silently. Query
the provider to clarify which type is actually documented before
assigning either code. Do not pick one arbitrarily, and do not code
both "to be safe" — that is the Excludes1 violation itself.
```

## Excludes2 — Not Included Here, Worked Conflict Resolution

```
Excludes2 = "NOT INCLUDED HERE" — the excluded condition is not part
of the condition above the note, but a patient CAN genuinely have
both at the same time. Both may be reported together when the
documentation supports it.

Worked example (needs verification — recheck the current-year
Excludes2 list under J44/J45 before relying on this exact pairing;
Excludes notes are revised annually):
J44   Chronic obstructive pulmonary disease (COPD)
J45   Asthma
      ↑ these are Excludes2-related — COPD and asthma are distinct
        diagnoses, and a patient can have a genuine history of COPD
        while also being separately treated for an asthma
        exacerbation. Where documentation specifically supports
        "asthma with COPD" as a single overlapping condition, a
        dedicated combination code may apply instead (Fundamentals'
        combination-code rule) — the Excludes2 relationship and a
        combination code are not the same mechanism, which is why
        this pairing needs a fresh check against the current-year
        Tabular List rather than being memorized once.

Resolution: unlike Excludes1, there is no query needed just because
both are documented — the guideline explicitly allows both. The
judgment call is whether the documentation describes two genuinely
separate conditions (code both) or one overlapping condition with
its own combination code (code the combination code instead).
```

## Multi-Condition Sequencing: Extending Overview's Pattern to a New Scenario

Overview worked through sepsis and obstetric sequencing. Here's the same skill applied to a condition Overview didn't cover directly — using the FY2026 HIV-sequencing change Overview already introduced:

```
Documentation: pregnant patient, second trimester, on antiretroviral
therapy, with no documentation of HIV-related illness or AIDS —
admitted for an unrelated reason (appendicitis).

Step 1 — apply Overview's HIV rule: no symptomatic HIV disease
         documented → Z21 (asymptomatic HIV infection status), NOT
         O98.7 (HIV complicating pregnancy, which requires
         documented symptomatic disease).
Step 2 — apply Overview's obstetric sequencing rule: Chapter 15
         (O00-O9A) codes take sequencing priority for a pregnant
         patient — but Z21 isn't a Chapter 15 code, so it doesn't
         trigger that priority rule on its own.
Step 3 — apply Overview's principal diagnosis rule: the reason for
         THIS admission is appendicitis, not HIV status or pregnancy
         itself.

Sequencing:
K35.80   Acute appendicitis (principal diagnosis — the actual
         reason for this admission, per Step 3; neither the HIV
         status nor the pregnancy itself triggers a rule that
         overrides this)
Z21      Asymptomatic HIV infection status (additional code)

This is the point of the multi-rule walkthrough: no single rule
above answered the question alone. Step 1 ruled out O98.7 in favor
of Z21. Step 2 checked whether the obstetric Chapter-15-priority
rule applied here and correctly concluded it doesn't, since Z21
isn't itself a Chapter 15 code — which is exactly why nothing here
outranks Step 3's principal-diagnosis rule. Step 3 then does the
actual work: appendicitis is principal, Z21 is additional, and no
third code is needed or supported by Overview's own stated HIV
rule. Getting this right required combining all three rules in
order, not stopping after the first one that seemed to apply — the
same way Overview's Case 3 sepsis example combined a
postprocedural-sepsis rule with a "code the organism additionally"
rule.
```

## Try It (2 Minutes)

A patient's chart documents both "chronic obstructive pulmonary disease" and, in a separate note from the same visit, "acute asthma exacerbation," clearly described as two distinct, ongoing conditions — not one overlapping diagnosis.

1. Is the J44/J45 relationship here an Excludes1 or an Excludes2 situation, based on the guest-list analogy above?
2. Given that, do you report one code or both?
3. Contrast this with the Type 1/Type 2 diabetes example — why would the same "both are documented" scenario be handled completely differently there?

You should land on: Excludes2 — both conditions are genuinely distinct and both documented, so both codes may be reported. This is the opposite handling from the diabetes Excludes1 case, where "both documented" is a signal to query the provider, not to code both. The guideline type — not just the fact that two conditions appear in the same note — is what decides whether "both documented" means "code both" or "go verify with the provider."

## Study Resources
- **AHA Coding Clinic for ICD-10-CM/PCS** — the authoritative source for resolving ambiguous Excludes1/Excludes2 conflicts not fully settled by the Tabular List alone
- **ICD-10-CM Official Guidelines, Section I.A.12 (Excludes Notes)** — the source definitions for Excludes1/Excludes2 referenced above
- **ICD-10-CM Official Guidelines, Section I.B.13 (Laterality)** — governs bilateral-condition sequencing when no combined bilateral code exists (e.g., pressure ulcers: no single bilateral code exists for most sites — assign separate right- and left-side codes, such as L89.61x for right heel and L89.62x for left heel, per the guideline's own rule for this exact situation)
