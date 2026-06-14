# MongoDB — Advanced

## Production Architecture and Performance

At the advanced level, you understand MongoDB internals, high-availability patterns, and production operations.





## Sharding and Replication\n```javascript\n// MongoDB Replica Set: 3 nodes, auto-failover\n// mongod.conf for each node:\n// replication:\n//   replSetName: "rs0"\n\n// Initialize replica set\nrs.initiate({\n    _id: "rs0",\n    members: [\n        { _id: 0, host: "mongo1:27017", priority: 2 },\n        { _id: 1, host: "mongo2:27017", priority: 1 },\n        { _id: 2, host: "mongo3:27017", arbiterOnly: true }\n    ]\n})\nrs.status()\n\n// Sharding: distribute data across multiple replica sets\n// sh.addShard("rs0/mongo1:27017")\n// sh.enableSharding("mydb")\n// sh.shardCollection("mydb.orders", { user_id: "hashed" })\n```\n\n## Change Streams (Real-time)\n```javascript\n// Watch for changes on a collection\nconst pipeline = [{ $match: { operationType: "insert" } }];\nconst changeStream = db.orders.watch(pipeline);\nfor await (const change of changeStream) {\n    console.log("New order:", change.fullDocument);\n    await sendConfirmationEmail(change.fullDocument);\n}\n// Handles replica set failover automatically with resume token\n```





## Production Checklist
- ✅ Replication configured (primary + at least 1 replica)
- ✅ Automated backups with tested restore
- ✅ Monitoring: connections, query time, replication lag
- ✅ Alerting: disk space, CPU, slow queries
- ✅ Connection pooling configured
- ✅ Regular maintenance scheduled (VACUUM, ANALYZE, REPAIR)
