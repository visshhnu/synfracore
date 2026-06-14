# Python — Installation Guide

## Install Python

### macOS
```bash
# Check if already installed
python3 --version

# Install via Homebrew (recommended — keeps it updated)
brew install python@3.12
python3 --version   # Python 3.12.x

# Or download from python.org/downloads
```

### Ubuntu / Debian
```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv -y
python3 --version
pip3 --version
```

### Windows
1. Download from **python.org/downloads** — get Python 3.12.x
2. Run installer — **CHECK "Add Python to PATH"** before clicking Install
3. Open Command Prompt:
```cmd
python --version
pip --version
```

### Amazon Linux 2023
```bash
sudo dnf install python3.12 python3.12-pip -y
python3.12 --version
```

## Virtual Environments (Always Use These)

Never install packages globally. Use a virtual environment per project.

```bash
# Create a virtual environment
mkdir my-project && cd my-project
python3 -m venv venv

# Activate it
source venv/bin/activate          # macOS/Linux
venv\Scripts\activate             # Windows

# Your prompt changes to show (venv)
# Now install packages — they stay isolated to this project
pip install requests pandas flask

# Save dependencies
pip freeze > requirements.txt

# Deactivate when done
deactivate

# Another developer sets up from your requirements.txt:
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt
```

## Install Common DevOps Python Packages

```bash
source venv/bin/activate

# HTTP requests and APIs
pip install requests httpx

# AWS SDK
pip install boto3

# Kubernetes SDK
pip install kubernetes

# YAML processing
pip install pyyaml

# Environment variables
pip install python-dotenv

# CLI tools
pip install click typer

# All at once for DevOps work
pip install boto3 kubernetes requests pyyaml python-dotenv click
```

## Verify Python Works

```bash
# Quick test
python3 -c "print('Python works!')"

# Test pip and a package
pip install requests
python3 -c "import requests; r = requests.get('https://httpbin.org/get'); print(r.status_code)"
# Should print: 200

# Check your setup
python3 << 'EOF'
import sys
print(f"Python: {sys.version}")
print(f"Location: {sys.executable}")
EOF
```

## Recommended Tools

```bash
# ipython — much better interactive Python shell
pip install ipython
ipython

# black — auto-format your code
pip install black
black my_script.py

# pylint / flake8 — catch errors before running
pip install flake8
flake8 my_script.py

# VS Code extensions: Python, Pylance, Black Formatter
```

## Next Steps

Python is installed. Go to **Fundamentals** to start writing DevOps automation scripts.
