# 4.1 - 4.3
![[Pasted image 20250821215802.png]]

![[Pasted image 20250821215912.png]]
- **Elementærutsagn:** p, q, r, …
- **Operatorer:** ¬ (ikke), ∧ (og), ∨ (eller), → (implikasjon), ↔ (bikondisjonal).
- an implication A→B is **false only** when A is true and B is false;
- Litteral: enten et elementærutsagn eller negasjonen av det.
- Utsagn: noe som kan være sant eller usant.

Tabeller
- Semantikken bestemmes av sannhetsverdier for de elementære utsagnene.
- Med n utsagn finnes 2ⁿ mulige kombinasjoner.
- Tabeller viser når en formel er sann/usann.
- Eksempler:
    - Impliksjon (p → q) er usann bare når p er sann og q er usann.
    - Bikondisjonal (p ↔ q) er sann når p og q har samme verdi.

### 4.3 Status på logiske formler
- **Tautologi:** alltid sann (ufalsifiserbar).
- **Kontradiksjon:** alltid usann (uoppfyllbar). 
- **Oppfyllbar:** sann i minst én tildeling.
- **Falsifiserbar:** usann i minst én tildeling.
- **Kontingent:** både oppfyllbar og falsifiserbar.



# 4.4 - 4.6
#### Important Logical Equivalences:
These rules allow us to transform formulas while preserving their meaning:

1. **De Morgan’s Laws**:
    - ¬(α ∨ β) ≡ ¬α ∧ ¬β
    - ¬(α ∧ β) ≡ ¬α ∨ ¬β  
        → These help "push" negations inward, so they only apply to atomic statements (literals).
2. **Associative Laws**:
    - α ∨ (β ∨ γ) ≡ (α ∨ β) ∨ γ
    - α ∧ (β ∧ γ) ≡ (α ∧ β) ∧ γ  
        → Parentheses can be rearranged for same-type operators.
3. **Distributive Laws**:
    - α ∧ (β ∨ γ) ≡ (α ∧ β) ∨ (α ∧ γ)
    - α ∨ (β ∧ γ) ≡ (α ∨ β) ∧ (α ∨ γ)
4. **Implication and Equivalence Definitions**:
    - α → β ≡ ¬α ∨ β
    - α ↔ β ≡ (α → β) ∧ (β → α) ≡ (α ∧ β) ∨ (¬α ∧ ¬β)
5. **Obvious Equivalences**:
    - α ∨ ¬α ≡ ⊤ (tautology)
    - α ∧ ¬α ≡ ⊥ (contradiction)
    - α ∨ α ≡ α, α ∧ α ≡ α
    - ¬¬α ≡ α
    - α ∨ β ≡ β ∨ α, α ∧ β ≡ β ∧ α (commutativity)

- **Goal of syntactic transformation**: Rewrite complex formulas into simpler or standardized forms (like using only ∧, ∨, ¬), with negations only on atomic propositions (literals like p, ¬q).

> **Example**:  
> Transform:  
> `p0 → (p1 → (... → p7 → p0))`  
> Step-by-step using α→β ≡ ¬α ∨ β:  
> Becomes: `¬p0 ∨ ¬p1 ∨ ... ∨ ¬p7 ∨ p0`  
> Then: `(¬p0 ∨ p0)` is ⊤ → So whole expression ≡ ⊤ → **Tautology**




Qwen3-235B-A22B-2507 12:13 pm

Here is a clear and accurate summary of the content from the uploaded file [4.4-4.6.pdf], based only on what is written in the document. This covers the key concepts from sections 4.4 Syntaktisk transformasjon, 4.5 Normalformer, and 4.6 Naturleg deduksjon (Natural Deduction), which you can use for your assignment. 
 
🔹 4.4 Syntaktisk transformasjon (Syntactic Transformation) 

    Semantic equivalence (semantisk ekvivalens): Two logical formulas α and β are semantically equivalent (written α ≡ β) if they have the same truth table — that is, they are true under exactly the same valuations (truth assignments). 

    Even though every formula has a unique truth table, many different formulas can represent the same truth table. These are called semantically equivalent. 
     

✅ Important Logical Equivalences: 

