# Istio Cheatsheet

```bash
# Install
istioctl install --set profile=production
kubectl label namespace production istio-injection=enabled

# Traffic management
kubectl apply -f - <<EOF
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: myapp
spec:
  hosts: [myapp]
  http:
  - match:
    - headers: {x-canary: {exact: "true"}}
    route:
    - destination: {host: myapp, subset: v2}
  - route:
    - destination: {host: myapp, subset: v1}
      weight: 90
    - destination: {host: myapp, subset: v2}
      weight: 10
EOF

# Observability
istioctl dashboard kiali
istioctl dashboard jaeger
kubectl exec -it <pod> -c istio-proxy -- pilot-agent request GET stats
```
