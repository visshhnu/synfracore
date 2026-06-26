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

## Quick Reference — Istio

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.
