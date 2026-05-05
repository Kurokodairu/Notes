
> Cheat sheet covering graph representations, BFS, DFS, topological sort, plus a pointer to P vs NP material.

---

## 1. Graph Representation

A graph $G = (V, E)$ where $V$ = vertices, $E$ = edges. Can be **directed** or **undirected**.

### Storage Comparison

|Representation|Space|Best for|
|---|---|---|
|Adjacency list|$O(V + E)$|Sparse graphs|
|Adjacency matrix|$O(V^2)$|Dense graphs|

### Worked example ($V=6$, $E=8$)

**Adjacency list:**

- Array of list heads: $6 \times 8\text{B} = 48\text{B}$
- List entries (node ID + next pointer): $8 \times 2 \times 8\text{B} = 128\text{B}$
- **Total: 172 B**

**Adjacency matrix:**

- $6^2 = 36$ entries → 36 B (1 byte each) or 4.5 B (1 bit each)

### Dense vs sparse rule of thumb

- **Dense** (each vertex ~5 edges, $V=6$): list = 528 B, matrix = 4.5 B → matrix wins
- **Sparse** (Norway roads: $V=10^6$, ~5 edges each): list ≈ 100 MB, matrix ≈ 100 GB → list wins by **1000×**

---

## 2. Breadth-First Search (BFS)

**Goal:** find shortest distance (in edges) from source $s$ to every other vertex.

### Outputs per vertex $v$

- $v.d$ — distance from $s$
- $v.\pi$ — predecessor on shortest path

The set ${(v.\pi, v) \mid v \neq s}$ forms the **breadth-first tree**.

### Idea

"Paint flowing from $s$." Reaches distance-1 vertices first, then distance-2, etc. Use a **FIFO queue** for the wavefront. A vertex is in $Q$ iff it's been reached but its neighbors haven't been processed yet.

### Pseudocode

```
BFS(V, E, s)
  for u in V
    u.d = inf
    u.p = NIL
  s.d = 0
  Q = new Queue
  Enqueue(Q, s)
  while Q not empty
    u = Dequeue(Q)
    for v in G.Adj[u]
      if v.d == inf            # not yet painted
        v.d = u.d + 1
        v.p = u
        Enqueue(Q, v)
```

### Print path from $s$ to $v$

```
Print-Path(G, s, v)
  if v == s
    print s
  elseif v.p == NIL
    print "no path from s to v"
  else
    Print-Path(G, s, v.p)
    print v
```

### Analysis

- Setup: $O(V)$
- Each vertex enqueued/dequeued at most once: $O(V)$
- Each edge examined once across the nested loop: $O(E)$
- **Total: $O(V + E)$**

### Correctness intuition

Queue holds at most two consecutive distance values at a time, smallest at the head → distances assigned in non-decreasing order.

---

## 3. Depth-First Search (DFS)

**Goal:** explore every edge; build a depth-first **forest**.

### Outputs per vertex $v$

- $v.d$ — discovery time
- $v.f$ — finishing time
- $v.\pi$ — predecessor

Times are unique integers in $[1, 2|V|]$ with $v.d < v.f$.

### Vertex coloring

- **White** — undiscovered
- **Gray** — discovered, exploration ongoing
- **Black** — finished (all reachable found)

### Pseudocode

```
DFS(G)
  for u in G.V
    u.c = WHITE
    u.p = NIL
  time = 0
  for u in G.V
    if u.c == WHITE
      DFS-VISIT(G, u)

DFS-VISIT(G, u)
  time = time + 1
  u.d = time
  u.c = GRAY
  for each v in G.Adj[u]
    if v.c == WHITE
      v.p = u
      DFS-VISIT(G, v)
  u.c = BLACK
  time = time + 1
  u.f = time
```

### Analysis

- **$\Theta(V + E)$** — each vertex and edge examined once.

### Parenthesis Theorem

For any two vertices $u, v$, exactly one of:

1. **Disjoint intervals** — $[u.d, u.f]$ and $[v.d, v.f]$ don't overlap; neither is descendant of the other.
2. $v$ is descendant of $u$ — $u.d < v.d < v.f < u.f$
3. $u$ is descendant of $v$ — $v.d < u.d < u.f < v.f$

### Edge classification

|Type|Definition|
|---|---|
|**Tree edge**|$(u,v)$ found while $v$ is white|
|**Back edge**|$(u,v)$ where $u$ is descendant of $v$, i.e. $[u.d, u.f] \subset [v.d, v.f]$|
|**Forward edge**|$(u,v)$ where $v$ is descendant of $u$ but not a tree edge|
|**Cross edge**|Anything else (may span different trees)|

> **Theorem:** In an _undirected_ graph, DFS produces only tree and back edges.

---

## 4. Topological Sort

For **directed acyclic graphs (DAGs)** only — cycles make sorting impossible.

Captures **partial order**: $a > b$ and $b > c \Rightarrow a > c$, but pairs may be incomparable.

### Idea

Read edge $A \to B$ as "$A$ required by $B$." A vertex finishes (in DFS) only after all dependents are explored, so dependents have _earlier_ finish times but must run _later_.

→ **Output vertices in order of decreasing finishing time.**

### Algorithm

1. Run DFS.
2. When a vertex finishes, prepend it to the result list.
3. Resulting list is topologically sorted.

Runtime: **$\Theta(V + E)$** (just a DFS with bookkeeping).

### Example: getting dressed

Edge `pants → shoes` means "pants before shoes." DFS assigns finishing times; reading vertices by descending $f$ gives a valid dressing order (e.g., watch → underpants → socks → shirt → pants → tie → belt → jacket → shoes).

---

## 5. Limits of Computability

Pointer in lecture: see `INF221_V25_L13_PNP.pdf` and Skiena Ch. 11. Topics:

- **Das Entscheidungsproblem** (Hilbert's decision problem)
- **P vs NP**

---

## Quick reference card

|Algorithm|Input|Output|Runtime|
|---|---|---|---|
|BFS|graph + source $s$|shortest-edge distances, BFS tree|$O(V+E)$|
|DFS|graph|discovery/finish times, DFS forest|$\Theta(V+E)$|
|Topo sort|DAG|linear order respecting edges|$\Theta(V+E)$|

---

## Admin reminders

- **Exercise session:** Thu 7 May, 10:15–12:00, TF1-105
- **Q&A:** Thu 21 May, 10:00–11:00, Plesser's office (TF2-305)
- **Exam:** Wed 27 May, 09:00–12:30 — open book (Cormen _Algorithms Unlocked_ with handwritten notes only; no loose sheets/printouts), calculator provided, math sheet included.

#inf221 #algorithms #graphs #bfs #dfs #topological-sort

Want me to drop this into a `.md` file you can pull straight into your Obsidian vault?