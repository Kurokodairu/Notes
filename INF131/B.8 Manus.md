
oppgave **b.8**, der målet er å transformere aksiomene 6 til 9 fra førsteordens logikk slik at det **ikke finnes → eller ↔** (Implikasjon og )

---

Regler
- Implikasjon P→Q omskrives som ¬P∨Q
- Bikondisjonal P↔Q omskrives til (P→Q)∧(Q→P), og videre til (¬P∨Q)∧(¬Q∨P)
- Negasjon foran kvantor: ¬∀xφ≡∃x¬φ, og ¬∃xφ≡∀x¬φ
- De Morgan: ¬(P∧Q)≡¬P∨¬Q, ¬(P∨Q)≡¬P∧¬Q

- **6:** Starter med ∀x∀y(Rxy→Cx). Bruk regelen for implikasjon: vi får
    ∀x∀y(¬Rxy∨Cx)
    
- **7:** Starter med ¬∃x(Dx∧Ex). 
	Negasjonen flyttes: for alle x, ikke (Dx og Ex).
	
  Med De Morgan: for alle x, ikke Dx eller ikke Ex:
  ∀x(¬Dx∨¬Ex)
    
- **8:** Starter med ∀x(Dx→∃y(Rxy∧Dy)). Bruk implikasjon:
    ∀x(¬Dx∨∃y(Rxy∧Dy))

- **9:**
- Vi starter med ∀x(Cx↔∀y(Rxy→Ey))
- Først bryter vi ned ↔: (Cx∧∀y(Rxy→Ey))∨(¬Cx∧¬∀y(Rxy→Ey))
- Så  løse →: Rxy→Ey blir ¬Rxy∨Ey
- Og ¬∀y(...) blir ∃y¬(...). Dermed ender vi med: ∀x((Cx∧∀y(¬Rxy∨Ey))∨(¬Cx∧∃y(Rxy∧¬Ey)))

 - Vi starter med ∀x(Cx↔∀y(Rxy→Ey))
- ↔ (hvis og bare hvis) fjernes: (Cx∧∀y(Rxy→Ey))∨(¬Cx∧¬∀y(Rxy→Ey))
- → (hvis ... så) fjernes: Rxy→Ey≡¬Rxy∨Ey
  Negasjon foran kvantor: ¬∀y(...)≡∃y¬(...)¬∀y(...)≡∃y¬(...). 
  Inni gir det Rxy∧¬Ey.
  Dermed:
  ∀x((Cx∧∀y(¬Rxy∨Ey))∨(¬Cx∧∃y(Rxy∧¬Ey)))


| Nr  |                   |                                        |
| --- | ----------------- | -------------------------------------- |
| 6   | ∀x∀y(Rxy→Cx)      | ∀x∀y(¬Rxy∨Cx)                          |
| 7   | ¬∃x(Dx∧Ex)        | ∀x(¬Dx∨¬Ex)                            |
| 8   | ∀x(Dx→∃y(Rxy∧Dy)) | ∀x(¬Dx∨∃y(Rxy∧Dy))                     |
| 9   | ∀x(Cx↔∀y(Rxy→Ey)) | ∀x((Cx∧∀y(¬Rxy∨Ey))∨(¬Cx∧∃y(Rxy∧¬Ey))) |



6:

    "Vi starter med: for alle x, for alle y, hvis Rxy så Cx."
    ( ∀x∀y(Rxy→Cx )
    "Implikasjonspilen (→) betyr 'hvis … så …', og omskrives som 'ikke første del, eller andre del'."
    "Så vi får: for alle x, for alle y, ikke Rxy, eller Cx."
    ( ∀x∀y(¬Rxy∨Cx) )

7:

    "Vi starter med: ikke det finnes en x slik at Dx og Ex."
    ( ¬∃x(Dx∧Ex) )
    "Når vi flytter negasjonen foran eksistenskvantoren, snur den til en allkvantor."
    "Så vi får: for alle x, ikke (Dx og Ex)."
    ( ∀x¬(Dx∧Ex) )
    "Til slutt bruker vi De Morgan: for alle x, ikke Dx eller ikke Ex."
    ( ∀x(¬Dx∨¬Ex) )

8:

    "Vi starter med: for alle x, hvis Dx så det finnes en y slik at Rxy og Dy."
    ( ∀x(Dx→∃y(Rxy∧Dy)) )
    "Igjen fjerner vi implikasjonspilen (→). 'Hvis … så …' blir til 'ikke Dx eller …'."
    "Så vi får: for alle x, ikke Dx, eller det finnes en y slik at Rxy og Dy."
    ( ∀x(¬Dx∨∃y(Rxy∧Dy)) )

9:

    "Til slutt har vi: for alle x, Cx hvis og bare hvis for alle y, hvis Rxy så Ey."
    ( ∀x(Cx↔∀y(Rxy→Ey)) )
    "Bikondisjonal (↔) betyr 'hvis og bare hvis', og kan omskrives til '(Cx og …) eller (ikke Cx og ikke …)'."
    "Så vi får: for alle x, (Cx og for alle y, hvis Rxy så Ey) eller (ikke Cx og ikke for alle y, hvis Rxy så Ey)."
    ( (Cx∧∀y(Rxy→Ey))∨(¬Cx∧¬∀y(Rxy→Ey)) )
    "Nå tar vi implikasjonspilen (→) inni kvantoren. 'Hvis Rxy så Ey' blir 'ikke Rxy eller Ey'."
    "Og vi flytter negasjonen foran allkvantoren: 'ikke for alle y (…) ' blir 'det finnes en y slik at ikke (…) '. Dette gir 'Rxy og ikke Ey'."
    "Så sluttresultatet er:
    for alle x, (Cx og for alle y, ikke Rxy eller Ey) eller (ikke Cx og det finnes en y slik at Rxy og ikke Ey)."
    ( ∀x((Cx∧∀y(¬Rxy∨Ey))∨(¬Cx∧∃y(Rxy∧¬Ey))) )