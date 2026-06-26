# Helm Quick Reference

```bash
# Install/Upgrade
helm install myapp ./chart -f values.yaml -n production
helm upgrade myapp ./chart -f values.yaml --install -n production
helm upgrade myapp ./chart --set image.tag=v2.0 --atomic

# View
helm list -A
helm status myapp -n production
helm history myapp -n production
helm get values myapp -n production
helm get manifest myapp -n production

# Rollback
helm rollback myapp 2 -n production   # rollback to revision 2

# Test
helm template myapp ./chart -f values.yaml    # render without applying
helm lint ./chart                              # lint for errors
helm diff upgrade myapp ./chart              # show diff (helm-diff plugin)
helm test myapp -n production                 # run test hooks

# Registry (OCI)
helm registry login registry.example.com
helm push mychart-0.1.0.tgz oci://registry.example.com/charts
helm install myapp oci://registry.example.com/charts/mychart --version 0.1.0

# Chart structure
# Chart.yaml    — metadata (name, version, description)
# values.yaml   — default values
# templates/    — Kubernetes YAML templates with {{ }} expressions
# charts/       — dependency charts
```

## Quick Reference — Helm

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
