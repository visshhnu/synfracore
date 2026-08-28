# Patient Documentation & Clinical Documentation Improvement

**Analogy** — Documentation is the raw material a coder works with, the way ingredients are the raw material a recipe depends on. A coder can't produce an accurate code from vague documentation any more than a chef can produce a good dish from vague ingredients ("some meat, some spice"). CDI is the process of asking the "chef" (the physician) to specify exactly what's actually there — before cooking (coding) starts, not after the dish is already served (the claim is already submitted).

## What Is CDI?
Clinical Documentation Improvement (CDI) is the process of ensuring that a patient's medical record accurately and completely reflects the true clinical picture. Accurate documentation directly affects coding accuracy, quality metrics, reimbursement, and regulatory compliance.

## Why Documentation Quality Matters
- **Reimbursement**: Under DRG, APC, and PDGM systems, payment is driven by diagnosis and procedure codes — which come from documentation
- **Quality metrics**: CMS quality scores, readmission rates, mortality indices all use coded data from documentation
- **Legal**: The medical record is a legal document — gaps create liability
- **Continuity of care**: Incomplete records harm future clinical decision-making

## Common Documentation Deficiencies

```conceptgrid
{
  "boxes": [
    { "title": "Unspecified Diagnoses", "description": "\"Anemia\" instead of \"Iron-deficiency anemia\" -- lower specificity, missed CC/MCC", "color": "blue" },
    { "title": "Missing Linkage", "description": "HTN documented but not linked to CKD -- misses I13.x combination code", "color": "purple" },
    { "title": "No Severity", "description": "\"Sepsis\" without organ dysfunction -- misses severe sepsis/septic shock", "color": "red" },
    { "title": "Missing POA", "description": "Present-on-admission indicator blank -- quality metric errors", "color": "amber" }
  ]
}
```

| Deficiency | Example | Impact |
|-----------|---------|--------|
| Unspecified diagnoses | "Anemia" instead of "Iron-deficiency anemia" | Lower specificity, missed CC/MCC |
| Missing linkage | HTN documented but not linked to CKD | Misses I13.x combination code |
| No severity | "Sepsis" without organ dysfunction | Misses severe sepsis/septic shock |
| Missing POA | Present-on-admission indicator blank | Quality metric errors |
| Unsigned entries | Verbal orders not countersigned | Compliance violation |

## The CDI Workflow

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Concurrent Review", "sublabel": "CDI specialist reviews chart during admission", "color": "blue" },
    { "label": "Query Generation", "sublabel": "Sends clarification queries to physicians", "color": "purple" },
    { "label": "Query Response", "sublabel": "Physician responds with specific documentation", "color": "amber" },
    { "label": "Final Coding", "sublabel": "Coder assigns codes based on improved documentation", "color": "green" },
    { "label": "Quality Audit", "sublabel": "Random review of coded charts for accuracy", "color": "slate" }
  ]
}
```

1. Concurrent review — CDI specialist reviews chart during admission
2. Query generation — sends clarification queries to physicians
3. Query response — physician responds with specific documentation
4. Final coding — coder assigns codes based on improved documentation
5. Quality audit — random review of coded charts for accuracy

## SOAP Notes Structure
**S**ubjective (patient-reported), **O**bjective (vitals, exam findings), **A**ssessment (diagnoses), **P**lan (treatment, follow-up).

## Who This Is For
Medical coders, CDI specialists, HIM professionals, clinical staff learning documentation standards, and compliance officers.

## How to Study This Section
1. **Fundamentals** — what makes documentation codeable, the query process, and coding-relevant medical terminology
2. **Intermediate/Advanced** — applying CDI judgment to varied real documentation scenarios
3. **Interview Q&A** — practice articulating why a documentation gap matters and how you'd query it
4. **Certification Guide** — CDI-specific credentials (CDIP, CCDS), not just base coding certifications
5. **Cheatsheet** — quick reference for common deficiency patterns and compliant vs. leading query language

## Try It (2 Minutes)

Using the Common Documentation Deficiencies table above:

1. A chart says "anemia" with no further detail. Which deficiency type is this, and what's the coding impact?
2. A chart documents both hypertension and chronic kidney disease, but never states one caused the other. Which deficiency type, and what code gets missed as a result?
3. For both, would a compliant query be appropriate — and per the CDI Workflow above, who typically sends it?

You should land on: (1) unspecified diagnosis — lower specificity, missed CC/MCC; (2) missing linkage — misses the I13.x hypertensive-CKD combination code; and yes, both are legitimate query scenarios, sent by a CDI specialist or coder during concurrent review, not decided unilaterally by guessing the intended meaning.
