# Penetration Testing — PYQ (Previously Asked / Practice Questions)

**Framing note:** OSCP and CEH exams are proctored and confidential — no public past-paper archive exists, and OSCP specifically is a live hands-on exam rather than a fixed question bank in the first place. What follows is built from the **current, verified exam formats and methodologies** those certifications actually test, framed as practice/methodology questions rather than invented "leaked" content.

**Current OSCP format** (verified): 23 hours 45 minutes of live hacking against isolated targets, followed by a further 24 hours to submit a professional report. Standalone machines plus a mandatory Active Directory set worth 40 of the 100 points needed to pass (70/100 required) — the AD chain has no bonus points to fall back on if missed. Metasploit's automated exploitation modules are restricted to a single target for the whole exam, specifically to test manual exploitation ability rather than tool-driven automation. OffSec introduced **OSCP+** in November 2024 as a 3-year-renewable companion designation issued alongside the original lifetime OSCP — both are awarded together on a pass; existing lifetime OSCP holders keep that credential even without renewing the "+" version.

---

### 1. (Methodology) You've just gained a low-privilege shell on a Linux target during an authorized engagement. What's the correct next step, and why does skipping it cause more failed exams/engagements than any single missed exploit?

**Answer:** Enumerate thoroughly before attempting any privilege escalation technique — check `sudo -l`, SUID binaries, cron jobs, and world-writable files systematically (exactly as covered in this course's own Intermediate material) rather than jumping straight to a specific escalation technique you already know. Insufficient enumeration is consistently cited as the single most common reason OSCP candidates fail to escalate on machines they've already gained initial access to — the exploit path is almost always visible in the enumeration output; the failure mode is not looking thoroughly enough before trying things.

---

### 2. (Report writing) A finding involves a SQL injection vulnerability that let you dump the full `users` table, including password hashes. What does a properly structured finding write-up need beyond "SQL injection was found," and why does this course's own report structure separate "Description" from "Evidence" from "Impact" as distinct sections?

**Answer:** A complete finding needs: the exact vulnerable parameter and request, a CVSS score, the technical description of *why* it's vulnerable (unparameterized query), evidence (the actual request/response demonstrating the dump), business impact (what an attacker could actually do with dumped credentials — credential stuffing against other systems, direct account takeover), and specific remediation (parameterized queries, not just "fix SQL injection"). These are separated because they serve different readers — a developer needs the technical description and remediation; an executive reading only the summary needs the impact section; and evidence needs to stand on its own to be independently verifiable, which is exactly the standard a bug bounty triage team applies (see this course's Real World Scenarios material) when deciding whether a report can be validated quickly.

---

### 3. (Web app testing) Given a URL parameter `?id=1`, you test `?id=1'` and the page returns a database error instead of the normal result. What does this indicate, and what's the next diagnostic step before assuming full exploitability?

