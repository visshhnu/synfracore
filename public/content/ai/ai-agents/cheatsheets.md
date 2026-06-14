# AI Agents — Cheatsheet

```python
import anthropic, json, subprocess
client = anthropic.Anthropic()

# ── DEFINE TOOLS ──────────────────────────────────────────
tools = [
    {"name":"bash","description":"Run a bash command",
     "input_schema":{"type":"object","properties":{"cmd":{"type":"string"}},"required":["cmd"]}},
    {"name":"write_file","description":"Write content to a file",
     "input_schema":{"type":"object","properties":{"path":{"type":"string"},"content":{"type":"string"}},"required":["path","content"]}},
]

def execute_tool(name, inputs):
    if name == "bash":
        r = subprocess.run(inputs["cmd"],shell=True,capture_output=True,text=True,timeout=30)
        return r.stdout[:2000] + r.stderr[:500] or "(no output)"
    if name == "write_file":
        open(inputs["path"],"w").write(inputs["content"])
        return f"Written {len(inputs['content'])} bytes to {inputs['path']}"

# ── AGENT LOOP ────────────────────────────────────────────
def agent(task, system="You are a helpful DevOps assistant. Use tools to complete tasks.", max_steps=10):
    messages = [{"role":"user","content":task}]
    for step in range(max_steps):
        r = client.messages.create(model="claude-sonnet-4-6",max_tokens=4096,
            system=system,tools=tools,messages=messages)
        messages.append({"role":"assistant","content":r.content})
        if r.stop_reason == "end_turn":
            return next((b.text for b in r.content if hasattr(b,"text")),"Done")
        if r.stop_reason == "tool_use":
            results = [{"type":"tool_result","tool_use_id":b.id,
                        "content":execute_tool(b.name,b.input)}
                       for b in r.content if b.type=="tool_use"]
            messages.append({"role":"user","content":results})
    return "Max steps reached"

result = agent("Check disk usage and list top 5 largest files in /tmp")
print(result)

# ── OPENAI FUNCTION CALLING ───────────────────────────────
from openai import OpenAI
oai = OpenAI()

def oai_agent(task, tools_def, executor, max_steps=10):
    messages = [{"role":"user","content":task}]
    for _ in range(max_steps):
        r = oai.chat.completions.create(model="gpt-4o-mini",messages=messages,tools=tools_def,tool_choice="auto")
        msg = r.choices[0].message
        messages.append(msg)
        if r.choices[0].finish_reason == "stop": return msg.content
        if r.choices[0].finish_reason == "tool_calls":
            for tc in msg.tool_calls:
                result = executor(tc.function.name, json.loads(tc.function.arguments))
                messages.append({"role":"tool","tool_call_id":tc.id,"content":str(result)})

# ── MULTI-AGENT PATTERN ───────────────────────────────────
def orchestrator(task):
    plan_agent = agent(f"Break this into 3-5 steps: {task}", max_steps=3)
    steps = [s.strip() for s in plan_agent.split('
') if s.strip() and s[0].isdigit()]
    results = []
    for step in steps:
        result = agent(step, max_steps=5)
        results.append(result)
    return "
".join(results)
```
