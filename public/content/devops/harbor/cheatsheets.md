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
