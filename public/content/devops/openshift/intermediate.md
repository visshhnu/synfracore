# OpenShift — SCC, Routes & Operators in Practice

## Security Context Constraints: the actual troubleshooting flow

The single most common day-1 OCP error — *"unable to validate against any security context constraint"* — means the pod's security requirements (running as a specific UID, requiring host access, whatever it's asking for) don't match any SCC the pod's ServiceAccount is bound to. The fix is almost never "grant broader access" as a first move:

```bash
oc get scc                                    # list available SCCs
oc describe scc restricted                     # see what "restricted" actually allows
oc adm policy add-scc-to-user anyuid -z myapp-sa -n production   # bind a specific SCC to a specific SA
```

**`anyuid`** is a common, real fix for legacy applications hardcoded to run as a specific non-root UID that doesn't match `restricted`'s auto-assigned UID range — it's a targeted exception, not a broad relaxation. **Never reach for `privileged`** as a quick fix; it grants essentially unrestricted host access and should be reserved for genuinely privileged workloads (CNI plugins, node-level agents), not application troubleshooting.

## Routes: the three TLS termination modes, precisely

- **Edge**: TLS terminates at the router (HAProxy); traffic to the pod is plain HTTP. Simplest, and the router can inspect/route based on the actual request content.
- **Passthrough**: TLS is never terminated at the router — it passes through encrypted all the way to the pod, which handles TLS itself. The router can't inspect the request (it's encrypted to the router too), only route based on SNI hostname.
- **Re-encrypt**: TLS terminates at the router, then a *new* TLS connection is established to the pod — encrypted end-to-end, but the router can still inspect the decrypted request in between.

The real decision: Edge is the default, simplest choice when the pod doesn't need to handle TLS itself. Passthrough is needed when the application specifically requires seeing the original client certificate or the router genuinely shouldn't be able to decrypt traffic. Re-encrypt is the choice when you need both end-to-end encryption *and* router-level request inspection/routing — a real, non-trivial tradeoff, not just "more secure equals better" by default (Passthrough often *feels* more secure but actually gives the router less visibility to make good routing/security decisions).

## Route weights: A/B and canary traffic splits, without extra tooling

```yaml
apiVersion: route.openshift.io/v1
kind: Route
metadata: { name: myapp }
spec:
  to: { kind: Service, name: myapp-stable, weight: 90 }
  alternateBackends:
  - { kind: Service, name: myapp-canary, weight: 10 }
```
This gives basic weighted traffic splitting natively through the Route object itself — for more sophisticated progressive delivery (automated analysis, gradual weight shifting with rollback), Argo Rollouts still adds real value on top of this, but for a simple, manually-controlled canary split, Routes alone are often sufficient.

## Operators and OLM: subscription approval strategy matters for production

```yaml
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata: { name: my-operator }
spec:
  channel: stable
  installPlanApproval: Manual   # don't auto-upgrade in production
  name: my-operator
  source: redhat-operators
```
`installPlanApproval: Automatic` (the default) means an operator upgrade published upstream applies to your cluster on its own schedule, not yours — genuinely risky for production, where an unplanned operator upgrade could introduce a breaking change with no warning. `Manual` requires explicit approval of each `InstallPlan` before it applies — the correct default for anything production-critical, even though it means someone needs to actively review and approve upgrades rather than getting them automatically.

## MachineConfig: real, disruptive changes — plan for the reboot

```yaml
apiVersion: machineconfiguration.openshift.io/v1
kind: MachineConfig
metadata: { name: 99-worker-custom-sysctl, labels: { machineconfiguration.openshift.io/role: worker } }
spec:
  config:
    systemd:
      units:
      - name: custom.service
        enabled: true
```
Applying a `MachineConfig` change triggers the Machine Config Operator to perform a real, rolling drain-and-reboot across every node in the affected `MachineConfigPool` — this is not a lightweight, in-place config update. Scheduling this deliberately (maintenance window, one pool at a time) rather than treating it like an ordinary Kubernetes config change is a genuinely important operational distinction specific to OCP.
