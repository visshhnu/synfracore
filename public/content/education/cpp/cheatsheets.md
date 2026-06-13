# C++ — Cheatsheet

```cpp
// ── COMPETITIVE PROGRAMMING TEMPLATE ─────────────────────
#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
typedef pair<int,int> pii;
typedef vector<int> vi;
#define pb push_back
#define all(x) x.begin(),x.end()
#define sz(x) (int)(x).size()
const int MOD=1e9+7, INF=1e9;

// Fast I/O
ios_base::sync_with_stdio(false); cin.tie(NULL);

// ── VECTOR ────────────────────────────────────────────────
vector<int> v(n, 0);            // n zeros
v.pb(x); v.pop_back();
v.size(); v.empty();
v[i]; v.front(); v.back();
sort(all(v));
sort(all(v), greater<int>());    // descending
reverse(all(v));
*max_element(all(v));
accumulate(all(v), 0LL);         // sum (use 0LL for long long)
lower_bound(all(v), x) - v.begin(); // first index >= x
upper_bound(all(v), x) - v.begin(); // first index > x

// ── MAP ───────────────────────────────────────────────────
map<int,int> mp;
mp[k]++;                         // increment (auto-creates with 0)
mp.count(k)                      // 1 if exists, 0 if not
mp.find(k) != mp.end()           // exists check
for (auto& [k,v] : mp)           // C++17 structured binding

// ── SET ───────────────────────────────────────────────────
set<int> s;
s.insert(x); s.erase(x);
s.count(x); s.find(x)!=s.end();
*s.begin(); *s.rbegin();         // min, max
*prev(s.end());                  // last element

// ── PRIORITY QUEUE ────────────────────────────────────────
priority_queue<int> maxpq;       // max heap
priority_queue<int,vi,greater<int>> minpq; // min heap
// Custom comparator
auto cmp=[](pii a,pii b){ return a.second>b.second; };
priority_queue<pii,vector<pii>,decltype(cmp)> pq(cmp);

// ── STRING ────────────────────────────────────────────────
string s="hello";
s.size(); s.length(); s.empty();
s.substr(pos, len);
s.find("ll");                    // 2
s += " world";                   // concatenation
stoi(s); stoll(s); stof(s);      // string to number
to_string(42);                   // number to string
s[i];                            // char access
sort(all(s));                    // sort characters

// ── GRAPH TEMPLATES ───────────────────────────────────────
// BFS
vi dist(n, -1);
queue<int> q; q.push(src); dist[src]=0;
while(!q.empty()){
    int u=q.front(); q.pop();
    for(int v:adj[u]) if(dist[v]==-1){dist[v]=dist[u]+1; q.push(v);}
}

// DFS
vi vis(n,0);
function<void(int)> dfs=[&](int u){
    vis[u]=1;
    for(int v:adj[u]) if(!vis[v]) dfs(v);
};

// Dijkstra
vi dist(n,INF); dist[src]=0;
priority_queue<pii,vector<pii>,greater<pii>> pq;
pq.push({0,src});
while(!pq.empty()){
    auto [d,u]=pq.top(); pq.pop();
    if(d>dist[u]) continue;
    for(auto [v,w]:adj[u])
        if(dist[u]+w<dist[v]){ dist[v]=dist[u]+w; pq.push({dist[v],v}); }
}
```
