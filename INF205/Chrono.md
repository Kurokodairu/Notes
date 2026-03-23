```c++
double duration = 0.0;
for(int i = 0; i < iter; i++)
{
   auto t0a = std::chrono::high_resolution_clock::now();

   …  // her skjer det eigentlege arbeidet

   auto t1a = std::chrono::high_resolution_clock::now();
   auto delta_ta = std::chrono::duration_cast<std::chrono::microseconds>(t1a-t0a).count();
   duration += 1.0e-06 * delta_ta;
}
```


ER-Diagram

# ER Diagram — oblig3

## Entity Types & Relationship Types

  

`
```mermaid

flowchart TB

  

%% ── Entity types (rectangles) ──────────────────────────────────────────

  

Graph["**«abstract» Graph**

───────────────────────────────

+insert_edge(node_a, edge, node_b) : void

+disconnect(node_a, node_b) : void

+remove_node(node_label) : void

+print() : void

+write_file(filename) : void

+read_file(filename) : void

+node_count() : int

+get_node_labels() : vector&lt;string&gt;

+get_outgoing(node) : vector&lt;pair&lt;string,string&gt;&gt;"]

  

ILG["**IncidenceListGraph**

───────────────────────────────

-nodes : vector&lt;Node*&gt;

-edges : vector&lt;Edge*&gt;"]

  

AMG["**AdjacencyMatrixGraph**

───────────────────────────────

-node_labels : vector&lt;string&gt;

-matrix : vector&lt;vector&lt;vector&lt;string&gt;&gt;&gt;"]

  

NodeType["**Node**

───────────────────────────────

+label : string

+edges : vector&lt;Edge*&gt;"]

  

EdgeType["**Edge**

───────────────────────────────

+label : string

+source : Node*

+target : Node*"]

  

%% ── Taxonomy (ISA / subclass hierarchy) ────────────────────────────────

  

ILG -->|ISA| Graph

AMG -->|ISA| Graph

  

%% ── Relationship types (diamonds ◇) ────────────────────────────────────

%% Arrow (-->) points to the to-1 side

  

r1{ilg_owns_nodes}

r2{ilg_owns_edges}

r3{edge_source}

r4{edge_target}

r5{node_incident_edge}

  

%% N Nodes belong to 1 IncidenceListGraph → arrow toward ILG

NodeType --- r1

r1 -->|N-to-1| ILG

  

%% N Edges belong to 1 IncidenceListGraph → arrow toward ILG

EdgeType --- r2

r2 -->|N-to-1| ILG

  

%% N Edges share 1 source Node → arrow toward Node

EdgeType --- r3

r3 -->|N-to-1| NodeType

  

%% N Edges share 1 target Node → arrow toward Node

EdgeType --- r4

r4 -->|N-to-1| NodeType

  

%% Node back-references its incident Edges (M-to-N, no arrow)

NodeType --- r5

r5 --- EdgeType

```



```

Node ◇─────ilg_owns_nodes─────▷ IncidenceListGraph

label (string) nodes : vector<Node*>

edges : vector<Edge*> edges : vector<Edge*>

"Every Node is owned by exactly one IncidenceListGraph"

N-to-1

  

Edge ◇─────ilg_owns_edges─────▷ IncidenceListGraph

label (string)

source : Node*

target : Node*

"Every Edge is owned by exactly one IncidenceListGraph"

N-to-1

  

Edge ◇─────edge_source─────▷ Node

"Every Edge has exactly one source Node"

N-to-1

  

Edge ◇─────edge_target─────▷ Node

"Every Edge has exactly one target Node"

N-to-1

  

Node ◇─────node_incident_edge─────◇ Edge

"A Node references all Edges incident on it (back-ref)"

M-to-N (no arrow — neither side is 'to-1')

```

  

### Taxonomy

  

```

Graph (abstract)

/ \

▽ ▽

IncidenceListGraph AdjacencyMatrixGraph

```

  

---

  

## Legend

  

| Symbol | Meaning |

|--------|---------|

| `◇` (hollow diamond on line) | Relationship type (forholdstype) |

| `▷` (arrowhead on line) | to-1 side of the relationship |

| No arrowhead on line | M-to-N relationship |

| `▽` (hollow triangle) | ISA / subclass (points to superclass) |