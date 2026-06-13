# C++ — Intermediate

## STL Containers (Essential for Competitive Programming)

```cpp
#include <bits/stdc++.h>  // Include everything (competitive programming)
using namespace std;

int main() {
    // vector — dynamic array
    vector<int> v = {3, 1, 4, 1, 5, 9, 2, 6};
    v.push_back(7);           // Add to end
    v.pop_back();             // Remove from end
    sort(v.begin(), v.end()); // Sort ascending
    sort(v.rbegin(), v.rend()); // Sort descending
    reverse(v.begin(), v.end());
    v.size(); v[0]; v.front(); v.back();

    // pair
    pair<int, string> p = {1, "Alice"};
    p.first;  p.second;
    vector<pair<int,string>> vp = {{3,"C"},{1,"A"},{2,"B"}};
    sort(vp.begin(), vp.end()); // Sorts by first, then second

    // map (ordered by key, O(log n))
    map<string, int> mp;
    mp["Alice"] = 95;
    mp["Bob"]   = 87;
    mp.count("Alice");          // 1 if exists, 0 if not
    mp.find("Bob") != mp.end(); // exists check
    for (auto& [key, val] : mp) cout << key << ": " << val << "\n";

    // unordered_map (hash map, O(1) average)
    unordered_map<string, int> ump;
    ump["key"] = 42;

    // set (sorted unique elements)
    set<int> s = {5, 1, 3, 1, 2};  // {1, 2, 3, 5}
    s.insert(4); s.erase(3);
    s.count(2);   // 1 if present

    // priority_queue (heap)
    priority_queue<int> maxPQ;           // max heap
    priority_queue<int, vector<int>, greater<int>> minPQ;  // min heap
    maxPQ.push(5); maxPQ.push(1); maxPQ.push(3);
    cout << maxPQ.top();   // 5
    maxPQ.pop();

    // stack and queue
    stack<int> stk;
    stk.push(1); stk.top(); stk.pop();

    queue<int> q;
    q.push(1); q.front(); q.pop();

    // deque (double-ended queue)
    deque<int> dq;
    dq.push_front(1); dq.push_back(2);
    dq.front(); dq.back();

    return 0;
}
```

## STL Algorithms

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<int> v = {5, 2, 8, 1, 9, 3, 7, 4, 6};

    sort(v.begin(), v.end());               // ascending
    sort(v.begin(), v.end(), greater<int>()); // descending

    // Custom sort
    vector<pair<int,int>> pairs = {{3,1},{1,2},{2,3}};
    sort(pairs.begin(), pairs.end(), [](auto& a, auto& b){
        return a.second < b.second;  // sort by second element
    });

    int n = v.size();
    int idx = lower_bound(v.begin(), v.end(), 5) - v.begin(); // first >= 5
    int idx2 = upper_bound(v.begin(), v.end(), 5) - v.begin(); // first > 5
    bool found = binary_search(v.begin(), v.end(), 5);

    *max_element(v.begin(), v.end()); // maximum value
    *min_element(v.begin(), v.end()); // minimum value
    accumulate(v.begin(), v.end(), 0); // sum

    // Remove duplicates from sorted vector
    v.erase(unique(v.begin(), v.end()), v.end());

    // next_permutation — generate all permutations
    string s = "abc";
    do {
        cout << s << " ";
    } while (next_permutation(s.begin(), s.end()));
    // abc acb bac bca cab cba

    // Count and find
    count(v.begin(), v.end(), 5);               // count occurrences
    find(v.begin(), v.end(), 5) != v.end();     // check exists

    return 0;
}
```

## Templates

```cpp
// Generic function
template <typename T>
T maxVal(T a, T b) {
    return a > b ? a : b;
}

// Generic class
template <typename T>
class Stack {
    vector<T> data;
public:
    void push(T x) { data.push_back(x); }
    T pop() { T x = data.back(); data.pop_back(); return x; }
    T top() { return data.back(); }
    bool empty() { return data.empty(); }
    int size() { return data.size(); }
};

// Usage
cout << maxVal(3, 5) << "\n";           // 5 (int)
cout << maxVal(3.14, 2.71) << "\n";     // 3.14 (double)
cout << maxVal(string("apple"), string("fig")) << "\n"; // fig

Stack<int> s;
s.push(1); s.push(2); s.push(3);
cout << s.pop(); // 3
```
