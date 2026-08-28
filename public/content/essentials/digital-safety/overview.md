# Digital Safety & Online Privacy

**Before you start:** no prior technical background is needed. *(Note: legal section details — IT Act sections, penalties, DPDP Act specifics — reflect India law as of authoring; verify current provisions before relying on them for anything legal, as laws and amendments change.)*

## Why This Exists (The Hook)

A phishing email doesn't need to fool a security expert — it only needs to fool one tired, distracted person for ten seconds, out of thousands of attempts. Attackers exploit exactly that asymmetry: they only need to succeed once, while you need to be careful every single time. Digital safety exists to shrink that asymmetry back in your favor — recognizing the small number of attack patterns (urgency, impersonation, requests for OTP/passwords) that cover the overwhelming majority of real attacks, so you can catch them reflexively instead of needing to analyze every message from scratch.

**Analogy** — Think of digital safety like locking your car and not leaving valuables visible, not building a bunker. Most car break-ins are opportunistic — an unlocked door or a visible laptop on the seat, not a determined thief defeating a serious security system. Removing the easy opportunity (locking doors, hiding valuables) stops the overwhelming majority of real-world attempts, even though a truly determined, resourced attacker could theoretically still get in. Strong unique passwords, 2FA, and recognizing phishing are your "locked doors" — they don't make you invincible, but they stop the vast majority of real attacks, which are opportunistic, not targeted.

**Try it (2 minutes)** — Reason through why "no legitimate organisation asks for your OTP, password, or CVV" is treated as an absolute rule rather than a rule of thumb, without looking anything up: an OTP exists specifically to prove that a request is coming from you, the account owner, at the moment of a legitimate transaction you initiated. If someone calling and claiming to be from your bank asks you to read them the OTP that just arrived, what are they actually trying to do with it — and why would a genuine bank employee, who already has access to your account internally, have no legitimate reason to need a code that exists purely to prove YOUR identity to THEM?

---

## Most Common Online Threats

```conceptgrid
{
  "boxes": [
    { "title": "Phishing", "description": "Fake messages impersonating trusted entities to steal credentials", "color": "red" },
    { "title": "Social Engineering", "description": "Manipulating people directly -- fake bank calls, fake job offers", "color": "amber" },
    { "title": "Password Attacks", "description": "Brute force, credential stuffing, shoulder surfing", "color": "purple" },
    { "title": "Malware", "description": "Ransomware, spyware, adware -- damages or steals from your device", "color": "blue" }
  ]
}
```

### Phishing
Fake emails/messages impersonating trusted entities (bank, UIDAI, IRCTC, IT Department) to steal credentials.

**Spotting phishing:**
- Sender email domain doesn't match organisation (e.g. support@incometax-helpdesk.xyz vs incometax.gov.in)
- Urgent language: "Your account will be suspended in 24 hours"
- Links that look legitimate but redirect differently (hover over link to check real URL)
- Requests for OTP, password, CVV — no legitimate organisation asks for these
- Poor grammar, generic greeting ("Dear User" instead of your name)

**Phishing variants:**
- **Smishing:** Via SMS — fake delivery OTP, fake bank alert
- **Vishing:** Via voice call — fake bank/TRAI/CBI officer
- **Spear phishing:** Targeted, personalised — uses your name, role, employer

### Social Engineering
Manipulating people rather than systems. Common scenarios:
- "I'm from your bank's fraud department. To reverse an unauthorised transaction, please share the OTP sent to your phone." — Always hang up and call the official bank number.
- Fake job offers asking for advance deposits, document fees
- Fake lottery/prize money — "You've won ₹25 lakhs, pay ₹500 processing fee"

### Password Attacks
- **Brute force:** Try all combinations — countered by strong passwords and account lockout
- **Dictionary attack:** Try common words/passwords — countered by complex passwords
- **Credential stuffing:** Use passwords stolen from one breach to try on other sites — countered by unique passwords per site
- **Shoulder surfing:** Watching you type — use privacy screens in public

