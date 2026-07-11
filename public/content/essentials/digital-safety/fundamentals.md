# Digital Safety — Fundamentals

## Building a password system that actually holds up

The realistic threat isn't someone guessing your password directly — it's **credential stuffing**: one site you use gets breached, your email/password pair leaks, and attackers automatically try that same pair against banking, email, and social media sites, because most people reuse passwords. The fix has one non-negotiable rule: every account gets a unique password, generated and stored by a password manager (Bitwarden's free tier is genuinely sufficient for personal use), not remembered or reused. You only need to actually remember one password — the manager's own master password — which should be a long passphrase, not a short complex string (`correct-horse-battery-staple`-style length beats `P@ssw0rd!` complexity for real resistance to brute force).

**Practical setup order, in priority:**
1. Password manager first (Bitwarden, 1Password) — install browser extension + phone app, set one strong master password
2. Change your email account's password first, specifically, since email is the recovery path for every other account — if email is compromised, every other account's "forgot password" flow is too
3. Turn on 2FA on email, banking, and any account with stored payment info before anything else
4. Let the manager generate and store new unique passwords as you log into other accounts over the following weeks — you don't need to change everything on day one, just stop reusing going forward

## Two-Factor Authentication: which method to actually use

Not all 2FA is equally strong, and the choice matters:

| Method | Real security level | Why |
|---|---|---|
| SMS OTP | Weakest of the "real" options | Vulnerable to SIM-swap attacks — an attacker who social-engineers your telecom provider into porting your number receives your OTPs directly. Still far better than no 2FA at all. |
| Authenticator app (Google/Microsoft Authenticator, Authy) | Strong | Code is generated locally on your device via a shared secret set up once — nothing travels over the telecom network to be intercepted or SIM-swapped |
| Hardware key (YubiKey) | Strongest | Requires physical possession of the key itself; resistant to phishing in a way software codes aren't, since the key cryptographically verifies the actual site domain before authenticating |

**The practical rule:** use an authenticator app as your default everywhere it's offered; reserve a hardware key for your single most critical account (typically email, since it's the recovery path for everything else) if you're willing to carry one; accept SMS OTP only where it's the sole option offered, and treat that as a genuine security gap worth flagging when you notice it.

## Recognizing phishing in the 10 seconds before you click

Phishing succeeds by creating urgency that short-circuits scrutiny — the actual defense is a fixed habit, not vigilance you have to remember to apply:

1. **Check the sender's actual domain**, not the display name — `HDFC Bank <support@hdfc-alerts.xyz>` shows a trusted display name over an untrusted domain; hover or tap-and-hold to reveal it before trusting a display name alone
2. **Never act on urgency inside the message itself** — if a message says your account will be suspended in 24 hours, close the message and navigate to the service directly (typing the URL yourself or using your own bookmark), rather than clicking through
3. **No legitimate service ever asks for your OTP, full password, or CVV over call, SMS, or email** — this is true without exception; a caller claiming to be from your bank's "fraud department" asking you to read back an OTP to "reverse a fraudulent transaction" is itself the fraud
4. **When in doubt, contact the organization through a channel you looked up yourself** — the number on the back of your card, the URL you typed, not any contact info provided inside the suspicious message

## Backing up data: the 3-2-1 rule, made concrete

A backup strategy that only exists in theory ("I should back this up sometime") isn't a backup strategy. The 3-2-1 rule is simple enough to actually follow: **3** copies of anything that matters (1 original + 2 backups), on **2** different types of media (e.g., your laptop's disk + an external drive, not two folders on the same disk), with **1** copy off-site (cloud storage, or a drive kept at a different physical location) so a single event — theft, fire, ransomware, a failed drive — can't take out every copy at once.

For most individuals, the practical version is: enable automatic cloud backup (Google Photos/Drive, iCloud, OneDrive) for anything irreplaceable, and treat "it's only on my phone/laptop" as a temporary state, not a permanent one. Ransomware specifically defeats backups that are constantly connected and writable — a periodic, disconnected backup (an external drive you plug in weekly and unplug afterward) survives a ransomware infection that a permanently-mounted network drive does not.

## Securing your phone, specifically

Phones carry more sensitive access than most laptops now — banking apps, authenticator apps, and the SMS channel used for account recovery — and are lost or stolen far more often:

- **Enable a real lock screen** (PIN/pattern/biometric) with a short auto-lock timeout — a phone with no lock screen means anyone who picks it up has your email, banking apps, and every session already logged in
- **Enable "Find My Device" / "Find My iPhone"** before you need it — this is the mechanism that lets you remotely lock or wipe a lost or stolen phone, and it has to already be turned on to work
- **Review app permissions periodically** (Settings → Apps → Permissions) — a flashlight app requesting contacts or location access is a real, common pattern worth revoking, not a hypothetical risk
- **Only install apps from the official Play Store/App Store**, and be specifically suspicious of APKs shared outside the store — sideloaded apps bypass the store's own malware scanning entirely

## What to actually do in the first hour after you suspect a compromise

Acting fast measurably limits damage — most guidance about "reporting cybercrime" undersells how time-sensitive the first response actually is:

1. **If money was fraudulently transferred**, call India's Cyber Helpline **1930** immediately — banks can often freeze/reverse a transaction if reported within a few hours, and that window closes fast
2. **Change the compromised account's password immediately**, from a different, trusted device if possible — then check and revoke any active sessions/logged-in devices the account settings allow you to see
3. **Check whether the same password was reused anywhere else** — if so, that's now also compromised and needs changing, which is exactly the cascading cost that unique-per-account passwords exist to prevent in the first place
4. **File a complaint at cybercrime.gov.in** for a documented record, even after the immediate financial risk is handled — this matters for both potential recovery and any dispute with your bank or provider later
