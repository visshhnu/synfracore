# MongoDB -- Portfolio Projects

---

## Project 1: Blog Platform with Aggregation Pipeline

**Level:** Beginner | **Time:** 2 days | **GitHub:** `mongodb-blog-api`

Blog platform demonstrating MongoDB document design and aggregation pipelines.

```javascript
// Schema design -- embed vs reference decision
// EMBED (comments in posts): reads are fast, updates are in one doc
// REFERENCE (authors as separate collection): author data shared, not duplicated

db.posts.insertOne({
  title: "MongoDB Best Practices",
  slug: "mongodb-best-practices",
  author_id: ObjectId("..."),
  tags: ["mongodb", "nosql", "database"],
  content: "...",
  comments: [  // Embedded -- only 50 comments expected max
    {user: "alice", text: "Great post!", created_at: new Date()}
  ],
  stats: {views: 0, likes: 0},
  created_at: new Date()
});

// Aggregation: top authors by total views
db.posts.aggregate([
  { $group: {
      _id: "$author_id",
      total_views: { $sum: "$stats.views" },
      post_count: { $count: {} },
      avg_views: { $avg: "$stats.views" }
  }},
  { $sort: { total_views: -1 } },
  { $limit: 10 },
  { $lookup: {
      from: "authors",
      localField: "_id",
      foreignField: "_id",
      as: "author"
  }}
]);
```

**Steps:** Schema design decisions documented, aggregation pipeline, text search index, Atlas free tier

---

## Project 2: Real-Time Analytics with Change Streams

**Level:** Intermediate | **Time:** 2-3 days | **GitHub:** `mongodb-change-streams`

Listen to MongoDB changes in real-time and react -- no polling, instant updates.

```python
import pymongo, threading

client = pymongo.MongoClient("mongodb://localhost:27017")
db = client.myapp

def watch_orders():
    pipeline = [
        {"$match": {"operationType": "insert",
                    "fullDocument.status": "paid"}}
    ]
    with db.orders.watch(pipeline) as stream:
        for change in stream:
            order = change["fullDocument"]
            print(f"New paid order: {order["_id"]} total: {order["total"]}")
            send_confirmation_email(order)
            update_inventory(order["items"])

thread = threading.Thread(target=watch_orders, daemon=True)
thread.start()
```

**Steps:** Change streams on orders collection, update downstream systems, handle resume tokens for restart

---

## Portfolio Checklist
- [ ] Document design decisions explained in README
- [ ] Indexes for every query pattern
- [ ] Aggregation pipeline with at least 5 stages
- [ ] Change streams or Atlas triggers for real-time processing
