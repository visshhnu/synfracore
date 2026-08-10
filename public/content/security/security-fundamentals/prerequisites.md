# Security Fundamentals — Prerequisites

## What You Need Before Starting

Security fundamentals sits on top of general IT/networking/OS knowledge — it's a lens applied to systems you should already have some working familiarity with, not a completely standalone starting point. This course's own framing ("every DevOps, cloud, and platform engineer needs foundational security knowledge") assumes you're coming in with at least some engineering background already, even if security specifically is new to you.

### 1. Basic networking concepts (required)

You should already understand, at least at a conceptual level:
- IP addresses, ports, and the difference between TCP and UDP
- What DNS does
- What a firewall does (allow/block based on rules)
- The basic client-server request/response model (how a browser talking to a web server actually works)

If these are unfamiliar, foundational networking material should come first — a large share of this course's content (firewalls, TLS, network segmentation, SSRF) assumes you already have the underlying networking vocabulary and isn't the place to learn it for the first time.

### 2. Basic Linux/command-line comfort (required)

Much of this course's material is delivered as shell commands and config files (`openssl`, `chmod`, `iptables`, YAML for Kubernetes security contexts). You should be able to:
- Navigate a filesystem and understand basic file permissions (`chmod`, `chown`)
- Run and understand the output of simple commands
- Edit a text file at the command line

If you're not yet comfortable here, spend time on general Linux fundamentals first — trying to learn `chmod 600` for the first time *and* why SSH private keys need that specific permission level, simultaneously, is harder than learning them one at a time.

### 3. Basic understanding of how web applications work (required)

You don't need to be a web developer, but you should understand the pieces well enough that terms like "request," "response," "cookie," "session," and "API endpoint" aren't new vocabulary. A meaningful amount of this course's material (SQL injection, XSS, CSRF, IDOR, SSRF) is fundamentally about how web applications can be attacked — and that's much harder to reason about if the underlying concept of how a web application normally works isn't already familiar.

### 4. Basic programming/scripting exposure (recommended, not a hard blocker)

This course includes real Python (encryption libraries, JWT handling, IAM permission-check logic) and bash examples throughout. You don't need to be a professional developer, but comfort reading code (even if you couldn't write it from scratch yet) will make the Fundamentals and Intermediate sections land much faster. If you have zero programming exposure at all, it's reasonable to start this material anyway and pick up basic Python alongside it — but expect the code examples specifically to take more effort to parse until that catches up.

### 5. What you do *not* need yet

- A security-specific background or certification — this course is explicitly positioned as the foundational layer, not something that assumes prior security knowledge
- Deep cryptography mathematics — you need to understand what symmetric/asymmetric encryption and hashing *do* and when to use each, not the underlying number theory of how RSA actually works mathematically
- Cloud platform expertise — several examples reference AWS-specific services (Secrets Manager, IAM, S3) to ground concepts in something concrete, but you don't need prior AWS experience; the underlying security concept transfers to any cloud provider

### Quick self-check

If someone said "this API endpoint doesn't check whether the logged-in user actually owns the resource ID they're requesting in the URL," would that sentence make sense to you without needing every term explained? If yes, you're ready for the Fundamentals section — that's describing an IDOR vulnerability, one of the concepts this course covers early. If terms like "endpoint," "logged-in user," or "resource ID" needed unpacking, spend a bit more time on prerequisite #3 first.
