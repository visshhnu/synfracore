# Vault Intermediate — PKI, Encryption as a Service & Dynamic Secrets in Depth

## PKI Secrets Engine — Vault as a private certificate authority

```bash
# Enable and configure a root CA
vault secrets enable pki
vault secrets tune -max-lease-ttl=87600h pki
vault write pki/root/generate/internal \
  common_name="internal.example.com" ttl=87600h

# Configure a role defining what certificates can be issued
vault write pki/roles/my-app \
  allowed_domains="internal.example.com" \
  allow_subdomains=true \
  max_ttl="72h"

# Issue a SHORT-LIVED certificate on demand
vault write pki/issue/my-app common_name="api.internal.example.com"
# Returns: certificate, private_key, ca_chain, and a TTL
```

The same dynamic-secrets philosophy applies to certificates as to database credentials — instead of a long-lived TLS certificate manually rotated (or, worse, forgotten and left to expire unexpectedly), Vault's PKI engine issues short-lived certificates on demand, automatically expiring rather than requiring a manual rotation process most teams historically get wrong under time pressure.

## Intermediate CAs — why production PKI setups don't issue directly from the root

```bash
# Root CA signs an intermediate CA's CSR, keeping the root itself
# offline/unused for day-to-day certificate issuance
vault secrets enable -path=pki_int pki
vault write pki_int/intermediate/generate/internal \
  common_name="internal.example.com Intermediate Authority"
# The resulting CSR gets signed by the ROOT CA, then the signed
# intermediate certificate is set on the intermediate mount
```

Keeping the root CA's private key maximally protected (ideally never used for routine issuance at all) while an intermediate CA handles actual day-to-day certificate issuance limits the blast radius if the intermediate is ever compromised — the root can revoke and replace a compromised intermediate without needing to re-establish trust from scratch across every system that trusts the root.

## Transit Secrets Engine — Encryption as a Service

```bash
vault secrets enable transit
vault write -f transit/keys/my-app-key

# Encrypt data WITHOUT Vault ever storing the plaintext or the
# resulting ciphertext -- Vault only performs the crypto operation
vault write transit/encrypt/my-app-key plaintext=$(base64 <<< "sensitive data")
# Returns: ciphertext (vault:v1:...)

vault write transit/decrypt/my-app-key ciphertext="vault:v1:..."
# Returns: plaintext (base64-encoded)
```

The Transit engine is a fundamentally different pattern from KV or dynamic secrets — Vault never stores your actual data at all, only the encryption keys, performing encrypt/decrypt operations as a service. This is "encryption as a service": an application can encrypt/decrypt data using Vault-managed keys without ever needing to handle raw key material itself, and key rotation happens centrally without the application needing any code change.

```bash
# Key rotation: create a new version of the key -- old ciphertexts
# encrypted under the previous version remain decryptable
vault write -f transit/keys/my-app-key/rotate

# rewrap re-encrypts existing ciphertext under the LATEST key
# version, without ever exposing the plaintext to the caller
vault write transit/rewrap/my-app-key ciphertext="vault:v1:..."
```

## Response Wrapping — passing a secret through an untrusted intermediary safely

```bash
vault write -wrap-ttl=120s -f auth/approle/role/my-app/secret-id
# Returns a single-use wrapping token, NOT the actual secret
```

If a secret needs to pass through a system that shouldn't itself be able to read it (a CI orchestration layer, a deployment pipeline), response wrapping returns a single-use token wrapping the actual response — only the intended final recipient, unwrapping it once, ever sees the real secret. If the wrapping token is intercepted and used by someone else first, the legitimate recipient's own unwrap attempt fails, which itself is a strong tamper-detection signal (someone else already consumed it).

## Dynamic Secrets Beyond Databases

Vault's dynamic-secrets model extends well beyond database credentials — the same "generate on demand, short TTL, auto-revoke" pattern applies to cloud provider credentials (AWS IAM users/STS tokens, Azure service principals, GCP service accounts), SSH one-time passwords/signed certificates, and more. The specific secrets engine differs, but the underlying philosophy — a leaked credential should have a short, bounded useful life by design — is consistent across all of them.

```bash
# AWS secrets engine: generate short-lived AWS credentials on demand
vault secrets enable aws
vault write aws/config/root \
  access_key=<admin-access-key> secret_key=<admin-secret-key> region=us-east-1
vault write aws/roles/my-app \
  credential_type=iam_user \
  policy_document=-<<EOF
{"Version": "2012-10-17", "Statement": [{"Effect": "Allow", "Action": "s3:GetObject", "Resource": "*"}]}
EOF

vault read aws/creds/my-app
# Returns a brand-new AWS access key/secret key pair, auto-revoked
# (the underlying IAM user deleted) when the lease expires
```

## Try It (2 Minutes)

Using the Transit engine section above:

1. If a database storing Transit-encrypted ciphertext is fully compromised (an attacker gets read access to every row), can the attacker decrypt the data without also compromising Vault itself?
2. After rotating a Transit key, do OLD ciphertexts encrypted under the previous key version instantly become undecryptable?
3. What's the practical benefit of `rewrap` after a key rotation, given old ciphertexts still decrypt fine without it?

You should land on: no — the database only ever stored ciphertext; the actual encryption key material lives in Vault, which the attacker would need to separately compromise to decrypt anything; no — Vault retains old key versions specifically so previously-encrypted data remains decryptable, rotation doesn't invalidate old ciphertexts; rewrap re-encrypts data under the newest key version without ever exposing plaintext, useful for eventually retiring old key versions entirely once nothing depends on them anymore, and for defense-in-depth (limiting how much data any single key version's compromise would expose).