These rules allow us to transform formulas while preserving their meaning: 

    De Morgan’s Laws: 
        ¬(α ∨ β) ≡ ¬α ∧ ¬β
        ¬(α ∧ β) ≡ ¬α ∨ ¬β
        → These help "push" negations inward, so they only apply to atomic statements (literals).
         

    Associative Laws: 
        α ∨ (β ∨ γ) ≡ (α ∨ β) ∨ γ
        α ∧ (β ∧ γ) ≡ (α ∧ β) ∧ γ
        → Parentheses can be rearranged for same-type operators.
         

    Distributive Laws: 
        α ∧ (β ∨ γ) ≡ (α ∧ β) ∨ (α ∧ γ)
        α ∨ (β ∧ γ) ≡ (α ∨ β) ∧ (α ∨ γ)
         

    Implication and Equivalence Definitions: 
        α → β ≡ ¬α ∨ β
        α ↔ β ≡ (α → β) ∧ (β → α) ≡ (α ∧ β) ∨ (¬α ∧ ¬β)
         

    Obvious Equivalences: 
        α ∨ ¬α ≡ ⊤ (tautology)
        α ∧ ¬α ≡ ⊥ (contradiction)
        α ∨ α ≡ α, α ∧ α ≡ α
        ¬¬α ≡ α
        α ∨ β ≡ β ∨ α, α ∧ β ≡ β ∧ α (commutativity)
         
     

    Goal of syntactic transformation: Rewrite complex formulas into simpler or standardized forms (like using only ∧, ∨, ¬), with negations only on atomic propositions (literals like p, ¬q).
     

    Example:
    Transform:
    p0 → (p1 → (... → p7 → p0))
    Step-by-step using α→β ≡ ¬α ∨ β:
    Becomes: ¬p0 ∨ ¬p1 ∨ ... ∨ ¬p7 ∨ p0
    Then: (¬p0 ∨ p0) is ⊤ → So whole expression ≡ ⊤ → Tautology 
     

 
🔹 4.5 Normalformer (Normal Forms) 
These are standardized ways to write logical formulas. 
🟩 Disjunctive Normal Form (DNF) 
    A formula is in DNF if it is a disjunction (OR) of conjunctive clauses.
    A conjunctive clause is a conjunction (AND) of literals (e.g., p ∧ ¬q ∧ r).
    Full DNF: Every clause contains all atomic variables (either as p or ¬p).
     
👉 How to build full DNF from a truth table: 
    For each row where the formula is True, create a conjunction of literals that matches that row.
    Then join all these with ∨.
     
    Example: If formula is true when p=False, q=True, r=True → clause: ¬p ∧ q ∧ r
    Full DNF = (¬p ∧ q ∧ r) ∨ (p ∧ ¬q ∧ r) ∨ ... 
     
    Special cases:
        Tautology in full DNF: All possible combinations (e.g., (¬p∧¬q) ∨ (¬p∧q) ∨ (p∧¬q) ∨ (p∧q))
        Contradiction in full DNF: No true rows → DNF = ⊥

 Conjunctive Normal Form (CNF)
- A formula is in **CNF** if it is a **conjunction (AND)** of **disjunctive clauses**.
- A **disjunctive clause** is a disjunction (OR) of literals (e.g., p ∨ ¬q ∨ r).
- **Full CNF**: Each clause contains **all atomic variables**.

👉 How to build full CNF from a truth table:
- For **each row where the formula is False**, create a disjunction (OR) of literals that would make it false.
- Then join all these with ∧.

> **Example**: If formula is false when p=True, q=False, r=False → clause: ¬p ∨ q ∨ r  
> Full CNF = (¬p ∨ q ∨ r) ∧ (p ∨ ¬q ∨ r) ∧ ...

- Special cases:
    - **Tautology** in full CNF: No false rows → CNF = ⊤
    - **Contradiction** in full CNF: All combinations → e.g., (¬p∨¬q) ∧ (¬p∨q) ∧ (p∨¬q) ∧ (p∨q)

#### Transforming to CNF/DNF
Use logical equivalences:
1. Replace implications: α → β → ¬α ∨ β
2. Push negations inward using De Morgan’s laws
3. Use distributive laws to get desired structure
> Example:  
> `¬p ∨ (¬q → q)`  
> → `¬p ∨ (q ∨ q)` → `¬p ∨ q` → this is already in CNF  
> Full DNF: (¬p ∧ ¬q) ∨ (¬p ∧ q) ∨ (p ∧ q)


 🔹 **4.6 Naturleg deduksjon (Natural Deduction)**
- **Deduction**: The process of deriving new statements (**conclusions**) from given statements (**premises or axioms**) using valid reasoning rules.
    
- We use the symbol:
    - `⊨` for **semantic entailment** (based on truth tables)
    - `⊢` for **syntactic entailment** (based on inference rules, no truth tables)
- A **slutningsregel** (inference rule) is a pattern that says: _If these premises are true, then this conclusion must also be true._
    
Common Inference Rules (given in the slides):
![[Pasted image 20250822122241.png]]

#### Resolution Rule:
α ∨ β, ¬α ∨ γ ⊢ β ∨ γ
- If either α or β is true, and either not-α or γ is true, then at least one of β or γ must be true.
- This rule is the foundation of **resolution calculus**, used to check consistency of formulas in CNF.

> **Why is it valid?**
> - If α is true → then ¬α is false → so γ must be true (from second premise) → so β ∨ γ is true.
> - If α is false → then from first premise, β must be true → so β ∨ γ is true. → In both cases, β ∨ γ is true → rule is valid.



De morgan
∀x F(x) ≡ ¬∃x ¬F(x)
∀x ¬F(x) ≡ ¬∃x F(x)
∃x F(x) ≡ ¬∀x ¬F(x)
∃x ¬F(x) ≡ ¬∀x F(x)