# LLMOps — Fundamentals

## Prompt Versioning and Management

```python
# Track prompt versions like code — prompts change, regressions happen

class PromptRegistry:
    """Version-controlled prompt storage."""
    
    def __init__(self, db_path: str = "prompts.db"):
        import sqlite3
        self.conn = sqlite3.connect(db_path)
        self.conn.execute("""
            CREATE TABLE IF NOT EXISTS prompts (
                id INTEGER PRIMARY KEY,
                name TEXT, version TEXT, system TEXT, user_template TEXT,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                metrics TEXT, is_active BOOLEAN DEFAULT 0
            )
        """)
        self.conn.commit()
    
    def save(self, name: str, version: str, system: str, user_template: str):
        self.conn.execute(
            "INSERT INTO prompts (name, version, system, user_template) VALUES (?,?,?,?)",
            (name, version, system, user_template)
        )
        self.conn.commit()
    
    def get_active(self, name: str) -> dict:
        row = self.conn.execute(
            "SELECT * FROM prompts WHERE name=? AND is_active=1 ORDER BY created_at DESC LIMIT 1",
            (name,)
        ).fetchone()
        if row:
            return {"name": row[1], "version": row[2], "system": row[3], "template": row[4]}
        raise ValueError(f"No active prompt found for {name}")
    
    def activate(self, name: str, version: str):
        self.conn.execute("UPDATE prompts SET is_active=0 WHERE name=?", (name,))
        self.conn.execute("UPDATE prompts SET is_active=1 WHERE name=? AND version=?", (name, version))
        self.conn.commit()

registry = PromptRegistry()
registry.save("qa-bot", "v2.1", 
    system="You are a DevOps expert. Cite sources. Be concise.",
    user_template="Question: {question}\nContext: {context}"
)
```

## Cost Tracking and Budget Controls

```python
import time
from dataclasses import dataclass, field
from collections import defaultdict

@dataclass
class UsageTracker:
    daily_budget_usd: float = 100.0
    alert_threshold: float = 0.8  # Alert at 80% of budget
    
    _usage: dict = field(default_factory=lambda: defaultdict(float))
    
    # Pricing per 1M tokens (Claude Sonnet 4.6)
    PRICES = {
        "claude-sonnet-4-6": {"input": 3.0, "output": 15.0},
        "claude-opus-4-6": {"input": 15.0, "output": 75.0},
        "claude-haiku-4-5-20251001": {"input": 0.25, "output": 1.25},
    }
    
    def record(self, model: str, input_tokens: int, output_tokens: int, 
               user_id: str = "default", feature: str = "default"):
        prices = self.PRICES.get(model, {"input": 3.0, "output": 15.0})
        cost = (input_tokens * prices["input"] + output_tokens * prices["output"]) / 1_000_000
        
        today = time.strftime("%Y-%m-%d")
        self._usage[f"{today}:total"] += cost
        self._usage[f"{today}:user:{user_id}"] += cost
        self._usage[f"{today}:feature:{feature}"] += cost
        
        daily_total = self._usage[f"{today}:total"]
        if daily_total > self.daily_budget_usd * self.alert_threshold:
            self._send_alert(daily_total)
        
        if daily_total > self.daily_budget_usd:
            raise Exception(f"Daily budget ${self.daily_budget_usd} exceeded. Current: ${daily_total:.2f}")
        
        return cost
    
    def get_daily_report(self) -> dict:
        today = time.strftime("%Y-%m-%d")
        return {k.replace(f"{today}:", ""): v 
                for k, v in self._usage.items() if k.startswith(today)}
    
    def _send_alert(self, amount: float):
        print(f"⚠️ Budget alert: ${amount:.2f} spent today")

tracker = UsageTracker(daily_budget_usd=50.0)
```
