# Cloud Security — Key Takeaways

- **The shared responsibility model is the single most foundational concept** — misunderstanding where "provider secures this" ends and "you secure this" begins is a common, real source of misconfiguration, not a theoretical distinction.
- **IAM misconfiguration is the most common real root cause of cloud security incidents** — more time and depth here pays off more than in almost any other single area of this page.
- **Explicit Deny always wins in AWS's policy evaluation** — a specific, testable, non-negotiable detail worth knowing precisely, not approximately.
- **SSRF against cloud metadata services is a real, well-documented, historically consequential attack class** — IMDSv2's token requirement is a concrete, high-value defense worth verifying is actually enforced, not assumed.
- **Stateful vs. stateless is the core distinction between security groups and NACLs** — this explains a lot of "why doesn't this work" confusion when someone applies security-group intuition to NACL rules.
- **CSPM findings need a real triage framework, not equal urgency for everything** — without one, teams either panic-fix indiscriminately or, more commonly, get overwhelmed and start ignoring the tool.
- **Detection and prevention are both necessary, and neither is sufficient alone** — prevention can't anticipate every misconfiguration or novel attack; detection without fast response just means finding out about an incident, not being protected from one.
- **Credential compromise response has a specific correct order: revoke first, investigate scope second, remediate root cause third** — containing ongoing access takes priority over understanding the full picture.
- **Compliance should be continuously-verified infrastructure, not a periodic audit exercise** — a control that was correct at audit time and drifts afterward is a real, common gap that automated, continuous checks catch and manual periodic audits miss.
- **This is one of the more certification-relevant technologies on this site**, but certification study materials for cloud security go stale faster than most — verify currency against the certifying body's current exam guide, not an older study source.
