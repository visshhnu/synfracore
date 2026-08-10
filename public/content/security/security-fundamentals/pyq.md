# Security Fundamentals — PYQ (Previously Asked / Practice Questions)

**Framing note:** Same as other technologies in this course — CompTIA Security+ and ISC² CC are proctored, confidential exams with no public past-paper archive. What follows is built from the **current, live exam versions and domain structures**, verified against official sources rather than assumed from an older version.

**Corrections worth noting up front:** this course's `certification.md` lists Security+ at $392 — the current verified voucher price is **$425 USD** through Pearson VUE (pricing does vary by region/academic discount). It also lists ISC² CC as "free (2024 promo)" — that promotion (rebranded "One Million Certified in Cybersecurity") actually ran through **May 20, 2026** and is now closed to new enrollments; CC is a standard paid exam again at **$199 + $50/year maintenance**. Both certs' current domain structures are used below: **Security+ SY0-701** (General Security Concepts 12%, Threats/Vulnerabilities/Mitigations 22%, Security Architecture 18%, Security Operations 28%, Security Program Management & Oversight 20%) and **ISC² CC** (Security Principles 26%, Business Continuity/DR/IR Concepts, Access Controls, Network Security, Security Operations).

---

### 1. (Security+ Domain 1: General Security Concepts) A control that detects an intrusion after it has already occurred (e.g., a SIEM alert) is what type of control? Contrast with a control that would have stopped it from happening in the first place.

**Answer:** A SIEM alert firing on already-occurred activity is a **detective** control. A control that stops the activity before it happens (a firewall rule blocking the connection, MFA preventing the login in the first place) is a **preventive** control. Security+ also tests a third category worth knowing: **corrective** controls, which fix the damage after detection (restoring from backup, patching the exploited vulnerability) — the three work together as a sequence (prevent → detect → correct), not as competing alternatives.

---

### 2. (Security+ Domain 2: Threats, Vulnerabilities, and Mitigations) What distinguishes a "vulnerability" from a "threat" from "risk," using a concrete example?

**Answer:** An unpatched server is a **vulnerability** (a weakness). An attacker actively scanning the internet for that specific unpatched service is a **threat** (a potential source of harm). **Risk** is the combination — the likelihood that threat actually exploits that vulnerability, multiplied by the impact if it does. This distinction matters practically: an organization can reduce risk either by fixing the vulnerability (patching) or by reducing exposure to the threat (network segmentation, taking the service offline), and Security+ scenario questions often test whether you pick the right lever for the situation described.

---

### 3. (Security+ Domain 3: Security Architecture) An application needs to fetch a preview image from a user-submitted URL. What's the specific security architecture concern here, and what control category addresses it?

**Answer:** This is exactly the SSRF (Server-Side Request Forgery) pattern covered in this course's own Real World Scenarios — an unrestricted server-side fetch can be redirected to internal-only resources (cloud metadata endpoints, internal admin panels) that shouldn't be reachable externally. The architectural control category here is **network segmentation / allowlisting egress destinations** — the fetching service should only be able to reach an explicit allowlist of external hosts, not the entire internal network by default.

---

### 4. (Security+ Domain 4: Security Operations) A log shows a single external IP failing login against 15 different usernames within 2 minutes. What attack does this indicate, and why would a simple "5 failed logins locks the account" policy fail to catch it?

**Answer:** This is a **password spray** attack — many usernames, one password (or a small set) tried against each, specifically to stay under per-account lockout thresholds. A simple per-account lockout rule doesn't catch this because no single account sees more than a couple of failed attempts; detecting it requires correlating failed logins **across accounts by source IP** within a time window, which is a SIEM-level detection, not something a single account's lockout policy can catch on its own.

---

### 5. (Security+ Domain 5: Security Program Management and Oversight) An organization decides not to fix a low-likelihood, low-impact vulnerability and instead documents the decision and moves on. Which risk response strategy is this, and how does it differ from "risk transfer"?

