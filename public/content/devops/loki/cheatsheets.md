# Loki & LogQL Cheatsheet

```logql
# Basic log stream
{namespace="production", pod=~"myapp-.*"}

# Filter
{namespace="production"} |= "error"
{namespace="production"} != "debug"
{namespace="production"} |~ "timeout|refused"

# Parse JSON logs
{namespace="production"} | json | level = "error"

# Rate
rate({namespace="production"} |= "error" [5m])

# Count by label
sum by (pod) (count_over_time({namespace="production"} |= "error" [1h]))
```
