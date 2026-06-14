# Redis — Intermediate

## Core Operations at Scale

At the intermediate level, you move from basic CRUD to understanding how Redis works under the hood and writing efficient queries.



## Advanced Data Structures\n```bash\n# Sorted Set: leaderboard\nZADD leaderboard 1500 "alice" 2300 "bob" 800 "charlie"\nZRANGE leaderboard 0 -1 WITHSCORES REV\n# Returns: bob 2300, alice 1500, charlie 800\n\n# Stream: event log\nXADD events * action "login" user "alice" ip "1.2.3.4"\nXREAD COUNT 10 STREAMS events 0\n\n# Pub/Sub\nSUBSCRIBE notifications  # In terminal 1\nPUBLISH notifications "New order placed"  # In terminal 2\n\n# Pipeline: batch commands\nimport redis\nr = redis.Redis()\npipe = r.pipeline()\nfor i in range(1000):\n    pipe.set(f"key:{i}", f"value:{i}")\npipe.execute()  # 1000 commands in one round trip\n```\n\n## Cache Patterns\n```python\n# Cache-aside (most common)\ndef get_user(user_id):\n    cached = redis.get(f"user:{user_id}")\n    if cached:\n        return json.loads(cached)\n    user = db.query("SELECT * FROM users WHERE id = %s", user_id)\n    redis.setex(f"user:{user_id}", 300, json.dumps(user))  # 5 min TTL\n    return user\n\n# Write-through\ndef update_user(user_id, data):\n    db.execute("UPDATE users SET name = %s WHERE id = %s", data['name'], user_id)\n    redis.delete(f"user:{user_id}")  # Invalidate cache\n```







## Performance Checklist
- ✅ Indexes on all columns used in WHERE, JOIN, ORDER BY
- ✅ EXPLAIN your slow queries — never guess
- ✅ Use connection pooling in production
- ✅ Set appropriate timeouts
- ✅ Monitor: query time, connection count, cache hit rate
