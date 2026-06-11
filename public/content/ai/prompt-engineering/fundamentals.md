# Prompt Engineering — Fundamentals

## Core Principles

```
LLMs predict the next token based on all prior tokens.
Your prompt IS the context — better context = better output.

The model has no memory between API calls.
It can only work with what you put in the prompt.
It cannot browse the internet (unless tools are given).
It will hallucinate if it doesn't know the answer.
```

## Zero-Shot vs Few-Shot

```python
import anthropic
client = anthropic.Anthropic()

# Zero-shot — just describe the task
response = client.messages.create(
    model="claude-sonnet-4-20250514",
    max_tokens=1000,
    messages=[{
        "role": "user",
        "content": "Classify this review as POSITIVE, NEGATIVE, or NEUTRAL:\n\nThe product arrived on time but the quality was poor."
    }]
)
# Output: NEGATIVE

# Few-shot — provide examples (much more reliable)
response = client.messages.create(
    model="claude-sonnet-4-20250514",
    max_tokens=100,
    messages=[{
        "role": "user",
        "content": """Classify sentiment as POSITIVE, NEGATIVE, or NEUTRAL.

Review: "Amazing product, exceeded expectations!" → POSITIVE
Review: "Broken on arrival, terrible experience" → NEGATIVE  
Review: "Package arrived, product is as described" → NEUTRAL
Review: "The product arrived on time but the quality was poor." →"""
    }]
)
# Output: NEGATIVE  (more consistent with examples)
```

## System Prompts

```python
# System prompt sets the context, persona, and constraints
response = client.messages.create(
    model="claude-sonnet-4-20250514",
    max_tokens=2048,
    system="""You are a senior DevOps engineer with 10 years of experience.
    
Your responses should:
- Be concise and technical (audience: engineers, not beginners)
- Include specific commands and code examples
- Point out security and production considerations
- Use industry-standard terminology

When giving code, always include:
- Error handling
- Comments for non-obvious parts
- Security considerations""",
    messages=[{
        "role": "user",
        "content": "How do I rotate AWS access keys without downtime?"
    }]
)
```

## Structured Output

```python
# Request JSON output explicitly
response = client.messages.create(
    model="claude-sonnet-4-20250514",
    max_tokens=1000,
    system="You are a data extraction assistant. Always respond with valid JSON only. No explanation.",
    messages=[{
        "role": "user",
        "content": """Extract the following from this job posting and return as JSON:
        
Job: Senior DevOps Engineer at TechCorp
Location: Bangalore, India (Hybrid - 3 days/week)
Salary: ₹25-40 LPA
Required: Kubernetes, AWS, Terraform, 5+ years experience
Nice to have: ArgoCD, Helm, Python

Return format: {"title": "", "company": "", "location": "", "remote_type": "", "salary_range": "", "required_skills": [], "preferred_skills": [], "min_years": 0}"""
    }]
)

import json
data = json.loads(response.content[0].text)
```

## Chain of Thought (CoT)

```python
# Tell the model to reason step-by-step before answering
# Dramatically improves accuracy on complex problems

response = client.messages.create(
    model="claude-sonnet-4-20250514",
    max_tokens=2000,
    messages=[{
        "role": "user",
        "content": """A Kubernetes cluster has 3 nodes, each with 4 CPU and 8GB RAM.
You need to deploy an application that requires:
- 5 replicas
- Each replica: 1 CPU request, 500m CPU limit, 1GB RAM request, 2GB RAM limit

Will this deployment succeed? Think through this step by step."""
    }]
)

# The model will calculate:
# Total CPU requests: 5 × 1 = 5 CPUs needed
# Total CPU available: 3 × 4 = 12 CPUs available ✓
# Total RAM requests: 5 × 1GB = 5GB needed
# Total RAM available: 3 × 8GB = 24GB available ✓
# But: Kubernetes scheduler places pods based on requests, not limits
# Conclusion: Yes, the deployment can succeed
```

## ReAct Pattern (Reasoning + Acting)

```python
# Give the model tools and let it decide when to use them
tools = [
    {
        "name": "search_docs",
        "description": "Search internal documentation",
        "input_schema": {
            "type": "object",
            "properties": {
                "query": {"type": "string", "description": "Search query"}
            },
            "required": ["query"]
        }
    },
    {
        "name": "run_kubectl",
        "description": "Execute a kubectl command on the cluster",
        "input_schema": {
            "type": "object",
            "properties": {
                "command": {"type": "string", "description": "kubectl command to run"}
            },
            "required": ["command"]
        }
    }
]

response = client.messages.create(
    model="claude-sonnet-4-20250514",
    max_tokens=4096,
    tools=tools,
    messages=[{
        "role": "user",
        "content": "The API pods keep crashing. Find the issue and suggest a fix."
    }]
)

# Model will call run_kubectl to check pod status, logs, events
# Then reason about the findings and provide a diagnosis
```

## Prompt Templates

```python
from string import Template

# Reusable prompt templates
CODE_REVIEW_TEMPLATE = Template("""Review this $language code for:
1. Security vulnerabilities
2. Performance issues  
3. Code quality and maintainability

Code to review:
```$language
$code
```

Provide specific line numbers and actionable feedback.""")

prompt = CODE_REVIEW_TEMPLATE.substitute(
    language="python",
    code=open("handler.py").read()
)

# For production: use proper templating with validation
# Libraries: jinja2, langchain.prompts, promptflow
```
