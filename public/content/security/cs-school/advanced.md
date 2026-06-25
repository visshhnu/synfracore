# CS for Schools — Advanced Topics

## Data Structures

### Stacks
- LIFO (Last In, First Out)
- Operations: push, pop, peek
- Applications: undo feature, function call stack, expression evaluation

### Queues
- FIFO (First In, First Out)
- Operations: enqueue, dequeue
- Applications: printer spooling, BFS, message queues

### Linked Lists
- Nodes with data and pointer to next node
- Dynamic size, efficient insertion/deletion
- Traversal: O(n); No random access

### Trees
- Hierarchical structure; root → nodes → leaves
- Binary search tree: left < root < right
- Tree traversal: inorder (LNR), preorder (NLR), postorder (LRN)

### Hash Tables
- Key-value pairs; hash function maps key to index
- Average O(1) for get/set
- Collision resolution: chaining, open addressing

## Algorithms — Advanced

### Recursion
```python
def factorial(n):
    if n == 0:  # base case
        return 1
    return n * factorial(n-1)  # recursive case

def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
```

### Dynamic Programming
- Break problem into overlapping subproblems; store results
- Fibonacci with memoization: O(n) instead of O(2^n)
- Classic problems: coin change, knapsack, LCS

### Big O Notation
| Complexity | Name | Example |
|-----------|------|---------|
| O(1) | Constant | Array access |
| O(log n) | Logarithmic | Binary search |
| O(n) | Linear | Linear search |
| O(n log n) | Linearithmic | Merge sort |
| O(n²) | Quadratic | Bubble sort |
| O(2^n) | Exponential | Fibonacci (naive) |

## Networking Advanced

### Protocols
- TCP/IP: reliable connection-oriented protocol
- UDP: fast, connectionless, no guarantee of delivery
- HTTP/HTTPS: web browsing; HTTPS = HTTP + SSL/TLS encryption
- SMTP/IMAP/POP3: email protocols
- FTP/SFTP: file transfer

### Network Security
- Encryption: symmetric (AES) and asymmetric (RSA)
- SSL/TLS: encrypts web traffic (HTTPS padlock)
- Firewall: filters network traffic
- VPN: encrypted tunnel over public network

## Artificial Intelligence Basics
- Machine Learning: algorithms that learn from data
- Supervised learning: labeled training data (spam filter, image classification)
- Unsupervised learning: find patterns (clustering, recommendation)
- Neural networks: layers of connected nodes inspired by brain
- Applications: image recognition, NLP, self-driving cars, game AI
