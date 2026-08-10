# Ethical Hacking — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from security awareness training and incident postmortems industry-wide, not one specific traceable company's incident. These scenarios deliberately focus on the CEH-specific domains (social engineering, wireless, IoT/cloud) that this course's companion Pen Testing technology doesn't cover in depth, rather than repeating the web-application/Active Directory material already covered there.

---

## Scenario 1 (illustrative/composite): The phishing test that revealed a bigger problem than clicking

**The pattern:** An authorized social engineering assessment sends a simulated phishing email to 500 employees, styled as an urgent IT request to "verify your password" via a fake login page. As expected, some employees click the link and enter credentials — that's the headline metric everyone expects to track. But the more useful finding turns out to be a secondary pattern: of the employees who clicked, a meaningful number **reported the email to IT security *after* already entering their credentials on the fake page** — meaning the awareness training had partially worked (they eventually recognized something was wrong) but not soon enough to prevent the initial exposure.

**Why this is the more actionable finding, not just a footnote:** a simple "click rate" metric treats every click as an identical failure, but "clicked, entered credentials, then recognized the problem and reported it 10 minutes later" is a meaningfully different risk profile than "clicked and never noticed anything wrong" — the first case still has a real exposure window, but it also reveals that the org's *detection and reporting* culture is working, just too late in the sequence. A report that only tracks click-through rate misses this distinction entirely, and it's exactly the kind of nuance a properly designed social engineering assessment should surface.

**What actually improves the outcome, beyond "more training":**
- **Shorten the exposure window, not just the click rate** — if people are eventually recognizing and reporting phishing, the fix that matters most is making credential exposure itself harder to weaponize quickly (mandatory MFA that resists simple credential replay, rapid automated session/credential invalidation the moment a report comes in) rather than assuming zero clicks is achievable through training alone.
- **Reward reporting explicitly, even (especially) from people who clicked** — a punitive culture around "you fell for it" discourages exactly the self-reporting behavior that turned this scenario from a full compromise into a contained one; the org wants people who make the initial mistake to still come forward immediately, not hide it out of embarrassment.
- **Treat the assessment's real deliverable as a full narrative, not a single percentage** — this course's own Pen Testing material makes exactly this point about "attack narrative" mattering more than any single severity score; the same principle applies directly to social engineering reporting.

---

## Scenario 2 (illustrative/composite): The rogue access point that looked identical to the real one

**The pattern:** During an authorized wireless security assessment, a tester sets up a rogue access point broadcasting the same SSID as the organization's legitimate corporate Wi-Fi network, in a location with strong signal near a common break area. Several employee devices, configured to auto-connect to remembered networks by name, connect to the rogue AP without any user action or awareness at all — no phishing email, no click, nothing for the employee to have done differently in the moment.

**Why this is a genuinely different risk category from phishing, worth testing separately:** this attack requires zero interaction from the victim beyond having previously connected to the real network once and having device Wi-Fi auto-connect enabled — which is the default behavior on most laptops and phones. Unlike phishing, there's no decision point for security awareness training to intervene at; the vulnerability is purely in how Wi-Fi client behavior and network authentication work, not in human judgment at all.

**What actually addresses this, distinct from phishing countermeasures:**
- **802.1X with certificate-based authentication (WPA2/WPA3-Enterprise)** rather than a shared pre-shared key — a rogue AP broadcasting the same SSID can't complete this authentication without the client's actual certificate, which a fake AP has no way to present correctly, unlike a simple password-based network where the SSID and password alone are enough to fool an auto-connecting device.
- **Wireless intrusion detection (WIDS)** specifically monitoring for duplicate SSIDs broadcasting from unrecognized BSSIDs/MAC addresses — this is a detectable pattern distinct from anything a phishing-focused security program would catch, since it happens entirely at the network layer.
- **This is exactly why CEH's curriculum treats wireless attacks as a distinct domain from web/social engineering** — the defenses genuinely don't transfer between categories, and an organization that's only invested in phishing awareness training has done essentially nothing to address this specific attack surface.

---

## Scenario 3 (illustrative/composite): The IoT device that was never meant to be internet-facing

**The pattern:** A facilities team installs a network-connected building management system (HVAC controller) to allow remote monitoring, following the vendor's quick-start guide. The setup guide's fastest path forwards the device's admin interface directly to the internet for "convenient remote access," using the device's default credentials, which the vendor documentation mentions changing but doesn't enforce. Months later, during an authorized assessment, a tester finds the device via a Shodan search for the specific HVAC vendor's default web interface banner, logs in with the still-unchanged default credentials, and discovers the device sits on the same flat network segment as the building's access control system.

**Why this pattern is so common with IoT/OT devices specifically, not just a one-off oversight:** IoT and operational technology devices are frequently installed and configured by teams (facilities, physical security) whose primary expertise isn't network security, following vendor documentation optimized for "get this working quickly" rather than "get this working securely" — and unlike a corporate laptop, there's often no centralized IT patch management or credential policy enforcement covering these devices at all. Shodan-indexed default-credential IoT devices are a well-documented, large-scale phenomenon precisely because this pattern repeats across countless organizations and device categories, not because any single installer was unusually careless.

**What actually addresses this:**
- **Network segmentation specifically for IoT/OT devices** — these devices should sit on an isolated VLAN with no route to sensitive systems (access control, corporate data) regardless of whether their own credentials get hardened, since segmentation contains the blast radius even when a device-level fix gets missed.
- **Change default credentials as a mandatory step in any device's install checklist, verified by someone outside the installing team** — relying on a vendor's documentation to mention this isn't the same as it actually happening, which is exactly the gap this scenario illustrates.
- **Treat "should this be reachable from the internet at all" as the first question**, before any credential hardening — remote access convenience is frequently solved better by a VPN into the segmented IoT network than by exposing the device's own interface directly, and this decision matters more than any password policy applied afterward.
