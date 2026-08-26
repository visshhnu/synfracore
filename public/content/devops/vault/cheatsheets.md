# Vault Quick Reference Cheatsheet

## Server Lifecycle

```
vault server -dev              # dev mode, in-memory, auto-unsealed
vault status                   # check sealed/unsealed
vault operator init             # ONE-TIME: generates unseal keys + root token
vault operator unseal <key>     # repeat until threshold met
```

## KV Secrets (v2)

```
vault secrets enable -path=secret kv-v2
vault kv put secret/app/db password=xyz
vault kv get secret/app/db
vault kv get -version=1 secret/app/db
vault kv delete secret/app/db          # recoverable
vault kv undelete -versions=1 secret/app/db
vault kv destroy -versions=1 secret/app/db   # permanent
```

## Dynamic Database Secrets

```
vault secrets enable database
vault write database/config/mydb plugin_name=postgresql-database-plugin ...
vault write database/roles/readonly creation_statements="..." default_ttl=1h
vault read database/creds/readonly       # brand-new credential each call
```

## PKI (Vault as a CA)

```
vault secrets enable pki
vault write pki/root/generate/internal common_name="example.com" ttl=87600h
vault write pki/roles/my-app allowed_domains="example.com" allow_subdomains=true
vault write pki/issue/my-app common_name="api.example.com"
```

## Transit (Encryption as a Service)

```
vault secrets enable transit
vault write -f transit/keys/my-key
vault write transit/encrypt/my-key plaintext=$(base64 <<< "data")
vault write transit/decrypt/my-key ciphertext="vault:v1:..."
vault write -f transit/keys/my-key/rotate
```

## Auth Methods

```
# AppRole (machine-to-machine)
vault auth enable approle
vault write auth/approle/role/my-app token_policies="my-policy"
vault read auth/approle/role/my-app/role-id
vault write -f auth/approle/role/my-app/secret-id
vault write auth/approle/login role_id=<id> secret_id=<id>

# Kubernetes (in-cluster Pods)
vault auth enable kubernetes
vault write auth/kubernetes/role/my-app \
  bound_service_account_names=my-app \
  bound_service_account_namespaces=production \
  policies=my-app-policy ttl=1h
```

## Policies

```
vault policy write my-policy my-policy.hcl
vault policy read my-policy
vault token create -policy="my-policy"
```

## Leases

```
vault read database/creds/readonly       # note the lease_id in output
vault lease renew <lease-id>
vault lease revoke <lease-id>
vault lease revoke -prefix database/creds/readonly/    # revoke ALL under a path
```

## Policy Capabilities

```
create, read, update, delete, list, sudo, deny
(deny-by-default: nothing granted unless a policy explicitly allows it)
```

## HA / Auto-Unseal Config Snippet

```hcl
storage "raft" {
  path    = "/vault/data"
  node_id = "vault-node-1"
}
seal "awskms" {
  region     = "us-east-1"
  kms_key_id = "alias/vault-unseal-key"
}
```
