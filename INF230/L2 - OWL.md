# 1.2 Vevontologispråket OWL

> [!abstract] I korte trekk RDFS gir deg klasser, underklasser, underegenskapar og domene/verdiområde. OWL byggjer oppå med **restriksjonar** (∃/∀) som gjer at ein resonnerar kan utleie ny kunnskap. Ein **kunnskapsbase** = TBoks (ontologi, universalar) + ABoks (kunnskapsgraf, partikularar).

---

## Termliste (nn / en)

|nn|en|
|---|---|
|blank node _m._|blank node|
|DIKV-pyramide _m._|DIKW pyramid|
|informasjon _m._|information|
|kunnskapsbase _m._|knowledge base|
|ontologi _m._|ontology|
|semantisk artefakt _n._|semantic artefact|

---

## Kvifor OWL?

- OWL var opphavleg ein spøk om **"One World Language"** (jf. esperanto/interlingua) — no offisielt **Web Ontology Language**, bygd på **RDF Schema (RDFS)**.
- Verktøyet i kurset: **Protégé** — https://protege.stanford.edu/

### DIKV-pyramiden (DIKW)

Frå botn og opp, med tilhøyrande interoperabilitetsnivå:

|Nivå|Definisjon (nn)|Interoperabilitet|
|---|---|---|
|**data**|digitalt innhald utveksla etter ein formell **syntaks**|**syntaktisk** — data utveksla i eit avtalt format|
|**informasjon**|data med veldefinert betydning (formell **semantikk**)|**semantisk** — data blir informasjon når betydninga er avtalt|
|**kunnskap**|informasjon brukaren veit er sann, eller informasjon med karakterisert **epistemisk status**|**epistemisk** — metadatadokumentasjon som fastset kunnskapsstatus|
|**visdom**|kunnskap brukaren kan handtere godt i praksis, i ein kjend **pragmatisk** kontekst|**pragmatisk** — kompetanse + avtalt god praksis|


---

## Semantisk interoperabilitet

### OntoCommons og RoDI

- **OntoCommons CSA** samla og støtta design og samordning av **domenenivå-standardar for interoperabilitet**.
- Analysen blei levert som **RoDI: The Review of Domain Interoperability** (Chiacchiera _et al._, OntoCommons deliverable 3.8, 2023).
- RoDI skil mellom **syntaktisk**, **semantisk** og **pragmatisk** interoperabilitet.

### Nivåa i ontologipyramiden

```
TOP / REFERENCE LEVEL     ← DOLCE, EMMO, BFO (kjem i 1.5)
MIDDLE LEVEL          ┐
DOMAIN LEVEL          ┘   ← her jobbar OntoCommons/RoDI
APPLICATION LEVEL
```

### Kven er interoperabel med kven?

Matrise over interoperabilitetskrav, 4 aktørar → 10 symmetriske par:

||data|human|organization|software|
|---|---|---|---|---|
|**data** (d)|d↔d|d↔h|d↔o|d↔s|
|**human** (h)|—|h↔h|h↔o|h↔s|
|**organization** (o)|—|—|o↔o|o↔s|
|**software** (s)|—|—|—|s↔s|

### Semantiske artefaktar (typar metadatastandardar)

Plottet har to aksar: **depth of digitalization** (y) mot **depth of domain knowledge** (x).

- Låg/låg: **vocabulary** → **taxonomy** → **thesaurus** → **dictionary**
- Midt: **visual notation** (vector graphics), **hierarchical schema** (XSD, JSON Schema)
- Høgast digitalisering: **ontology** (TTL, OWL DL) = **semantic technology**
- Høg domenekunnskap, låg digitalisering: **literature corpus**, **compendium** → kan lyftast via annotert litteratur med maskinlesbar semantikk
- Pila vidare oppover: innlemming av **pragmatikk, modal-, temporal- og epistemisk logikk**

---

## Ontologiar i praksis

