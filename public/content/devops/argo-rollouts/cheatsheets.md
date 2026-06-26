# Argo Rollouts Cheatsheet

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
spec:
  replicas: 10
  strategy:
    canary:
      steps:
      - setWeight: 10       # 10% traffic to new version
      - pause: {duration: 5m}
      - analysis:
          templates: [{templateName: success-rate}]
      - setWeight: 50
      - pause: {duration: 10m}
      - setWeight: 100
      canaryService: myapp-canary
      stableService: myapp-stable
---
kubectl argo rollouts get rollout myapp
kubectl argo rollouts promote myapp
kubectl argo rollouts abort myapp
kubectl argo rollouts undo myapp
```

## Quick Reference — Argo Rollouts

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

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*
