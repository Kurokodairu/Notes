# INF221 Lecture 11 — Dynamic Programming, Greedy Algorithms, Graph Representation

## Overview

Topics:

1. Dynamic programming
2. Greedy algorithms
   - Activity selection problem
   - Greedy strategy
   - Knapsack problem
3. Graph representation
   - Adjacency lists
   - Adjacency matrices

---

# 1. Dynamic Programming

## Core idea

Dynamic programming is a general optimization technique.

Despite the name, “programming” does **not** mean computer programming here. It is closer to “dynamic optimization”.

Dynamic programming is used for problems where we want to:

- maximize something, or
- minimize something

Examples:

- maximize profit
- minimize cost
- find shortest path
- maximize number of compatible activities
- maximize value in a knapsack

---

## General dynamic programming approach

1. Characterize the structure of an optimal solution.
2. Recursively define the value of an optimal solution.
3. Compute the value of an optimal solution.
4. Construct an optimal solution from computed information.

---

## When can dynamic programming be used?

Dynamic programming works when the problem has:

### 1. Optimal substructure

An optimal solution to the whole problem can be built from optimal solutions to smaller subproblems.

In other words:

> The best global solution contains best solutions to its subproblems.

### 2. Independent subproblems

Subproblems must not interfere with each other.

For example, in rod cutting, after making a cut, each remaining piece can be optimized independently.

But if there were a global constraint like:

> the saw can make at most \(N\) cuts total

then subproblems would no longer be independent in the same simple way.

### 3. Overlapping subproblems

The same subproblems occur many times.

This allows us to reuse already-computed results.

---

## Dynamic programming vs divide-and-conquer

| Technique | Subproblems | Reuse results? | Example |
|---|---|---|---|
| Divide-and-conquer | Different independent subproblems | Usually no | Merge sort |
| Dynamic programming | Overlapping subproblems | Yes | Rod cutting |

In merge sort, each recursive call sorts different data, so memoization does not help.

In dynamic programming, the same subproblem appears repeatedly.

---

# 2. Rod Cutting Problem

## Problem

We have a rod of length \(n\).

We may cut it into integer-length pieces and sell each piece.

Each length \(i\) has price \(p_i\).

Goal:

> Cut the rod to maximize total revenue.

---

## Example prices

| Length \(i\) | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Price \(p_i\) | 1 | 5 | 8 | 9 | 10 | 17 | 17 | 20 | 24 | 30 |

---

## Cutting combinations

If the rod has length \(n\), we can cut it into pieces:

$$
n = i_1 + i_2 + \cdots + i_k
$$

The revenue is:

$$
r_n = p_{i_1} + p_{i_2} + \cdots + p_{i_k}
$$

The optimal value \(r_n\) is the maximum revenue possible for length \(n\).

---

## Example optimal solutions

| Rod length | Optimal value | Optimal cut |
|---:|---:|---|
| 1 | 1 | 1 |
| 2 | 5 | 2 |
| 3 | 8 | 3 |
| 4 | 10 | 2 + 2 |
| 5 | 13 | 2 + 3 |
| 6 | 17 | 6 |
| 7 | 18 | 1 + 6 or 2 + 2 + 3 |
| 8 | 22 | 2 + 6 |

---

## Recursive structure

For a rod of length \(n\), try choosing the first cut length \(i\).

Then the remaining rod has length \(n - i\).

So:

$$
r_n = \max_{1 \le i \le n}(p_i + r_{n-i})
$$

Base case:

$$
r_0 = 0
$$

---

## Naive recursive algorithm

```text
Cut-Rod(p, n)
    if n == 0
        return 0

    q = -infinity

    for i = 1 to n
        q = max(q, p[i] + Cut-Rod(p, n - i))

    return q
```

### Problem

This recomputes the same subproblems many times.

Example:

```text
Cut-Rod(p, 4)
```

calls:

```text
Cut-Rod(p, 3)
Cut-Rod(p, 2)
Cut-Rod(p, 1)
Cut-Rod(p, 0)
```

and those again call smaller versions repeatedly.

### Runtime

The recurrence is:

$$
T(n) =
\begin{cases}
1 & \text{if } n = 0 \\
1 + \sum_{j=0}^{n-1} T(j) & \text{if } n \ge 1
\end{cases}
$$

Solution:

$$
T(n) = 2^n
$$

