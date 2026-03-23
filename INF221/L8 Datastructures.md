

Operations on dynamic sets:
**Queries**:
- Seach(S, k)
Given a set S and key k, return reference x to element in S so that x, key = k or NIL

- Minimum(S)
- Maximum(S)
- Successor(S, x)
- Predecessor(S,x)

**Modifying** Operations:
- Insert(S, x)
- Delete(S, x)

Notes
- Min, max, succ, pred are only defined for totally ordered sets S
- For some data structures, we also may have operations such as Successor that take us through the entire data structure but may return elements in different order on each traversal.
- It is possible to implement a data structure supporting any of the operations above in O(lg n) for a set of size n, (red-black tres)

---

## Arrays
Basic, but more advances data structures can be built on them.
	- heaps
	- linked-list

- All entries have the same size and type
- Cannot extend array when it is full.
Solutions,
- Interpret data in array in different ways (linked list example)
- when out of space, copy all data to larger array
- Place old data at beginning of new array
- All relations between old data remain the same
- Space for more elemts 
- usual approach: double array size every time

---

## Stacks and queues
### Stack
LAST IN FIRST OUT - **LIFO**

### Queue
FIRST IN FIRST OUT - FIFO

