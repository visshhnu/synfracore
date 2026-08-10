# Ethical Hacking — PYQ (Previously Asked / Practice Questions)

**Framing note:** Same as this course's Pen Testing technology — CEH is a proctored, confidential exam with no public past-paper archive. What follows is built from the **current CEH v13** domain structure, focused specifically on the domains this technology's own material covers that overlap least with the companion Pen Testing technology (social engineering, malware, wireless, IoT/cloud) rather than repeating the web-app/AD-focused questions already written there.

**Current CEH v13 format** (verified): 125 multiple-choice questions, 4-hour window, EC-Council's own variable cut score (60-85% depending on the specific question pool difficulty — you won't know your exact threshold in advance, which means no domain is safe to skip in preparation). Voucher price $1,199 (Pearson VUE) or ~$950 (EC-Council remote proctoring); this course's own `certification.md` figure of "~$1,200" is close enough to current pricing to not need correction. **CEH v13 specifically integrated AI-driven attack and defense content across its curriculum** rather than as a separate add-on — a genuine content update, not just a version-number change.

---

### 1. (Social Engineering domain) An attacker calls the IT helpdesk claiming to be a traveling executive who's locked out of their account and needs an urgent password reset, providing just enough correct personal detail (department, manager's name) to sound legitimate. What's this specific technique called, and what's the single most important helpdesk process control that defeats it?

**Answer:** This is **pretexting** (or specifically **vishing** if done by phone) — building a fabricated but plausible scenario to manipulate a target into an action they wouldn't take under normal scrutiny. The correct-sounding details don't confirm identity; they're often gathered beforehand via OSINT (LinkedIn org charts, public bios) specifically to make the pretext convincing. The control that defeats this regardless of how convincing the pretext sounds: **an out-of-band identity verification step that doesn't rely on information the caller supplies** — calling back a known-good number on file, requiring a manager's separate confirmation, or a pre-established verification question that isn't derivable from public information. If the helpdesk's process can be satisfied purely by information an attacker could plausibly gather about the target, the process is bypassable no matter how alert the individual helpdesk agent is.

---

### 2. (Malware Threats domain) What's the actual technical difference between a virus, a worm, and a trojan — terms that get used almost interchangeably in casual conversation?

**Answer:** A **virus** requires a host file/program to attach to and needs some form of user action (running the infected file) to execute and spread. A **worm** is self-propagating — it spreads across a network on its own without needing a host file or user action, exploiting a vulnerability or misconfiguration directly (this is why worms can spread so much faster than viruses). A **trojan** disguises itself as legitimate software to trick a user into installing it voluntarily — it doesn't self-replicate at all; its "attack" is entirely in the deception of getting installed in the first place, after which it can do anything from data theft to opening a backdoor. The practical distinction matters for defense: worm containment is primarily a network-segmentation and patching problem, while trojan defense leans more on application allowlisting and user-facing awareness about installing unverified software.

---

### 3. (Sniffing domain) On a modern switched network (not a hub), why doesn't simply running Wireshark on your machine let you see other devices' traffic — and what technique would an attacker need to actually intercept it?

**Answer:** Switches forward traffic only to the specific port a destination MAC address is associated with, unlike old hub-based networks that broadcast every packet to every port — so passively listening on your own network interface only shows traffic actually addressed to or from your own machine. To intercept traffic between two *other* devices, an attacker needs an active technique like **ARP spoofing/poisoning** (sending forged ARP replies to make both target devices believe the attacker's machine is the other party, routing their traffic through the attacker as a man-in-the-middle) or **MAC flooding** (overwhelming a switch's MAC address table until it fails open and starts broadcasting like a hub). This is exactly why "sniffing" as a CEH domain is inseparable from understanding switch behavior specifically — the attack techniques exist precisely because switching defeated the older, passive approach.

---

### 4. (Denial of Service domain) What's the conceptual difference between a volumetric DoS attack and an application-layer DoS attack, and why can a target with plenty of bandwidth still go down from the second type?

**Answer:** A **volumetric attack** (like a UDP flood or amplification attack) tries to saturate the target's network bandwidth or infrastructure capacity directly with raw traffic volume. An **application-layer attack** (like Slowloris, or a flood of legitimate-looking but resource-expensive requests — e.g., search queries that trigger expensive database operations) targets a specific bottleneck in the application's own processing capacity rather than network bandwidth at all. A target can have abundant bandwidth and still go down from an application-layer attack because the actual constraint being exhausted is server-side compute, database connections, or open connection slots — not the pipe the traffic arrives through. This is why DDoS mitigation strategy has to address both layers separately: a network-layer scrubbing service alone doesn't protect against an attack that looks like normal, if excessive, application traffic.

---

### 5. (Session Hijacking domain) An application generates session tokens as sequential integers (session ID 10001, 10002, 10003...). What's the specific vulnerability this creates, and what should a session token actually look like to prevent it?

