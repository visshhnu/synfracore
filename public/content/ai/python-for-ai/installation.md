# Python Foundations for AI — Getting Set Up

The fastest real path: skip local installation entirely at first and use Google Colab, then move to a local setup once you're actually building something that needs to persist or run outside a browser tab.

## Fastest start: Google Colab (zero install)

Go to colab.research.google.com, create a new notebook — Python, NumPy, and most common data libraries are pre-installed. This is genuinely the right choice for working through this page's examples; don't burn your first learning session fighting a local environment setup instead of writing code.

## Local setup, when you're ready for it

```bash
# Check if Python is already installed (macOS/Linux usually have it)
python3 --version

# If not, install via python.org or your OS package manager, then:
python3 -m venv ai-env
source ai-env/bin/activate        # Windows: ai-env\Scripts\activate

# The packages this page's examples actually use
pip install numpy
```

**Why a virtual environment, specifically** — not optional cleanliness, it's what stops one project's package versions from breaking another's. AI/ML Python projects are notorious for tight, sometimes conflicting version requirements between libraries (a common real annoyance: two projects needing different NumPy major versions) — a fresh venv per project sidesteps this from the start rather than debugging it later.

## Setting up for real AI SDK work (once you're past the basics)

```bash
pip install anthropic          # or: pip install openai
```

You'll also need an API key from whichever provider you're using, set as an environment variable rather than hardcoded:

```bash
export ANTHROPIC_API_KEY="your-key-here"   # never commit this to a repo
```

```python
import os
from anthropic import Anthropic

client = Anthropic(api_key=os.environ["ANTHROPIC_API_KEY"])
```

## A genuinely common early mistake worth naming directly

Installing packages globally (`pip install` with no venv active) works at first and then quietly breaks a second project weeks later when their dependency versions collide — by which point you've forgotten which project needs which version. Get in the venv habit from your very first real project, not after the first collision forces it.
