# Credit Analysis — Fundamentals

## DSCR: working through the calculation and why the threshold matters

```
DSCR = Cash Flow Available for Debt Service ÷ Total Debt Service
       (principal + interest due in the period)

Worked example:
  A business generates ₹50 lakh in annual operating cash flow
  (after adjusting for necessary capital expenditure — a real
  detail worth getting right, covered below)
  Annual loan obligations (principal + interest): ₹40 lakh

  DSCR = 50 / 40 = 1.25

Interpretation: for every ₹1 of debt obligation, the business
  generates ₹1.25 of available cash flow — a 25% cushion above
  exactly breaking even on debt service
```
The Overview tab's flag that "DSCR below 1.0 is a red flag" is worth understanding precisely: DSCR below 1.0 means the business's operating cash flow alone doesn't cover its debt obligations, meaning it would need to draw on cash reserves, raise new financing, or sell assets just to make scheduled payments — this is a genuinely different, more severe situation than merely "tight" cash flow, since it means debt service isn't self-sustaining from operations at all. Most lenders set a minimum acceptable DSCR meaningfully above 1.0 (often 1.2-1.5x depending on the lender's risk appetite and the loan type) specifically to maintain a margin of safety against a business's actual cash flow coming in below projections.

## The capital expenditure adjustment: a genuine, common calculation trap

```
A business's reported "operating cash flow" from the cash flow
  statement doesn't automatically equal cash genuinely
  AVAILABLE for debt service — necessary, ongoing capital
  expenditure (maintaining existing equipment/facilities, not
  growth capex) has to be funded from that same cash flow
  before anything is genuinely available for debt repayment

Adjusted formula, more precisely:
  Cash Available for Debt Service = Operating Cash Flow −
    Necessary Maintenance Capex (NOT growth/expansion capex,
    which is a separate, discretionary decision)
```
A common analytical error: using raw operating cash flow directly in the DSCR calculation without this maintenance-capex adjustment, which can overstate a borrower's genuine debt-service capacity — a manufacturing business with aging equipment requiring significant ongoing maintenance investment has meaningfully less cash genuinely available for debt service than its raw operating cash flow figure alone would suggest, and a credit analyst who misses this adjustment risks approving a loan the borrower's true cash-generation capacity doesn't actually support.

## Applying the 5 Cs to a real lending scenario, together

```
Scenario: A small manufacturing business applies for a working
  capital loan.

Character: CIBIL score of 720 (reasonably good, not
  exceptional), no defaults in credit history, but a recent
  late payment on a supplier account — worth investigating why

Capacity: DSCR of 1.3 (adequate, per the calculation above),
  but revenue has been flat for two years — worth understanding
  whether that reflects a mature, stable business or early
  signs of stagnation

Capital: Owner has invested 30% of the business's total capital
  personally — meaningful "skin in the game," a positive signal

Collateral: Loan is secured against inventory and receivables
  (relatively liquid collateral, though inventory valuation
  needs genuine scrutiny — see Intermediate tab)

Conditions: The specific manufacturing sub-sector is
  experiencing input cost pressure industry-wide — a genuine
  external risk factor worth factoring into the decision
  regardless of this specific borrower's individual strength
```
The genuine skill the 5 Cs framework is teaching isn't memorizing five categories — it's recognizing that a real credit decision requires weighing ALL FIVE together, since a borrower can be strong on some Cs and weaker on others, and the lending decision (approve, decline, or approve with specific conditions/covenants) depends on the overall combined picture, not any single C in isolation. A borrower with excellent Character and Capital but genuinely weak Capacity given industry Conditions headwinds is a different, more nuanced case than one weak across all five — and correctly synthesizing this combined picture, not just checking each box independently, is the actual analytical skill.

## Reading the three financial statements as a connected story, not separately

```
The Overview tab's three-statement framework works best when
  read as ONE connected narrative, not three independent checks:

Income statement shows revenue growing 15% year-over-year —
  looks positive in isolation

Balance sheet shows accounts receivable growing 40% over the
  same period — a genuine warning sign when read alongside the
  income statement: is this "real" revenue growth, or growth
  driven by increasingly generous payment terms to customers
  that may not actually convert to cash?

Cash flow statement confirms the concern: operating cash flow
  is DECLINING despite revenue growth, because that revenue
  growth is sitting in receivables, not converting to cash
```
This connected reading — checking whether growth reflected in the income statement is actually confirmed by cash flow, not just assumed to be — is a specific, practical skill worth building deliberately: a credit analyst who reviews each statement independently, without cross-referencing them against each other, would likely miss this exact pattern (revenue growth that isn't genuine cash-generating growth), which is precisely the kind of red flag the three-statement analysis is specifically designed to surface when the statements are read together as one story rather than three separate checklists.
