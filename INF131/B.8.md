
6. ∀x∀y (Rxy → Cx)
7. ¬∃x (Dx ∧ Ex)
8. ∀x (Dx → ∃y (Rxy ∧ Dy))
9. ∀x (Cx ↔ ∀y (Rxy → Ey))
    
    
Regler for omgjøring
- Implikasjon:
	P → Q ≡ ¬P ∨ Q
	
- Bikondisjonal:
	P ↔ Q ≡ (P → Q) ∧ (Q → P) ≡ (¬P ∨ Q) ∧ (¬Q ∨ P)

- Negasjon foran kvantor:
	¬∀x φ ≡ ∃x ¬φ
	¬∃x φ ≡ ∀x ¬φ

- Negasjon flyttes innover ved De Morgan:
    ¬(P ∧ Q) ≡ ¬P ∨ ¬Q
    ¬(P ∨ Q) ≡ ¬P ∧ ¬Q


6:
	P → Q ≡ ¬P ∨ Q        ikke, eller
7:
	bruk regelen: ¬∃x φ ≡ ∀x ¬φ 
	Deretter De Morgan: ¬(Dx ∧ Ex) ≡ ¬Dx ∨ ¬Ex
8:
	Omskriving av → :
9:
	Erstatt ↔
	Omskriv alle → 	
	Sett sammen, med ∀x.

| 6   | ∀x∀y(Rxy→Cx)      | ∀x∀y(¬Rxy∨Cx)                          |
| --- | ----------------- | -------------------------------------- |
| 7   | ¬∃x(Dx∧Ex)        | ∀x(¬Dx∨¬Ex)                            |
| 8   | ∀x(Dx→∃y(Rxy∧Dy)) | ∀x(¬Dx∨∃y(Rxy∧Dy))                     |
| 9   | ∀x(Cx↔∀y(Rxy→Ey)) | ∀x((Cx∧∀y(¬Rxy∨Ey))∨(¬Cx∧∃y(Rxy∧¬Ey))) |
