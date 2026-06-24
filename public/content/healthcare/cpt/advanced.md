# CPT Advanced Coding Topics

## Surgery Section Deep Dive

```
INTEGUMENTARY SYSTEM (10004-19499):
  Lesion removal:
    Shave: 11300-11313 (superficial, no full-thickness excision)
    Excision benign: 11400-11471 (by site and size including margins)
    Excision malignant: 11600-11646 (by site and size including margins)
    Size = lesion diameter + narrowest margin x2

  Wound repair:
    Simple: 12001-12021 (superficial, single layer)
    Intermediate: 12031-12057 (layered closure, contaminated wound)
    Complex: 13100-13160 (special techniques, retention sutures)
    Add lengths of same complexity, same anatomic grouping

  Skin grafts:
    Autograft: 15040-15261 (patient's own skin)
    Allograft: 15300-15321 (cadaver skin, temporary)
    Site preparation coded separately (15002-15005)

MUSCULOSKELETAL (20100-29999):
  Fracture care: closed vs open treatment
    Closed: no surgical exposure of fracture site
    Open: incision to visualize fracture
    Percutaneous: pins/screws inserted without direct visualization
  Application of cast/splint separately coded when not in global
  Arthroscopy vs open: arthroscopy higher RVU, separate code range

CARDIOVASCULAR (33010-37799):
  Cardiac catheterization: 93451-93572
    Left heart (33010) vs right heart vs combined
    Add-on codes for additional vessels
  Pacemaker: insertion vs replacement vs revision
    Single vs dual chamber affects code selection
    Generator only vs lead only vs complete system
  Coronary stenting: 92928-92944 (by vessel, by stent number)
```

## Modifiers Advanced Usage

```
MODIFIER 59 vs X MODIFIERS (NCCI):
  -59: Distinct procedural service (use when specific X modifier not available)
  -XE: Separate encounter
  -XS: Separate structure
  -XP: Separate practitioner
  -XU: Unusual, non-overlapping service
  CMS prefers X modifiers over -59 when applicable

MODIFIER 22 DOCUMENTATION:
  Must document why service was substantially more work
  Operative report should specify increased complexity
  Typically requires 20-30% additional work above norm
  Include documentation of: increased time, technical difficulty, extra risk

MODIFIER 51 EXEMPT CODES:
  Add-on codes: never append -51 (marked with + in CPT)
  Modifier 51 exempt: marked with circle/slash in CPT
  Radiology supervision codes: also modifier 51 exempt

TELEMEDICINE MODIFIERS:
  -95: Synchronous telemedicine (real-time audio/video)
  -GT: Via interactive audio and video (Medicare)
  GQ: Via asynchronous telecommunications (store-and-forward)
  Place of service 02 (telehealth) or 10 (patient home)
```

## Study Resources
- **AMA CPT Professional Edition** — required for exam, buy current year
- **CPT Assistant** (AMA publication) — official CPT coding guidance monthly
- **AAPC Practicode** — realistic coding scenarios with audit feedback
- **CMS NCCI Policy Manual** — free, explains bundling edits
