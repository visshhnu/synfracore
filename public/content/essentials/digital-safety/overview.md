# Digital Safety & Online Privacy

## Why Digital Safety Matters

Every connected device is an entry point for attackers. Your smartphone, laptop, social media accounts, email, and banking apps are all targets. Digital literacy means understanding the threats and protecting yourself.

---

## Most Common Online Threats

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
