

## Why Hash Tables?
- Need dynamic sets supporting **insert, delete, search** only
- Example: Python `dict` (used internally to manage names)
- Arrays are fast but require direct indexing; key universe is often "infinite"
- Hash tables: $O(1)$ expected search, $\Theta(n)$ worst-case search
- Useful when $|K| \ll |U|$ (stored keys much fewer than possible keys)
- Example: $26^8 \approx 2 \times 10^{11}$ possible 8-letter words (universe), but languages use only ~$10^5$ words

---

## 1. Direct-Address Tables

**Scenario**:
- Keys from universe $U = \{0,1,\dots,m-1\}$, $m$ not too large
- No two elements share a key

**Implementation**: Array `T[0..m-1]`
- `T[k]` → pointer to element with key $k$, or `NIL`

**Pseudocode**:
```text
Direct-Address-Search(T, k)
    return T[k]

Direct-Address-Insert(T, x)
    T[x.key] = x

Direct-Address-Delete(T, x)
    T[x.key] = NIL
```

- **All operations O(1)**
- **Problem**: if $|U|$ is large, table requires too much memory

---

## 2. Hash Tables

**Idea**:
- Array $T[0\dots m-1]$ with size proportional to $|K|$, not $|U|$
- Hash function $h: U \to \{0,1,\dots,m-1\}$
- Key $k$ **hashes to** slot $h(k)$

**Collisions**: $h(k) = h(j)$ for $k \neq j$
- **Must** occur if $|K| > m$
- **May** occur even if $|K| \leq m$

**Collision handling**:
1. Chaining
2. Open addressing

---

## 3. Chaining

All elements with same hash go into a **doubly linked list** at that slot.
- Doubly linked (not singly) → makes deletion faster

Each entry of $T$ is:
- `NIL` if no key hashes there
- Pointer to **head** of list of elements hashing there

### Pseudocode

```text
Chained-Hash-Insert(T, x)
    Linked-List-Insert(T[h(x.key)], x)       // O(1) worst case

Chained-Hash-Search(T, k)
    return Linked-List-Search(T[h(k)], k)     // O(length of list at h(k))

Chained-Hash-Delete(T, x)
    Linked-List-Delete(T[h(x.key)], x)        // O(1) if pointer to x given
```

- If we must **find** $x$ first before deleting: $O(\text{length of list})$

### Load Factor

$$\alpha = \frac{n}{m}$$

- $n$ = number of stored entries
- $m$ = number of slots (linked lists, may be empty)
- $\alpha < 1$: few entries, mostly short/empty lists
- $\alpha > 1$: guaranteed collisions (lists with ≥2 elements)

### Simple Uniform Hashing (Assumption)

- Any given key is **equally likely** to hash into any of the $m$ slots
- Idealization; requires good hash function
- An adversary could violate this, but we work with it for analysis
- Expected list length: $E[n_j] = \alpha = n/m$ for list $T[j]$

### Analysis: Unsuccessful Search

**Theorem**: Expected time $\Theta(1 + \alpha)$

**Proof sketch**:
1. Computing $h(k)$: $\Theta(1)$
2. Key $k \notin$ table hashes to any slot with equal probability $1/m$
3. Must inspect **entire** list at $T[h(k)]$ → $\Theta(n_{h(k)})$ steps
4. Expected chain length: $E[n_{h(k)}] = \alpha$ → linear search takes $\Theta(\alpha)$
5. Total: $\Theta(1 + \alpha)$

### Analysis: Successful Search

**Theorem**: Expected time $\Theta(1 + \alpha)$

**Intuition**: On average search half-way through the list (shorter than unsuccessful)

**Proof sketch** (using indicator random variables):
1. Search for element $x = x_i$ (the $i$-th inserted), equally likely to be any of the $n$ elements
2. Since insertion is at **head**, must pass all elements inserted **after** $x_i$
3. Define indicator $X_{ij} = I\{h(k_i) = h(k_j)\}$, so $E[X_{ij}] = 1/m$
4. Number of elements to check for target $x_i$: $1 + \sum_{j=i+1}^{n} X_{ij}$
5. Average over all targets:

