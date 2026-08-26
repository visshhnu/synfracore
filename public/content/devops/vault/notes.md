# Vault Key Notes

## Core Concepts Quick Reference

| Concept | What It Is |
|---|---|
| Seal / Unseal | Vault starts encrypted-at-rest and inert; must be unsealed (Shamir threshold or auto-unseal via KMS) before serving requests |
| Secrets Engine | A plugin mounted at a path implementing a specific secret type (KV, database, PKI, Transit, AWS, etc.) |
| Auth Method | How a client proves identity (token, AppRole, Kubernetes, OIDC, etc.) — results in a Vault token |
| Policy | Path-based capability grants (read/write/delete/list/sudo) attached to an authenticated identity; deny-by-default |
| Lease | The record of a granted dynamic secret's TTL and revocation info |

## Command Reference

```
vault server -dev                          # dev-mode server (never production)
vault status                                # sealed/unsealed status
vault operator init                         # one-time: generates unseal keys + root token
vault operator unseal <key>                 # submit one unseal key share

vault secrets enable -path=<p> <engine>     # mount a secrets engine
vault secrets list                          # list mounted engines

vault kv put secret/<path> key=value        # write a KV secret (v2)
vault kv get secret/<path>                  # read latest version
vault kv get -version=N secret/<path>       # read a specific version

vault policy write <name> <file.hcl>        # create/update a policy
vault token create -policy="<name>"         # issue a scoped token

vault read database/creds/<role>            # generate dynamic DB credential
vault lease renew <lease-id>                # renew before expiry
vault lease revoke <lease-id>                # revoke immediately

vault write transit/encrypt/<key> plaintext=<b64>   # Transit encrypt
vault write transit/decrypt/<key> ciphertext=<ct>   # Transit decrypt
```

## Secrets Engines Quick Match

| Engine | Purpose |
|---|---|
| KV (v1/v2) | Static secret storage; v2 adds versioning |
| Database | Dynamic, short-lived database credentials |
| PKI | Dynamic, short-lived TLS certificates (Vault as a CA) |
| Transit | Encryption as a service — Vault never stores your data |
| AWS / Azure / GCP | Dynamic cloud provider credentials |
| SSH | One-time passwords or signed SSH certificates |

## Auth Methods Quick Match

| Method | Best Fit |
|---|---|
| Token | The base mechanism everything resolves to |
| AppRole | Machine-to-machine (CI/CD pipelines, services) |
| Kubernetes | In-cluster Pods, using their own ServiceAccount token |
| OIDC / LDAP | Human users, tied to existing identity providers |

## Token Types

```
Root token      — unlimited access, revoke/lock away after setup
Service token   — normal, policy-scoped, the default for apps/users
Batch token     — lightweight, non-renewable, no child tokens
Periodic token  — renewable indefinitely if renewed within each period
```

## HA / Storage Quick Facts

```
Raft integrated storage — Vault's own consensus-based storage,
  no separate Consul cluster required, tolerates node failures
  per majority-quorum math (same idea as odd-numbered Swarm/etcd)

Auto-unseal    — cloud KMS decrypts Vault's master key on restart,
                 no human intervention needed
Manual Shamir  — threshold of separately-held key shares required,
                 stronger "no single point of trust" property,
                 operationally heavier
```

## Enterprise-Only Features

```
Namespaces                    — multi-tenancy within one cluster
Performance Replication       — active-read secondary clusters
Disaster Recovery Replication — standby-only, promotable on primary loss
Sentinel                      — policy-as-code, richer than plain ACLs
```