So the naive version is exponential.

---

# 3. Dynamic Programming Solutions for Rod Cutting

There are two main DP styles:

1. Top-down recursion with memoization
2. Bottom-up iteration

---

## 3.1 Top-down with memoization

### Idea

Store already-computed results in an array \(r\).

If we need \(r[n]\) again, return the stored value instead of recomputing it.

---

### Wrapper

```text
Memoized-Cut-Rod(p, n)
    new array r[0..n] = -infinity
    return Memoized-Cut-Rod-Aux(p, n, r)
```

---

### Recursive worker

```text
Memoized-Cut-Rod-Aux(p, n, r)
    if r[n] >= 0
        return r[n]

    if n == 0
        q = 0
    else
        q = -infinity

        for i = 1 to n
            q = max(q, p[i] + Memoized-Cut-Rod-Aux(p, n - i, r))

    r[n] = q
    return q
```

---

## 3.2 Bottom-up dynamic programming

### Idea

Compute small rod lengths first.

Then use those solutions to compute larger lengths.

---

### Algorithm

```text
Bottom-Up-Cut-Rod(p, n)
    new array r[0..n]
    r[0] = 0

    for j = 1 to n
        q = -infinity

        for i = 1 to j
            q = max(q, p[i] + r[j - i])

        r[j] = q

    return r[n]
```

---

## Runtime of DP rod cutting

Both memoized top-down and bottom-up have runtime:

$$
\Theta(n^2)
$$

Reason:

For each rod length \(j\), we try all first cuts \(i = 1, \dots, j\).

Total work:

$$
\sum_{j=1}^{n} j = \Theta(n^2)
$$

---

# 4. Reconstructing the Rod-Cutting Solution

So far we only computed the optimal revenue.

To recover the actual cuts, store the best first cut for each rod length.

---

## Extended bottom-up algorithm

```text
Extended-Bottom-Up-Cut-Rod(p, n)
    new array r[0..n]
    new array s[1..n]

    r[0] = 0

    for j = 1 to n
        q = -infinity

        for i = 1 to j
            if q < p[i] + r[j - i]
                q = p[i] + r[j - i]
                s[j] = i

        r[j] = q

    return r, s
```

---

## Meaning of array \(s\)

\(s[j]\) stores the first cut length in an optimal solution for rod length \(j\).

Example:

If:

```text
s[8] = 2
```

then the first cut should be length 2, leaving length 6.

Then check:

```text
s[6]
```

and continue until length 0.

---

## Print optimal cut sequence

```text
Print-Cut-Rod-Solution(p, n)
    r, s = Extended-Bottom-Up-Cut-Rod(p, n)

    while n > 0
        print s[n]
        n = n - s[n]
```

---

# 5. Greedy Algorithms

## Core idea

Greedy algorithms solve optimization problems by making the locally best choice at each step.

A greedy choice is:

> the option that looks best right now.

For some problems, this local strategy produces a globally optimal solution.

For others, it does not.

---

## Greedy algorithm requirements

A greedy algorithm is correct when the problem has:

### 1. Greedy-choice property

A globally optimal solution can be built by repeatedly making locally optimal choices.

Meaning:

> The greedy choice is always safe.

### 2. Optimal substructure

After making the greedy choice, the remaining problem must still be an optimization problem of the same kind.

---

## Greedy strategy procedure

1. Reformulate the problem so that one choice leaves one smaller subproblem.
2. Prove that there is always an optimal solution containing the greedy choice.
3. Prove that combining the greedy choice with an optimal solution to the subproblem gives an optimal solution to the original problem.

---

# 6. Activity Selection Problem

## Problem

We have a set of activities:

$$
S = \{a_1, a_2, \dots, a_n\}
$$

Each activity \(a_i\) has:

- start time \(s_i\)
- finish time \(f_i\)

Activity \(a_i\) uses the resource during:

$$
[s_i, f_i)
$$

Goal:

> Select as many mutually compatible, non-overlapping activities as possible.

---

## Important note

We maximize the **number of activities**, not total duration.

Other possible objectives could be:

- maximize room usage time
- maximize rental income
- be robust against delays

But this lecture focuses on maximizing number of activities.

---

## Compatibility

Two activities are compatible if they do not overlap.

Activity \(a_i\) and \(a_j\) are compatible if:

$$
f_i \le s_j
$$

