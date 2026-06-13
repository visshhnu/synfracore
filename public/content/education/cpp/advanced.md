# C++ — Advanced

## Smart Pointers (Modern C++ Memory Management)

```cpp
#include <memory>
using namespace std;

// unique_ptr — single owner, automatically freed
unique_ptr<int> uptr = make_unique<int>(42);
cout << *uptr;         // 42
// uptr goes out of scope → memory automatically freed
// Cannot copy unique_ptr, only move
unique_ptr<int> uptr2 = move(uptr); // Transfer ownership

// shared_ptr — reference counted, freed when count hits 0
shared_ptr<string> sptr1 = make_shared<string>("Hello");
shared_ptr<string> sptr2 = sptr1;  // Both own the string
cout << sptr1.use_count();  // 2
sptr1.reset();              // sptr1 releases ownership
cout << sptr2.use_count();  // 1
// sptr2 goes out of scope → memory freed

// weak_ptr — observe shared_ptr without owning
weak_ptr<string> wptr = sptr2;
if (auto locked = wptr.lock()) {  // Check if still alive
    cout << *locked;
}

// RULE: prefer make_unique/make_shared over raw new
// AVOID: delete, raw new in modern C++
```

## C++ Cheatsheet + Interview

```cpp
// ── COMMON COMPETITIVE PROGRAMMING TEMPLATE ───────────────
#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
typedef pair<int,int> pii;
typedef vector<int> vi;
#define pb push_back
#define mp make_pair
#define all(x) x.begin(), x.end()
#define sz(x) (int)x.size()
const int MOD = 1e9 + 7;
const int INF = 1e9;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    // Your code here
    return 0;
}

// ── STL QUICK REFERENCE ───────────────────────────────────
vector<int> v;   v.pb(x); v.pop_back(); v[i]; sort(all(v));
map<K,V> m;      m[k]=v; m.count(k); m.find(k);
set<T> s;        s.insert(x); s.erase(x); s.count(x);
priority_queue<int> maxpq;                // max heap
priority_queue<int,vector<int>,greater<int>> minpq; // min heap

// ── KEY INTERVIEW QUESTIONS ───────────────────────────────
// Q: What is RAII?
// A: Resource Acquisition Is Initialization — acquire resources in
//    constructor, release in destructor. Smart pointers, file streams,
//    locks all use RAII. When object goes out of scope, destructor
//    called automatically — no resource leaks.

// Q: virtual function vs override?
// A: virtual = function CAN be overridden by derived class.
//    override (C++11) = explicitly marks this overrides a virtual.
//    pure virtual (=0) = must be overridden (abstract function).

// Q: What is the Rule of Five?
// A: If you define any of: destructor, copy constructor, copy assignment,
//    move constructor, move assignment — define all five.
//    Modern C++: use smart pointers to avoid defining any.
```
