# ICD-10-CM Fundamentals

## What is ICD-10-CM?
International Classification of Diseases, 10th Revision, Clinical Modification.
Maintained by CMS and NCHS. Used for all outpatient, inpatient, and physician claims in the United States. Updated annually (effective October 1).

## Code Structure
```
E 11 . 6 2 1 A
│  │    │ │ │ └── 7th character (encounter type, laterality)
│  │    │ │ └──── 6th character (detail)
│  │    │ └────── 5th character (specificity)
│  │    └──────── 4th character (manifestation/complication)
│  └───────────── 2nd-3rd: category detail (numeric)
└──────────────── 1st character: letter (body system/chapter)
```
- Always 3-7 characters
- First character: letter (A-Z, except U)
- Decimal after 3rd character
- X used as placeholder when 7th character needed but fewer than 6 characters

## Chapter Organization
| Range | Chapter Content |
|-------|----------------|
| A00-B99 | Infectious and parasitic diseases |
| C00-D49 | Neoplasms |
| D50-D89 | Blood and immune disorders |
| E00-E89 | Endocrine, nutritional, metabolic |
| F01-F99 | Mental and behavioral disorders |
| G00-G99 | Nervous system |
| H00-H59 | Eye and adnexa |
| H60-H95 | Ear and mastoid |
| I00-I99 | Circulatory system |
| J00-J99 | Respiratory system |
| K00-K95 | Digestive system |
| L00-L99 | Skin and subcutaneous tissue |
| M00-M99 | Musculoskeletal system |
| N00-N99 | Genitourinary system |
| O00-O9A | Pregnancy, childbirth |
| P00-P96 | Perinatal conditions |
| Q00-Q99 | Congenital malformations |
| R00-R99 | Symptoms, signs, abnormal findings |
| S00-T88 | Injury, poisoning, external causes |
| V00-Y99 | External causes |
| Z00-Z99 | Factors influencing health status |

## Essential Conventions

### Placeholder X
Used when code is fewer than 6 characters but needs 7th character.
T40.1X1A = Poisoning by heroin, accidental, initial encounter
(X is in position 5-6 so A can occupy position 7)

### 7th Characters for Injury Codes
- A: Initial encounter (active treatment)
- D: Subsequent encounter (routine healing)
- S: Sequela (late effect/complication)
- Additional 7th characters for fractures: G (delayed healing), K (nonunion), P (malunion)

### Combination Codes
Single code classifying: two diagnoses, a diagnosis with complication, or a diagnosis with associated symptom.
Example: E11.22 = Type 2 DM with diabetic chronic kidney disease (covers both conditions).

## Code Selection Process
1. Identify main term from documentation
2. Look up in Alphabetic Index → note tentative code
3. Verify in Tabular List → read all notes, conventions, Excludes
4. Select the most specific code supported by documentation
5. Apply sequencing rules based on setting
