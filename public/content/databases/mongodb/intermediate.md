# MongoDB — Intermediate

## Aggregation Pipeline Deep Dive

```javascript
// Complex analytics pipeline
const result = await db.collection('orders').aggregate([
    // Stage 1: Filter
    { $match: {
        status: 'completed',
        createdAt: { $gte: new Date('2024-01-01') }
    }},

    // Stage 2: Join with users
    { $lookup: {
        from: 'users',
        localField: 'userId',
        foreignField: '_id',
        as: 'user',
        pipeline: [                    // Sub-pipeline for lookup
            { $project: { name: 1, email: 1, plan: 1 }}
        ]
    }},
    { $unwind: '$user' },

    // Stage 3: Group by month and plan
    { $group: {
        _id: {
            month: { $dateToString: { format: '%Y-%m', date: '$createdAt' }},
            plan: '$user.plan'
        },
        revenue: { $sum: '$total' },
        orders: { $count: {} },
        avgOrder: { $avg: '$total' },
        uniqueCustomers: { $addToSet: '$userId' }
    }},

    // Stage 4: Add computed fields
    { $addFields: {
        uniqueCustomerCount: { $size: '$uniqueCustomers' },
        revenuePerCustomer: { $divide: ['$revenue', { $size: '$uniqueCustomers' }]}
    }},

    // Stage 5: Sort
    { $sort: { '_id.month': -1, revenue: -1 }},

    // Stage 6: Shape output
    { $project: {
        month: '$_id.month',
        plan: '$_id.plan',
        revenue: { $round: ['$revenue', 2] },
        orders: 1,
        uniqueCustomerCount: 1,
        revenuePerCustomer: { $round: ['$revenuePerCustomer', 2] },
        _id: 0
    }}
]).toArray();
```

## Change Streams

```javascript
// React to database changes in real-time
// Perfect for: cache invalidation, event sourcing, notifications

const pipeline = [
    { $match: {
        'operationType': { $in: ['insert', 'update', 'delete'] },
        'ns.coll': 'orders'
    }}
];

const changeStream = db.collection('orders').watch(pipeline, {
    fullDocument: 'updateLookup'  // Include full document on update
});

changeStream.on('change', async (event) => {
    const { operationType, fullDocument, documentKey } = event;

    switch (operationType) {
        case 'insert':
            await notifyNewOrder(fullDocument);
            await invalidateCache(`user:${fullDocument.userId}:orders`);
            break;

        case 'update':
            if (fullDocument.status === 'shipped') {
                await sendShippingEmail(fullDocument);
            }
            break;

        case 'delete':
            await cleanup(documentKey._id);
            break;
    }
});

// Handle connection drops
changeStream.on('error', async (error) => {
    if (error.code === 40585) {  // Resume token no longer valid
        await reconnectAndReprocess();
    }
});
```

## Multi-Document Transactions

```javascript
// MongoDB transactions (4.0+ single replica set, 4.2+ sharded)
const session = client.startSession();

try {
    await session.withTransaction(async () => {
        const orders = db.collection('orders');
        const inventory = db.collection('inventory');

        // Create order
        const order = await orders.insertOne({
            userId: 'user-123',
            items: [{ productId: 'prod-456', qty: 2 }],
            status: 'pending',
            createdAt: new Date()
        }, { session });

        // Deduct inventory
        const update = await inventory.updateOne(
            { productId: 'prod-456', qty: { $gte: 2 } },
            { $inc: { qty: -2 } },
            { session }
        );

        if (update.matchedCount === 0) {
            throw new Error('Insufficient inventory');
            // Throws → transaction auto-aborts
        }

        // If we get here → commit happens automatically
    });
    console.log('Order created successfully');
} catch (error) {
    console.error('Transaction failed, rolled back:', error.message);
} finally {
    await session.endSession();
}
```