$$E\left[\frac{1}{n}\sum_{i=1}^{n}\left(1 + \sum_{j=i+1}^{n} X_{ij}\right)\right] = 1 + \frac{1}{nm}\sum_{i=1}^{n}(n-i) = 1 + \frac{\alpha}{2} - \frac{\alpha}{2n}$$

6. Adding $\Theta(1)$ for hash computation:

$$\Theta\!\left(2 + \frac{\alpha}{2} - \frac{\alpha}{2n}\right) = \Theta(1 + \alpha)$$

### Interpretation

If $n = O(m)$, then:

$$\alpha = \frac{n}{m} = \frac{O(m)}{m} = O(1)$$

→ **All operations are O(1)** on average.

**Depends on**: (1) slots proportional to elements, (2) simple uniform hashing.

---

## 4. Hash Functions

> Not about cryptographic hash functions (that's INF240).

**Goals**: fast to compute, approximate simple uniform hashing.

Simple uniform hashing is **impossible to guarantee** in practice (key distribution unknown), so use heuristics.

### Keys as Natural Numbers

Assume all keys are natural numbers. Convert strings:

```python
def key(s):
    return sum(ord(c) * 256**i for i, c in enumerate(s))
```

- No need to preserve ordering of strings (unlike comparison-based methods)

### Very Simple Hash Function

If keys are uniformly distributed in $[0, 1)$:

$$h(k) = \lfloor km \rfloor$$

- Gives simple uniform hashing **if** assumption holds (usually doesn't)

### Division Method

$$h(k) = k \bmod m$$

- **Fast**: single division
- **Avoid bad $m$**:
    - $m = 2^p$ → only uses $p$ least significant bits of $k$ (usually not random)
    - When converting strings with radix $2^p$ (e.g., 256), $m = 2^p - 1$ is bad: permuting characters doesn't change hash
- **Good $m$**: **prime number**, not close to a power of 2
- Example: $m = 199$ for ~100 entries

### Multiplication Method

$$h(k) = \lfloor m\,(kA - \lfloor kA \rfloor) \rfloor, \quad 0 < A < 1$$

- $kA - \lfloor kA \rfloor$ = fractional part of $kA$
- **Value of $m$ not critical** (advantage over division)
- Knuth suggests **golden ratio**: $A \approx \frac{\sqrt{5}-1}{2} \approx 0.618$

> ⚠️ **Precision warning**: With large keys (e.g., $>10^{16}$), floating-point arithmetic loses precision → all large keys map to 0. Use **arbitrary precision integer arithmetic** (Python's built-in big ints, or libraries like GMP in C/C++).

---

## 5. Open Addressing

- **All keys stored in the table itself** (no linked lists)
- Each slot: exactly one key or `NIL`
- On collision: **probe** alternative slots according to a rule
- Hash function maps key **and** probe number to slot:

$$h: U \times \{0,1,\dots,m-1\} \to \{0,1,\dots,m-1\}$$

- Probe sequence $\langle h(k,0),\, h(k,1),\, \dots,\, h(k,m-1) \rangle$ must be a **permutation** of $\{0,\dots,m-1\}$

### Pseudocode

```text
Hash-Search(T, k)
    i = 0
    repeat
        j = h(k, i)
        if T[j] == k
            return j
        i = i + 1
    until T[j] == NIL or i == m
    return NIL

Hash-Insert(T, k)
    i = 0
    repeat
        j = h(k, i)
        if T[j] == NIL
            T[j] = k
            return j
        else
            i = i + 1
    until i == m
    error "table full"
```

### Deletion — Two Approaches

**Approach 1: DELETED marker**
- Mark deleted slots as `DELETED`
- Search: skip `DELETED` entries
- Insert: treat `DELETED` as empty (insert there)
- **Disadvantages**:
    - Requires second "magic value" besides `NIL`
    - Search/insertion times don't improve when load factor $\alpha$ decreases

**Approach 2: Shift entries**
- Delete key $k$ from position $j$ in probe sequence (from entry $h(k,j)$)
- Move all subsequent entries in same probe sequence forward
- Questions: how many entries to move? How to minimize?

---

## 6. Probe Sequences

All use an **auxiliary hash function** $h'(k): U \to \{0,1,\dots,m-1\}$

### Linear Probing

$$h(k,i) = (h'(k) + i) \bmod m$$

- Start at $h'(k)$, move to next slot, wrap around
- **Problem — Primary clustering**: long runs of occupied slots build up
    - If a slot is preceded by $j$ occupied slots, probability of being filled next insertion: $(j+1)/m$
    - Leads to longer search and insertion times

### Quadratic Probing

$$h(k,i) = (h'(k) + c_1 i + c_2 i^2) \bmod m, \quad c_1, c_2 > 0$$

- Better spread than linear probing
- Must choose $c_1, c_2, m$ carefully — risk that some slots are never probed
- E.g., $m$ prime, $c_1 = c_2 = 1/2$ → only **half** the entries probed

**Full table probing**: If $m$ is prime and $m = 4j + 3$, then:

$$h(k,i) = (h'(k) + (-1)^i i^2) \bmod m$$

probes the **entire** table. The $(-1)^i$ gives alternating signs: $-1, 4, -9, 16, \dots$

### Double Hashing

$$h(k,i) = (h_1(k) + i \cdot h_2(k)) \bmod m$$

- $h_1(k)$: starting point
- $h_2(k)$: step length
- If $h_2(k)$ is **relatively prime** to $m$ → full permutation of all slots
- Achieving coprimality:
    - $m$ is power of 2 → $h_2(k)$ returns only **odd** numbers
    - $m$ is prime → $1 < h_2(k) < m$
- Yields $\Theta(m^2)$ different probe sequences (each $(h_1, h_2)$ combo is unique)
- **Best practical approximation** to uniform hashing

---

## 7. Performance of Open Addressing

**Conditions**: $\alpha < 1$, uniform hashing, no deletions, each key equally likely to be searched.

| Search type | Expected max probes |
|---|---|
| **Unsuccessful** | $\dfrac{1}{1 - \alpha}$ |
| **Successful** | $\dfrac{1}{\alpha} \ln \dfrac{1}{1 - \alpha}$ |

**Key examples**:

| $\alpha$ | Unsuccessful probes | Successful probes |
|---|---|---|
| 0.5 | 2 | 1.39 |
| 0.75 | 4 | 1.85 |
| 0.9 | 10 | 2.56 |
| 0.95 | 20 | 3.15 |

> ⚠️ Performance **degrades sharply** for $\alpha \gtrsim 0.8$

---

## 8. Chaining vs Open Addressing — Summary

| | Chaining | Open Addressing |
|---|----------|-----------------|
| Storage | Table + linked list pointers | Table only |
| $\alpha > 1$ allowed? | ✅ Yes | ❌ No |
| Dense tables ($\alpha$ high) | **Better** | Degrades badly |
| Sparse tables ($\alpha$ low) | Pointer overhead | **Better** (cache-friendly) |
| Deletion | Easy ($O(1)$ with pointer) | Complicated (DELETED or shift) |
| Worst case search | $O(n)$ (all in one list) | $O(n)$ (all slots probed) |
| Expected search | $\Theta(1+\alpha)$ | $\frac{1}{1-\alpha}$ (unsuccessful) |

---

## Key Takeaways

1. Hash tables give **O(1) average-case** dictionary operations when $n = O(m)$
2. **Division method**: pick $m$ = prime not near power of 2
3. **Multiplication method**: value of $m$ less critical; watch floating-point precision
4. **Chaining**: robust, handles high load factors, easy deletion
5. **Open addressing**: space-efficient, but keep $\alpha < 0.8$; double hashing best in practice
6. All average-case results assume **simple uniform hashing** (idealization)
7. 