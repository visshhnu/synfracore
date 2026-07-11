# Cloud Security — Troubleshooting

## GuardDuty/Security Hub findings, but no idea which are actually urgent

This isn't a tooling problem — it's a missing triage framework (see Intermediate). Before treating every finding as equally urgent (leading to alert fatigue and eventually ignoring the tool) or panicking over all of them at once, classify by internet-facing exposure and data/privilege sensitivity first, and build a defined SLA per category. If findings volume is genuinely unmanageable even after triage, that's usually a signal of a broader misconfiguration pattern worth fixing at the root (a permissive baseline security group applied broadly, for example) rather than remediating hundreds of individual instances of the same underlying issue one at a time.

## An IAM policy that should work is denying access

Check for an explicit Deny anywhere in the policy chain first — organization-level Service Control Policies (SCPs), permission boundaries, and the role's own policies all get evaluated together, and an explicit Deny in *any* of them wins regardless of Allow statements elsewhere (see Fundamentals). A common real cause: an SCP applied at the AWS Organizations level for a broader security guardrail unintentionally blocks a specific role's legitimate access that wasn't accounted for when the SCP was written.

## Security group changes aren't taking effect

Check whether the resource is actually using the security group you just modified — a common real mistake is editing the wrong security group (an EC2 instance can have multiple attached, and only editing one) or editing a security group that's defined but not actually attached to the resource in question. Also verify you're not being blocked by a NACL at the subnet level (see Fundamentals) — a security group correctly allowing traffic doesn't help if a NACL at the subnet level is blocking it first, since both are evaluated and both need to allow the traffic.

## CloudTrail logs show unclear or incomplete activity for an investigation

Check whether CloudTrail is actually enabled in the specific region where the activity occurred — logging enabled only in your primary/default region is a common real gap (see Intermediate), and an attacker (or a misconfigured process) operating in an unmonitored region simply won't appear in your logs at all, which can look like "nothing happened" rather than "we weren't watching."

## A vulnerability scanner (Inspector or similar) reports findings that seem to not apply

Verify the scan actually covers the resource type and configuration you expect — vulnerability scanners often have specific coverage requirements (an agent that needs to be installed and running, specific resource tagging for the scanner to include a resource in scope) and a resource that's silently excluded from scanning (missing the agent, untagged) will show as having no findings, which is easy to misread as "clean" rather than "not actually scanned."

## Compliance framework mapping shows gaps that don't match your actual controls

Before assuming your controls are genuinely missing, verify the compliance tool's mapping logic actually recognizes how you've implemented a given control — a control satisfied via a non-default mechanism (a third-party secrets vault instead of the cloud provider's native one, for example) can show as "not implemented" in an automated compliance tool that only recognizes the default/expected implementation path, even though the underlying requirement is genuinely met. This needs a manual review to confirm before treating the tool's gap report as ground truth.