**Answer:** Sequential or predictable session tokens allow **session prediction** — an attacker who obtains one valid session ID (their own, from logging in normally) can guess or systematically try nearby values to find another active user's session ID and hijack their session without ever needing their password. A session token should be generated with a cryptographically secure random number generator, be sufficiently long to resist brute-forcing (128+ bits of entropy is a common baseline), and ideally be tied to additional binding factors (IP consistency checks, though these have their own tradeoffs with legitimate IP changes) — the key property being that no amount of observing valid tokens should let an attacker infer or predict another one.

---

### 6. (Evading IDS/Firewalls domain) What's the general principle behind most IDS/firewall evasion techniques — fragmentation, encoding, timing-based approaches — and why does understanding this principle matter more than memorizing a list of specific tricks?

**Answer:** Most evasion techniques exploit a gap between how the detection system *interprets* traffic and how the actual target system will ultimately process it — fragmenting a payload across multiple packets so a signature-matching IDS never sees the complete malicious pattern in a single packet (while the target's OS reassembles the fragments back into the full payload before processing), encoding a payload so it doesn't match a known signature until decoded on the target side, or spacing requests out in time to stay under a rate-based detection threshold. Understanding this underlying principle — "detection and destination don't always see and process traffic identically" — matters more than memorizing specific technique names because new detection tools change the specific tricks that work, but the underlying gap between detection-side interpretation and destination-side processing is a structural property of network detection generally, not a specific bug that gets patched once.

---

### 7. (Cloud/IoT Hacking domain) An IoT device ships with a hardcoded admin password baked into its firmware that can't be changed by the end user at all. Why is this qualitatively worse than a device that ships with a *default* password the user simply forgot to change?

**Answer:** A default password is a user/organizational failure to follow a security best practice — the fix (change the password) is entirely within the owner's control once they're aware of it. A **hardcoded** credential baked into the firmware itself means no amount of user diligence can fix it — every unit of that device model shares the same credential permanently, and the only real fix is a firmware update from the vendor (if one is ever released at all) or physically decommissioning the device. This distinction is exactly why vulnerability databases and IoT security assessments treat hardcoded credentials as a categorically more severe finding than a default-credential misconfiguration, even though both might superficially look like "weak password" issues at first glance.

---

### 8. (Cloud/IoT Hacking domain) In a multi-tenant cloud environment, what's a "container escape," and why does it matter more in a shared-hosting/multi-tenant context than in a single-tenant deployment?

**Answer:** A container escape is a vulnerability that lets code running inside a container break out of its intended isolation boundary and access the underlying host system (or, in the worst case, other containers running on that same host). In a single-tenant deployment, a container escape is bad but the blast radius is contained to that organization's own infrastructure. In a **multi-tenant** cloud environment (shared Kubernetes clusters, shared container hosting), a successful container escape could potentially expose or affect *other customers'* workloads running on the same physical host — which is exactly why cloud providers and multi-tenant platforms invest heavily in kernel-level isolation hardening (gVisor, Kata Containers, and similar sandboxing technologies) specifically for this threat model, beyond what a single-tenant environment would typically need.

---

### 9. (Social Engineering domain) What's "tailgating" (or "piggybacking") as a physical social engineering technique, and what's the single hardest part of defending against it, organizationally?

**Answer:** Tailgating is following an authorized person through a secured door/entry point without independently badging in — relying on social pressure (holding a door open is normal, polite behavior) rather than any technical vulnerability at all. The hardest part of defending against it isn't technology (mantrap doors and turnstiles exist specifically to prevent it physically) — it's that **the defense requires employees to act against a strong, deeply ingrained social norm** (holding a door for someone looks helpful; not holding it can feel rude or confrontational), which makes consistent enforcement genuinely difficult even with clear policy and training. This is worth naming explicitly as a distinct kind of difficulty from a technical control gap — it's a policy that asks people to override ordinary politeness norms, which is a harder ask than "install this patch."

---

### 10. (Malware Threats domain, AI-related — CEH v13 addition) What's a specific, non-generic concern about AI-generated phishing content compared to traditional templated phishing emails?

**Answer:** Traditional phishing campaigns often reuse identifiable templates and boilerplate language, which is exactly what many email security filters and awareness-training pattern-recognition are tuned to catch (generic greetings, characteristic urgency phrasing, telltale grammatical patterns). AI-generated phishing content can be produced uniquely per-target and grammatically fluent at scale, removing exactly the pattern-level tells that both automated filters and "spot the phishing email" awareness training have historically relied on — meaning defenses that worked by recognizing *how* a phishing email was written need to shift toward verifying *what's being asked* (out-of-band verification of unusual requests) rather than relying on writing-quality or template-matching as a detection signal at all. This is a specific, structural shift in the defensive approach required, not just "phishing got a little better."
