# LangChain — Intermediate

## LCEL Advanced Patterns

```python
from langchain_anthropic import ChatAnthropic
from langchain.prompts import ChatPromptTemplate
from langchain.schema.runnable import RunnablePassthrough, RunnableLambda, RunnableParallel
from langchain.schema.output_parser import StrOutputParser
import json

llm = ChatAnthropic(model="claude-sonnet-4-6")

# Branching based on input
def route_by_language(info: dict) -> str:
    if info.get("language") == "python":
        return python_chain
    elif info.get("language") == "javascript":
        return js_chain
    else:
        return general_chain

routed_chain = {
    "question": lambda x: x["question"],
    "language": lambda x: x.get("language", "general")
} | RunnableLambda(route_by_language)

# Parallel execution
parallel_chain = RunnableParallel(
    summary = ChatPromptTemplate.from_template("Summarize: {text}") | llm | StrOutputParser(),
    keywords = ChatPromptTemplate.from_template("Extract keywords from: {text}") | llm | StrOutputParser(),
    sentiment = ChatPromptTemplate.from_template("Sentiment of: {text} (positive/negative/neutral)") | llm | StrOutputParser()
)

# Runs all 3 in parallel
results = parallel_chain.invoke({"text": "Kubernetes is complex but powerful for managing containers"})
print(results["summary"])
print(results["keywords"])
print(results["sentiment"])

# Map-reduce pattern
map_chain = ChatPromptTemplate.from_template("Summarize this chunk: {chunk}") | llm | StrOutputParser()

def map_reduce(chunks: list[str]) -> str:
    summaries = [map_chain.invoke({"chunk": c}) for c in chunks]
    combined = "\n".join(summaries)
    reduce_prompt = ChatPromptTemplate.from_template("Combine these summaries: {combined}")
    return (reduce_prompt | llm | StrOutputParser()).invoke({"combined": combined})
```

## LangChain Agents

```python
from langchain.agents import create_tool_calling_agent, AgentExecutor
from langchain.tools import tool
from langchain_community.tools import DuckDuckGoSearchRun, WikipediaQueryRun

# Custom tool with @tool decorator
@tool
def check_kubernetes_pod_status(namespace: str, pod_name: str) -> str:
    """Check the status of a Kubernetes pod. Use this when asked about pod health."""
    import subprocess
    result = subprocess.run(
        ["kubectl", "get", "pod", pod_name, "-n", namespace, "-o", "json"],
        capture_output=True, text=True
    )
    if result.returncode != 0:
        return f"Error: {result.stderr}"
    data = json.loads(result.stdout)
    return f"Status: {data['status']['phase']}, Ready: {data['status']['conditions']}"

@tool
def query_prometheus(promql: str) -> str:
    """Query Prometheus metrics. Use for performance and health metrics."""
    import requests
    r = requests.get("http://prometheus:9090/api/v1/query", params={"query": promql})
    data = r.json()
    return str(data.get("data", {}).get("result", []))

tools = [check_kubernetes_pod_status, query_prometheus, DuckDuckGoSearchRun()]

llm = ChatAnthropic(model="claude-sonnet-4-6")
prompt = ChatPromptTemplate.from_messages([
    ("system", "You are a DevOps assistant. Use tools to gather real information."),
    ("human", "{input}"),
    ("placeholder", "{agent_scratchpad}")
])

agent = create_tool_calling_agent(llm, tools, prompt)
executor = AgentExecutor(agent=agent, tools=tools, verbose=True, max_iterations=10)

result = executor.invoke({"input": "What is the status of the api-server pod in production namespace?"})
print(result["output"])
```
