# Security Fundamentals Certification Guide

## Top Entry-Level Security Certifications

| Cert | Provider | Best For | Cost |
|------|----------|----------|------|
| **CompTIA Security+** | CompTIA | IT professionals entering security | $392 |
| **CompTIA CySA+** | CompTIA | Security analysts (blue team) | $392 |
| **Google Cybersecurity Certificate** | Google/Coursera | Career changers | $300 total |
| **ISC² CC (Certified in Cybersecurity)** | ISC² | Absolute beginners | Free exam (2024 promo) |
| **Microsoft SC-900** | Microsoft | Microsoft security basics | $165 |

---

## Core Security Concepts (All Certs)

```
CIA TRIAD — the foundation of everything:
  Confidentiality: only authorised parties see data
    Controls: encryption, access control, MFA
  
  Integrity: data hasn't been tampered with
    Controls: hashing (SHA-256, MD5), digital signatures, checksums
  
  Availability: systems accessible when needed
    Controls: redundancy, backups, DDoS protection, disaster recovery

AUTHENTICATION FACTORS:
  Something you know:  password, PIN, security question
  Something you have:  OTP device, smart card, phone (TOTP app)
  Something you are:   fingerprint, face, iris (biometrics)
  MFA: combine 2+ factors → much stronger than single factor

COMMON ATTACK VECTORS:
  Phishing: fake email/site to steal credentials
    Spear phishing: targeted | Whaling: executives | Smishing: SMS
  
  Social Engineering: manipulate humans (weakest link)
    Pretexting: fabricated scenario | Baiting: USB drops
    Vishing: voice/phone | Tailgating: physical access
  
  Malware types:
    Virus: attaches to programs | Worm: self-replicating network
    Trojan: disguised as legitimate software
    Ransomware: encrypt files, demand payment (e.g., WannaCry)
    Spyware: hidden monitoring | Rootkit: hides itself in OS
    Botnet: compromised machines under attacker control

ENCRYPTION:
  Symmetric: same key encrypt/decrypt (AES-256) — fast, key distribution problem
  Asymmetric: public/private key pair (RSA, ECC) — slow, solves key distribution
  Hash functions: one-way (SHA-256, bcrypt) — not encryption, for integrity
  
  TLS handshake: asymmetric to exchange symmetric key → symmetric for data
  PKI: Certificate Authorities issue digital certificates (bind key to identity)

ACCESS CONTROL MODELS:
  DAC (Discretionary): owner sets permissions (Linux file permissions)
  MAC (Mandatory): system enforces labels (government, military)
  RBAC (Role-Based): permissions by job role (most common enterprise)
  ABAC (Attribute-Based): policies based on user/resource attributes
```

---

## Security+ Domain Quick Reference

```
RISK MANAGEMENT:
  Risk = Threat × Vulnerability × Impact
  Strategies: Accept | Transfer (insurance) | Mitigate | Avoid
  
  Vulnerability vs Threat vs Risk:
    Vulnerability: weakness (unpatched server)
    Threat: potential harm (attacker targeting unpatched server)
    Risk: likelihood × impact

INCIDENT RESPONSE (PICERL):
  Preparation → Identification → Containment → Eradication
  → Recovery → Lessons Learned

BUSINESS CONTINUITY:
  RTO (Recovery Time Objective): max acceptable downtime
  RPO (Recovery Point Objective): max acceptable data loss
  BCP: Business Continuity Plan | DRP: Disaster Recovery Plan

CRYPTOGRAPHY KEY LENGTHS:
  AES-128/256: symmetric | RSA-2048+: asymmetric
  SHA-256/512: hashing | ECC (256-bit ≈ RSA 3072-bit): efficient asymmetric
```

---

## Study Resources

- **Professor Messer** (professormesser.com) — free Security+ videos, best free resource
- **Darril Gibson books** — Security+ study guide
- **TryHackMe** — Pre-Security and SOC Level 1 paths (hands-on)
- **Cybrary** — free security courses
- **ISC² CC** — free certification for beginners (limited time)

## Revision Notes
```
CIA TRIAD: Confidentiality + Integrity + Availability — everything maps to these

AUTH FACTORS: know (password) + have (OTP/card) + are (biometric)
MFA: 2+ different factors — not just 2 passwords

ENCRYPTION:
  Symmetric (AES): fast, same key — use for bulk data
  Asymmetric (RSA): slow, key pair — use for key exchange + signatures
  Hashing (SHA): one-way, integrity verification

ATTACK TYPES: phishing/spear/whale/smish/vish | social engineering
Malware: virus/worm/trojan/ransomware/rootkit/botnet/spyware

RISK: Accept | Transfer | Mitigate | Avoid
IR: Prepare → Identify → Contain → Eradicate → Recover → Learn
```
