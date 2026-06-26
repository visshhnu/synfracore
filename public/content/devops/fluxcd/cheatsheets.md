# FluxCD Cheatsheet

```bash
# Install
flux install
flux check

# Bootstrap (GitHub)
flux bootstrap github --owner=<org> --repository=<repo> --path=clusters/production

# Sources
flux create source git myapp --url=https://github.com/org/repo --branch=main
flux get sources git

# Kustomization
flux create kustomization myapp --source=myapp --path=./k8s --prune=true --interval=5m
flux get kustomizations
flux reconcile kustomization myapp

# HelmRelease
flux create helmrelease myapp --chart=myapp --source=HelmRepository/stable --chart-version=">=1.0.0"
flux get helmreleases

# Debug
flux logs --all-namespaces
flux events
```

## Quick Reference — Fluxcd

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
