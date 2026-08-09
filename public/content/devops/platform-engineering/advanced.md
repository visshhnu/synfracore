# Platform Engineering vs SRE vs DevOps — Advanced

Intermediate covered how a single platform team runs its own golden path day to day. Advanced covers what changes once an organization is large enough that "the platform team" becomes multiple teams, the build-vs-buy decision for IDP tooling itself becomes a real strategic call, and organizational anti-patterns emerge that only show up at that scale — distinct from the tactical failure patterns already covered in this guide's Troubleshooting section.

## Platform-of-Platforms — Scaling Beyond One Platform Team

A single platform team's golden path works while an org has, roughly, dozens of application teams. Past a certain scale (large enterprises, hundreds of teams), a single centralized platform team becomes its own bottleneck — every provisioning request, every new capability, funnels through one team's finite capacity. The pattern that emerges is a **platform-of-platforms**: a central "core" platform team owning the foundational layer (identity, base Kubernetes/cloud infrastructure, the Backstage portal itself), with domain-specific platform teams building on top of that foundation for their own area (a data-platform team, a mobile-platform team, an ML-platform team):

```
Core Platform Team
  — owns: identity/auth, base infra provisioning, Backstage portal itself,
    org-wide security/compliance defaults baked into every layer above
  |
  +-- Data Platform Team    — owns: data pipeline golden path, warehouse
  |                            provisioning, data-catalog integration
  +-- ML Platform Team      — owns: model training/serving golden path,
  |                            GPU scheduling, experiment tracking
  +-- Mobile Platform Team  — owns: mobile CI/CD golden path, app-store
                               release automation, crash-reporting setup
```

The critical design constraint that makes this work rather than fragmenting into inconsistent silos: every domain-specific platform team builds *on top of* the core platform's primitives (the same identity system, the same base provisioning APIs), rather than each reimplementing its own foundational layer — Team Topologies' "platform enables stream-aligned teams" principle applies recursively here, with the core platform team enabling the domain platform teams, who in turn enable the application teams.

## Build vs. Buy for IDP Tooling

Overview and Intermediate both assume Backstage as the IDP portal, but at the point of committing real platform-team headcount, build-vs-buy is a genuine strategic decision, not a foregone conclusion:

```
Build (self-hosted Backstage, customized):
+ Full control over plugins, UI, and integration depth
+ No per-seat licensing cost at scale
- Real, ongoing engineering cost to maintain the Backstage
  instance itself, separate from building golden paths on top of it
- Upgrade/migration burden falls entirely on the platform team

Buy (a managed IDP product, e.g. a commercial Backstage-as-a-service
or a purpose-built commercial IDP platform):
+ Platform team's engineering time goes toward golden paths and
  Compositions, not maintaining the portal software itself
+ Vendor handles portal upgrades, hosting, and baseline plugin support
- Per-seat or usage-based licensing cost, which can exceed self-hosting
  cost at large enough org size
- Less flexibility for deeply custom internal workflows the vendor's
  product wasn't designed around
```

The deciding factor in practice is usually whether the platform team's genuine differentiated value is the portal experience itself, or the golden paths and Compositions built on top of it — for most orgs, the actual competitive/organizational value is in the latter, which is the argument commonly made for buying the portal layer and investing engineering time in the parts that are actually org-specific.

## Platform-as-Ivory-Tower — A Distinct Anti-Pattern From Low Adoption

This guide's Troubleshooting section covers "golden path exists but adoption stays low" as a symptom with a root cause of the golden path being harder than the status quo. A related but distinct anti-pattern, visible mainly at larger scale, is the **ivory tower platform team**: a platform team that has genuine executive sponsorship and mandate, achieves *high* nominal adoption because teams are required to use it, but is organizationally isolated from the application teams it serves — no embedded feedback loop, no shared on-call exposure to the pain its own tooling causes, decisions made in isolation from the teams living with the consequences.

The symptom is subtler than low adoption: adoption numbers look healthy, but developer satisfaction stays flat or declines, and the platform team is perceived as an obstacle to route around rather than a genuine enabler — compliance without buy-in. The fix is structural, not tactical: rotate platform engineers through embedded stints on application teams (or vice versa), and make the platform team genuinely accountable to the same incident/on-call consequences its tooling choices create for consumers — an ivory-tower platform team that never feels the downstream pain of its own decisions has no organic pressure to notice when a mandated golden path has quietly become a burden rather than a help.

## Platform Team Funding Models at Scale

At platform-of-platforms scale, how a platform team's cost is funded becomes a real organizational-design question with direct behavioral consequences, not just a budgeting detail:

- **Centrally funded** (platform work is corporate overhead, free to consuming teams) — removes any friction to adoption, but also removes any price signal telling the platform team which capabilities are actually valuable versus merely available.
- **Chargeback / internal billing** (consuming teams pay for what they provision, e.g. per-database or per-environment cost attribution) — creates a genuine feedback signal on which capabilities are worth their operating cost, but reintroduces exactly the friction a self-service platform was built to remove if the billing/approval process itself becomes a new bottleneck.
- **Hybrid** (core foundational capabilities centrally funded and mandatory; optional/premium capabilities chargeback-funded) — the most common pattern at real scale, mirroring how the platform-of-platforms structure itself splits mandatory core infrastructure from optional domain-specific capabilities.

This connects directly to the DORA-metrics-regression failure mode in Troubleshooting: a chargeback model that adds approval friction to provisioning is a structurally different way of arriving at the same "standardized but slower" outcome that an overly rigid pipeline template produces — the root cause category (added process cost without proportional benefit) is the same even though the mechanism (billing approval vs. pipeline gates) is different.
