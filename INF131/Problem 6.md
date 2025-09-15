b.14 A BOKS
```
@prefix A-inst: <https://www.nmbu.no/fair-semantics/A-inst#> .

# Fakta i A-boksen
A-inst:pi a A-gruppeA08:Identifikator .

# Tving pi til å få en egenskap 'løsbargjennom' til et individ p
A-inst:pi A-gruppeA08:løsbargjennom A-inst:p .

# Gjør p til en Identifikator (ikke Protokoll direkte)
A-inst:p a A-gruppeA08:Identifikator .

# I tillegg: la p identifisere pi (bruk av identifiserer med range DigitalRessurs
# og pi er allerede en Identifikator -> gjør pi også til DigitalRessurs fra range)
A-inst:p A-gruppeA08:identifiserer A-inst:pi .
```


b.17
(rdfs:domain(R,C) ~ ∃R.⊤ ⊑ C (eller som typing av subjekt i R)
rdfs:range(R,C) ~ ⊤ ⊑ ∀R.C)


b.20
Mål: Utlede konflikt for individet p ved at det blir både Protokoll og Identifikator og klassene er disjunkte.

    Predikat- og konstantkonvensjoner

    Klasser: Protokoll(x), Identifikator(x)
    Egenskap: løsbargjennom(x,y) (forkortes L(x,y))
    Disjunkthet: ¬∃x (Protokoll(x) ∧ Identifikator(x)) eller ∀x (¬Protokoll(x) ∨ ¬Identifikator(x))
    A-boks-konstanter: pi, p

    Nødvendige utsagn i førsteordens logikk (FOL)
    Velg bare de som faktisk brukes i beviset:

T-boks
T1. Range(løsbargjennom) = Protokoll:
∀x∀y ( L(x,y) → Protokoll(y) )

T2. Disjunkthet:
∀x ( ¬(Protokoll(x) ∧ Identifikator(x)) )
ekvivalent: ∀x ( ¬Protokoll(x) ∨ ¬Identifikator(x) )

A-boks
A1. Identifikator(pi)
A2. L(pi, p)
A3. Identifikator(p)

Merk: Vi bruker ikke domene eller other properties i dette minimale beviset; T1 + T2 + A2 + A3 er tilstrekkelig. A1 er overflødig for selve konflikten, men kan stå med uten å skade.

Utledning uformelt:

    Fra A2 og T1: Protokoll(p).
    Sammen med A3: Identifikator(p).
    Med T2: motsigelse (for p).

    Konjunktiv preneksnormalform (KPNF)
    Vi konverterer T1, T2 til KPNF. A1–A3 er lukkede atomiske fakta (grunnformler) og står som de er.

T1 i KPNF
Start: ∀x∀y ( ¬L(x,y) ∨ Protokoll(y) )
Dette er allerede i preneks (alle kvantorer foran) og i konjunktiv normalform (det er én klausul).

    KPNF: ∀x∀y ( ¬L(x,y) ∨ Protokoll(y) )

T2 i KPNF
Start: ∀x ( ¬Protokoll(x) ∨ ¬Identifikator(x) )
Dette er allerede i preneks og CNF.

    KPNF: ∀x ( ¬Protokoll(x) ∨ ¬Identifikator(x) )

A-boks-fakta som grunnklausuler

    Identifikator(pi)
    L(pi, p)
    Identifikator(p)

    Hele bevisgrunnlaget i KPNF (klar til resolusjon)
    Skriv alt samlet:

    ∀x∀y ( ¬L(x,y) ∨ Protokoll(y) )
    ∀x ( ¬Protokoll(x) ∨ ¬Identifikator(x) )
    Identifikator(pi)
    L(pi, p)
    Identifikator(p)

    Skolemisert klauseform (om du vil vise ren klausulmengde for resolusjonsbevis)
    Fjern kvantorene (alt er universelt kvantifisert i klausulform), og oppgi klausuler:

K1: ¬L(x,y) ∨ Protokoll(y)
K2: ¬Protokoll(x) ∨ ¬Identifikator(x)
K3: Identifikator(pi)
K4: L(pi,p)
K5: Identifikator(p)

Resolusjonsskisse til motsigelse:

    Fra K4 og K1 (med x:=pi, y:=p) får vi Protokoll(p).
    Kombiner med K5 og K2 (x:=p): ¬Protokoll(p) ∨ ¬Identifikator(p) og Identifikator(p) gir ¬Protokoll(p).
    Men vi har Protokoll(p) fra første steg ⇒ kontradiksjon.


### b.21
Klausuler (alle universelt kvantifiserte)
K1: ¬L(x,y) ∨ Protokoll(y)
K2: ¬Protokoll(z) ∨ ¬Identifikator(z)
K3: Identifikator(pi)
K4: L(pi,p)
K5: Identifikator(p)

Mål: Utled ⊥ (tom klausul).

Trinnvis resolusjon

    Fra K1 og K4
        K1: ¬L(x,y) ∨ Protokoll(y)
        K4: L(pi,p)
        Substitusjon: σ1 = {x := pi, y := p}
        Resolvent R1: Protokoll(p)
    Fra K2 og K5
        K2: ¬Protokoll(z) ∨ ¬Identifikator(z)
        K5: Identifikator(p)
        Substitusjon: σ2 = {z := p}
        Resolvent R2: ¬Protokoll(p)
    Fra R1 og R2
        R1: Protokoll(p)
        R2: ¬Protokoll(p)
        Resolvent: ⊥

