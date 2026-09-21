
# 1.3 Terminologi og taksonomi

> [!abstract] Kjernen Kjernen i ei ontologi er **terminologi + taksonomi**. Definer alt aristotelisk: **definisjon = nærmaste overomgrep + åtskiljande kjenneteikn**. Da får du taksonomien gratis.

## Termliste

|nn|en|
|---|---|
|multippel arv|multiple inheritance|
|nærmaste overomgrep|genus proximus|
|omgrepsskjema|concept scheme|
|referent|referent|
|taksonomi|taxonomy|
|term|term|
|åtskiljande kjenneteikn|differentia|

## Omgrep ≠ term

- **Omgrep** = IRI-en og `owl:Class`. **Term** = etiketten (label).
- Fleire språk er god praksis. Fleire termar per omgrep i same språk er greitt — peik ut ei hovudform.

**Stilreglar (eksamensrelevant):**

- term: **små bokstavar, eintal, ingen artikkel**
- definisjon: **byrjar med liten bokstav, ingen artikkel, ingen punktum til slutt** (det er ikkje ei setning)

Døme på iterasjon: _Knowledge graphs → Knowledge graph → knowledge graph: a labelled graph … → knowledge graph: labelled graph where the edge labels represent relations and the node labels are unique and represent individuals_

## Den semiotiske trekanten

Språkrådet: **omgrep** (begrep) – **term** – **referent** – **definisjon**. Definisjonen presiserer omgrepet; termen namngjev det; referenten er tingen i verda.

|Posisjon|Referent?|
|---|---|
|**Saussure**|signifié/signifiant — berre teiknet, ingen referent|
|**Peirce**|sign–object–interpretant; representasjonen er grunna i ein reell kausal samanheng|
|**Derrida**|«il n'y a pas de hors-texte» — nektar for referenten|
|**Språkrådet**|referenten er med i modellen|

## Aristoteliske definisjonar

«An _x_ is a _y_ with the property _z_» — _y_ = **genus** (γένος), _z_ = **differentia** (διαφορά).

Oppnår to ting:

1. Å skrive definisjonane **byggjer taksonomien** samtidig.
2. Kva som helst kan klassifiserast **ovanfrå og ned** ved å teste vilkåra.

**Retningsliner** (Seppälä, Ruttenberg & Smith 2017):

- Bruk genus-differentia-forma
- **Nøyaktig eitt genus**
- Bruk **genus proximus** — næraste forelder, så alle termar på same nivå har same genus
- **Match tekstleg og logisk definisjon**: _bacteremia: an infection that has as part bacteria located in the blood_ ⟶ `infection and (has_part some (infectious agent and Bacteria and (located_in some blood)))`
- Gjer genus meir spesifikk der differentia alt føreset det: «graph» → «labelled graph», «lifeform with six legs» → «animal with six legs»

❌ Dårleg: _«a vertebrate like a cat, dog or whale»_ (døme er ikkje differentia) · _«Mammals nurse their young.»_ (fleirtal + setning)

**Unpackable** (Arp, Smith & Spear 2015): definisjonen skal kunne bytast ut med termen utan at meininga endrar seg.

## Taksonomi

- Døme: `Person → Employee → {Instructor, Secretary}`, `Person → Student` (Silberschatz)
- Språkrådet: `bil → {personbil, minibuss, varebil}` skilde på bruksføremål, vekt, tal på passasjersete. `minibuss = bil + persontransport + over åtte passasjersete`

> [!warning] Multippel arv Regelen: alle nodar unntatt rota har **nøyaktig éin forelder**. «Blue car» under både «Blue thing» og «Car» bryt dette — du har blanda **to klassifiseringsprinsipp** (farge og køyretøytype).

### Unngå diamantar og ad hoc-unionar

```turtle
# Frank er forskingsingeniør — utan ein ResearchEngineer-klasse:
<Frank> a <Researcher>, <Engineer> .

# Kvart registrert team må ha minst éin forskingsingeniør:
<RegisteredTeam> rdfs:subClassOf [
  a owl:Restriction ;
  owl:onProperty <hasTeamMember> ;
  owl:someValuesFrom [ owl:intersectionOf (<Researcher> <Engineer>) ] ] .

# Berre forskarar eller ingeniørar kan vere teammedlem — utan unionsklasse:
<hasTeamMember> rdfs:range [ owl:unionOf (<Researcher> <Engineer>) ] .
```

«Frank er forskar **eller** ingeniør, men eg veit ikkje kva» — **ikkje gjer dette**. Disjunktive påstandar om individ er dårleg praksis.

## SKOS

- **Omgrep** = universal som berre blir instansiert av individ. I OOP: klasse. I ER: entity type. (Nominalistisk: universalet _er_ mengda av instansane sine.)
- Taksonomi: `skos:broader` / `skos:narrower`
- Samordning mellom ontologiar: `skos:exactMatch`, `skos:broadMatch`, `skos:narrowMatch`
- https://www.w3.org/TR/skos-primer/

## Glossar (nn)

**nærmaste overomgrep** — snevraste omgrep frå eit omgrepsskjema som eit visst omgrep kan subsumerast under; fyrste ledd i ein aristotelisk definisjon

**omgrepsskjema** — system av universelle kategoriar (omgrep, forholdstypar o.l.) samt beskriving av korleis dei heng saman

**åtskiljande kjenneteikn** — kriterium som avgjer om eit individ som instansierer eit omgrep, også instansierer eit snevrare underomgrep; andre ledd i definisjonen

## Diskusjonsdøme

- **cactus** (Wikipedia): kva er gale? Fleire termar i éin oppføring, definerer «Christmas cactus» inni, ikkje genus-differentia-form.
- **featherless biped** (Platon/Diogenes): differentia som ikkje held — Diogenes plukka ein kylling.

---

Førre: [[INF230 1.2 Vevontologispråket OWL]] · Neste: [[INF230 1.4 Ontologiutvikling]]