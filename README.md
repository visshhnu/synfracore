# SynfraCore — The Complete Tech Learning Ecosystem

> Learn → Practice → Build → Troubleshoot → Get Certified → Get Hired

## Tech Stack
- **Framework:** Next.js 16 (App Router, TypeScript)
- **Styling:** Tailwind CSS v4 + custom dark design system
- **AI:** Anthropic Claude API (AI Assistant + per-section AI content)
- **Fonts:** Space Grotesk · Syne · JetBrains Mono
- **Deploy:** Vercel

## 6 Academies · 50+ Technologies · 13 Certifications

| Academy | Key Technologies |
|---------|----------------|
| Infrastructure | Linux, Docker, Kubernetes, Terraform, Ansible, Jenkins, ArgoCD, Helm, Prometheus, Grafana, ELK |
| Cloud | AWS (IAM, EC2, VPC, S3, RDS, Lambda, EKS), Azure (Entra, AKS, DevOps), GCP (GKE) |
| AI Engineering | LangChain, LangGraph, RAG, Vector DBs, AI Agents, LLMOps, OpenAI, MCP |
| Data Analytics | SQL, Python, Pandas, Power BI, Tableau, Data Engineering |
| Healthcare | ICD-10-CM, CPT, HCPCS, Medical Coding Exams |
| Cybersecurity | Ethical Hacking, SOC, Pen Testing, SIEM, Network Security |

## Deploy to Vercel

### Quick Deploy (Recommended)

```bash
npm i -g vercel
vercel login
vercel --prod
```

Then in Vercel Dashboard → Project Settings → Domains → Add `synfracore.com`

### GitHub Integration
1. Push to GitHub
2. vercel.com/new → Import repo
3. Framework: Next.js (auto-detected)
4. Deploy → Add custom domain

## Local Development

```bash
npm install
npm run dev
# Open http://localhost:3000
```

## Project Structure

```
app/
  page.tsx                    # Homepage (9 sections)
  academies/[academy]/        # Academy pages
    [technology]/             # Tech overview + 14 sections
      [section]/page.tsx      # AI-generated content
  ai-assistant/               # Interactive AI chat
  roadmaps/, certifications/
  labs/, projects/, interview/
  troubleshooting/, community/, career/

components/
  layout/  Navbar, Footer
  home/    Hero, Stats, AcademyGrid, LearningPaths, FeaturedLabs,
           AIAssistantTeaser, TroubleshootingPreview, Certs, Journey
  tech/    SectionContent (AI-powered)

lib/data/
  academies.ts    All 6 academies + 50+ technologies
  navigation.ts   Nav, certifications, roadmaps, stats
```

## Roadmap
- Phase 1 ✅ — Knowledge base, roadmaps, AI content generation
- Phase 2 🔄 — Interactive labs, real projects
- Phase 3 📋 — Community, progress tracking
- Phase 4 📋 — AI Mentor, RAG search
- Phase 5 📋 — Career portal, job board
- Phase 6 📋 — Enterprise training platform
