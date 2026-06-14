# Redis — Installation Guide

## Option 1: Docker (Fastest)

```bash
# Run Redis
docker run -d \
  --name redis \
  -p 6379:6379 \
  redis:7-alpine

# Connect with redis-cli
docker exec -it redis redis-cli

# Test
docker exec -it redis redis-cli ping   # PONG
```

## Option 2: Redis with Password (More Realistic)

```bash
docker run -d \
  --name redis \
  -p 6379:6379 \
  redis:7-alpine \
  redis-server --requirepass "mysecretpassword" --appendonly yes

# Connect with password
docker exec -it redis redis-cli -a mysecretpassword
redis-cli -h localhost -p 6379 -a mysecretpassword
```

## Option 3: Install on Ubuntu

```bash
# Add Redis official repository (latest version)
curl -fsSL https://packages.redis.io/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] \
  https://packages.redis.io/deb $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/redis.list

sudo apt update && sudo apt install redis -y
sudo systemctl enable --now redis-server

# Connect
redis-cli ping   # PONG
redis-cli info server | grep redis_version
```

## Option 4: macOS

```bash
brew install redis
brew services start redis
redis-cli ping   # PONG
```

## First Commands After Install

```bash
redis-cli   # Opens interactive shell

# Basic key-value
SET name "Alice"
GET name           # "Alice"
DEL name
EXISTS name        # 0 (doesn't exist)

# With expiry (TTL)
SET session:abc123 "user_data" EX 3600   # Expires in 1 hour
TTL session:abc123                        # 3598 (seconds remaining)

# Hash (store objects)
HSET user:1 name "Alice" email "alice@example.com" age 30
HGETALL user:1
HGET user:1 name   # "Alice"

# List (queue)
RPUSH tasks "task1" "task2" "task3"
LPOP tasks         # "task1"
LRANGE tasks 0 -1  # All remaining

# Check server
INFO server        # Full server info
DBSIZE             # Number of keys
```

## Python Client

```bash
pip install redis

python3 << 'EOF'
import redis

r = redis.Redis(host='localhost', port=6379, decode_responses=True)

# Test connection
print(r.ping())   # True

# Basic operations
r.set('name', 'Alice', ex=3600)
print(r.get('name'))   # Alice

# Hash
r.hset('user:1', mapping={'name': 'Alice', 'email': 'alice@example.com'})
print(r.hgetall('user:1'))
EOF
```

## Node.js Client

```bash
npm install ioredis

node << 'EOF'
const Redis = require('ioredis');
const redis = new Redis();

async function main() {
  await redis.set('name', 'Alice');
  const val = await redis.get('name');
  console.log(val);   // Alice
  redis.quit();
}
main();
EOF
```

## Next Steps

Redis is running. Go to **Fundamentals** to learn data structures, TTLs, and cache-aside patterns used in production.