**Answer:** This is **risk acceptance** — a deliberate, documented decision to accept a risk rather than spend resources mitigating it, appropriate when the cost of fixing it exceeds the realistic impact. This is different from **risk transfer**, which shifts the financial consequence of the risk to a third party (cyber insurance, a vendor contract with liability clauses) without actually changing the underlying vulnerability or likelihood — transfer changes who pays if it happens; acceptance is a decision that the risk isn't worth paying to fix at all.

---

### 6. (ISC² CC Domain: Security Principles, largest domain at 26%) What's the actual difference between authentication and authorization, and where does "accounting" fit alongside them?

**Answer:** Authentication answers "who are you" (verifying identity — password, certificate, biometric); authorization answers "what are you allowed to do" (RBAC, ABAC, ACLs) — these are separate steps that happen in sequence, and a system can authenticate someone correctly while still denying them access to a specific resource they're not authorized for. **Accounting** (the third part of the "AAA" framework alongside Authentication and Authorization) is the ongoing record of what was actually done — audit logs, access trails — which matters specifically because it's what makes an incident investigable after the fact, independent of whether the original access was properly authorized.

---

### 7. (ISC² CC Domain: Business Continuity/DR/Incident Response) What's the difference between RTO and RPO, and why would a database need a much smaller RPO than a static marketing website?

**Answer:** **RTO (Recovery Time Objective)** is how long you can tolerate being down. **RPO (Recovery Point Objective)** is how much data loss you can tolerate, measured in time (e.g., "we can lose up to 15 minutes of data"). A transactional database needs a small RPO because every transaction since the last backup represents real, non-reconstructible business data (orders, payments) — a static marketing site that rarely changes can tolerate a much larger RPO (even a day-old backup loses essentially nothing meaningful), since its content isn't generating new, irreplaceable data continuously the way a transactional system is.

---

### 8. (ISC² CC Domain: Access Controls Concepts) What's the difference between DAC, MAC, and RBAC, and which one is Linux's standard file permission system an example of?

**Answer:** **DAC (Discretionary Access Control)** lets the resource owner decide who gets access — standard Linux/Windows file permissions are a textbook example of DAC, since the file's owner sets the permissions. **MAC (Mandatory Access Control)** has the system itself enforce access based on fixed security labels/classifications that the resource owner cannot override (common in government/military systems — SELinux is a Linux example of adding MAC on top of the OS's normal DAC). **RBAC (Role-Based Access Control)** assigns permissions based on job role rather than individual discretion or fixed labels, and is the most common model in typical enterprise environments.

---

### 9. (ISC² CC Domain: Network Security) Why does putting a service behind HTTPS not automatically mean the service is "secure," and what's a concrete example of a vulnerability HTTPS doesn't address?

**Answer:** HTTPS (TLS) provides confidentiality and integrity for data **in transit** between the client and server — it doesn't validate what the server does with the data once received, and it doesn't prevent application-layer vulnerabilities at all. A concrete example: a login form served entirely over HTTPS can still be fully vulnerable to SQL injection in its backend query — TLS protects the credentials from being intercepted in transit, but does nothing to stop a malicious username value from reaching a vulnerable, unparameterized query on the server side. This is a genuinely common area of confusion worth being explicit about: "encrypted in transit" and "secure" are not the same claim.

---

### 10. (ISC² CC Domain: Security Operations) An organization's incident response plan says to "isolate affected systems" during containment. What's the specific caveat about *how* to isolate that this course's own material emphasizes, and why does it matter?

**Answer:** Isolate by cutting network access, **not by powering the system off** — powering off destroys volatile memory (RAM), which can contain evidence critical to the investigation (encryption keys, malware artifacts, running process state that wouldn't survive a shutdown). This exact distinction — and a real failure mode where an automated containment action triggered a shutdown routine instead of a pure network-level isolation — is covered in more depth in this course's own Real World Scenarios material for the related SOC/incident-response technology.
