# MongoDB — Installation Guide

## Option 1: Docker (Fastest)

```bash
# Run MongoDB
docker run -d \
  --name mongodb \
  -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=secret \
  -v mongo-data:/data/db \
  mongo:7

# Connect with mongosh
docker exec -it mongodb mongosh \
  --username admin --password secret --authenticationDatabase admin
```

## Option 2: MongoDB Atlas (Cloud — Free Tier Forever)

The easiest way to get a production-grade MongoDB:

1. Go to **cloud.mongodb.com**
2. Create a free account
3. Create a cluster → **Free (M0 Shared)** — 512MB storage, forever free
4. Add your IP to the allowlist
5. Create a database user
6. Get the connection string:
   ```
   mongodb+srv://username:password@cluster.mongodb.net/myapp
   ```

```bash
# Connect from CLI
mongosh "mongodb+srv://username:password@cluster.mongodb.net/myapp"
```

## Option 3: Install on Ubuntu

```bash
# Import MongoDB GPG key
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
  sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor

# Add repository
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] \
  https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | \
  sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Install
sudo apt update && sudo apt install -y mongodb-org

# Start
sudo systemctl enable --now mongod
sudo systemctl status mongod

# Connect
mongosh
```

## Option 4: macOS

```bash
brew tap mongodb/brew
brew install mongodb-community@7.0
brew services start mongodb-community@7.0
mongosh
```

## First Steps with mongosh

```javascript
// mongosh — the modern MongoDB shell
use myapp          // Switch to (or create) database

// Insert documents
db.users.insertOne({ name: "Alice", email: "alice@example.com", age: 30 })
db.users.insertMany([
  { name: "Bob", email: "bob@example.com", age: 25 },
  { name: "Charlie", email: "charlie@example.com", age: 35 }
])

// Query
db.users.find({})                          // All documents
db.users.find({ age: { $gt: 28 } })       // Age > 28
db.users.findOne({ name: "Alice" })        // First match

// Update
db.users.updateOne({ name: "Alice" }, { $set: { age: 31 } })

// Delete
db.users.deleteOne({ name: "Charlie" })

// Show collections and databases
show dbs
show collections
db.users.countDocuments()
```

## Install Compass (GUI Tool)

MongoDB Compass is the official GUI for MongoDB:
1. Download from **mongodb.com/products/tools/compass**
2. Install and open
3. Paste your connection string and connect

## Python Client

```bash
pip install pymongo

python3 << 'EOF'
from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["myapp"]
users = db["users"]

# Insert
users.insert_one({"name": "Alice", "email": "alice@example.com"})

# Query
for user in users.find():
    print(user)

client.close()
EOF
```

## Next Steps

MongoDB is running. Go to **Fundamentals** to learn CRUD operations, document design, and the aggregation pipeline.