**Answer:** A database error on a single-quote injection is a strong signal of a SQL injection vulnerability (the quote broke the query's syntax). The next step is determining *which type* of SQLi you're dealing with before assuming full data extraction is possible — test boolean-based blind (`' AND 1=1--` vs `' AND 1=2--`, checking whether the response differs) and time-based blind (`' AND SLEEP(5)--`, checking for a delay) if no error-based output is directly visible, since the exploitation approach differs substantially between "the database hands back visible errors/data directly" and "the only signal available is true/false or timing." This distinction, already covered in this course's own Intermediate material, is exactly what determines whether a tool like sqlmap can extract data directly or has to do it much more slowly via blind inference.

---

### 4. (Active Directory) You've compromised a low-privilege domain user account. What's Kerberoasting, and why does it work specifically against **service accounts** rather than regular user accounts?

**Answer:** Kerberoasting requests a Kerberos Ticket Granting Service (TGS) ticket for a service account, which comes back encrypted with that service account's password hash — an attacker can then attempt to crack that hash offline, at their own pace, without triggering further authentication attempts against the domain controller. It specifically targets service accounts because those accounts commonly have SPNs (Service Principal Names) registered and, in practice, often have older, weaker, or infrequently-rotated passwords compared to regular user accounts subject to standard password policies and expiration — making the offline cracking step more likely to succeed. This is exactly why security guidance for AD environments emphasizes strong, regularly rotated service account passwords specifically, not just general password policy for human users.

---

### 5. (Privilege escalation, Windows) What does "unquoted service path" privilege escalation exploit, and why does it only work when the path contains spaces?

**Answer:** When a Windows service's binary path isn't wrapped in quotes and contains spaces (e.g., `C:\Program Files\My App\service.exe`), Windows attempts to resolve the unquoted path by trying each space-delimited segment as a potential executable in turn — `C:\Program.exe`, then `C:\Program Files\My.exe`, before finally trying the full intended path. If an attacker has write access to a location earlier in that resolution order (e.g., `C:\Program.exe`) and the service runs with elevated privileges, planting a malicious executable there gets it executed with that service's privileges. This is exactly why it only matters when the path *contains spaces without quotes* — a properly quoted path, or one with no spaces at all, has no ambiguous earlier segment for Windows to accidentally try first.

---

### 6. (Scoping/ethics) A client's rules of engagement say "web application at app.example.com" is in scope. During testing, you discover the application shares a database server with a different application on `billing.example.com`, which isn't mentioned in scope. What's the correct move?

**Answer:** Stop and get explicit written clarification before touching anything related to `billing.example.com`, even if the path there was discovered incidentally while testing the in-scope application. This is exactly the scope-boundary problem covered in this course's own Real World Scenarios material — shared infrastructure makes "is this actually in scope" genuinely ambiguous in a way that's easy to rationalize past under time pressure, and the correct response is documenting the boundary and contacting the client's point of contact, not assuming continuation is fine because the discovery was incidental.

---

### 7. (Tools/methodology) Why does this course's own material specifically caution that Metasploit's `check` command tests exploitability *without* exploiting, and when would you use it during an authorized engagement versus jumping straight to `run`?

**Answer:** `check` sends a request designed to determine whether a target is vulnerable to a specific exploit module without actually triggering the exploit payload — useful specifically when you want to confirm a vulnerability exists (for reporting purposes, or to avoid unnecessary risk to a production system) without the potential side effects of actually running the exploit, which could crash a service or leave artifacts you didn't intend. You'd reach for `run` only once you've confirmed scope explicitly permits actual exploitation of that specific target (not just vulnerability confirmation) — some engagements are scoped to stop at "confirmed vulnerable" rather than "successfully exploited," and knowing which your specific engagement calls for is a rules-of-engagement question, not a technical one.

---

### 8. (CEH-style, broader theory) What's the difference between a vulnerability scanner (like Nessus) and a penetration test, and why does an organization typically need both rather than either alone?

**Answer:** A vulnerability scanner checks systems against a database of known vulnerability signatures and misconfigurations automatically, at scale, but doesn't attempt actual exploitation or chain findings together — it tells you *what might be wrong*. A penetration test manually attempts exploitation, chains findings together into realistic attack paths, and specifically tests things a scanner structurally can't (business logic flaws, whether a "vulnerable" finding is actually exploitable in this specific environment, how far an attacker could actually get). Organizations typically need both because scanning is cheap, fast, and good at catching the "did we forget to patch something" class of problem at scale, while pen testing is the tool for validating real-world exploitability and finding the logic-level issues scanning fundamentally can't detect — treating either as a complete substitute for the other leaves a real gap.

---

### 9. (Bug bounty / responsible disclosure) You find a critical vulnerability in a bug bounty program's in-scope application. The program's policy explicitly lists "no automated scanning tools" as a rule. You used `sqlmap` to confirm the finding. What should you do?

**Answer:** Disclose the tool usage honestly in your report and be prepared for the report to be rejected or for the program to flag the policy violation — misrepresenting how a finding was discovered, or omitting that a prohibited tool was used, is a trust and ethics violation independent of whether the underlying vulnerability is real. Programs set tool restrictions for real reasons (server load, distinguishing genuine manual testing skill, avoiding noisy scans across shared infrastructure), and the correct response to having already violated one, even unintentionally, is transparency about it — not concealment, which risks program access entirely if discovered later rather than just this one report.

---

### 10. (Reporting, severity judgment) Two findings both score CVSS 7.5 (High). One is a reflected XSS requiring a victim to click a crafted link; the other is a stored XSS that fires automatically for every user who views a specific page. Should they be prioritized identically in the report's remediation ordering?

**Answer:** Not necessarily — CVSS base score captures technical severity but not full exploitation likelihood/blast-radius context, which is exactly why this course's own report structure includes a separate "Impact" narrative alongside the raw score. Stored XSS firing automatically for every viewer of a page has a meaningfully larger realistic blast radius (no social engineering step required, hits every visitor) than reflected XSS (requires successfully tricking a specific victim into clicking a crafted link first) — even at an identical CVSS score, a report that explains this distinction in the narrative gives the client a more actionable remediation priority than the score alone would suggest.
