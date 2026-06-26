# Harbor Cheatsheet

```bash
# Login
docker login harbor.example.com -u admin

# Push image
docker tag myapp:v1 harbor.example.com/myproject/myapp:v1
docker push harbor.example.com/myproject/myapp:v1

# Pull
docker pull harbor.example.com/myproject/myapp:v1

# Scan image via API
curl -X POST "https://harbor.example.com/api/v2.0/projects/myproject/repositories/myapp/artifacts/v1/scan"   -H "Authorization: Basic $(echo -n 'admin:password' | base64)"

# Helm chart push (OCI)
helm push mychart-0.1.0.tgz oci://harbor.example.com/myproject
```

## Key Concepts
- Project: namespace for images. Public or private.
- Robot account: service account for CI/CD (scoped permissions)
- Retention policy: auto-delete old images by tag/count
- Replication: sync with remote registries
- Notary/Content Trust: sign images for supply chain security

## Quick Reference — Harbor

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
