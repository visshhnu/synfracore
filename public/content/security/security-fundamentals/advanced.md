# Security Fundamentals — Advanced

## Secrets Management at Scale

```python
# HashiCorp Vault — enterprise secrets management

import hvac, os

# Connect to Vault
client = hvac.Client(
    url='https://vault.example.com:8200',
    token=os.environ['VAULT_TOKEN']
)

# Store and retrieve secrets
client.secrets.kv.v2.create_or_update_secret(
    path='myapp/prod/database',
    secret={'host': 'db.prod.internal', 'password': 'strong-random-password'}
)

secret = client.secrets.kv.v2.read_secret_version(
    path='myapp/prod/database'
)
db_config = secret['data']['data']

# Dynamic secrets — Vault creates time-limited DB credentials
# Much safer: no long-term credentials stored anywhere
mount = client.sys.enable_secrets_engine(backend_type='database', path='database')

client.write(
    'database/config/my-postgres',
    plugin_name='postgresql-database-plugin',
    connection_url='postgresql://vault:{{password}}@postgres:5432/myapp',
    allowed_roles='myapp-role',
    username='vault_admin',
    password='vault_admin_pass'
)

client.write(
    'database/roles/myapp-role',
    db_name='my-postgres',
    creation_statements=["""
        CREATE ROLE "{{name}}" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';
        GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO "{{name}}";
    """],
    default_ttl='1h',
    max_ttl='24h'
)

# App requests credentials → gets unique short-lived creds
creds = client.read('database/creds/myapp-role')
print(creds['data']['username'])  # v-token-xxxx
print(creds['data']['password'])  # auto-generated
# Credentials expire after 1h — no rotation needed!
```

## Threat Modeling

```
STRIDE threat model for a web application:

S — Spoofing:        Impersonating another user or system
  Threats:           Stolen JWT, credential stuffing, MITM
  Mitigations:       MFA, short token TTL, device binding

T — Tampering:       Modifying data in transit or at rest
  Threats:           SQL injection, CSRF, man-in-the-middle
  Mitigations:       Input validation, HTTPS, HMAC signatures

R — Repudiation:     Denying an action was performed
  Threats:           Log deletion, log forgery
  Mitigations:       Tamper-evident logs, CloudTrail, WORM storage

I — Information Disclosure: Exposing sensitive data
  Threats:           IDOR, verbose errors, path traversal
  Mitigations:       Authz checks, error handling, encryption

D — Denial of Service: Making system unavailable
  Threats:           DDoS, resource exhaustion, algorithmic attacks
  Mitigations:       Rate limiting, WAF, CDN, circuit breakers

E — Elevation of Privilege: Gaining higher access
  Threats:           SQL injection to admin, insecure deserialization
  Mitigations:       Least privilege, input validation, RBAC
```

## Security Cheatsheet

```bash
# ── TLS / CERTIFICATES ────────────────────────────────────
openssl s_client -connect host:443 -servername host    # Inspect cert
openssl x509 -in cert.pem -text -noout                 # Parse cert
openssl x509 -noout -dates -in cert.pem                # Expiry dates
openssl verify -CAfile ca.pem cert.pem                 # Verify chain
openssl req -new -newkey rsa:2048 -nodes -keyout k.pem -out csr.pem  # Generate CSR
openssl pkcs12 -export -out bundle.pfx -inkey k.pem -in cert.pem     # Create PFX

# ── HASHING AND ENCRYPTION ────────────────────────────────
echo -n "password" | sha256sum                         # SHA256 hash
openssl rand -base64 32                                # Random 32-byte key
openssl enc -aes-256-cbc -salt -in plain.txt -out encrypted.bin -k password
openssl enc -d -aes-256-cbc -in encrypted.bin -out plain.txt -k password

# ── JWT ───────────────────────────────────────────────────
# Decode JWT (base64 decode each section)
echo "eyJhbGciOi..." | cut -d. -f2 | base64 -d 2>/dev/null | jq .

# ── SECRET SCANNING ───────────────────────────────────────
gitleaks detect --source .              # Scan for secrets in git repo
trufflehog git https://github.com/...  # Scan GitHub repo
trivy fs --security-checks secret .    # Trivy secret scan

# ── NETWORK SECURITY ──────────────────────────────────────
nmap -sV -sC target.host               # Service + script scan
nmap -p- --min-rate=1000 target        # Full port scan
nikto -h https://target.com            # Web vuln scanner
sslyze --regular target.com:443        # SSL/TLS analysis
```
