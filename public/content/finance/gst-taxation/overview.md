# GST & Indirect Tax — Overview

**Before you start:** [Financial Accounting](/academies/finance/accounting-basics/overview) basics (bookkeeping records) are assumed — GST compliance is built directly on top of them.

## What this technology covers

GST & Indirect Tax covers India's Goods and Services Tax framework: how GST replaced the earlier multi-layered indirect tax system, GSTR return filing, Input Tax Credit (ITC — the mechanism preventing tax-on-tax across a supply chain), the composition scheme (a simplified compliance option for small businesses), and place-of-supply rules (determining which state's GST applies to a given transaction). This technology assumes Financial Accounting's basic bookkeeping concepts as background, since GST compliance is built directly on top of a business's accounting records.

## Why This Exists (The Hook)

GST is India's primary indirect tax, applying to nearly all goods and services transactions, making GST compliance a near-universal requirement for businesses of any meaningful size operating in India. Beyond compliance necessity, understanding GST's structural logic — particularly how Input Tax Credit prevents cascading taxation — explains *why* GST replaced the pre-2017 indirect tax system, which suffered from exactly this cascading problem (tax charged on top of previously-taxed value at each stage of a supply chain).

**Analogy** — Think of Input Tax Credit like a relay race baton, not a tollbooth that charges every runner separately. A tollbooth-style system (the pre-GST system) charges full tax at every single stage regardless of tax already paid earlier — a manufacturer, then a wholesaler, then a retailer each get taxed on the FULL value, stacking tax on top of already-taxed value. ITC works like passing a baton: each business in the supply chain gets credit for tax already paid by the business before them, so only the value THEY actually added gets newly taxed — the tax "baton" passes along the chain instead of restarting from zero at every stage.

**Try it (2 minutes)** — Reason through why place-of-supply rules matter specifically for splitting GST into CGST/SGST versus IGST, without looking anything up: CGST+SGST apply to intra-state transactions (both go to the center and the same state respectively), while IGST applies to inter-state transactions (collected once, then apportioned between the center and the destination state). If a business in Karnataka sells to a customer in Tamil Nadu, and GST needs to correctly credit Tamil Nadu (the destination state) rather than Karnataka, why would the transaction need to be classified by "which state is this supply happening for" (place of supply) before the system can even determine whether to apply CGST+SGST or IGST in the first place?

## GST structure — a quick map

```conceptgrid
{
  "boxes": [
    { "title": "CGST", "description": "Central GST -- intra-state transactions, collected by the center", "color": "blue" },
    { "title": "SGST", "description": "State GST -- intra-state transactions, collected by the state", "color": "purple" },
    { "title": "IGST", "description": "Integrated GST -- inter-state, apportioned between center and destination", "color": "amber" },
    { "title": "ITC", "description": "Input Tax Credit -- offsets GST owed with GST already paid on purchases", "color": "green" }
  ]
}
```

| Component | What it is |
|---|---|
| CGST | Central GST — collected by the central government on intra-state transactions |
| SGST | State GST — collected by the state government on intra-state transactions |
| IGST | Integrated GST — collected on inter-state transactions, apportioned between center and destination state |
| GSTR | GST Return — periodic filing reporting a business's GST transactions |
| ITC | Input Tax Credit — credit for GST already paid on business purchases, offsettable against GST owed on sales |

`(needs verification — recheck against current source: GST slab rates, thresholds, and specific compliance requirements are revised periodically by the GST Council.)`

## Why GST replaced the pre-2017 system — the cascading tax problem

Before GST (implemented in July 2017), India's indirect tax system involved multiple separate taxes (excise duty, service tax, VAT, and others) at different stages of a supply chain, often without a mechanism to credit tax already paid at an earlier stage — meaning tax could effectively be charged on top of previously-taxed value, a problem called **cascading taxation** ("tax on tax"). GST's core structural innovation is the Input Tax Credit mechanism (Fundamentals), which allows a business to credit GST already paid on its purchases against GST owed on its sales, taxing only the value actually added at each stage — directly solving the cascading problem the pre-GST system suffered from.

## Exam and career relevance

GST & Indirect Tax is core syllabus for CA/CS/CMA coursework, and directly relevant to any accounting, tax-compliance, or finance role at a business of meaningful size operating in India, given GST's near-universal applicability.

## How to use this technology's sections

Fundamentals covers GST's basic structure (CGST/SGST/IGST) and the Input Tax Credit mechanism. Intermediate applies these to GSTR return filing and the composition scheme. Advanced covers place-of-supply rules and more complex compliance scenarios. Interview and Cheatsheets provide exam-format practice and quick reference.
