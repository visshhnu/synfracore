# Prompt Engineering — LLM Mastery

Prompt engineering is the discipline of designing inputs to Large Language Models to get accurate, reliable, and useful outputs. It's the most important skill for anyone building AI applications.

## Why Prompt Engineering Matters

The same model with different prompts can produce wildly different results:

```
Bad prompt:  "Write code"
Output:      Vague, generic boilerplate

Good prompt: "Write a Python function that validates an email address
             using regex. Include docstring, type hints, and 3 test cases.
             Handle edge cases: empty string, no @, multiple @ symbols."
Output:      Exactly what you need, first try
```

The model's knowledge is fixed. Your prompt determines what portion of that knowledge is activated and how it's applied.

## Core Principles

### 1. Be Specific and Explicit

```
❌ Vague:
"Explain Kubernetes"

✅ Specific:
"Explain Kubernetes to a developer who knows Docker but has never used
Kubernetes. Focus on: Pods vs containers, why you need a Deployment,
and how Services expose apps. Use analogies. Keep it under 300 words."
```

### 2. Provide Context

```
❌ No context:
"Review this code for bugs"

✅ With context:
"You are a senior Python engineer reviewing code for a high-traffic
production API (10k req/min). Review this for: security vulnerabilities,
performance issues, error handling gaps, and Python best practices.
Flag critical issues first."
```

### 3. Specify the Output Format

```
❌ No format:
"List the top cloud providers"

✅ With format:
"Compare AWS, Azure, and GCP in a markdown table with columns:
Strength, Best For, Market Share, Unique Feature.
Then write one paragraph summarizing which to choose for a startup."
```

### 4. Use Examples (Few-Shot Prompting)

```
Convert these technical terms to simple language:

Examples:
- "Kubernetes" → "A system that automatically manages and restarts your app containers"
- "CI/CD pipeline" → "Automated system that tests and deploys your code changes"
- "Load balancer" → "Traffic cop that spreads visitors across multiple servers"

Now convert these:
- "Service mesh"
- "Observability"
- "Infrastructure as Code"
```

### 5. Chain of Thought — Make the Model Reason

```
❌ Direct question (often wrong for complex problems):
"Is this architecture secure?"

✅ Chain of thought:
"Analyze this architecture for security vulnerabilities.
Think step by step:
1. Identify the attack surface (entry points)
2. Check authentication and authorization
3. Evaluate data in transit and at rest
4. Look for network segmentation issues
5. Check for hardcoded secrets or credentials
6. Final security rating: Critical/High/Medium/Low

Architecture: [paste architecture diagram/description]"
```

## Advanced Techniques

### Role Prompting

```python
SYSTEM_PROMPT = """You are a Senior DevOps Architect with 15 years of experience
at companies like Netflix, Google, and AWS. You have deep expertise in:
- Kubernetes and container orchestration at scale
- Multi-cloud architecture (AWS, Azure, GCP)
- Site Reliability Engineering (SRE) practices
- Cost optimization for cloud infrastructure

When answering:
- Give production-ready advice, not textbook answers
- Always consider cost, scalability, and operational overhead
- Flag potential pitfalls and anti-patterns
- Provide specific numbers (latency targets, cost estimates) when relevant
- If a question is ambiguous, ask one clarifying question before answering
"""
```

### Structured Output Prompting

```python
PROMPT = """
Analyze this Kubernetes deployment manifest and return a JSON object.

Manifest:
```yaml
{manifest}
```

Return ONLY valid JSON with this exact structure (no other text):
{{
  "security_issues": [
    {{
      "severity": "critical|high|medium|low",
      "issue": "description",
      "fix": "how to fix it"
    }}
  ],
  "best_practice_violations": ["list of issues"],
  "overall_score": 0-100,
  "summary": "one sentence summary"
}}
"""
```

### Negative Prompting — What NOT to Do

```
Write an explanation of Docker for a beginner.

Rules:
- Do NOT use jargon without explaining it first
- Do NOT assume prior knowledge of Linux or containers
- Do NOT use bullet points — write in natural prose
- Do NOT include installation instructions
- Do NOT write more than 200 words
```

### Self-Consistency

```python
# For high-stakes decisions, ask the model multiple times
# and take the majority answer

import anthropic

def reliable_answer(question: str, n: int = 5) -> str:
    client = anthropic.Anthropic()
    answers = []

    for _ in range(n):
        response = client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=100,
            messages=[{
                "role": "user",
                "content": f"{question}\n\nAnswer with just: YES or NO"
            }]
        )
        answers.append(response.content[0].text.strip())

    # Return majority answer
    return max(set(answers), key=answers.count)
```

### ReAct — Reason + Act Pattern

```
You are a DevOps assistant that can use tools.
Think step by step, then decide what action to take.

Available tools:
- check_pod_status(namespace, pod_name) → returns pod status
- get_logs(namespace, pod_name, lines=100) → returns recent logs
- describe_resource(namespace, resource_type, name) → returns full description

Format:
Thought: [your reasoning]
Action: [tool_name(args)]
Observation: [result]
... (repeat until done)
Final Answer: [your conclusion]

Question: The payment service is down. Debug and find the root cause.
```