assuming \(a_i\) finishes before \(a_j\) starts.

---

## Greedy idea

Assume activities are sorted by increasing finish time:

$$
f_1 \le f_2 \le \cdots \le f_n
$$

Greedy rule:

> Always choose the activity that finishes first among the remaining compatible activities.

Why?

Because finishing early leaves as much room as possible for future activities.

---

## Recursive greedy algorithm

```text
Rec-Activity-Selector(s, f, k, n)
    m = k + 1

    while m <= n and s[m] < f[k]
        m = m + 1

    if m <= n
        return {a_m} + Rec-Activity-Selector(s, f, m, n)
    else
        return {}
```

Initial call:

```text
Rec-Activity-Selector(s, f, 0, n)
```

Here \(a_0\) is a dummy activity with finish time \(f_0 = 0\).

---

## Runtime

If activities are already sorted by finish time:

$$
\Theta(n)
$$

Each activity is considered once.

If not sorted, sorting costs:

$$
\Theta(n \log n)
$$

---

## Iterative greedy algorithm

```text
Greedy-Activity-Selector(s, f)
    A = {a_1}
    k = 1

    for m = 2 to s.length
        if s[m] >= f[k]
            A = A + {a_m}
            k = m

    return A
```

Runtime after sorting:

$$
\Theta(n)
$$

---

## Activity selection cheat pattern

Given sorted finish times:

1. Pick first activity.
2. Track last selected activity \(k\).
3. Scan through remaining activities.
4. If \(s_m \ge f_k\), select activity \(m\).
5. Update \(k = m\).

---

# 7. Dynamic Programming vs Greedy

## Comparison

| Feature | Dynamic Programming | Greedy |
|---|---|---|
| Main idea | Solve all relevant subproblems | Make best local choice |
| Considers many choices? | Yes | Usually one |
| Stores subproblem results? | Yes | Usually no |
| Requires optimal substructure? | Yes | Yes |
| Requires greedy-choice property? | No | Yes |
| Example | 0-1 knapsack, rod cutting | Activity selection, fractional knapsack |

---

## When to suspect DP

Use dynamic programming when:

- many combinations must be considered
- subproblems overlap
- greedy local choices may fail
- you need guaranteed optimal value

---

## When to suspect greedy

Use greedy when:

- a locally optimal choice can be proven safe
- one choice reduces the problem to one smaller subproblem
- no need to revisit earlier choices

---

# 8. Knapsack Problems

## General knapsack idea

We have:

- items/goods
- each has value
- each has size, weight, or volume
- knapsack has fixed capacity

Goal:

> Choose items to maximize total value without exceeding capacity.

---

# 8.1 Fractional Knapsack

## Problem

Items are divisible.

Example:

- sausages
- liquid
- grain

You can take part of an item.

---

## Greedy strategy

For each item, compute:

$$
\text{value density} = \frac{\text{value}}{\text{volume}}
$$

Then:

1. Sort items by decreasing value density.
2. Take as much as possible of the highest-density item.
3. Continue with next-highest density.
4. If remaining capacity is small, take a fraction of the next item.

---

## Why greedy works

Because every unit of capacity should be filled with the highest value-per-volume still available.

Fractional choices avoid wasted space.

---

# 8.2 0-1 Knapsack

## Problem

Items are indivisible.

Example:

- books
- laptops
- boxes

Each item must either be taken or not taken.

Hence “0-1”:

- 0 = do not take item
- 1 = take item

---

## Why greedy does not generally work

Taking the best value density item may leave unusable space.

Sometimes a lower-density combination gives higher total value.

Therefore:

> 0-1 knapsack usually needs dynamic programming.

---

## Fractional vs 0-1 knapsack

| Feature | Fractional knapsack | 0-1 knapsack |
|---|---|---|
| Items divisible? | Yes | No |
| Can take part of item? | Yes | No |
| Greedy works? | Yes | Not generally |
| Typical solution | Greedy | Dynamic programming |
| Example | Sausages | Books |

---

# 9. Graph Representation

## Graph definition

A graph is:

$$
G = (V, E)
$$

where:

- \(V\) is the set of vertices
- \(E\) is the set of edges

Graphs can be:

- directed
- undirected
- weighted
- unweighted

---

## Important quantities

| Notation | Meaning |
|---|---|
| \(|V|\) | number of vertices |
| \(|E|\) | number of edges |

