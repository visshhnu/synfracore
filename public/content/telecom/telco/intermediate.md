# Telecom Industry — Intermediate

## Interconnection and termination charges — how operators bill each other, not just customers

When a Jio subscriber calls an Airtel subscriber, Jio's network has to hand that call off to Airtel's network — and historically, the originating operator paid the terminating operator an **Interconnect Usage Charge (IUC)** per minute for completing that call on its network. This is a business-to-business revenue stream layered entirely underneath the customer-facing tariff, and it has been genuinely contentious in India: IUC rates were set to zero by TRAI in 2020 (moving to a "Bill and Keep" regime for most mobile-to-mobile calls), a policy shift smaller/regional operators argued disadvantaged them relative to operators with more balanced or dominant traffic flows. Understanding IUC/interconnection is the difference between seeing telecom as "operators competing for customers" and seeing the fuller picture — operators also constantly transact with each other, and regulatory changes to those inter-operator terms can reshape competitive dynamics independent of anything visible to subscribers.

## Mobile Number Portability — the mechanism, not just the outcome

Fundamentals covers MNP's competitive effect (easier churn, fiercer price competition). The mechanism itself matters at this level: a ported number doesn't physically move to the new operator's numbering block — instead, a central **Number Portability database**, managed by licensed clearinghouses, maps the ported number to its current serving operator, and every operator's network queries this database to correctly route calls/SMS to a number regardless of which operator currently serves it. This is architecturally similar to DNS resolving a domain name to whichever server currently hosts it — the number stays constant while the "answer" of who serves it can change, and every other network has to consult the same source of truth to route correctly.

## Spectrum trading, sharing, and leasing — the secondary market

Beyond the primary DoT auctions covered in Fundamentals, India permits operators to trade spectrum between each other, share spectrum jointly in the same band/circle, and lease unused spectrum — all subject to DoT approval. This secondary market exists because an operator's spectrum needs are rarely static: a merger (Vodafone-Idea) leaves the combined entity holding overlapping spectrum in some circles and gaps in others, and trading/sharing lets operators rebalance holdings without going through a fresh auction. Spectrum sharing in particular has become more relevant with 5G, since building out a full 5G network in every band, in every circle, independently is capital-intensive enough that shared infrastructure arrangements (including passive infrastructure sharing — towers, not just spectrum, covered further below) materially affect rollout economics.

## Passive vs. active infrastructure sharing

- **Passive sharing** — operators share physical, non-electronic infrastructure: towers, power, physical shelters. Common and largely uncontroversial — it reduces capital cost for all participants without giving competitors any access to each other's actual network traffic or spectrum.
- **Active sharing** — operators share electronic network elements (antennas, spectrum itself, RAN equipment) — more capital-efficient still, but commercially and regulatorily more sensitive, since it blurs the line between "competing networks" and "one shared network serving multiple brands."

Independent tower companies (Indus Towers being the most prominent in India, formed from a merger of operator-owned tower assets) exist specifically to monetize passive sharing at scale — an operator leases tower space from a neutral third party rather than every operator building redundant towers in the same locations, which is a large part of why passive infrastructure sharing is now closer to industry-standard practice than an edge case.

## OSS/BSS integration complexity — where telecom IT effort actually concentrates

Fundamentals introduces OSS and BSS as two systems that must integrate. At the intermediate level, the actual complexity is worth naming directly: these systems are frequently built by different vendors, on different release cycles, sometimes acquired through different mergers (an operator that has absorbed a competitor often runs that competitor's legacy OSS/BSS stack alongside its own for years before consolidation). A single customer-facing action — say, a plan upgrade — can require BSS to update billing and CRM records while simultaneously triggering an OSS-side provisioning change on the actual network element serving that customer, and keeping those two updates consistent (not just individually correct) is where a large share of real telecom IT and DevOps engineering effort goes, more than in operating either system in isolation. This is also, practically, why telecom job postings for "OSS/BSS integration engineer" or similar titles are common and distinct from either pure network engineering or pure software/billing-systems roles.

## 5G rollout economics — why coverage expands unevenly

Fundamentals' ARPU discussion explains operator pricing behavior; the same capital-discipline logic explains geographic rollout order. 5G's higher-frequency bands require substantially more cell sites per unit area than 4G to achieve equivalent coverage (a physics constraint, not a business choice — covered in more depth in the 4G/5G & Wireless technology). Combined with real capital constraints, this means operators rationally prioritize dense urban and high-ARPU markets first, where the same infrastructure investment reaches (and monetizes) the most subscribers fastest, and expand to rural/semi-urban areas only as capital allows — which is also the direct structural reason BSNL, as a government operator with slower capital access (introduced on Overview), has lagged private operators in 5G rollout speed specifically, not merely a general "public sector is slower" assumption.

## Getting started

1. Treat interconnection/IUC as a genuinely separate revenue and policy layer from customer tariffs — a regulatory change here (like the 2020 Bill-and-Keep shift) can matter as much to operator economics as a tariff war.
2. Learn to distinguish passive from active infrastructure sharing — one is largely uncontroversial industry practice, the other carries real regulatory and competitive sensitivity.
3. Connect 5G rollout order back to Fundamentals' ARPU/capital discussion — the "why urban-first" pattern isn't a separate topic, it's the same capital-discipline logic applied to network buildout instead of pricing.
