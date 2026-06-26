# Platform Engineering vs SRE vs DevOps

> **Three roles clarified — what each does, how they differ, interview answers**

**Category:** Site Reliability Engineering  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Platform Engineering vs SRE vs DevOps?

These three terms are often confused but have distinct meanings. DevOps is a culture — break silos between Dev and Ops, automate everything, developers own their deployments. SRE is Google's implementation of DevOps — uses software engineering to solve operations problems, defines SLOs, manages error budgets. Platform Engineering builds the internal platform that developers use — the golden path, the paved road. Interviewers test this distinction at senior levels.

## Why Platform Engineering vs SRE vs DevOps?

An Internal Developer Platform (IDP) is what the Platform Engineering team builds. It gives application developers a self-service portal to deploy applications, spin up databases, create pipelines — without knowing Kubernetes or Terraform internals. Backstage (from Spotify, now CNCF) is the most popular IDP portal. The golden path is the opinionated, well-supported way to do something — new service scaffold, standard Helm chart, standard pipeline template.

---

## Learning Modules

### Module 01 — DevOps vs SRE vs Platform Engineering
*Definitions and real differences*

These three terms are often confused but have distinct meanings. DevOps is a culture — break silos between Dev and Ops, automate everything, developers own their deployments. SRE is Google's implementation of DevOps — uses software engineering to solve operations problems, defines SLOs, manages error budgets. Platform Engineering builds the internal platform that developers use — the golden path, the paved road. Interviewers test this distinction at senior levels.

**Topics covered:**

- DevOps — culture and philosophy — 🟢 Beginner
- SRE — Google implementation of DevOps — 🟢 Beginner
- Platform Engineering — internal developer platform — 🟡 Intermediate
- Which role are you interviewing for? — 🟡 Intermediate
- Salary and career progression — 🟢 Beginner

```bash
# DevOps (culture + practices):
# - Break silos between Dev and Ops
# - Developers own their deployments
# - Automate everything
# - Fast feedback loops
# - CI/CD, IaC, monitoring are the tools
# Anyone can be "doing DevOps" — it is a culture, not a job

# SRE (Google implementation of DevOps):
# - Software engineers solving operations problems
# - Defines SLOs, measures SLIs, manages error budgets
# - On-call rotation with escalation procedures
# - Toil reduction — automate repetitive ops work
# - Postmortem culture — blameless RCA
# Job title: Site Reliability Engineer

# Platform Engineering:
# - Builds the Internal Developer Platform (IDP)
# - Goal: developer self-service
# - "Golden path" — opinionated, supported, paved road
# - Tools: Backstage (portal), Crossplane, Terraform modules
# - Reduces cognitive load on application developers
# - Team Topologies: Platform team enables Stream-aligned teams
# Job title: Platform Engineer / Staff Engineer

# INTERVIEW ANSWER:
# "DevOps is the culture we all work in.
# SRE is how we operationalise reliability — SLOs, error budgets,
# on-call practices.
# Platform Engineering is the work of building internal tools
# and golden paths so developers can deploy without needing
# to understand Kubernetes internals.
# In my current role I do all three: I maintain SLOs (SRE),
# I build shared Terraform modules and CI templates (Platform),
# and I work closely with developers to remove friction (DevOps)."
```

### Module 02 — Internal Developer Platform
*Backstage, golden paths, self-service*

An Internal Developer Platform (IDP) is what the Platform Engineering team builds. It gives application developers a self-service portal to deploy applications, spin up databases, create pipelines — without knowing Kubernetes or Terraform internals. Backstage (from Spotify, now CNCF) is the most popular IDP portal. The golden path is the opinionated, well-supported way to do something — new service scaffold, standard Helm chart, standard pipeline template.

**Topics covered:**

- What is an Internal Developer Platform (IDP) — 🟡 Intermediate
- Backstage — CNCF developer portal — 🟡 Intermediate
- Golden path — opinionated, supported route — 🟡 Intermediate
- Self-service deployment without K8s knowledge — 🔴 Advanced
- Platform team metrics — 🟡 Intermediate

