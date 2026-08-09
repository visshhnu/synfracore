# Splunk — Certification

## The certification track

Splunk's certifications run as a genuine progression rather than independent badges — each level assumes the previous one's knowledge, and the track branches into an admin path and a security-specific path once past the entry level:

| Certification | Level | Focus |
|---|---|---|
| Splunk Core Certified User | Entry | Basic navigation, running searches, understanding results — Splunk Enterprise and Splunk Cloud basics |
| Splunk Core Certified Power User | Entry/Foundational | Core SPL — `stats`, `eval`, `rex`, lookups, building reports and dashboards |
| Splunk Core Certified Advanced Power User | Intermediate | Deeper SPL, data models, advanced search optimization |
| Splunk Enterprise Certified Admin (SPLK-1003) | Intermediate/Advanced | Installing, configuring, and managing a Splunk Enterprise deployment — forwarders, indexers, clustering |
| Splunk Cloud Certified Admin | Intermediate/Advanced | The Splunk Cloud Platform equivalent of the Enterprise Admin track |
| Splunk Core Certified Consultant | Advanced | Requires one of Power User/Advanced Power User/Enterprise Admin/Enterprise Architect as a prerequisite |

**Splunk Enterprise Security Certified Admin (ES Admin, SPLK-3001)** is the SIEM-specific certification — validating the ability to deploy, configure, and manage Splunk Enterprise Security specifically (correlation searches, the Common Information Model, Risk-Based Alerting, Notable Event workflow), the exact concepts covered in this guide's Advanced tab. As of current information, **this is officially a legacy certification** — Splunk has stated its exam content will no longer be actively maintained or updated to reflect newer product releases, which is worth knowing before investing study time specifically in it rather than a currently-maintained credential; `(needs verification — recheck against current source: confirm current status directly on Splunk's certification page before relying on this, since certification lifecycle status can change)`.

`(needs verification — recheck against current source: exact exam pricing, question counts, and passing-score thresholds change and vary by region/promotion — do not rely on specific figures without confirming against Splunk's current official certification page and Pearson VUE listing.)` Directionally: entry-level exams are typically a single sitting under two hours with somewhere in the range of 60-70 multiple-choice-style questions, administered through Pearson VUE, at a per-exam cost that has historically been in the low hundreds of dollars for entry-level exams — Splunk has also run substantial event-specific discounts (at its annual `.conf` conference, for instance), so the same exam's real cost can vary a great deal depending on when and how it's booked.

## Core Certified User — what it actually tests

The entry-level exam is scoped to using Splunk, not administering it — a user can pass this without ever touching a `props.conf` file or configuring a forwarder:

```spl
` Core User-level skills: basic search syntax, time range selection,
  and reading results — not yet building complex pipelines `
index=web_logs status=200 earliest=-24h

` Understanding the search UI's own output — result count, fields
  sidebar, basic visualizations — is as much a tested skill as SPL itself `
```

## Core Certified Power User — SPL depth

This is where the exam starts testing the actual SPL commands covered in this guide's Fundamentals and Intermediate tabs directly — `stats`, `eval`, `rex`, lookups, and building/scheduling reports and alerts:

```spl
` Power User-level: multi-command pipelines, computed fields,
  and aggregation — the core building blocks from Fundamentals `
index=web_logs
| eval status_category=if(status>=500, "error", "ok")
| stats count by status_category, host
| sort -count
```

```spl
` Lookups and basic dashboard-building are also in scope at this level `
index=web_logs
| lookup status_codes.csv status OUTPUT description
| stats count by description
```

## Splunk Enterprise Certified Admin — architecture and operations

This exam shifts from "using Splunk" to "running Splunk" — the content maps directly to this guide's Overview (architecture: forwarders, indexers, search heads) and Advanced (clustering, replication factor, search factor) tabs:

```bash
# Admin-level knowledge: deployment and configuration, not just search
# Forwarder deployment and management
/opt/splunkforwarder/bin/splunk add forward-server indexer.company.com:9997
/opt/splunkforwarder/bin/splunk add monitor /var/log/myapp/app.log

# Indexer cluster status and health — a core admin-exam topic
/opt/splunk/bin/splunk show cluster-status
```

```
Admin-exam topic areas typically include:
  - Installation and initial configuration (standalone and distributed)
  - Indexer clustering — replication factor, search factor, cluster
    manager coordination
  - Forwarder management and deployment at scale (deployment server,
    forwarder management console)
  - User/role management and access control
  - Data input configuration (props.conf/transforms.conf/inputs.conf)
  - License management and monitoring license usage
```

## Splunk Enterprise Security Certified Admin — SIEM-specific depth

For the security-focused path, exam content centers on Splunk ES specifically rather than the base platform — deploying ES, configuring data inputs and normalizing them against the **Common Information Model (CIM)** (a standardized field-naming schema that lets ES's built-in correlation searches and dashboards work across differently-sourced data without custom mapping for every source), and managing the knowledge objects that make ES function as a SIEM rather than just a search platform:

```spl
` CIM-compliant field naming is what lets a single correlation search
  work across differently-sourced authentication data (Windows,
  Linux, cloud IAM) without a separate search per source `
index=* tag=authentication action=failure
| stats count by user, src, dest

` A simplified example of the kind of correlation search this
  certification path tests understanding of `
index=* tag=authentication action=failure
| bucket _time span=1h
| stats count as failed_attempts by user, _time
| where failed_attempts > 10
```

```
ES Admin exam topic areas typically include:
  - ES deployment planning and installation
  - Data onboarding and CIM normalization
  - Correlation search configuration and tuning
  - Risk-Based Alerting setup (risk objects, risk scores, risk thresholds)
  - Notable Event and incident review workflow configuration
  - Threat intelligence framework integration
```

## Study approach that matches how this guide is structured

The certification track maps closely enough onto this guide's own tab structure that working through Overview → Fundamentals → Intermediate → Advanced in order covers most of the Power User through Enterprise Admin exam content directly — Fundamentals' SPL building blocks are Power User-level material, Intermediate's lookups/data models/macros are Advanced Power User territory, and Advanced's clustering/performance/ES content maps to the Enterprise Admin and ES Admin exams respectively. The one gap worth calling out explicitly: exam-specific practice under real time pressure (a 60-70 question exam in under two hours) is a distinct skill from open-ended SPL problem-solving, and is worth practicing separately regardless of how solid the underlying conceptual knowledge is.

---

## Official Resources

- [Splunk Certification Overview](https://www.splunk.com/en_us/training/certification.html)
- [Splunk Core Certified User Track](https://www.splunk.com/en_us/training/certification-track/splunk-core-certified-user.html)
- [Splunk Enterprise Certified Admin Track](https://www.splunk.com/en_us/training/certification-track/splunk-enterprise-certified-admin.html)
- [Splunk Enterprise Security Certified Admin](https://www.splunk.com/en_us/training/certification-track/splunk-es-certified-admin.html)

---
