# AI Engineering — Setup Guide

## What You Need to Get Started

AI engineering doesn't require installing a local model. You use API access to cloud models (Claude, GPT-4, etc.) and Python libraries. Here's everything to set up.

## Step 1: Python Setup

```bash
# Verify Python 3.10+ is installed
python3 --version   # Need 3.10 or higher

# Create a virtual environment for AI projects
mkdir ai-projects && cd ai-projects
python3 -m venv venv
source venv/bin/activate   # Mac/Linux
# venv\Scripts\activate   # Windows

# Verify
which python   # should point to venv/bin/python
```

## Step 2: Get an Anthropic API Key (Claude)

1. Go to **console.anthropic.com**
2. Create account → API Keys → Create Key
3. Copy the key (starts with `sk-ant-...`)

```bash
# Set as environment variable (don't hardcode in code!)
export ANTHROPIC_API_KEY="sk-ant-your-key-here"

# Add to ~/.bashrc or ~/.zshrc to persist
echo 'export ANTHROPIC_API_KEY="sk-ant-your-key-here"' >> ~/.bashrc

# Test the key
pip install anthropic
python3 -c "
import anthropic
client = anthropic.Anthropic()
msg = client.messages.create(
    model='claude-haiku-4-5-20251001',
    max_tokens=100,
    messages=[{'role': 'user', 'content': 'Say hello!'}]
)
print(msg.content[0].text)
"
# Should print a greeting
```

## Step 3: Install Core AI Libraries

```bash
# Anthropic SDK (Claude)
pip install anthropic

# OpenAI SDK (GPT-4, also used with many other providers)
pip install openai

# LangChain (chain LLM calls, build RAG systems)
pip install langchain langchain-community langchain-anthropic

# Vector database for RAG
pip install chromadb

# Document loaders
pip install pypdf python-docx

# Embeddings (free, runs locally)
pip install sentence-transformers

# Data processing
pip install pandas numpy

# Web interface for demos
pip install streamlit

# Save all dependencies
pip freeze > requirements.txt
```

## Step 4: Test Everything Works

```python
# test_setup.py
import anthropic
import langchain
import chromadb
print("All imports successful!")

client = anthropic.Anthropic()
response = client.messages.create(
    model="claude-haiku-4-5-20251001",
    max_tokens=50,
    messages=[{"role": "user", "content": "What is 2+2?"}]
)
print(f"Claude says: {response.content[0].text}")
print(f"Tokens used: {response.usage.input_tokens} in, {response.usage.output_tokens} out")
print(f"Cost: ~${(response.usage.input_tokens * 0.00025 + response.usage.output_tokens * 0.00125) / 1000:.5f}")
```

```bash
python3 test_setup.py
# Claude says: 2+2 equals 4.
# Tokens used: 14 in, 12 out
# Cost: ~$0.00002
```

## API Costs — What to Expect

| Model | Input (per 1M tokens) | Output (per 1M tokens) | Good for |
|---|---|---|---|
| claude-haiku-4-5 | $0.25 | $1.25 | Q&A, classification, summaries |
| claude-sonnet-4-6 | $3.00 | $15.00 | Complex tasks, code, analysis |
| claude-opus | $15.00 | $75.00 | Most complex reasoning |

**Rule:** Start with Haiku. Use Sonnet for tasks Haiku struggles with. 1000 Haiku API calls costs roughly ₹20-50. Very affordable for learning.

## Optional: Run Models Locally (Free, No API Cost)

```bash
# Install Ollama (runs open-source models locally)
# macOS/Linux:
curl -fsSL https://ollama.ai/install.sh | sh

# Pull a model (llama3.2 is good and small)
ollama pull llama3.2

# Run it
ollama run llama3.2
# You can now chat with it in the terminal — no API key, no cost

# Use from Python
pip install ollama
python3 -c "
import ollama
r = ollama.chat(model='llama3.2', messages=[{'role':'user','content':'Hello!'}])
print(r['message']['content'])
"
```

## Project Structure

```
ai-projects/
├── venv/                    # Virtual environment (gitignored)
├── .env                     # API keys (NEVER commit this!)
├── requirements.txt         # Dependencies
├── 01_hello_claude.py       # Basic API call
├── 02_chat_history.py       # Multi-turn conversation
├── 03_rag_system.py         # RAG with documents
└── data/                    # Your documents for RAG
```

```bash
# .env file (use python-dotenv to load)
ANTHROPIC_API_KEY=sk-ant-xxx
OPENAI_API_KEY=sk-xxx  # If using OpenAI too
```

## Next Steps

Your AI development environment is ready. Go to **Fundamentals** to start building with the Claude API.