```bash
# Platform Engineering goal:
# BEFORE: Developer needs to know K8s, Terraform, Jenkins,
#         Grafana, Harbor — cognitive overload
# AFTER:  Developer fills a form → platform provisions everything

# Backstage — self-service developer portal
# Install Backstage
npx @backstage/create-app@latest

# Backstage provides:
# Software Catalog  — list of all services, owners, docs
# TechDocs          — documentation from markdown in repo
# Templates         — "create new service" scaffolding
# Plugins           — Kubernetes, GitHub, PagerDuty, SonarQube

# Example: Backstage template for new microservice
# Developer fills form: service name, team, language
# Backstage:
# 1. Creates GitHub repo from template
# 2. Sets up CI/CD pipeline (GitHub Actions/Jenkins)
# 3. Creates Kubernetes namespace with RBAC
# 4. Creates ArgoCD Application for GitOps
# 5. Creates Grafana dashboard
# 6. Registers service in catalog
# Developer has running service in 10 minutes, zero platform knowledge

# Platform team metrics:
# DORA metrics:
# - Deployment Frequency: how often teams deploy
# - Lead Time for Changes: commit → production time
# - Change Failure Rate: % deployments causing incidents
# - Time to Restore Service: MTTR for incidents
# Platform adoption: % of teams using golden path
# Developer satisfaction: quarterly survey score
```

### Module 01 — Why Organic Farming?
*What chemicals do vs what nature does better*

Chemical fertilisers kill soil microorganisms. Feed the SOIL not the plant. Costs less after year 3 as soil health rebuilds.

**Topics covered:**

- How chemical fertilisers damage soil — 🟢 Beginner
- What organic means — 🟢 Beginner
- Cost comparison: organic vs chemical — 🟡 Intermediate

```bash
# Year 1: transition, yield may drop 10-20%
# Year 2: soil recovers, same yield
# Year 3+: better yield, near-zero cost, premium price
# STOP: Urea, DAP, synthetic pesticides
# START: Compost, vermicompost, jeevamrut, neem, mulching
```

### Module 02 — Soil Preparation
*Compost, vermicompost, jeevamrut, mulching*

Compost is decomposed kitchen and farm waste. Vermicompost is 7x more nutritious. Jeevamrut activates billions of soil microorganisms. Mulching covers soil to prevent moisture loss.

**Topics covered:**

- Compost at home in 45-60 days — 🟢 Beginner
- Vermicompost — 7x nutrients — 🟢 Beginner
- Jeevamrut — ZBNF method — 🟡 Intermediate
- Mulching — 50% water saving — 🟢 Beginner

```bash
# COMPOST: 3 dry : 1 wet, turn every 7-10 days, 45-60 days ready
# JEEVAMRUT (200L): 10kg cow dung + 5L urine + 2kg jaggery
# + 2kg gram flour + handful soil. Ferment 48h.
# Use: 10% dilution, drench soil every 15 days
```

### Module 03 — Terrace & Home Garden
*200 sq.ft can grow 70% of family vegetables*

A 200 sq.ft terrace can grow 60-70% of a family's daily vegetable need. Best season in India: winter October to February.

**Topics covered:**

- Container depth guide — 🟢 Beginner
- Best soil mix for containers — 🟢 Beginner
- Season-wise planting — India — 🟢 Beginner
- Companion planting — 🟡 Intermediate

```bash
# SHALLOW 6-8 inch: coriander, methi, spinach, radish
# MEDIUM 10-12 inch: tomato, chilli, capsicum, okra
# DEEP 14-18 inch: carrot, potato, turmeric, ginger
# MIX: 40% soil + 30% vermicompost + 20% cocopeat + 10% sand
```

### Module 04 — Natural Pest Control
*Neem, panchagavya, organic sprays*

Neem disrupts 200+ insect pests without harming bees or birds. Prevention always better than cure.

**Topics covered:**

- Neem oil spray — 200+ insects — 🟢 Beginner
- Chilli-garlic spray — 🟢 Beginner
- Bordeaux mixture for fungal diseases — 🟡 Intermediate

