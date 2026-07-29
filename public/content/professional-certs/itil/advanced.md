# ITIL 4 Foundation — Advanced

## Key practices — the most frequently tested subset

Of ITIL 4's 34 practices (Overview/Fundamentals), a subset carries particular exam weight and practical importance:

- **Incident management:** restoring normal service operation as quickly as possible after an unplanned interruption, minimizing negative business impact — distinct from problem management (below) in its focus on speed of restoration over root-cause resolution.
- **Problem management:** identifying and managing the causes of incidents, aiming to prevent recurrence — the frequently tested distinction from incident management is that incident management prioritizes fast restoration (even via a workaround that doesn't address the underlying cause), while problem management specifically investigates and addresses root causes, which may take longer than any individual incident's restoration.
- **Change enablement:** ensuring risks are properly assessed and changes to services/infrastructure are authorized appropriately, maximizing the number of successful changes while managing associated risk.
- **Service desk:** the entry point and single point of contact for users, capturing demand for incident resolution and service requests.
- **Service level management:** setting clear, business-relevant targets for service performance (service level agreements) and ensuring actual delivery is measured against them.

## Incident management vs. problem management — the practical distinction, in depth

This is one of ITIL 4's most frequently tested conceptual distinctions, worth examining carefully: a server outage affecting users is an **incident** — the immediate priority is restoring service (potentially via a workaround, like restarting the server, without yet knowing why it failed). Investigating *why* the server failed, to prevent it from happening again, is **problem management** — this might reveal an underlying issue (a memory leak, a capacity limitation) requiring a longer-term fix. A single underlying problem can generate multiple incidents over time before its root cause is identified and addressed — recognizing this relationship (one problem, potentially many incidents) rather than treating incident and problem management as interchangeable is exactly what exam questions on this topic test.

## Change enablement — types of change

Change enablement (above) typically distinguishes between **standard changes** (pre-authorized, low-risk, well-understood changes following an established procedure — routine password resets or standard software patches, for instance), **normal changes** (changes requiring assessment and authorization through a defined change process, given their higher risk or novelty), and **emergency changes** (changes needing to be implemented as quickly as possible, typically to resolve or prevent a significant incident, following an expedited but still appropriately controlled authorization process). This categorization exists specifically to avoid applying the same heavy-weight authorization process to every change regardless of actual risk — directly reflecting the "keep it simple and practical" guiding principle (Fundamentals) applied to change management specifically.

## Practices in the context of the four dimensions and SVS, synthesized

The advanced-level synthesis: genuine ITIL 4 Foundation readiness requires moving fluidly between the SVS's abstract structure (guiding principles, service value chain, Fundamentals/Intermediate), the four dimensions shaping how practices are actually implemented (Intermediate), and the specific, familiar practices themselves (this file) — a well-constructed exam question might describe an incident-management scenario and test whether a candidate recognizes both the specific practice-level distinction (incident vs. problem management) and the underlying guiding principle at work (e.g., "progress iteratively with feedback" if the scenario involves incremental resolution steps), reflecting that these frameworks describe interconnected aspects of the same underlying service-management competence, not separate content silos requiring separate study.