Kommentar

    K3: Identifikator(pi) er overflødig for selve beviset, men kan stå med i klausulmengden uten å bli brukt.
    Beviset bruker nøyaktig de klausulene som trengs: K1, K2, K4, K5.











# KORTERE VERSJONER?
```

Problem b.20: Formler i konjunktiv preneksnormalform (KPNF)

Vi isolerer den minimale delen som trengs for inkonsistensbeviset.

Predikatkonvensjoner:

    L(x,y): løsbargjennom(x,y)
    Protokoll(x)
    Identifikator(x)
    Konstanter: pi, p

Førsteordens utsagn (KPNF/CNF)

    ∀x∀y (¬L(x,y) ∨ Protokoll(y))
    [range(løsbargjennom) = Protokoll]

    ∀x (¬Protokoll(x) ∨ ¬Identifikator(x))
    [Protokoll disjoint Identifikator]

    L(pi, p)
    [A-boks-fakta]

    Identifikator(p)
    [A-boks-fakta]

Kommentar:

    Alle formlene står allerede i preneksform med universelle kvantorer og i konjunktiv normalform (hver linje er en klausul eller et grunnatom). Dette er den minimale delen av kunnskapsbasen som trengs for å utlede en motsigelse for individet p

```


# 21
```
Problem b.21: Predikatlogisk resolusjon

Klausulmengde (fra b.20)

    K1: ¬L(x,y) ∨ Protokoll(y)
    K2: ¬Protokoll(z) ∨ ¬Identifikator(z)
    K3: L(pi,p)
    K4: Identifikator(p)

Mål: Utled tom klausul (⊥).

Resolusjonsbevis (med substitusjoner)

    Fra K1 og K3
        K1: ¬L(x,y) ∨ Protokoll(y)
        K3: L(pi,p)
        Substitusjon σ1 = {x := pi, y := p}
        Resolvent R1: Protokoll(p)
    Fra K2 og K4
        K2: ¬Protokoll(z) ∨ ¬Identifikator(z)
        K4: Identifikator(p)
        Substitusjon σ2 = {z := p}
        Resolvent R2: ¬Protokoll(p)
    Fra R1 og R2
        R1: Protokoll(p)
        R2: ¬Protokoll(p)
        Resolvent: ⊥

Dermed er den tomme klausulen utledet, og inkonsistensen er bevist.
```



# 21 FORKLARING
Her er en fokusert forklaring på beviset, med kun målrettede steg og eksplisitte substitusjoner:

Hva vi skal bevise
- Mål: Utlede tom klausul (⊥) ved predikatlogisk resolusjon fra K1–K4.
- Strategi: Finn to motstridende litteraler om samme individ p: Protokoll(p) og ¬Protokoll(p).

Klausulmengde (fra b.20)
- K1: ¬L(x,y) ∨ Protokoll(y)
- K2: ¬Protokoll(z) ∨ ¬Identifikator(z)
- K3: L(pi,p)
- K4: Identifikator(p)

Trinn 1: Avled Protokoll(p)
- Par: K1 og K3
  - K1: ¬L(x,y) ∨ Protokoll(y)
  - K3: L(pi,p)
- Substitusjon: σ1 = {x := pi, y := p}
  - Begrunnelse: Matcher L(x,y) i K1 med L(pi,p) i K3.
- Resolvent: R1 = Protokoll(p)
  - Forklaring: Resolusjon mellom ¬L(x,y) og L(pi,p) eliminerer L-litteralen og etterlater Protokoll(p).

Trinn 2: Avled ¬Protokoll(p)
- Par: K2 og K4
  - K2: ¬Protokoll(z) ∨ ¬Identifikator(z)
  - K4: Identifikator(p)
- Substitusjon: σ2 = {z := p}
  - Begrunnelse: Matcher Identifikator(z) i K2 med Identifikator(p) i K4.
- Resolvent: R2 = ¬Protokoll(p)
  - Forklaring: Resolusjon mellom ¬Identifikator(z) og Identifikator(p) eliminerer Identifikator-litteralen og etterlater ¬Protokoll(p).

Trinn 3: Utled motsigelsen
- Par: R1 og R2
  - R1: Protokoll(p)
  - R2: ¬Protokoll(p)
- Resolvent: ⊥ (tom klausul)
  - Forklaring: Komplementære litteraler på samme atom og individ gir tom klausul.

Hvorfor dette er “målretta”
- Vi brukte kun de parene av klausuler som direkte produserer:
  - først Protokoll(p) fra L(pi,p) via range-regelen (K1),
  - deretter ¬Protokoll(p) fra disjointness + Identifikator(p) (K2 og K4),
  - til slutt konflikten mellom disse to.
- Ingen sideveier eller irrelevante resolusjoner er inkludert.

Intuisjon
- Fra L(pi,p) og regelen “alle L-mål er Protokoll” får vi Protokoll(p).
- Fra “Protokoll og Identifikator kan ikke sameksistere” og Identifikator(p) får vi ¬Protokoll(p).
- Sammen gir de ⊥.