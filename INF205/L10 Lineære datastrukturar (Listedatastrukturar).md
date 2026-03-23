

---

### Linked Lists

**Singly Linked List**
- Each node: `item` + `next` pointer (2 vars per item)
- **Not contiguous** in memory → no pointer arithmetic (`p++`)
- Tracked by `head` and `tail` pointers
- Last node's `next` = `nullptr`

**Doubly Linked List**
- Each node: `prev` + `item` + `next` (3 vars per item)
- Traverse **both directions**
- Insert **before** any node in O(1) (singly linked can only insert *after*)

---

### push\_front: Singly vs Doubly

```cpp
// Singly linked
void SinglyLinkedList::push_front(const int& pushed_item) {
  auto* new_node = new SinglyLinkedListNode;
  new_node->set_item(pushed_item);
  if (this->empty()) this->tail = new_node;
  else new_node->set_next(this->head);
  this->head = new_node;
}

// Doubly linked — extra line: set prev on old head
void DoublyLinkedList::push_front(const int& pushed_item) {
  auto* new_node = new DoublyLinkedListNode;
  new_node->set_item(pushed_item);
  if (this->empty()) this->tail = new_node;
  else {
    new_node->set_next(this->head);
    this->head->set_prev(new_node);  // <-- extra
  }
  this->head = new_node;
}
```

---

### Deleting / Copying a Linked List

| Scenario | Default behavior | Problem |
|---|---|---|
| List goes out of scope (no custom destructor) | Only `head`/`tail` freed | **Memory leak** — nodes not freed |
| `y = x` (default copy) | Copies `head`/`tail` pointers | **Shallow copy** — both point to same nodes |

> You need custom **destructor**, **copy constructor**, and **copy assignment** (Rule of Three/Five).

---

### Sequential Data Structures: Complexity Comparison

| Operation | Dynamic Array | Singly Linked | Doubly Linked |
|---|---|---|---|
| **Access at pos k** | \( O(1) \) | \( O(k) \) → \( O(n) \) | \( O(\min(k, n-k)) \) → \( O(n) \) |
| **Iterate to next** | \( O(1) \) | \( O(1) \) | \( O(1) \) |
| **Insert at pos k** | \( O(n-k) \); \( O(n) \) worst (realloc) | \( O(1) \) at head/tail w/ ref; else \( O(k) \) | \( O(1) \) at head/tail w/ ref; else \( O(\min(k, n-k)) \) |
| **Delete at pos k** | \( O(1) \) at end; \( O(n-k) \) general | \( O(1) \) at head w/ ref; else \( O(k) \) | \( O(1) \) at head/tail w/ ref; else \( O(\min(k, n-k)) \) |

> **Key insight**: Linked list insert/delete is O(1) *once the node is found*. Finding it can take O(n).

---

### Stacks and Queues

| Structure | Principle | Push | Pop | Good implementations |
|---|---|---|---|---|
| **Stack** | LIFO (last in, first out) | head (list) or end (array) | head (list) or end (array) | Singly linked list *or* dynamic array |
| **Queue** | FIFO (first in, first out) | tail (enqueue) | head (dequeue) | Singly linked list (with tail ref) |

> All push/pop operations are **O(1)**. (Array push is O(1) amortized, O(n) worst case on realloc.)

---

### Graph Traversal

| Algorithm | Principle | Data structure used | Behavior |
|---|---|---|---|
| **DFS** (depth-first search) | LIFO | **Stack** | Goes deep first, backtracks |
| **BFS** (breadth-first search) | FIFO | **Queue** | Explores all neighbors first |

> Only nodes **reachable from the start node** can be found.

---

### Binary Search Trees (BST)

- **Balanced** → operations in \( O(\log n) \)
- **Degenerate** (all nodes on one side) → becomes a linked list → \( O(n) \)

**Red-Black Tree** (self-balancing BST):
1. Every node is **red** or **black** (1 extra bit)
2. All paths from root to leaf/half-leaf have **equal black-height**
3. **Red nodes** have only **black children**

→ Guarantees \( O(\log n) \) for search, insert, delete.

---

### Resource Efficiency

- **Problem size \( n \)**: defines the magnitude of the task (you choose what \( n \) represents)
- **Time** vs **Space** requirements
- **Worst-case** vs **Average-case** performance
- **Complexity class**: asymptotic behavior as \( n \to \infty \), Landau notation \( O(\cdot) \)
- **Algorithm efficiency** ≠ **Problem complexity** (problem complexity = best possible algorithm)

---

### Glossar (Key Terms)

| Norsk | English |
|---|---|
| Breidd-fyrst-søk (BFS) | Breadth-first search |
| Djupn-fyrst-søk (DFS) | Depth-first search |
| Kompleksitetsklasse | Complexity class |
| Dynamisk datastruktur | Dynamic data structure |
| Kø | Queue (FIFO) |
| Stakk | Stack (LIFO) |