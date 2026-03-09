

## Terminology / Ordliste

| English | Nynorsk |
|---|---|
| Graph | Graf |
| Directed graph | Retta graf |
| Tree | Tre |
| Binary search tree | Binært søkjetre |
| Adjacency list | Naboliste |
| Knowledge graph | Kunnskapsgraf |

## Core Definitions

- **Graph:** \( G = (V, E) \) — a set of **nodes** (vertices) \( V \) and **edges** \( E \subseteq V \times V \)
- **Tree:** An acyclic connected graph — unique path from root to every node
- **Knowledge graph:** Graph where nodes = objects, edges = binary relations between objects

## Three Graph Representations

### 1. Adjacency List (Naboliste)

- Each node stores a **list of nodes it connects to**
- Doubly-linked variant: separate lists for incoming and outgoing edges
- Good for **sparse graphs**

### 2. Incidence List (Insidensliste)

- Each node stores a **list of edges** it is incident to
- Each **edge object** stores: `source`, `target`, `label`
- Allows labelled edges naturally (useful for knowledge graphs)
- Can use dynamic arrays or linked lists internally

### 3. Adjacency Matrix (Nabomatrise)

- 2D boolean array: `adj[i][j] = true` means edge from node *i* to node *j*
- Best for **dense graphs** (sparse → wastes memory with mostly `false`)

```cpp
bool adj[5][5] = {
    {true,  true,  true,  false, false},  // out of node 0
    {false, false, false, true,  false},  // out of node 1
    {true,  true,  false, false, false},  // out of node 2
    {false, true,  true,  false, false},  // out of node 3
    {true,  false, true,  false, false}   // out of node 4
};
```

## Comparison

| | Adjacency List | Incidence List | Adjacency Matrix |
|---|---|---|---|
| **Best for** | Sparse graphs | Labelled edges | Dense graphs |
| **Space** | \( O(V + E) \) | \( O(V + E) \) | \( O(V^2) \) |
| **Edge lookup** | Traverse list | Traverse list | \( O(1) \) |
| **Edge labels** | Not natural | Built-in | Not natural |

## Trees (Special Case of Graphs)

- A tree is a graph with a **unique root** and a **unique path** from root to each node
- **Binary search tree:** Each node has at most 2 children (left < parent < right)
- Leaf nodes point to `nullptr`
- Trees are often used as **sorted data structures** for efficiency

## Use Cases

- **Distance maps** → weighted graph (edges labelled with distances)
- **Knowledge bases / Semantic web** → knowledge graphs (nodes = individuals, edges = relations, can also represent class instantiation)
- **Sorted lookup** → binary search trees