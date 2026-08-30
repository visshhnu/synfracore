# Telecom Industry — Fundamentals

## Licensed spectrum and why operators pay billions for it

A telecom operator cannot simply start transmitting on any radio frequency it likes — spectrum is a scarce public resource allocated by government auction, and in India the Department of Telecommunications (DoT) conducts these auctions directly. This single fact explains a huge share of industry economics that otherwise looks strange from the outside: why operator balance sheets carry enormous spectrum-acquisition debt, why a new entrant can't simply "start a telecom company" the way a startup enters most other industries, and why market consolidation (Vodafone + Idea merging into Vi, multiple smaller operators exiting the market over the last decade) has been so common — spectrum cost and license obligations create a capital barrier that pushes weaker players toward merger or exit rather than indefinite competition.

## Circle-based licensing — India's specific structure

Unlike many countries where a national operator license is the norm, India's telecom licensing is organized around 22 **telecom circles** (roughly state/regional boundaries, e.g. Delhi, Mumbai, Karnataka, Rest of Tamil Nadu). An operator typically bids for and holds spectrum circle-by-circle, not as one blanket national grant — meaning an operator's actual coverage and competitive strength can vary meaningfully by region even under one national brand. This circle structure is also why regulatory and revenue data (subscriber counts, market share) is frequently reported circle-wise rather than only at the national level — a detail worth knowing before interpreting any TRAI report.

## Who regulates what — TRAI vs. DoT

- **DoT (Department of Telecommunications)** — part of the central government; issues licenses, conducts spectrum auctions, sets policy
- **TRAI (Telecom Regulatory Authority of India)** — the independent regulator; sets tariff rules, quality-of-service benchmarks, and issues recommendations DoT often (but not always) adopts

The distinction matters practically: a tariff-plan complaint or call-quality issue falls under TRAI's remit, while a spectrum-allocation or new-license dispute falls under DoT's. Confusing the two is a common beginner mistake when reading telecom news or exam material covering this industry.

## Prepaid vs. postpaid — why the split shapes operator strategy

India's telecom market is overwhelmingly prepaid (the large majority of subscribers), which is a meaningfully different business than postpaid-dominant markets like the US:

| | Prepaid | Postpaid |
|---|---|---|
| Payment timing | Before use (recharge) | After use (monthly bill) |
| Typical customer | Price-sensitive mass market | Higher-ARPU, enterprise/premium |
| Operator risk | Near-zero credit risk | Requires credit checks, collections |
| Revenue predictability | Lower (churn is easy — no contract) | Higher (billing cycle, often contract-bound) |

Because switching prepaid operators requires little more than swapping a SIM (accelerated further by Mobile Number Portability, which lets a subscriber keep their number across operators), prepaid-dominant markets like India see much fiercer price competition and churn than postpaid-dominant markets — this is a direct structural reason Indian data pricing has historically been among the cheapest in the world.

## ARPU — the metric that drives almost every operator decision

**ARPU (Average Revenue Per User)** — total revenue divided by subscriber count over a period — is the single most-watched metric in telecom because subscriber count alone is a misleading success measure: an operator can have the most subscribers and still be unprofitable if ARPU is too low to cover network costs. This is exactly the tension Reliance Jio's 2016 entry created industrywide — Jio's aggressive low-price data strategy grew subscriber count explosively while pulling the entire market's ARPU down, forcing competitors (and eventually Jio itself) into a multi-year cycle of tariff hikes once the initial subscriber land-grab phase ended. Reading any operator's quarterly results, ARPU trend is usually a more informative number than subscriber count alone.

## OSS/BSS — the operational split, at the fundamentals level

Every operator's IT and operations estate splits into two halves with genuinely different jobs, introduced on this technology's Overview page and worth restating precisely at this level:

- **BSS (Business Support Systems)** — customer-facing: billing, CRM, order/service provisioning, product catalogue. This is the system that activates your SIM, generates your bill, and handles your support ticket.
- **OSS (Operations Support Systems)** — network-facing: fault management (what's broken), performance management (how well is it running), inventory (what equipment exists where), provisioning at the network level (activating a new cell site or service on the physical network, distinct from BSS's customer-facing provisioning).

The two must integrate constantly — a customer's dropped-call complaint (BSS) can only be properly resolved by checking whether there's an actual confirmed network fault at their location (OSS) — and this OSS↔BSS correlation work is a significant share of what telecom IT/operations teams actually do day to day.

## Getting started

1. Anchor everything else in ARPU and spectrum cost — nearly every operator strategic decision (pricing, market consolidation, capital investment pace) traces back to these two pressures.
2. Learn India's circle-based licensing structure before trying to interpret any market-share or coverage statistic — national-level numbers can hide big circle-by-circle variation.
3. Keep the OSS/BSS split clear before moving to Intermediate, where the architecture and integration challenges inside each side get covered in more depth.
