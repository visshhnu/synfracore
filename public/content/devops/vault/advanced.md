# Vault Advanced — HA, Disaster Recovery & Enterprise Patterns

## High Availability with Raft Integrated Storage

```bash
# Raft storage config (server.hcl) -- Vault's own consensus-based
# storage backend, no separate Consul cluster required
storage "raft" {
  path    = "/vault/data"
  node_id = "vault-node-1"

  retry_join {
    leader_api_addr = "https://vault-node-2:8200"
  }
  retry_join {
    leader_api_addr = "https://vault-node-3:8200"
  }
}

cluster_addr = "https://vault-node-1:8201"
api_addr     = "https://vault-node-1:8200"
```

Modern Vault deployments commonly use integrated Raft storage rather than a separate Consul cluster — Raft (the same consensus algorithm underlying Consul and Kubernetes' etcd) provides its own leader election and data replication across Vault nodes, meaning a 3-or-5-node Vault cluster can tolerate node failures (per Raft's usual majority-quorum math) without requiring a separately-operated storage cluster alongside it.

## Standby Nodes and Request Forwarding

```
Active node    — the current Raft leader, handles all read/write
                 requests directly
Standby nodes  — unsealed, but forward incoming requests to the
                 active node rather than serving them locally
                 (in most configurations) -- kept ready for
                 automatic failover if the active node goes down
```

In an HA Vault cluster, only the current leader actively processes requests by default — standby nodes stay unsealed and ready, forwarding client requests to the active node, and are positioned to take over automatically (a new Raft leader election) if the active node fails, without requiring manual intervention to restore service.

## Disaster Recovery Replication (Enterprise)

```
Performance Replication (Enterprise) — replicates secrets/config
  to a secondary cluster that can ALSO actively serve read
  traffic, for geo-distributed read performance

Disaster Recovery Replication (Enterprise) — replicates to a
  secondary cluster kept purely as a standby, promotable to
  primary if the entire primary cluster is lost
```

Both replication types are Vault Enterprise features (not available in open-source Vault), addressing genuinely different problems — Performance Replication is about serving reads closer to geographically distributed clients; DR Replication is purely about surviving the total loss of an entire primary cluster/region, with the secondary promoted to become the new primary only in that failure scenario.

## Namespaces (Enterprise) — multi-tenancy within one Vault cluster

```bash
vault namespace create team-a
vault namespace create team-b

# Operations within a namespace are scoped/isolated from others
vault login -namespace=team-a <token>
vault kv put -namespace=team-a secret/app/config key=value
```

Namespaces let a single Vault Enterprise cluster host genuinely isolated tenants (different teams, different business units) with their own separately-managed policies, auth methods, and secrets engines — avoiding either running entirely separate Vault clusters per team (operational overhead) or forcing every team into one shared, unisolated namespace (a real cross-tenant access risk).

## Auto-Unseal in Depth

```hcl
# seal "awskms" block -- Vault delegates the unseal-key-protection
# problem to the cloud provider's own KMS entirely
seal "awskms" {
  region     = "us-east-1"
  kms_key_id = "alias/vault-unseal-key"
}
```

With auto-unseal, Vault encrypts its own master key with a key held in the cloud KMS, rather than splitting it into Shamir shares held by humans — on restart, Vault calls the KMS to decrypt its master key automatically. This trades Shamir's "no single human/system can unseal alone" property for genuinely resilient, automatic operational recovery — a real, deliberate tradeoff, which is why some very-high-security root-of-trust deployments still prefer manual Shamir unsealing for the outermost layer of trust despite the operational cost.

## Sentinel Policy-as-Code (Enterprise)

```
Sentinel policies can enforce rules BEYOND simple path-based ACLs --
e.g. "certificates issued by the PKI engine must have a TTL under
24 hours" or "database credentials can only be requested during
business hours" -- genuinely richer conditional logic than a plain
policy's capability grants alone can express.
```

Where standard Vault policies grant or deny access to specific paths/capabilities, Sentinel (also used in Terraform Enterprise/HCP Terraform, the same policy-as-code engine) can enforce conditional business logic ABOUT those requests — a meaningfully more expressive governance layer for organizations with compliance requirements beyond simple access control.

## Vault Agent — automating the auth-and-fetch pattern

```hcl
# vault-agent.hcl
auto_auth {
  method "kubernetes" {
    mount_path = "auth/kubernetes"
    config = { role = "my-app" }
  }
  sink "file" {
    config = { path = "/vault/token" }
  }
}

template {
  source      = "/vault/templates/db-creds.tpl"
  destination = "/vault/secrets/db-creds.txt"
}
```

Vault Agent runs as a sidecar, handling authentication (re-authenticating automatically as needed) and rendering secrets to a file the main application container reads — the application itself never needs Vault-specific client code at all, just needs to read a file Agent keeps populated with current, valid secrets, including automatically renewing/re-fetching before expiry.

## Try It (2 Minutes)

Using the HA/standby section above:

1. In a 3-node Raft-based Vault cluster, if the current active (leader) node crashes, does the entire cluster go down until a human manually intervenes?
2. What's the key difference between Performance Replication and Disaster Recovery Replication?
3. Why might a very-high-security deployment still prefer manual Shamir unsealing over auto-unseal, despite auto-unseal's operational convenience?

You should land on: no — Raft's consensus mechanism triggers automatic leader election among the remaining nodes, restoring service without manual intervention, assuming quorum is maintained; Performance Replication serves active read traffic from a geographically distributed secondary; DR Replication is a pure standby, only promoted to primary if the whole primary cluster is lost; manual Shamir unsealing enforces that no single human or system alone can unseal Vault (requiring a THRESHOLD of separate key holders to cooperate), a stronger "no single point of trust" property than auto-unseal's reliance on one cloud KMS having that power alone.
