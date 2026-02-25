
## Three Common Memory Bugs

| Bug | Description |
|---|---|
| **Wild pointer** | Accessing an uninitialized pointer, `nullptr`, or invalid address |
| **Memory leak** | Memory allocated with `new` but never freed with `delete` |
| **Dangling pointer** | Pointer to memory that has already been deallocated (stack frame removed or `delete` called) |

---

## Stack vs Heap

- **Stack**: Automatic allocation/deallocation (local variables, function calls)
- **Heap**: Manual allocation (`new`) and deallocation (`delete`)
- **Rule**: For every `new` there must be a matching `delete`

---

## Strategies to Avoid Memory Bugs

1. **Avoid manual memory management** – prefer stack over heap, avoid pointers without good reason
2. **Assign clear ownership** – use containers that "own" their data
   - Smart pointers: `std::unique_ptr<T>`, `std::shared_ptr<T>`

---

## Constructors & Destructors

- **Constructor** `T::T(...)` – called when an object is **allocated**
- **Destructor** `T::~T()` – called when an object is **deallocated**

```cpp
class T {
public:
    T() { this->p = new S[1000](); }   // constructor
    ~T() { delete[] this->p; }          // destructor
private:
    S* p = nullptr;
};
```

> **Rule of zero** (C.20): Don't define constructors/destructors if you don't need them.
> **C.30/C.31**: If a class acquires resources, define a destructor to release them.

---

## Shallow Copy vs Deep Copy

| | Shallow Copy | Deep Copy |
|---|---|---|
| **What happens** | Copies pointer values only | Copies the actual data pointed to |
| **Data in memory** | Once (shared) | Twice (independent) |
| **When appropriate** | Content is **not owned** | Content is **uniquely owned** (container pattern) |

---

## Rule of Three

> If your class does manual memory management (`new`/`delete`), implement **at least**:

1. **Destructor** `~T()`
2. **Copy constructor** `T(const T& original)`
3. **Copy assignment operator** `T& operator=(const T& rhs)`

> If you don't implement (2) and (3), **forbid copying**.

### Copy Constructor

Called when a new object is created as a copy of an existing one.

```cpp
T(const T& original) {
    this->p = new S[1000]();
    std::copy(original.p, original.p + 1000, this->p);
}
```

**Triggers**: `T second = first;`, passing by value `func(tobject);`

### Copy Assignment Operator

Called when assigning to an **already existing** object.

```cpp
T& operator=(const T& rhs) {
    if (&rhs == this) return *this;  // self-assignment check
    delete[] this->p;                // free old data
    this->p = new S[1000];           // allocate new
    std::copy(rhs.p, rhs.p + 1000, this->p);
    return *this;
}
```

**Trigger**: `tsecond = tfirst;` (both already exist)

---

## Rule of Five

> Extends the rule of three with move semantics for efficiency:

1. Destructor
2. Copy constructor
3. Copy assignment operator
4. **Move constructor** `T(T&& old)`
5. **Move assignment operator** `T& operator=(T&& old)`

### Move Constructor

Transfers ownership via **shallow copy** + nullify old pointers. No data duplication.

```cpp
T(T&& old) {
    this->p = old.p;
    old.p = nullptr;   // detach so old's destructor won't free it
}
```

**Trigger**: `T second = std::move(func(...));`

### Move Assignment Operator

Same idea but for an **already existing** target object.

```cpp
T& operator=(T&& old) {
    if (&old == this) return *this;
    delete[] this->p;    // free current data
    this->p = old.p;
    old.p = nullptr;
    return *this;
}
```

---

## Why Move > Copy?

| Copy + Destroy | Move + Destroy |
|---|---|
| Deep copy all data → destroy original | Shallow copy pointer → nullify original |
| **Expensive** (O(n) data copied unnecessarily) | **Cheap** (O(1) pointer swap) |
| Data exists twice temporarily | Data exists once throughout |

---

## Glossary

| English | Nynorsk |
|---|---|
| Container | Container / konteinar |
| Copy assignment operator | Kopieringsoperator |
| Deep copy | Djupnekopi |
| Shallow copy | Overflatekopi |
| Moving | Flytting |
| Rule of three/five | Trear-/femmarregelen |
| Constructor | Konstruktør |
| Destructor | Destruktør |
| Dangling pointer | Hengande peikar |
| Wild pointer | Peikar til ingenting |
| Memory leak | Minnelekkasje |
| Ownership | Eigarskap |