```bash
# NEEM: 5ml neem oil + 2ml soap per litre, spray evenings
# CHILLI-GARLIC: 10 chillies + 10 garlic in 1L, dilute 1:10
# BORDEAUX: 100g copper sulphate + 100g lime in 10L
```

### Module 05 — Crop Guides
*Rice, spices, dal, vegetables, fruits, cotton*

SRI rice method uses 50% less water with 30-50% higher yield. Turmeric is the easiest organic crop. Dal crops fix nitrogen from air and improve soil.

**Topics covered:**

- SRI rice — 50% less water, higher yield — 🟡 Intermediate
- Turmeric and ginger — 🟡 Intermediate
- Dal crops — nitrogen fixing — 🟡 Intermediate

```bash
# SRI RICE: single seedling, 25x25cm, alternate wet-dry
# Yield: 6-8 tonnes/acre vs 3-4 tonnes chemical
# TURMERIC: 5kg compost/sqm + jeevamrut every 30 days
# DAL: Rhizobium seed treatment + 2 jeevamrut applications
```

### Module 06 — Water Conservation
*Drip, mulch, rainwater harvesting*

Organic soil holds water much better. Drip saves 60%, mulching saves 50%. Organic farms survive droughts better.

**Topics covered:**

- Drip irrigation — 60% water saving — 🟡 Intermediate
- Farm pond — 🟡 Intermediate
- Rainwater harvesting — 🟡 Intermediate

```bash
# DRIP for 500 sqft: INR 3,000-5,000 + timer INR 800
# FARM POND: 20x20x2 metres, silpaulin lined
# Cost: INR 25,000-50,000 (govt subsidised)
```

---

## Production Example

```bash
# Platform Engineering — Senior Interview Questions

# Q: "How do you measure the success of a Platform team?"
# ANSWER:
# "Platform teams are measured by the productivity of the teams
# they serve, not their own output.
# Key metrics I track:
# 1. DORA metrics — deployment frequency, lead time, failure rate
# 2. Onboarding time — how long for a new service to reach production
#    (target: under 1 day with golden path)
# 3. Platform adoption — % of teams using standard templates
# 4. Developer Net Promoter Score — quarterly survey
# 5. Toil reduction — hours saved per week across all teams
#
# At a large telecom organisation: reduced new service onboarding from 2 weeks to
# 2 days by creating a Backstage template that scaffolds repo,
# pipeline, K8s namespace, ArgoCD app and Grafana dashboard."

# Q: "What is toil and how do you reduce it?"
# Toil = manual, repetitive, automatable ops work that scales with traffic
# Examples: manually restarting pods, rotating certs, resizing disks
# Toil reduction = automate it, so it happens zero times per incident
# SRE target: < 50% of time on toil, > 50% on engineering work

# Q: "Team Topologies — how do you apply it?"
# Stream-aligned teams: own a product end-to-end (app + deploy + ops)
# Platform team: provides self-service capabilities
# Enabling team: helps stream-aligned teams adopt new tech
# Complicated subsystem team: specialised complex components (ML, Security)
# Interaction modes: X-as-a-Service, Collaboration, Facilitating
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Platform Engineering vs SRE vs DevOps and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Platform Engineering vs SRE vs DevOps work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Platform Engineering vs SRE vs DevOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Platform Engineering vs SRE vs DevOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Platform Engineering vs SRE vs DevOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Platform Engineering vs SRE vs DevOps in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Platform Engineering vs SRE vs DevOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Platform Engineering vs SRE vs DevOps compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain DevOps vs SRE vs Platform Engineering in Platform Engineering vs SRE vs DevOps."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Internal Developer Platform in Platform Engineering vs SRE vs DevOps."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Backstage — Internal Developer Portal](https://backstage.io/docs/)
- [Platform Engineering Community](https://platformengineering.org/)
- [Team Topologies](https://teamtopologies.com/key-concepts)
- [Subhash Palekar ZBNF](https://www.youtube.com/results?search_query=subhash+palekar+zbnf)
- [PKVY Organic Farming India](https://pgsindia-ncof.gov.in/)
- [FAO Organic Agriculture](https://www.fao.org/organicag/en/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*