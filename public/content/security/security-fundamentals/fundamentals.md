# Security Fundamentals — Core Concepts

## CIA Triad

```
Confidentiality: Only authorized parties can access data
  Controls: Encryption, access control, authentication

Integrity: Data is accurate and has not been tampered with
  Controls: Hashing, digital signatures, checksums, audit logs

Availability: Systems are accessible when needed
  Controls: Redundancy, backups, DDoS protection, DR planning
```

## Authentication vs Authorization

```
Authentication (AuthN): Who are you?
  Verifying identity: password, biometric, certificate, OTP
  
Authorization (AuthZ): What can you do?
  Verifying permissions: RBAC, ABAC, ACL

Protocols:
  OAuth 2.0: Authorization framework (delegated access)
  OIDC: Authentication layer on top of OAuth 2.0
  SAML 2.0: Enterprise SSO (XML-based, legacy)
  JWT: Stateless token format (not a protocol — a format)
```

## Encryption

```python
# Symmetric encryption — same key to encrypt and decrypt
# AES-256-GCM: current standard for data at rest
from cryptography.hazmat.primitives.ciphers.aead import AESGCM
import os

key = AESGCM.generate_key(bit_length=256)
aes = AESGCM(key)
nonce = os.urandom(12)          # 96-bit nonce, never reuse!
ciphertext = aes.encrypt(nonce, b"secret data", b"associated data")
plaintext = aes.decrypt(nonce, ciphertext, b"associated data")

# Asymmetric encryption — public key encrypts, private key decrypts
# RSA-2048: Use for key exchange, signatures
# ECDSA P-256: Smaller, faster — preferred for TLS, JWTs
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.hazmat.primitives import hashes

private_key = rsa.generate_private_key(public_exponent=65537, key_size=2048)
public_key = private_key.public_key()

# Encrypt with public key (only private key can decrypt)
ciphertext = public_key.encrypt(b"secret", padding.OAEP(
    mgf=padding.MGF1(algorithm=hashes.SHA256()),
    algorithm=hashes.SHA256(),
    label=None
))

# Password hashing — NEVER encrypt passwords, HASH them
import bcrypt
password_hash = bcrypt.hashpw(b"user_password", bcrypt.gensalt(rounds=12))
valid = bcrypt.checkpw(b"user_password", password_hash)

# Modern alternative: argon2
from argon2 import PasswordHasher
ph = PasswordHasher(time_cost=3, memory_cost=65536, parallelism=4)
hash = ph.hash("user_password")
ph.verify(hash, "user_password")  # raises VerifyMismatchError if wrong
```

## OWASP Top 10 — Quick Reference

```
A01 Broken Access Control
  Attack: Accessing other users' data by changing an ID in the URL
  Defense: Always check authorization server-side, never trust client input
  
A02 Cryptographic Failures
  Attack: Sensitive data in plaintext, weak encryption (MD5, SHA1 for passwords)
  Defense: TLS everywhere, AES-256, bcrypt/argon2 for passwords
  
A03 Injection (SQL, Command, LDAP)
  Attack: ' OR 1=1 -- in login form, ; rm -rf / in OS commands
  Defense: Parameterized queries, input validation, principle of least privilege

A04 Insecure Design
  Attack: Logic flaws, missing rate limiting, no fraud checks
  Defense: Threat modeling, security requirements in design phase

A05 Security Misconfiguration
  Attack: Default credentials, debug mode on, unnecessary services running
  Defense: Hardening guides, CIS benchmarks, security baselines

A06 Vulnerable Components
  Attack: Known CVEs in libraries (Log4Shell, Struts, etc.)
  Defense: SCA tools (Snyk, Dependabot), keep dependencies updated

A07 Auth/Session Failures
  Attack: Brute force, weak passwords, session fixation, credential stuffing
  Defense: MFA, lockouts, strong session management, password policies

A08 Integrity Failures
  Attack: Tampered serialized objects, malicious CI/CD pipeline
  Defense: Digital signatures, verify checksums, secure CI/CD

A09 Logging Failures
  Attack: Attacks go undetected, no forensic evidence
  Defense: Centralized logging, alerting on anomalies, tamper-evident logs

A10 SSRF (Server-Side Request Forgery)
  Attack: Server makes requests to internal services (metadata API, internal APIs)
  Defense: Allowlist external URLs, block private IP ranges, disable unnecessary URL schemes
```

## SQL Injection — Prevention

```python
# VULNERABLE — never do this
def get_user_bad(user_id: str):
    query = f"SELECT * FROM users WHERE id = {user_id}"
    # Attacker passes: "1 OR 1=1 --" → returns ALL users
    return db.execute(query)

# SAFE — parameterized queries
def get_user_good(user_id: int):
    return db.execute("SELECT * FROM users WHERE id = %s", (user_id,))

# SQLAlchemy ORM (inherently safe)
user = session.query(User).filter(User.id == user_id).first()

# Always validate and sanitize inputs
def get_user_validated(user_id: str) -> dict:
    if not user_id.isdigit():
        raise ValueError("user_id must be numeric")
    return db.execute("SELECT * FROM users WHERE id = %s", (int(user_id),))
```

## Secrets Management

```bash
# Never hardcode secrets in code or config files
# Never put secrets in environment variables in docker-compose.yml in git

# AWS Secrets Manager
aws secretsmanager create-secret \
  --name prod/myapp/db-password \
  --secret-string "$(openssl rand -base64 32)"

# Retrieve in app
import boto3, json
secret = json.loads(
    boto3.client('secretsmanager').get_secret_value(
        SecretId='prod/myapp/db-password'
    )['SecretString']
)

# HashiCorp Vault
vault kv put secret/myapp/db password="$(openssl rand -base64 32)"
vault kv get secret/myapp/db

# Kubernetes Secrets (base64 encoded, encrypted at rest with KMS)
kubectl create secret generic db-secret \
  --from-literal=password="$(openssl rand -base64 32)"
```
