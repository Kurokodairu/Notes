
## The Sorting Problem

- **Input:** sequence $\langle a_1, a_2, \dots, a_n \rangle$
- **Output:** permutation such that $a_1' \leq a_2' \leq \dots \leq a_n'$
- **Key** = attribute determining sort order; everything else is **satellite data**

| Algorithm      | Time              | In-place? |
| -------------- | ----------------- | --------- |
| Insertion sort | $O(n^2)$          | ✅         |
| Merge sort     | $O(n \lg n)$      | ❌         |
| Heapsort       | $O(n \lg n)$      | ✅         |
| Quicksort      | $O(n \lg n)$ avg  | ✅         |

---

## Heaps

> A **(binary) heap** is a **complete or almost-complete binary tree** stored as an array.

### Array Representation

| Property           | Formula                                        |
| ------------------ | ---------------------------------------------- |
| Root               | `A[1]`                                         |
| Left child of `i`  | `2i` (bit-shift left)                          |
| Right child of `i` | `2i + 1` (bit-shift left + 1)                  |
| Parent of `i`      | `⌊i/2⌋` (bit-shift right) (**floor** operator) |
| Array size         | `A.length`                                     |
| Heap size          | `A.heap_size ≤ A.length`                       |
l = $2*i$ -> p= l/2
|r = $2*i + 1$ ->  p= $(r-1) /2$

### Key Definitions

- **Root:** only node with no parent
- **Leaf:** node with no children
- **Height of node:** # edges on longest downward path to a leaf
- **Height of heap:** height of root = $\lfloor \lg n \rfloor$

### Max-Heap Property

$$A[\text{Parent}(i)] \geq A[i] \quad \forall\; i \neq \text{root}$$

- Largest element at root
- Every Parent value for i  must be equal to/greater than the value at i
- **Min-heap:** reversed — smallest at root




---

## Core Heap Algorithms

### Max-Heapify — $O(\lg n)$

> Fixes **one violation** at node `i`, assuming both subtrees are already max-heaps.

```text
Max-Heapify(A, i)
  l = Left(i)
  r = Right(i)
  largest = i
  if l ≤ A.heap_size and A[l] > A[i]
    largest = l
  if r ≤ A.heap_size and A[r] > A[largest]
    largest = r
  if largest ≠ i:
    swap A[i], A[largest]
    Max-Heapify(A, largest)
```
Runtime T(n) = $\Theta$ (lg n)
### Build-Max-Heap — $O(n)$

> Converts any array into a max-heap bottom-up.

```text
Build-Max-Heap(A)
  A.heap_size = A.length
  for i = ⌊A.length/2⌋ downto 1
    Max-Heapify(A, i)
```

- Leaves ($A[\lfloor n/2 \rfloor + 1 \dots n]$) are trivial 1-element max-heaps
- Loose bound: $O(n \lg n)$; 
- tight bound: $O(n)$ because most nodes are near the bottom

**Tight bound derivation:**

$$T(n) = \sum_{h=0}^{\lfloor \lg n \rfloor} \left\lceil \frac{n}{2^{h+1}} \right\rceil O(h) = O\!\left(n \sum_{h=0}^{\infty} \frac{h}{2^h}\right) = O(n)$$

since $\sum_{h=0}^{\infty} h/2^h = 2$.

Correctness
-> invariant, at the start of each iteration of the for-loop on line 3-4, each node i+1, i+2..., n is the root of a max-heap.
-> init, before we start we have i = $\lfloor \frac{n}{2} \rfloor$ Since all elements in .... 
**PDF**


---

## Heapsort — $O(n \lg n)$, in-place

```text
Heapsort(A)
  Build-Max-Heap(A)              // O(n)
  for i = A.length downto 2      // n-1 iterations
    swap A[1], A[i]              // move max to end
    A.heap_size -= 1
    Max-Heapify(A, 1)            // O(lg n)
```

**Idea:** repeatedly extract the max (root), place it at the end, shrink heap, re-heapify.

**Runtime:** $O(n) + O(n \lg n) = O(n \lg n)$
Build-Heapmax + max-heapify = O(n lg n)

---

## Priority Queues (via Max-Heap)

> Dynamic set supporting efficient extraction of the max-key element.

| Operation                        | Runtime        | Description                          |
| -------------------------------- | -------------- | ------------------------------------ |
| `Heap-Maximum(A)`                | $\Theta(1)$    | Return `A[1]`                        |
| `Heap-Extract-Max(A)`            | $O(\lg n)$     | Remove & return max, then heapify    |
| `Heap-Increase-Key(A, i, key)`   | $O(\lg n)$     | Increase key, bubble up to root      |
| `Max-Heap-Insert(A, key)`        | $O(\lg n)$     | Insert at end with $-\infty$, then increase key |

### Pseudocode Snippets

```text
Heap-Extract-Max(A)
  max = A[1]
  A[1] = A[A.heap_size]
  A.heap_size -= 1
  Max-Heapify(A, 1)
  return max

Heap-Increase-Key(A, i, key)
  A[i] = key
  while i > 1 and A[Parent(i)] < A[i]
    swap A[i], A[Parent(i)]
    i = Parent(i)

Max-Heap-Insert(A, key)
  A.heap_size += 1
  A[A.heap_size] = -∞
  Heap-Increase-Key(A, A.heap_size, key)
```

---

## Quicksort

> Divide-and-conquer, in-place, $O(n \lg n)$ average case.

```text
Quicksort(A, p, r)
  if p < r
    q = Partition(A, p, r)
    Quicksort(A, p, q-1)
    Quicksort(A, q+1, r)
```

Call with `Quicksort(A, 1, A.length)`.

### Lomuto Partition — $\Theta(n)$

```text
Partition(A, p, r)
  x = A[r]                // pivot = last element
  i = p - 1
  for j = p to r - 1
    if A[j] ≤ x
      i += 1
      swap A[i], A[j]
  swap A[i+1], A[r]
  return i + 1
```

**Invariant maintained:**
- `A[p..i]` — elements **≤ pivot**
- `A[i+1..j-1]` — elements **> pivot**
- `A[r]` — pivot

**After partition:** pivot is at index `q = i+1`, everything left ≤ pivot, everything right > pivot.

---

## Quick Reference

Questions
Q1, Min and max number of elements in a heap of height h?
h = 3
**min** = $2^3$ -> $2^h$
***max*** = $2^4 -1$ -> $2^{h+1} -1$

Q2, Show that an n-element heap has height $\lfloor lg n \rfloor$

Q3, Show that in any subtree af a max-heap, the root of the subtree contains the largest value occuring anywhere in that subtree.


Q4, is the array with values <23, 17, 14, 6, 13, 10, 1, 5, 7, 12> a max-heap?

[NIce exam question]
-> Draw it up and see if any children are larger than their parent then its not.

| Concept                        | Key Fact                                           |     |
| ------------------------------ | -------------------------------------------------- | --- |
| Heap height                    | $\lfloor \lg n \rfloor$                            |     |
| Elements in heap of height $h$ | min $2^h$, max $2^{h+1}-1$                         |     |
| Build-Max-Heap                 | $O(n)$ — not $O(n \lg n)$                          |     |
| Heapsort                       | $O(n \lg n)$ worst case, in-place, **not stable**  |     |
| Quicksort                      | $O(n \lg n)$ average, $O(n^2)$ worst, in-place     |     |
| Priority queue ops             | All $O(\lg n)$ except Maximum which is $\Theta(1)$ |     |