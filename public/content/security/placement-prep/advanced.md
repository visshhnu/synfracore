# Placement Preparation Advanced

## Advanced Interview Topics

### Memory Management in Languages
- C/C++: manual memory management (malloc/free, new/delete)
- Java: garbage collection (GC); JVM heap management
- Python: reference counting + cyclic GC
- Rust: ownership and borrowing system; no GC needed

### Concurrency and Threading
```java
// Java synchronized method
public synchronized void increment() {
    count++;
}

// Python threading
import threading
lock = threading.Lock()
def safe_increment():
    with lock:
        global count
        count += 1
```

### Database Query Optimization
- EXPLAIN query plan
- Index selection and covering indexes
- Query rewriting: avoid SELECT *, use pagination (LIMIT/OFFSET)
- Connection pooling
- Read replicas for read-heavy workloads

## Behavioral Interview — STAR Method

**S**ituation: Set the context
**T**ask: Describe your responsibility
**A**ction: Explain what you did specifically
**R**esult: Share measurable outcomes

### Common Behavioral Questions
- "Tell me about yourself" — 2-minute pitch
- "Why do you want to join this company?"
- "Tell me about a challenge you faced"
- "Describe a time you disagreed with your manager"
- "Where do you see yourself in 5 years?"

## Negotiation and Offer Stage

### Evaluating an Offer
- CTC breakdown: base, bonus, stock (vesting schedule), benefits
- Work-life balance and culture
- Growth opportunities: learning, promotions
- Job stability and company financials

### Negotiation
- Have competing offers if possible (strongest leverage)
- Know your market value (Glassdoor, LinkedIn)
- Negotiate the whole package, not just base salary
- Be professional and appreciative even while negotiating

## Post-Placement Action Items
- Research the team/project before joining
- Build relevant skills (technologies in JD)
- Network with future colleagues on LinkedIn
- Set learning goals for first 90 days
- Prepare questions to ask in onboarding