Often, in asymptotic notation, people write:

$$
O(V + E)
$$

instead of:

$$
O(|V| + |E|)
$$

when context is clear.

---

# 10. Adjacency Lists

## Structure

An adjacency list representation stores:

- one list per vertex
- each list contains all neighboring vertices

For vertex \(u\), the list contains all \(v\) such that:

$$
(u, v) \in E
$$

Notation:

```text
G.Adj[u]
```

means the adjacency list of vertex \(u\).

---

## Directed graph

For a directed graph, each edge appears once.

If:

$$
(u, v) \in E
$$

then \(v\) appears in `G.Adj[u]`.

---

## Undirected graph

For an undirected graph, each edge appears twice.

If there is an undirected edge between \(u\) and \(v\), then:

- \(v\) appears in `G.Adj[u]`
- \(u\) appears in `G.Adj[v]`

---

## Weighted graphs

For weighted graphs, store the weight along with the destination vertex.

Example adjacency list entry:

```text
u: [(v, w), (x, w2)]
```

where:

- \(v\), \(x\) are neighboring vertices
- \(w\), \(w2\) are edge weights

---

## Adjacency list complexity

| Operation | Complexity |
|---|---|
| Space | \(\Theta(V + E)\) |
| List all neighbors of \(u\) | \(\Theta(\text{degree}(u))\) |
| Check whether \((u, v) \in E\) | \(O(\text{degree}(u))\) |

---

## When are adjacency lists good?

Adjacency lists are good for sparse graphs.

A sparse graph has relatively few edges compared to the maximum possible number.

For example:

$$
|E| \ll |V|^2
$$

---

# 11. Adjacency Matrix

## Structure

An adjacency matrix is a \(|V| \times |V|\) matrix \(A\).

For unweighted graphs:

$$
a_{ij} =
\begin{cases}
1 & \text{if } (i, j) \in E \\
0 & \text{otherwise}
\end{cases}
$$

Row \(i\) represents edges leaving vertex \(i\).

---

## Weighted graphs

For weighted graphs, store the weight instead of 1:

$$
a_{ij} = w
$$

if there is an edge from \(i\) to \(j\) with weight \(w\).

If no edge exists, store something like:

- 0
- infinity
- null

depending on the algorithm/context.

---

## Adjacency matrix complexity

| Operation | Complexity |
|---|---|
| Space | \(\Theta(V^2)\) |
| List all neighbors of \(u\) | \(\Theta(V)\) |
| Check whether \((u, v) \in E\) | \(\Theta(1)\) |

---

## When are adjacency matrices good?

Adjacency matrices are good when:

- the graph is dense
- many edge-existence queries are needed
- constant-time edge lookup matters

A dense graph has many edges, often close to:

$$
|V|^2
$$

---

# 12. Adjacency List vs Matrix

| Feature | Adjacency List | Adjacency Matrix |
|---|---|---|
| Space | \(\Theta(V + E)\) | \(\Theta(V^2)\) |
| Good for | Sparse graphs | Dense graphs |
| List neighbors | \(\Theta(\text{degree}(u))\) | \(\Theta(V)\) |
| Check if edge exists | \(O(\text{degree}(u))\) | \(\Theta(1)\) |
| Undirected edge storage | Twice | Symmetric entries |
| Directed edge storage | Once | One matrix entry |

---

# 13. Exam / Quick Cheat Sheet

## Dynamic programming

Use when:

- optimal substructure
- independent subproblems
- overlapping subproblems

General steps:

1. Define optimal value.
2. Find recurrence.
3. Compute values with memoization or bottom-up.
4. Reconstruct solution if needed.

---

## Rod cutting recurrence

Base:

$$
r_0 = 0
$$

Recurrence:

$$
r_n = \max_{1 \le i \le n}(p_i + r_{n-i})
$$

Naive recursive runtime:

$$
T(n) = 2^n
$$

DP runtime:

$$
\Theta(n^2)
$$

---

## Rod cutting reconstruction

Store:

```text
s[j] = first cut in optimal solution for length j
```

Then repeatedly print:

```text
s[n]
n = n - s[n]
```

---

## Greedy algorithms

Use when:

- greedy-choice property
- optimal substructure

Greedy choice must be safe.

---

## Activity selection

Goal:

> maximize number of non-overlapping activities.