- **schema.org**: stor delt ontologi for vev-innhald. Dokumentasjon: https://schema.org/docs/full.html — ontologi i TTL: https://schema.org/version/latest/schemaorg-current-https.ttl
- Døme (Fensel _et al._, §2.2 Knowledge Creation): eit hotell markert opp med **JSON-LD** der `"@context": "http://schema.org"` og `"@type": "Hotel"`. Klassehierarkiet er `Thing > Organization > LocalBusiness > LodgingBusiness > Hotel` **og** `Thing > Place > LocalBusiness > LodgingBusiness > Hotel` → multippel arv er heilt vanleg i OWL.
- I Protégé ser du både **asserted** og **inferred** hierarki (OWLViz), og `schema:Thing` blir underklasse av `owl:Thing`.

---

## RDF Schema (RDFS)

> Alt i RDFS er sjølv trippel. Det einaste som gjer dei til «skjema» er at dei bruker termar frå `rdfs:`-namnerommet.

### Klasser

```turtle
:AllStarPlayer  rdf:type rdfs:Class .
:MajorLeaguePlayer rdf:type rdfs:Class .
:Surgeon rdf:type rdfs:Class .
```

### Dei fire kjernekonstruksjonane

|Konstruksjon|Betydning som slutningsregel|
|---|---|
|`rdfs:subClassOf`|`?x rdf:type :A` + `:A rdfs:subClassOf :B` ⟹ `?x rdf:type :B` (typepropagering)|
|`rdfs:subPropertyOf`|`?x :p ?y` + `:p rdfs:subPropertyOf :q` ⟹ `?x :q ?y`|
|`rdfs:domain`|`:p rdfs:domain :D` + `?x :p ?y` ⟹ `?x rdf:type :D` (om **subjektet**)|
|`rdfs:range`|`:p rdfs:range :R` + `?x :p ?y` ⟹ `?y rdf:type :R` (om **objektet**)|

> [!tip] Hugs prinsippet Kvar gong ein ny RDFS-ressurs blir innført, er svaret på «kva tyder det?» alltid på forma: _«under desse omstenda kan du utleie desse nye trippela.»_

> [!warning] Klassisk misforståing `rdfs:domain`/`rdfs:range` er **ikkje** integritetsskrankar. Dei avviser ikkje data — dei **utleier** typen. Skriv du feil type, får du ein ny inferert type, ikkje ein feilmelding. `D` og `R` treng korkje vere disjunkte eller distinkte.

> [!info] OO-samanlikning (Sidebar 8.1) `rdfs:subPropertyOf` har **ingen direkte analog i OOP**, fordi eigenskapar der ikkje er førsteklasses entitetar (dei kan ikkje relaterast til kvarandre uavhengig av klassen dei er definerte i). Forvirring oppstår når subproperty-diagram blir forveksla med klassediagram.

Døme på subproperty-hierarki:

```turtle
:freeLancesTo         rdfs:subPropertyOf :contractsTo .
:indirectlyContractsTo rdfs:subPropertyOf :contractsTo .
:isEmployedBy         rdfs:subPropertyOf :worksFor .
:contractsTo          rdfs:subPropertyOf :worksFor .
```

---

## Å skrive eit RDF-skjema

```turtle
# Omgrep er av typen owl:Class
animals:Fox a owl:Class .

# Taksonomi med rdfs:subClassOf
animals:Fox      rdfs:subClassOf animals:Canidae .
animals:Canidae  rdfs:subClassOf animals:Mammalia .

# Relasjonar er av typen owl:ObjectProperty
animals:isNaturalEnemyOf a owl:ObjectProperty .
animals:isNaturalEnemyOf rdfs:domain animals:Predator .   # og tilsvarande rdfs:range

# Elementære datatypeeigenskapar
uni:hasSubmissionTimestamp a owl:DatatypeProperty .
uni:hasSubmissionTimestamp rdfs:range xs:dateTime ;
                           rdfs:subPropertyOf uni:hasTimestamp .   # hierarki også for datatypeeigenskapar
```

