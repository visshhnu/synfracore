# Route53 — Interview Questions

**What is the difference between an A record, CNAME, and ALIAS record?**
A record: maps domain directly to IPv4 address. CNAME: maps domain to another domain name (cannot be used at zone apex — e.g., example.com). ALIAS (AWS-specific): like CNAME but can be used at zone apex, resolves the target at query time, no extra DNS lookup, and is free for queries to AWS endpoints. Use ALIAS for: ALBs, CloudFront, S3 websites, API Gateway. Never use CNAME at the root domain.

**What is TTL and how does it affect DNS changes?**
TTL (Time To Live) in seconds tells resolvers how long to cache a DNS record. High TTL (86400 = 1 day): fewer DNS queries, faster resolution, cheaper. But changes propagate slowly — old value cached for up to 1 day. Low TTL (60s): changes propagate within a minute but more DNS queries (higher cost, slightly more latency). Best practice: lower TTL to 60s before planned changes, make the change, verify, then raise TTL back.

**How do Route53 health checks work for failover?**
Route53 health checks poll your endpoint (HTTP/HTTPS/TCP) from multiple AWS locations every 10 or 30 seconds. If the endpoint fails the configured failure threshold (e.g., 3 consecutive failures), Route53 marks it unhealthy. For failover routing, if the PRIMARY record's health check fails, Route53 automatically starts returning the SECONDARY record. DNS TTL must be low (≤60s) for fast failover. Health check threshold + TTL = effective failover time.

**What is a Route53 private hosted zone?**
A DNS zone only visible within specified VPCs — not on the public internet. Used for internal service discovery: `api.internal.company.com` resolves to private IPs. Associate with multiple VPCs in the same or different accounts. Useful for: microservice discovery, database endpoints, internal tools. Combine with Route53 Resolver for hybrid connectivity where on-premises servers can also resolve internal DNS names.
