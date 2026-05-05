![[Pasted image 20260420082739.png]]
A) TREE  B) FOREST  C) not a tree, graph. bc of cycle

Rooted trees

Ordered tree

### Binary tree
*A binary tree T is a structure defined on a finite set of nodes that either contains no nodes or,
is composed of three disjoint sets of nodes
	- a root node
	- a binary tree called left subtree
	- a binary tree called right subtree*

- Each tree has exactly one root Each node of the tree has exactly one parent (except root, which has no parent) 
- Starting from the root, there is (at least) one way to reach each node in a tree 
- The root of the tree can be reached from any node

Node
- Each node has to store a reference to its parent (NIL for root) 
- a reference to its left child (may be NIL) 
- a reference to its right child (may be NIL) a key data or a reference to satellite data
Attributes:
- key
- data
- parent
- left
- right

### Binary search trees
Basic operations take time proportional to height of tree 
- Complete binary tree with N nodes: worst case $\Theta$(lg n)
- Linear chain of N nodes: worst case $\Theta$(n)

- We focus on basic binary trees In practice, more advanced binary trees required to keep trees balanced over time, e.g. B-trees, red-black-trees Nodes have key parent left child right child Root has no parent Leaves have no children

- A binary tree has the binary-search-tree property, if for any two elements X and Y the following holds: 
	- if Y is in the left of the subtree of x, then Y.key <= x.key
	- if Y is in the rights subtree of x, then Y.key >= x.key

### Inorder tree walk
	Inorder-Tree-Walk(x) 
		if x == NIL 
			return 
		Inorder-Tree-Walk(x.left)
		output x 
		Inorder-Tree-Walk(x.right)
Correctness Follows from binary-search-tree property, can prove by induction. 
Time We visit each node exactly once and perform a single operation, thus $\Theta$(n)

### Pre- and post-order walks
- Pre-order: output each node before visiting left, then right subtree 
- Post-order: visit left, then right subtree, then output node

![[Pasted image 20260420085252.png|567]]
a) PRE: 6 5 2 5 7 8    POST: 
b) PRE: 2 5 7 6 5 8    POST: 

### Querying
Tree-Search(x, k) 
	if x == NIL or k == x.key
		 return x 
	if k < x.key 
		return Tree-Search(x.left, k) 
	else 
		return Tree-Search(x.right, k) 
		
- Time is O(h), where h is height of tree.

What happens if a key occurs serveral times in a tree? 
Answer: The first key found by the algorithm given above will be returned

### Minimum and Maximum
- Minimum is leftmost leaf 
- Maximum is rightmost leaf 
- Time is O(h)
- Recursive implementation 
Tree-Min-Recursive(x) 
	if x == NIL # in case we are called on empty (sub)- tree 
		return NIL 
	elif x.left == NIL # no left subtree, minimum found 
		return x 
	else 
		return Tree-Min-Recursive(x.left)

This is an example of tail recursion
There is only a single recursive call and it is in the last statement of the function 
Since each function call comes with an overhead, it is often more efficient to eliminate tail recursion and replace it by a loop

- Iterative implementation
Tree-Min(x) 
	if x == NIL # in case we are called on empty (sub)- tree 
		return NIL 
	while x.left != NIL
		 x = x.left
	return x

### Successor and predecessor 
- Defined in terms of order of in-order tree walk 
- Assume unique keys 
- Successor of x: the node with the smallest key greater than x.key 
- Predecessor of x: the node with the largest key smaller than x.key 
Tree-Successor(x) 
	if x.right != NIL 
		return Tree-Minimum(x.right) 
	y = x.parent 
	while y != NIL and x == y.right 
		x = y 
		y = y.parent 
	return y 

- Can be extended to trees with non-unique keys by defining as successor the element returned by the algorithm above.
- ![[Pasted image 20260420092042.png|491]]

### Insertion 
- We have some new node z with z.key = v to insert into tree
- Always insert as a new leaf 
- Must maintain binary-search-tree property (BSTP) 
	- insert to the right of all nodes with smaller key 
	- insert to the left of all nodes with larger key

Tree-Insert(T, z) 
	y = NIL 
	x = T.root 
	while x != NIL 
		y = x 
		if z.key < x.key
			 x = x.left 
		else 
			x = x.right
	 z.p = y 
	 if y == NIL // tree was empty 
		 T.root = z 
		 elseif z.key < y.key
			y.left = z
		 else 
			y.right = z
- y is parent of node we currently inspect 
- while loop descends through tree moving into correct subtree at each step last part links node and parent 
- time for insertion: O(h)

**Deletion**
More complicated since we may delete inner nodes Not part of the curriculum See Compendium Part 14 if you are interested in how it works

### Advanced search trees
- Trees that remain automatically balanced—example: red-black trees 
- Trees that reduce number of disk operations—example: B-trees

### Red Black trees
Red-black tree properties 
1. Every node is either red or black. 
2. The root is black. 
3. Every leaf (NIL) is black. 
4. If a node is red, then both children are black. 
5. For each node, all paths from the node to descendant leaves contain the same number of black nodes.

From (4) -> No red node can have a red child
Height of a node is the number of edges in shortest path to leaf
Black height bh(x) of node x is the number of black nodes on path from x to a leaf, not counting itself.
Due to property 5, all paths from x to any leaf have the same black height

**Operations on red-black trees** 
- All lookup operations (search, min, max, successor, predecessor) are the same as for plain binary search trees 
- Since h = O(lg n) for RB-trees, these operations are guaranteed to be O(lg n) 
- Insertion and deletion are more complicated, but complete in O(lg n)
- Thus, all operations on RB-trees are guaranteed to complete in time O(lg n)

### B-Trees