|Du vil uttrykke|Bruk|
|---|---|
|eit omgrep / ein klasse|`owl:Class`|
|taksonomi|`rdfs:subClassOf`|
|relasjon mellom to individ|`owl:ObjectProperty`|
|eigenskap med literal verdi|`owl:DatatypeProperty`|
|hierarki mellom relasjonar/eigenskapar|`rdfs:subPropertyOf`|
|kva som kan stå som subjekt/objekt|`rdfs:domain` / `rdfs:range`|

---

## Øving: kan vi skrive dette ER-diagrammet i RDFS?

ER-modellen:

- `Person` (name), `Human` (p_number), `Organization` (o_number), `Employer`
- `Human` ⊑ `Person`, `Organization` ⊑ `Person`, `Employer` ⊑ `Organization`
- `hasEmployee`: domene `Employer`, verdiområde `Human`

Svar — ja, alt dette går med RDFS/OWL-vokabularet frå førre slide:

```turtle
:Person       a owl:Class .
:Human        a owl:Class ; rdfs:subClassOf :Person .
:Organization a owl:Class ; rdfs:subClassOf :Person .
:Employer     a owl:Class ; rdfs:subClassOf :Organization .

:hasEmployee a owl:ObjectProperty ;
             rdfs:domain :Employer ;
             rdfs:range  :Human .

:p_number a owl:DatatypeProperty ; rdfs:domain :Human .
:o_number a owl:DatatypeProperty ; rdfs:domain :Organization .
:name     a owl:DatatypeProperty ; rdfs:domain :Person .
```

> [!question] Poenget med øvinga Les subklasse-aksiomet høgt: _«Every Organization is a Person.»_ Det er formelt greitt, men ontologisk tvilsamt — ER-diagram let deg teikne arv utan å ta stilling til om det verkeleg er ei **is-a**-relasjon. I RDFS/OWL blir slikt utleidd av ein resonnerar og forplantar seg. Same med `p_number`: å setje `rdfs:domain :Human` betyr «alt som har eit p_number **er** ein Human» — ei slutning, ikkje ein sjekk.

---

## Kunnskapsbasar: TBoks og ABoks

> [!note] Definisjon Ein **kunnskapsbase** _K_ = (_T_, _A_) består av ein **ontologi _T_** som skildrar **universalar**, og ei **mengd assertjonar _A_** som skildrar konkrete **instansar** av desse universalane.
> 
> (Glossaret skriv _K_ = (_A_, _T_) — same sak, berre motsett rekkefølgje. Ver klar over begge.)

||entitet|relasjon|eigenskap|
|---|---|---|---|
|**partikular** (ABoks = kunnskapsgraf)|individ / object|relationship|property _(sometimes: attribute)_|
|**universal** (TBoks = ontologi)|omgrep / entity type / class|relation / relationship type → `owl:ObjectProperty`|attribute _(attribute type)_ → `owl:DatatypeProperty`|

- **ABox = knowledge graph** (dataa)
- **TBox = ontology** (skjemaet)

### Kva _er_ ein ontologi? (Keet 2020, §1.2)

|#|Kjelde|Definisjon|Problem|
|---|---|---|---|
|1.1|Gruber [Gru93]|«a specification of a conceptualization»|Mest siterte, men problematisk: to nebuløse omgrep skildrar eit tredje|
|1.2|[SBF98]|«a **formal, explicit** specification of a **shared** conceptualization»|Kva vil «shared» seie — deg og meg, eller ei heil gruppe?|
|1.3|Guarino [Gua98]|«a logical theory accounting for the intended meaning of a formal vocabulary, i.e. its **ontological commitment** to a particular conceptualization of the world»|Presis, men ein munnfull; framleis omdiskutert|
|1.4|[HPSvH03] (W3C/OWL-utviklarane)|«an ontology being equivalent to a **Description Logic knowledge base**»|Unødig restriktiv — ein ontologi kan representerast i andre logikkspråk|

---

## FOL-semantikk for RDFS

Franconi _et al._, «The logic of extensional RDFS», _Proc. ISWC 2013_, LNCS **8218**, 101–116, doi:10.1007/978-3-642-41335-3_7. _(Slidesa skriv «Francon».)_

