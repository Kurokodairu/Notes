
---

### Entity-Relationship (E-R) Diagrams

| Level | Object | Connection | Data |
|---|---|---|---|
| **Particular** (instance) | object / entity / individual | relationship | property (attribute) |
| **Universal** (type) | class / entity type / concept | relation / relationship type | attribute (attribute type) |

- **OWL terms**: relation → `ObjectProperty`, attribute → `DatatypeProperty`
- Diamonds in ER diagrams = **forholdstypar** (relationship types)
- Arrow on a line = **to-1** side of the relationship

---

### ER Diagram Notation (Example)

```text
City ◇———city_country———▷ Country
  ID (long, unique)                  ID (int, unique)
  name (std::string)                 name (std::string)
  population (int)

  "Every City is in such a relationship"
  "N-to-1 relation from Cities to Countries"
```

---

### Taxonomy (Class Hierarchy)

- Subclasses inherit attributes from superclass
- Example: `Person` → `Employee`, `Student` → `Instructor`, `Secretary`
- Shown with **triangle/arrow** pointing to superclass

---

### Implementing Relations in C++ (Non-Owning Pointers)

```cpp
class City {
  private:
    long ID;
    string name;
    long population;
    Country* country;       // non-owning pointer → Country
};

class Country {
  private:
    int ID;
    string name;
    vector<City*> cities;   // non-owning pointers → Cities
};
```

> **Key question**: What happens when a `Country` object's lifetime ends? → Dangling pointers in `City` objects!

---

### DB vs OOP Approach

| Database | OOP |
|---|---|
| Primary keys (IDs) identify objects | Pointers/references to objects |
| Foreign keys link to other objects' IDs | Pointer stored as property |
| Could use `std::map` registry | Standard: hold pointer directly |

---

### Smart Pointers (`<memory>`)

| Type | Ownership | Copyable? |
|---|---|---|
| `std::unique_ptr<T>` | Sole owner, deletes on destruction | **No** (move only) |
| `std::shared_ptr<T>` | Shared ownership, ref-counted | **Yes** |
| Raw pointer `T*` | Non-owning | Yes |

> **Core Guidelines I.11**: Never pass ownership through raw pointers. Use smart pointers.

---

### JSON & JSON-LD

- **JSON**: Hierarchical (tree structure only), self-contained, no external links
- Used in RESTful APIs, MySQL (as column type), MongoDB
- **Limitation**: Only tree structures (transitive containment)

**JSON-LD** extends JSON with:
- `@id` — IRI identifiers → enables **graph structure**
- `@type` — class instantiation via IRIs
- `@context` — namespace prefixes

```json
{
  "@context": { "schema": "https://schema.org/" },
  "@id": "example:ISSON25",
  "@type": "schema:EducationEvent",
  "schema:performer": [{ "@id": "example:Halliru" }]
}
```

**Tools**: JSON-LD Playground, Google Schema Markup Validator, Rich Results Test

---

### CRC Cards (Class – Responsibilities – Collaborations)

| Front | Back (invariants) |
|---|---|
| **Class name** | Conditions that must always hold |
| Attributes + methods | e.g., "population = sum of cities' populations" |
| Collaborating classes | e.g., "each city needs a country" |

> Useful for OOP design since methods can be called in any order → make invariants explicit.

---

### Generic Programming (C++20 Concepts)

```cpp
// Old: no constraint info
template<typename SeqnT>
void test_sequence(SeqnT* sqn) { … }

// New: concept-constrained
template<Sequence SeqnT>
void test_sequence(SeqnT* sqn) { … }
```

- **Concepts** = named requirements for template types
- Builds on OOP via inheritance + templates
- One implementation works for many types

---

### Glossar (Key Terms)

| Norsk | English |
|---|---|
| Datainntak | Data ingest |
| Entitet-relasjonsdiagram | Entity-relationship diagram |
| Individ (objekt) | Individual (object) |
| Forhold | Relationship (instance) |
| Forholdstype | Relationship type |