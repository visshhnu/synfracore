# Kubernetes Quick Reference

```bash
# Context and namespace
kubectl config get-contexts
kubectl config use-context <name>
kubectl config set-context --current --namespace=<ns>

# Pods
kubectl get pods -A                          # all namespaces
kubectl get pods -o wide                     # with node/IP info
kubectl describe pod <name>                  # events + spec
kubectl logs <pod> -c <container>            # container logs
kubectl logs <pod> --previous               # previous crash logs
kubectl exec -it <pod> -- /bin/bash         # shell into pod
kubectl port-forward pod/<name> 8080:80     # local port forward

# Deployments
kubectl rollout status deployment/<name>
kubectl rollout history deployment/<name>
kubectl rollout undo deployment/<name>
kubectl rollout undo deployment/<name> --to-revision=2
kubectl scale deployment/<name> --replicas=5
kubectl set image deployment/<name> <container>=<image>:<tag>

# Services
kubectl get svc
kubectl expose deployment <name> --port=80 --target-port=8080

# Debugging
kubectl get events --sort-by='.lastTimestamp' -n <ns>
kubectl top nodes
kubectl top pods -n <ns>
kubectl debug node/<node> -it --image=busybox

# RBAC
kubectl auth can-i create pods --as=<user>
kubectl auth can-i '*' '*'                   # check cluster-admin

# Apply and delete
kubectl apply -f manifest.yaml
kubectl delete -f manifest.yaml
kubectl apply -k ./overlays/production       # Kustomize

# Drain and cordon
kubectl cordon <node>                        # stop new pods
kubectl drain <node> --ignore-daemonsets --delete-emptydir-data
kubectl uncordon <node>
```

## Quick Reference — Kubernetes

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
