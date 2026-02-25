
---

## A.1 Memory Leak

**The bug**: `deallokering()` sets `tabell = nullptr` without calling `delete[]` first → the allocated memory is never freed.

**Fix**: Add `delete[] tabell;` before `tabell = nullptr;`:

```cpp
void deallokering() {
    assert(tabell != nullptr);
    delete[] tabell;       // FREE the memory
    tabell = nullptr;      // THEN nullify the pointer
}
```

> **Rule**: Every `new` must have a matching `delete`. Every `new[]` must have a matching `delete[]`.

---

## A.2 Operator Overloading (Prefix vs Postfix `++`)

| | Prefix `++x` | Postfix `x++` |
|---|---|---|
| **Effect** | Increment, then return **new** value | Return **old** value, then increment |
| **Signature (method)** | `T& operator++()` | `T operator++(int)` |

**Why the dummy `int` parameter?** It's solely to distinguish the postfix signature from prefix. The compiler uses it as a tag — you never pass or use the value.

**Example for `BookIndex`:**

```cpp
BookIndex BookIndex::operator++(int) {
    BookIndex old = *this;  // save current state
    this->next_page();      // increment
    return old;             // return pre-increment state
}
```

---

## A.3 Control Flow Graph & Loop Invariants

**Key concept**: For a loop, identify a **loop invariant** — a condition that is:
1. **True before** the loop starts
2. **Preserved** by each iteration
3. **Still true after** the loop ends → proves correctness

Use this to reason about pointer arithmetic / array traversal code.

---

## B.1 Command-Line Flags (`-n`, `-d`, `-s`)

**Goal**: Parse flags in any order and compute \( n/d + s \).

**Key skills**:
- `argc` / `argv` handling
- Comparing C-strings: `std::strcmp(argv[i], "-n") == 0`
- Converting strings to doubles: `std::stod(argv[i+1])`
- Iterating `argv` in a loop, stepping by 2 (flag + value)

**Skeleton**:

```cpp
#include <cstring>
#include <iostream>

int main(int argc, char** argv) {
    double n = 0, d = 1, s = 0;
    for (int i = 1; i < argc; i += 2) {
        if (std::strcmp(argv[i], "-n") == 0)
            n = std::stod(argv[i + 1]);
        else if (std::strcmp(argv[i], "-d") == 0)
            d = std::stod(argv[i + 1]);
        else if (std::strcmp(argv[i], "-s") == 0)
            s = std::stod(argv[i + 1]);
    }
    std::cout << (n / d + s) << "\n";
}
```

---

## B.2 Stream Filter for Pipelines (`-i`, `-o` flags)

**Goal**: Remove all occurrences of a character, reading from `stdin`/file and writing to `stdout`/file.

**Key skills**:
- Default I/O: `std::cin` / `std::cout`
- File I/O: `std::ifstream` / `std::ofstream`
- Switching streams based on flags `-i` and `-o`
- Character-by-character filtering with `get()` / `put()`
- POSIX pipes: `./prog1 | ./prog2` chains stdout→stdin

**Pattern**:

```cpp
#include <fstream>
#include <iostream>

int main(int argc, char** argv) {
    char filter_char = argv[1][0];
    std::istream* in = &std::cin;
    std::ostream* out = &std::cout;
    std::ifstream fin;
    std::ofstream fout;

    for (int i = 2; i < argc; i += 2) {
        if (std::strcmp(argv[i], "-i") == 0) {
            fin.open(argv[i + 1]);
            in = &fin;
        } else if (std::strcmp(argv[i], "-o") == 0) {
            fout.open(argv[i + 1]);
            out = &fout;
        }
    }

    char c;
    while (in->get(c)) {
        if (c != filter_char) out->put(c);
    }
}
```

---

## B.3 Core Guidelines for Constructors

Referring to the `BookIndex` example, relevant guidelines:

- **C.45**: Use **member initializer lists** instead of assignment in the constructor body
- **C.48**: Prefer **in-class initializers** for constant default values
- **C.46**: Declare **single-argument constructors `explicit`** to prevent implicit conversions

```cpp
// Before (assignment in body):
BookIndex::BookIndex(int c, int s, int p) {
    this->chapter = c; this->section = s; this->page = p;
}

// After (member initializer list):
BookIndex::BookIndex(int c, int s, int p)
    : chapter{c}, section{s}, page{p} {}
```

---

## B.4 Shallow Copy Problems with Structs

```cpp
struct Message {
    int ID;
    char* content = nullptr;
};
```

**What happens**: Copying `Message` does a **shallow copy** — the `content` pointer is copied, **not the data it points to**. Both the original and the copy point to the **same** `char` array.

**Problem**: `n.content[0]++` in `next()` **modifies the original data too**, since both share the same pointer.

**Memory picture**:

```text
m.content ──────┐
                ▼
              "A\n"
                ▲
m_kopi.content ─┘   ← same address!
```

**Dangers**:
- Unintended mutation of shared data
- If one copy `delete`s the content → **dangling pointer** in the other
- Double-free if both try to `delete`

**Fix**: Implement a **deep copy** (copy constructor that allocates new memory and copies the content).

---

## B.5 Encapsulated Container Class (Ownership)

**Goal**: Wrap the raw `int*` table from A.1 into a class that **owns** the memory.

**Rule of zero?** **No** — since we use `new[]`/`delete[]`, we **must** implement at least a constructor and destructor.

```cpp
#include <cassert>
#include <cstddef>

class Tabell {
public:
    void alloker_tabell(std::size_t elementtal) {
        assert(!er_allokert());
        data = new int[elementtal]();
        storleik = elementtal;
    }

    void dealloker_tabell() {
        assert(er_allokert());
        delete[] data;
        data = nullptr;
        storleik = 0;
    }

    bool er_allokert() const {
        return data != nullptr;
    }

    int get_element(int indeks) const {
        assert(er_allokert() && indeks >= 0
            && indeks < (int)storleik);
        return data[indeks];
    }

    void set_element(int indeks, int verdi) {
        assert(er_allokert() && indeks >= 0
            && indeks < (int)storleik);
        data[indeks] = verdi;
    }

    // Constructor (not strictly required but good practice)
    Tabell() = default;

    // Destructor — REQUIRED (rule of zero does NOT apply)
    ~Tabell() { delete[] data; }

    // Forbid copying (unless you implement deep copy)
    Tabell(const Tabell&) = delete;
    Tabell& operator=(const Tabell&) = delete;

private:
    int* data = nullptr;
    std::size_t storleik = 0;
};
```

**Key takeaways**:
- Rule of zero **does not apply** when you do manual memory management
- At minimum: implement the **destructor**
- If you don't implement copy constructor + copy assignment → **`= delete` them** to forbid copying
- `assert()` guards help catch misuse at runtime