Assume sorted by finish time.

Greedy rule:

> Always choose the compatible activity with earliest finish time.

Compatibility:

$$
s_m \ge f_k
$$

Runtime after sorting:

$$
\Theta(n)
$$

With sorting included:

$$
\Theta(n \log n)
$$

---

## Knapsack

| Problem | Greedy? | DP? |
|---|---:|---:|
| Fractional knapsack | Yes | Not needed |
| 0-1 knapsack | Not generally | Yes |

Fractional greedy rule:

$$
\text{choose by decreasing } \frac{\text{value}}{\text{volume}}
$$

---

## Graph representation

Graph:

$$
G = (V, E)
$$

Adjacency list:

- space: \(\Theta(V + E)\)
- neighbor listing: \(\Theta(\text{degree}(u))\)
- edge lookup: \(O(\text{degree}(u))\)

Adjacency matrix:

- space: \(\Theta(V^2)\)
- neighbor listing: \(\Theta(V)\)
- edge lookup: \(\Theta(1)\)

---

# 14. Common Exam Traps

## Trap 1: Greedy does not always work

Just because an algorithm makes locally good choices does not mean it is correct.

You must prove:

- greedy-choice property
- optimal substructure

---

## Trap 2: Fractional vs 0-1 knapsack

Fractional knapsack:

- divisible items
- greedy works

0-1 knapsack:

- indivisible items
- greedy fails in general
- use DP

---

## Trap 3: DP needs overlapping subproblems

Optimal substructure alone is not enough.

Merge sort has optimal substructure-like recursion, but no overlapping subproblems.

---

## Trap 4: Rod cutting naive recursion is exponential

Even though the recurrence looks simple, repeated recomputation makes it expensive.

Naive:

$$
2^n
$$

DP:

$$
\Theta(n^2)
$$

---

## Trap 5: Activity selection must be sorted by finish time

The greedy activity algorithm assumes:

$$
f_1 \le f_2 \le \cdots \le f_n
$$

If not sorted, sort first.

---

# 15. Minimal Obsidian Flashcards

## Dynamic programming

Q: What are the three key requirements for dynamic programming?  
A: Optimal substructure, independent subproblems, overlapping subproblems.

---

Q: What is memoization?  
A: Storing results of subproblems so repeated calls can reuse them.

---

Q: What is bottom-up dynamic programming?  
A: Computing smaller subproblems first and using them to build larger solutions.

---

Q: What is the rod-cutting recurrence?  
A: \(r_n = \max_{1 \le i \le n}(p_i + r_{n-i})\), with \(r_0 = 0\).

---

Q: What is the runtime of naive rod cutting?  
A: \(2^n\).

---

Q: What is the runtime of DP rod cutting?  
A: \(\Theta(n^2)\).

---

## Greedy algorithms

Q: What is a greedy algorithm?  
A: An algorithm that repeatedly makes the locally best choice.

---

Q: What two properties are needed for greedy correctness?  
A: Greedy-choice property and optimal substructure.

---

Q: What does it mean that a greedy choice is safe?  
A: There exists an optimal solution that includes that greedy choice.

---

## Activity selection

Q: What is the greedy rule for activity selection?  
A: Pick the compatible activity with earliest finish time.

---

Q: What does activity selection maximize?  
A: The number of selected non-overlapping activities.

---

Q: What is the compatibility condition for two activities?  
A: \(s_m \ge f_k\), where \(k\) is the last selected activity.

---

Q: What is the runtime of greedy activity selection after sorting?  
A: \(\Theta(n)\).

---

## Knapsack

Q: Which knapsack variant can be solved greedily?  
A: Fractional knapsack.

---

Q: Which knapsack variant usually needs dynamic programming?  
A: 0-1 knapsack.

---

Q: What is the greedy rule for fractional knapsack?  
A: Take items in decreasing value density.

---

## Graphs

Q: What is a graph?  
A: \(G = (V, E)\), where \(V\) is vertices and \(E\) is edges.

---

Q: What is the space usage of adjacency lists?  
A: \(\Theta(V + E)\).

---

Q: What is the space usage of an adjacency matrix?  
A: \(\Theta(V^2)\).

---

Q: Which representation is better for sparse graphs?  
A: Adjacency lists.

---

Q: Which representation gives constant-time edge lookup?  
A: Adjacency matrix.

---