### Malware
Malicious software that damages or steals from your device:
- **Virus:** Attaches to files, spreads when file is shared
- **Ransomware:** Encrypts your files, demands payment. Notable: WannaCry (2017), encrypted 200,000+ systems
- **Spyware:** Logs keystrokes, takes screenshots, reads messages
- **Adware:** Displays unwanted ads, may lead to malicious sites
- **RAT (Remote Access Trojan):** Attacker can remotely control your device

---

## Protective Measures

### Passwords & Authentication
- **Strong password:** 12+ characters, mix of uppercase, lowercase, numbers, symbols
- **Passphrase:** Easier to remember — "Chai@Morning!2024" is strong and memorable
- **Never reuse passwords:** Each account needs a unique password
- **Password manager:** LastPass, Bitwarden, 1Password — stores and generates strong passwords
- **Two-Factor Authentication (2FA):** Even if password is stolen, attacker can't login without second factor
  - Authenticator app (Google Authenticator, Authy) — better than SMS OTP
  - Hardware key (YubiKey) — strongest
  - SMS OTP — better than nothing, but vulnerable to SIM swap attacks

### Device Security
- **Screen lock:** PIN/pattern/biometric. Auto-lock after 30 seconds.
- **Encryption:** Android: Settings → Security → Encrypt. iPhone: automatic when passcode set.
- **Software updates:** 85% of successful attacks exploit known vulnerabilities with patches available. Update immediately.
- **Antivirus:** Microsoft Defender (Windows) — adequate. Malwarebytes for scanning. Avoid fake antivirus pop-ups.
- **Firewall:** Enable Windows Firewall or Mac firewall.

### Network Security
- **Home Wi-Fi:** Use WPA3 (or WPA2 minimum). Change default router password. Hide SSID optional but not essential.
- **Public Wi-Fi:** Never access banking or email on open public Wi-Fi without VPN
- **VPN (Virtual Private Network):** Encrypts traffic between your device and VPN server. NordVPN, ProtonVPN, ExpressVPN. Free VPNs often log and sell data — avoid.
- **HTTPS:** Always check for padlock + https:// before entering any personal data on a website.

---

## India-Specific Digital Laws

### IT Act 2000 & Amendments

**Sec 43:** Damage to computer system — civil penalty up to ₹1 crore
**Sec 66:** Computer related offences — imprisonment up to 3 years and/or fine
**Sec 66A (struck down):** Offensive online communication — removed by Supreme Court in *Shreya Singhal (2015)*
**Sec 66C:** Identity theft — imprisonment up to 3 years, fine ₹1 lakh
**Sec 66D:** Cheating by personation using computer — same penalties
**Sec 66E:** Violation of privacy (capturing/transmitting private images without consent) — imprisonment up to 3 years
**Sec 67:** Obscene material online — imprisonment up to 5 years
**Sec 69:** Government power to intercept/monitor — requires Home Secretary order
**Sec 79:** Safe harbour for intermediaries — platforms not liable for user content if they comply with takedown notices

### DPDP Act 2023 (Digital Personal Data Protection)
- Data fiduciary must obtain explicit consent for personal data processing
- Data principal rights: right to information, correction, erasure, grievance redressal, nomination
- Significant Data Fiduciaries (large companies): additional obligations
- Data Protection Board: adjudicates disputes
- Penalties: up to ₹250 crore for violations

---

## How to Report Cybercrime in India

**Cybercrime Portal:** cybercrime.gov.in
**Cyber Helpline:** 1930 (national helpline for financial fraud — report within 24 hours to block money)
**Local police:** File FIR at nearest police station. Cyber cells in major cities.

**Golden rule for financial fraud:** If money has been transferred fraudulently, call 1930 IMMEDIATELY. Banks can flag and hold fraudulent transactions if reported within a few hours.

---

## Privacy Settings — Quick Actions

**Google Account:** myaccount.google.com → Data & Privacy → review what's saved
**Facebook:** Settings → Privacy → restrict post visibility, disable location
**WhatsApp:** Settings → Privacy → Who can see last seen, profile photo, status → set to Contacts only
**Instagram:** Settings → Privacy → Private Account → approve followers
**LinkedIn:** Settings → Privacy → restrict who sees your connections, activity

**App permissions (Android/iOS):** Settings → Apps → review camera, microphone, location permissions. Revoke any app that doesn't need them.
