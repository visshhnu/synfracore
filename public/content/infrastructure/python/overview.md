# Python for DevOps & Cloud Engineers

Python is the scripting language of DevOps. It's used for automation, infrastructure tooling, data processing, AI/ML, and cloud SDKs. Nearly every major DevOps tool exposes a Python API — Ansible is written in Python, Terraform has a CDK in Python, AWS SDK is boto3.

## Why Python for DevOps?

- **boto3** — AWS SDK. Automate everything in AWS
- **Ansible** — Written in Python, modules are Python
- **Kubernetes Client** — python-kubernetes for K8s automation
- **Terraform CDK** — Define infra in Python
- **Scripting** — Replace complex bash with readable Python
- **APIs** — `requests` library makes REST API calls trivial
- **Data processing** — Parse logs, process JSON/YAML/CSV

## Python vs Bash for Automation

| Task | Bash | Python |
|------|------|--------|
| Simple file ops | Better | Overkill |
| Complex logic | Ugly | Clean |
| Error handling | Hard | Easy (try/except) |
| JSON/YAML parsing | `jq` dependency | Built-in |
| HTTP requests | `curl` | `requests` |
| AWS automation | `aws cli` only | Full SDK (boto3) |
| Unit testing | Very hard | pytest |
| Reusability | Scripts only | Modules, packages |

**Rule of thumb:** Use bash for simple shell operations (<20 lines). Use Python for anything with logic, error handling, or that needs to be maintainable.

## Python for DevOps — Key Libraries

| Library | Purpose | Install |
|---------|---------|---------|
| `boto3` | AWS SDK | `pip install boto3` |
| `requests` | HTTP client | `pip install requests` |
| `paramiko` | SSH client | `pip install paramiko` |
| `fabric` | SSH automation | `pip install fabric` |
| `pyyaml` | YAML parsing | `pip install pyyaml` |
| `kubernetes` | K8s client | `pip install kubernetes` |
| `click` | CLI frameworks | `pip install click` |
| `pytest` | Testing | `pip install pytest` |
| `python-dotenv` | Env var management | `pip install python-dotenv` |
| `rich` | Beautiful terminal output | `pip install rich` |

## Setup — Python Environments

```bash
# Python 3.11+ recommended
python3 --version

# Virtual environment (always use one!)
python3 -m venv .venv
source .venv/bin/activate      # Linux/Mac
.venv\Scripts\activate         # Windows

# Install packages
pip install boto3 requests pyyaml

# Save dependencies
pip freeze > requirements.txt

# Install from requirements
pip install -r requirements.txt

# pyenv for managing multiple Python versions
curl https://pyenv.run | bash
pyenv install 3.12.0
pyenv global 3.12.0
```
