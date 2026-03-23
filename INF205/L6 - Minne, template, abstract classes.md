Memory Management, Templates & Abstract Classes

---

## 2.4 Class Hierarchy (Taxonomy) & Inheritance

- **Superclass** → general; **Subclass** (derived/child) → specific
- Subclass **inherits** all members from superclass
- Subclass object **is also** an object of the superclass


```cpp
class LiteratureIndex {
public:
    virtual int next_page(); // virtual = can be overridden
private:
    int year = 0;
};

class JournalArticleIndex : public LiteratureIndex {
public:
    int next_page(); // overrides superclass version
private:
    int volume = 0; // own property; also inherits year
};
```

**Key rule:** Without `virtual`, the **static type** (compile-time) determines which method is called. With `virtual`, the **dynamic type** (runtime) determines it.

---

## Virtual Methods & Overriding

| Keyword | Meaning |
|---|---|
| `virtual` | Declare in **base class** — allows subclass to override |
| `override` | Use in **derived class** — signals you're overriding |
| `= 0` | **Pure virtual** — no implementation, makes class abstract |
| `final` | Prevents further overriding |

**Guideline C.128:** Each virtual function should specify exactly one of `virtual`, `override`, or `final`.

---

## Abstract vs Concrete Classes

- **Abstract class:** Has ≥1 **pure virtual** method (`= 0`), **cannot be instantiated**
- **Pure abstract class:** *Only* pure virtual methods → used as **interface**
- **Concrete class:** No pure virtual methods; must **override all** inherited pure virtuals

```cpp
class Sequence { // abstract
public:
    virtual bool empty() const = 0;
    virtual size_t size() const = 0;
    virtual int& front() = 0;
    virtual int& back() = 0;
    virtual int& at(int i) = 0;
};

class SinglyLinkedList : public Sequence {
    // must define ALL of the above to be concrete
};
```

---

## Linked Lists (Singly Linked)

```text
head → [item|next] → [item|next] → [item|next] → nullptr
                                          ↑ tail
```

- **Dynamic** & **linked** — elements **not contiguous** in memory
- No pointer arithmetic (`p++`) — must follow `next` pointers
- Each element is a **node** with `item` + `next` pointer

---

## Templates (Parameterized Classes/Functions)

One source code, works for **any type** `T`:

```cpp
template <typename T>
class SinglyLinkedListNode {
public:
    T& get_item() { return this->item; }
    SinglyLinkedListNode<T>* get_next() const {
        return this->next;
    }
private:
    T item;
    SinglyLinkedListNode<T>* next = nullptr;
};
```

**Multiple template params:**

```cpp
template <typename SeqnT, typename ElmnT>
void test_sequence(SeqnT* sqn, int n, ElmnT a, ElmnT b);
```

**⚠ Watch out:**
- Template code usually goes in **headers** (compiler needs full definition at instantiation)
- Be careful with **initialization** of `T item` (no universal default)

---

## Template Type Traits (`<type_traits>`)

Use `if constexpr` for compile-time branching on type:

```cpp
#include <type_traits>

SinglyLinkedListNode() {
    if constexpr (std::is_arithmetic<T>::value)
        this->item = 0;
    else if constexpr (std::is_pointer<T>::value)
        this->item = nullptr;
    else
        this->item = T(); // default constructor
}
```

Useful traits: `is_arithmetic`, `is_signed`, `is_pointer`, `is_class`, `is_array`, `is_same<T, S>`

---

## STL Container Quick Reference

| Container         | Type                          | Notes              |
| ----------------- | ----------------------------- | ------------------ |
| `vector<T>`       | Dynamic array                 | Like Python list   |
| `deque<T>`        | Double-ended dynamic array    | Push/pop both ends |
| `forward_list<T>` | Singly linked list            |                    |
| `list<T>`         | Doubly linked list            |                    |
| `set<T>`          | Unique keys, sorted           |                    |
| `map<T,V>`        | Key→value, unique keys        |                    |
| `multimap<T,V>`   | Key→value, duplicate keys ok  |                    |
| `array<T,n>`      | Static array (fixed size `n`) | Like `T[]`         |

---

## Core Guidelines Summary

- **C.120:** Use hierarchies only for inherently hierarchical concepts
- **C.121:** Interface base class → make it pure abstract
- **C.122:** Use abstract classes when you need full interface/implementation separation
- **C.128:** Virtual functions: use exactly one of `virtual` / `override` / `final`