# ICD-10-CM — International Classification of Diseases

ICD-10-CM is the diagnosis coding system used in the United States for medical billing, statistical reporting, and clinical documentation. Every patient encounter requires accurate ICD-10-CM codes to process insurance claims and track health data.

## What is ICD-10-CM?

**ICD-10-CM** = International Classification of Diseases, 10th Revision, Clinical Modification

- Maintained by the **CDC** (Centers for Disease Control and Prevention)
- Updated annually (October 1st each year)
- Used by physicians, hospitals, outpatient facilities, home health agencies
- Required for all HIPAA-covered transactions

ICD-10-CM replaced ICD-9-CM on **October 1, 2015**. It provides far more specificity — over 70,000 codes vs. 14,000 in ICD-9.

## Code Structure

```
Format: [Letter][Number][Number].[Up to 4 characters]

A00.0
│  │ └── Subdivision (specificity)
│  └──── Second character
└──────── Category letter (A00–Z99)

Examples:
E11.9    Type 2 diabetes mellitus without complications
J18.9    Pneumonia, unspecified organism
M54.5    Low back pain
Z23      Encounter for immunization
S52.501A Unspecified fracture of lower end of right radius, initial encounter
         └──────────────────────────────────────────────┘└──┘
                         Site and nature                  7th character (encounter type)
```

## Code Categories

| Range | Description |
|-------|-------------|
| A00–B99 | Certain infectious and parasitic diseases |
| C00–D49 | Neoplasms |
| D50–D89 | Blood and blood-forming organ diseases |
| E00–E89 | Endocrine, nutritional, metabolic diseases |
| F01–F99 | Mental, behavioral, neurodevelopmental disorders |
| G00–G99 | Nervous system diseases |
| H00–H59 | Eye and adnexa diseases |
| I00–I99 | Circulatory system diseases |
| J00–J99 | Respiratory system diseases |
| K00–K95 | Digestive system diseases |
| M00–M99 | Musculoskeletal and connective tissue diseases |
| N00–N99 | Genitourinary system diseases |
| O00–O9A | Pregnancy, childbirth, puerperium |
| S00–T88 | Injury, poisoning, external causes |
| Z00–Z99 | Factors influencing health status (Z codes) |

## The 7th Character

Many code categories require a 7th character to indicate the episode of care:

| Character | Meaning | Used For |
|-----------|---------|----------|
| **A** | Initial encounter | Active treatment |
| **D** | Subsequent encounter | Healing, follow-up |
| **S** | Sequela | Late effects |

Fracture codes add more:
- **G** = Subsequent encounter for fracture with delayed healing
- **K** = Subsequent encounter for fracture with nonunion
- **P** = Subsequent encounter for fracture with malunion

## Key Conventions

**Principal Diagnosis** — The condition established after study to be chiefly responsible for the hospital admission.

**Additional Diagnoses** — Conditions that affect patient management (require monitoring, treatment, or increase length of stay).

**Excludes Notes:**
- **Excludes1** — Codes cannot be used together (mutually exclusive)
- **Excludes2** — Code not included here but may be coded additionally

**"Code also"** — Both codes should be assigned when applicable.

**"Use additional code"** — Additional code required to fully describe the condition.