**Signaturen:**

- `T(·,·,·)` — ternært predikat for eit RDF-trippel (skrive som `(a, b, c)`)
- `C(·)` — unært: medlemskap i `rdfs:Class`
- `P(·)` — unært: medlemskap i `rdf:Property`
- Forkortingar: `sc` = subClass, `sp` = subProperty, `dom` = domain

**Grunnaksiom (intensjonelle, berre →):**

|#|Aksiom|Les som|
|---|---|---|
|(1)|∀a,b (a, sc, b) → C(a) ∧ C(b) ∧ ∀x (x, type, a) → (x, type, b)|subklasse gir typepropagering|
|(2)|∀a,b (a, sp, b) → P(a) ∧ P(b) ∧ ∀x,y (x, a, y) → (x, b, y)|subproperty gir trippelpropagering|
|(3)|∀a,c (a, dom, c) → ∀x,y (x, a, y) → (x, type, c)|domene typar subjektet|
|(4)|∀a,d (a, range, d) → ∀x,y (x, a, y) → (y, type, d)|verdiområde typar objektet|

**Refleksivitet og transitivitet:**

|#|Aksiom|
|---|---|
|(5)|(a, sc, b) ∧ (b, sc, c) → (a, sc, c)|
|(6)|C(a) → (a, sc, a)|
|(7)|(a, sp, b) ∧ (b, sp, c) → (a, sp, c)|
|(8)|P(a) → (a, sp, a)|

**Typing av sjølve vokabularet:**

|#|Aksiom|
|---|---|
|(9)|(a, dom, b) → P(a) ∧ C(b)|
|(10)|(a, range, b) → P(a) ∧ C(b)|
|(11)|(a, type, b) → C(b)|
|(12)|(a, b, c) → P(b)|
|(13)|P(sc) ∧ P(sp) ∧ P(dom) ∧ P(range) ∧ P(type)|

**Ekstensjonell RDFS (W3C sin «non-normative» variant):** byt ut → med ↔ i (1)–(4) ⟹ aksiom (14)–(17). Då får `sc`, `sp`, `dom`, `range` **den vanlege mengdeteoretiske betydninga**.

> [!warning] Hovudpoenget **Intensjonell** RDFS (normativ): frå `A rdfs:subClassOf B` følgjer at alle A-ar er B-ar — men ikkje omvendt. **Ekstensjonell** RDFS: om alle A-ar tilfeldigvis er B-ar, _er_ A ein subklasse av B. Standarden vel den intensjonelle varianten fordi den ekstensjonelle utleier langt meir (og er dyrare å resonnere med).

---

## Blank nodes i TTL-notasjon

**Når:** vi veit at noko finst og veit noko om det, men veit ikkje **identiteten**.

Med identifikator:

```turtle
lit:Mistress1 rdf:type bio:Woman ;
              bio:livedIn geo:England .
lit:Sonnet78 lit:hasInspiration lit:Mistress1 .
```

Som blank node — alle trippel der noden er **subjekt** blir sett i hakeparentes:

```turtle
[ rdf:type bio:Woman ;
  bio:livedIn geo:England ]
```

Heile hakeparentes-sekvensen kan stå **i staden for** noden i eit anna trippel (og `a` er forkorting for `rdf:type`):

```turtle
lit:Sonnet78 lit:hasInspiration [ a bio:Woman ;
                                  bio:livedIn geo:England ] .
```

Kan lesast nesten som engelsk: _«Sonnet78 has as inspiration a Woman who lived in England.»_ Identiteten til kvinna er ubestemt.

---

## Eksistensielle og universelle restriksjonar (OWL)

> [!note] Kjernen Ein **restriksjon er ein spesiell type klasse**, og har individ som medlemmer som alle andre klasser. Medlemskap krev at vilkåra i restriksjonen er oppfylte. Ein restriksjon = `owl:onProperty` + éin av `owl:someValuesFrom` / `owl:allValuesFrom` / `owl:hasValue`.

