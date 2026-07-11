# Cloud Architecture Patterns FAQ

**Q: Do I need to memorize all six core patterns before I can be useful in an architecture discussion?**
A: No — recognizing which problem class a situation belongs to (does this need distributed transaction handling? asymmetric read/write scaling? incremental legacy migration?) matters more than having all six memorized cold. Most real discussions only need 1-2 patterns to be actually relevant at a time; broad recognition beats deep memorization of patterns you won't use in a given conversation.

**Q: Are these patterns AWS-specific, or do they apply to Azure/GCP too?**
A: The patterns themselves (Multi-AZ, Hub-and-Spoke, Strangler Fig, CQRS, Saga, Serverless Event-Driven) are provider-agnostic concepts — this page's concrete examples happen to use AWS service names (Transit Gateway, Lambda, DynamoDB) because that's this site's Cloud academy's primary reference point, but Azure and GCP have direct equivalents for nearly every example (Azure Virtual WAN for Transit Gateway, Azure Functions for Lambda, and so on). Learning the pattern's mechanics transfers; the specific service name is a lookup problem once you're on a different provider.

**Q: Is CQRS only useful at large scale, or can a small project benefit from it too?**
A: It's most clearly justified at scale, but the deciding factor is genuine read/write asymmetry, not raw size — a small project with a very read-heavy, differently-shaped access pattern (a public content site with rare admin writes and heavy public reads, for example) can benefit from a lightweight version even at modest scale. The common mistake isn't "using CQRS too early," it's using it *without* an actual asymmetry driving the need — size alone isn't the right trigger in either direction.

**Q: How do I know if I actually need multi-region, or if Multi-AZ is enough?**
A: Multi-AZ covers the far more common failure mode (a single data center-scale event) at meaningfully lower cost and complexity than multi-region. Multi-region is justified by a specific, concrete requirement — regulatory data residency across geographies, a genuine global-latency requirement, or an explicit business continuity mandate that specifically can't tolerate a whole-region outage. If you can't name one of those specific drivers, Multi-AZ is very likely sufficient, and multi-region's added complexity (see Advanced's conflict-resolution and split-brain concerns) isn't yet worth taking on.

**Q: Isn't Saga just "distributed transactions," dressed up with a new name?**
A: It's actually the opposite — Saga exists because true distributed transactions (an atomic, all-or-nothing commit spanning multiple independent databases) generally aren't practical at microservices scale, so Saga replaces that guarantee with something weaker but achievable: a sequence of local transactions plus compensating transactions to undo completed steps on failure. It's a deliberate accommodation to a constraint (no real cross-service atomic transaction), not a renamed version of the thing it's working around.

**Q: What's the single most common architecture-pattern mistake you'd flag for someone learning this?**
A: Adopting a pattern for its resilience/scalability benefit without pricing in its real cost and complexity — CQRS "sounds better" than a single data model in the abstract, Multi-AZ Active-Active "sounds safer" than a single AZ, but both have genuine, non-trivial costs (see Intermediate/Notes) that aren't worth paying without the specific problem that justifies them. The patterns aren't wrong to use; using them by default, without an actual driving requirement, is the mistake.

**Q: Do these patterns actually come up in real interviews, or are they more theoretical?**
A: Very much real and commonly asked, especially for AWS/Azure/GCP architect-level certifications (see Certification) and mid-to-senior cloud/backend engineering interviews — "design a system that needs X uptime given Y constraints" style questions are standard, and they're specifically testing whether you can reason about pattern tradeoffs on the fly, not whether you've memorized a fixed list of pattern definitions.