## Prompt Templates for DevOps

```python
# Code Review
CODE_REVIEW = """
Review this {language} code for a production {context} system.

Code:
```{language}
{code}
```

Evaluate:
1. Security vulnerabilities (SQL injection, hardcoded secrets, input validation)
2. Error handling completeness
3. Performance issues (N+1 queries, memory leaks, blocking calls)
4. Code quality (readability, naming, duplication)
5. Missing edge cases

Format: severity (CRITICAL/HIGH/MEDIUM/LOW): issue — suggested fix
"""

# Incident Analysis
INCIDENT_ANALYSIS = """
You are an SRE analyzing a production incident.

Alert: {alert_details}
Logs: {relevant_logs}
Metrics: {metric_snapshot}
Recent deployments: {recent_changes}

Provide:
1. Likely root cause (be specific, not generic)
2. Immediate mitigation steps (ordered by priority)
3. Permanent fix
4. What monitoring would have caught this earlier
5. Similar past incidents to reference
"""

# Architecture Review
ARCHITECTURE_REVIEW = """
Review this architecture for a {scale} system handling {load}.

Requirements: {requirements}
Architecture: {description}

Evaluate against:
- Scalability: Can it handle 10× current load?
- Reliability: Single points of failure?
- Security: Attack surface and data protection
- Cost: Estimated monthly AWS cost + optimization opportunities
- Operational: How hard to deploy, monitor, debug?

Rate each 1-10 with specific justification.
"""
```

## System Prompts for Production Apps

```python
# Customer support bot
SUPPORT_BOT = """
You are a helpful customer support agent for SynfraCore, a technical
learning platform for DevOps and Cloud engineers.

Tone: Professional but friendly. Technical but accessible.

You can help with:
- Platform navigation and finding courses
- Technical questions about DevOps, Cloud, and AI topics
- Troubleshooting learning issues
- Course recommendations based on user's goals

You cannot:
- Access user account data
- Process refunds or billing
- Guarantee job placement

If a question is outside your scope, say:
"For [topic], please contact support@synfracore.com"

Always end complex technical answers with:
"Does this help? Let me know if you'd like me to explain any part further."
"""

# Code assistant
CODE_ASSISTANT = """
You are an expert software engineer and DevOps architect.
When writing code:
- Always include error handling
- Add type hints for Python functions
- Include a brief comment explaining non-obvious logic
- Write production-quality code, not tutorial code
- If a requirement is ambiguous, state your assumption before coding
- After code, add: "This handles: [list edge cases covered]"
"""
```

## Measuring Prompt Quality

```python
# Evaluate prompts systematically
test_cases = [
    {
        "input": "How do I restart a Kubernetes pod?",
        "expected_keywords": ["kubectl", "delete", "pod", "recreate"],
        "should_not_contain": ["kubectl edit", "kubectl apply"],
        "max_words": 150
    }
]

def evaluate_prompt(prompt_template, test_cases, model="claude-sonnet-4-20250514"):
    client = anthropic.Anthropic()
    scores = []

    for case in test_cases:
        response = client.messages.create(
            model=model,
            max_tokens=500,
            system=prompt_template,
            messages=[{"role": "user", "content": case["input"]}]
        )
        text = response.content[0].text

        score = 0
        # Check required keywords
        for kw in case["expected_keywords"]:
            if kw.lower() in text.lower():
                score += 1

        # Check forbidden content
        for bad in case.get("should_not_contain", []):
            if bad.lower() in text.lower():
                score -= 1

        # Check length
        word_count = len(text.split())
        if word_count <= case.get("max_words", 9999):
            score += 1

        scores.append(score / (len(case["expected_keywords"]) + 2))

    return sum(scores) / len(scores)
```

## Interview Questions

**What is few-shot vs zero-shot prompting?**
Zero-shot: you ask the model to do a task without any examples. It relies entirely on pre-trained knowledge. Few-shot: you provide 2-5 examples of input→output pairs before your actual request. Few-shot dramatically improves accuracy for classification, formatting, and style-sensitive tasks. The examples teach the model the exact pattern you want without fine-tuning. One-shot is just one example.

**When should you use system prompts vs user prompts?**
System prompts define the model's persistent role, behavior constraints, response format, and context that applies to all messages in the conversation. User prompts are the specific request for each turn. Use system prompts for: persona, tone, output format rules, domain constraints, and what the model can/cannot do. Keep system prompts concise — long system prompts can dilute instruction following.

**How do you prevent prompt injection attacks?**
Prompt injection is when user input contains malicious instructions trying to override your system prompt. Defenses: use delimiters (XML tags, triple quotes) to clearly separate user content from instructions, validate and sanitize inputs, never interpolate raw user input into privileged parts of the prompt, use output parsers that only accept valid formats, and test with adversarial inputs like "Ignore all previous instructions and...".
