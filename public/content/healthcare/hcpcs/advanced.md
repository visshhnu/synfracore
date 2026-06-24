# HCPCS Advanced Topics

## DME Billing Deep Dive

```
DME COVERAGE CRITERIA (Medicare):
  1. Durable (able to withstand repeated use)
  2. Medical in nature
  3. Used in the home
  4. Useful life of 3+ years
  5. Medically necessary per physician order

RENTAL vs PURCHASE:
  Inexpensive/routinely purchased: purchase only
  Frequently serviced items: rental up to 15 months then convert
  Capped rental items: rental months 1-13, then monthly maintenance
    After month 13: patient owns, supplier provides maintenance

OXYGEN THERAPY BILLING:
  E1390: concentrator (monthly rental)
  E0424/E0425: compressed gas system (portable)
  E0432: portable liquid oxygen system
  Documentation: certificate of medical necessity (CMN) required
  Face-to-face encounter required before initial order

WHEELCHAIR BILLING:
  K0001: Standard manual wheelchair
  K0004: High-strength, lightweight wheelchair
  K0005: Ultralightweight wheelchair
  K0800-K0899: Power operated vehicles
  Complex rehab: manual K0001-K0009, power K0835-K0886
  ATP (Assistive Technology Professional) evaluation needed for complex
```

## Drug Billing (J Codes)

```
CALCULATING J CODE BILLING:
  Find drug name and route of administration
  Determine dose given in the clinical documentation
  Find corresponding J code for that drug
  Calculate units: dose given ÷ dose per code unit

  EXAMPLE: J0702 = Betamethasone 3mg injection
  Patient received 6mg
  Bill J0702 x 2 units

  WASTE: if drug drawn from multi-dose vial and remainder wasted
    Bill for drug used AND drug wasted (document waste in chart)
    Append modifier JW to wasted drug amount (separate line)

  NOT SELF-ADMINISTERED DRUGS:
    Must be administered by or under direct supervision of physician
    If patient could self-administer = not covered (not incident-to)
    Oral chemotherapy: exception, may be covered under Part D

CHEMOTHERAPY DRUGS (J9xxx):
  Always verify NDC (National Drug Code) for exact drug match
  Biosimilars: use Q codes or J code with modifier (JA, JB, JC)
  Infusion administration: bill separately with CPT 96365-96379
```

## Study Resources
- **CMS DME MAC websites** — supplier billing guides by jurisdiction
- **PDAC (Pricing, Data Analysis and Coding)** — DME coding verification
- **AAPC HCPCS Level II Expert Codebook** — annual updates
- **NHIC, Noridian, CGS, Palmetto** — your DME MAC based on state