|Konstruksjon|DL|Les som|
|---|---|---|
|`owl:someValuesFrom`|∃P.C|alle individ der **minst éin** verdi av P kjem frå klassen C|
|`owl:allValuesFrom`|∀P.C|alle individ der **alle** verdiar av P kjem frå C|
|`owl:hasValue`|∃P.{v}|alle individ som har den konkrete verdien v for P|

### ∃ — someValuesFrom (definerer ein klasse → klassifisering)

```turtle
q:AnsweredQuestion owl:equivalentClass
    [ a owl:Restriction ;
      owl:onProperty q:hasSelectedOption ;
      owl:someValuesFrom q:Answer ] .
```

Gitt dei asserterte trippela:

```turtle
d:WhatProblem q:hasSelectedOption d:STV .
d:STV a q:Answer .
```

⟹ `d:WhatProblem` oppfyller vilkåra og blir **klassifisert som** `q:AnsweredQuestion`. Fordi det er `equivalentClass` (ikkje `subClassOf`), verkar slutninga **begge vegar**.

### ∀ — allValuesFrom (fører type nedover til verdiane)

```turtle
:MyFavoriteAllStarTeam a :BaseballTeam ;
    a [ owl:Restriction ;
        owl:onProperty :hasPlayer ;
        owl:allValuesFrom :StarPlayer ] ;
    :hasPlayer :Kaneda, :Gonzales .

# utleidd (merkte med * i boka):
* :Gonzales a :StarPlayer .
* :Kaneda   a :StarPlayer .
```

> [!tip] Skilnaden på ein setning `someValuesFrom` brukt med `equivalentClass` **klassifiserer subjektet**. `allValuesFrom` brukt som typeassertjon **typar objekta**. Ingen av dei er skrankar — begge produserer nye trippel.

---

## Glossar (nn)

**DIKV-pyramide** _(en. DIKW pyramid)_ — data → informasjon → kunnskap → visdom; sjå tabellen øvst.

**informasjon** — utsegn eller mengde av utsegner. Eller noko som kan lagast om til utsegner, t.d. data med veldefinert semantikk.

**kunnskapsbase** — par _K_ = (_A_, _T_), der _A_ er ein ABoks (kunnskapsgraf) og _T_ er ein TBoks (ontologi).

**ontologi** — «formell oversikt over eit kunnskapsfelt, representert ved omgrep og relasjonar mellom dei» (M. K. Ådland i SNL).

**blank node** — node i ein RDF-graf utan identifikator; skriven `[ … ]` i Turtle.

**semantisk artefakt** — samlenemning for typar metadatastandardar (vokabular, taksonomi, tesaurus, skjema, ontologi …).

---

## Sannsynlege eksamenspoeng

- [ ] Plassere dei fire interoperabilitetsnivåa på DIKV-pyramiden
- [ ] Skrive ein liten taksonomi + relasjonar i Turtle med `owl:Class`, `owl:ObjectProperty`, `owl:DatatypeProperty`
- [ ] Forklare kvifor `rdfs:domain`/`rdfs:range` utleier og ikkje avgrensar
- [ ] Skilje TBoks/ABoks og partikular/universal
- [ ] Gjere greie for dei fire ontologidefinisjonane og svakheitene deira
- [ ] Skilje intensjonell og ekstensjonell RDFS (→ vs ↔)
- [ ] Skrive og lese blank nodes i Turtle
- [ ] `someValuesFrom` vs `allValuesFrom` — kva blir utleidd i kvart tilfelle?

## Kjelder frå slidesa

- Allemang _et al._, §3.9 (blank nodes), §8.2 (RDF schema language), §12.1 (Basic OWL: restrictions)
- Keet (2020), §1.2 What is an ontology?
- Fensel _et al._, §2.2 Knowledge Creation
- Franconi _et al._, ISWC 2013 — extensional RDFS
- Chiacchiera _et al._, OntoCommons D3.8 (RoDI), 2023
- Rowley, _J. Inform. Sys._ 33(2): 163–180
