
Kunnskapsgraf
Definisjon: graf der noder er individ (objekt) og kanter er binære forhold mellom individ.


Semantisk vev
Definisjon: «del av internett med koblede datasett som […] består av enkle påstander som er forståelige for maskiner"
- «Den semantiske veven består ikke bare av datasett, men også av lenker mellom disse datasettene, slik at man får en samling koplede datasett»

### 3.1
- Databaser med klasser - ikke relasjoner (sql)

Kunnskapsgrafen
noder med forholdene mellom som piler
- instansiering (hvilken klasse hører individ til) skrives som en annotasjon ved siden av noden eller ikke i det hele tatt
- ![[Pasted image 20250818103724.png]]
- [SUBJECT   PREDICATE   OBJECT]
lit:Shakespear   lit:wrote   lit:KingLear     = Shakespear skrev "King Lear"
geo:Stratford   geo:isIn    geo:England

### den semantiske webben
- Består av tre slags ressurser
	- Omgrep: klasser
	- Forholdstyper: relasjoner/roller
	- Individ: objekt
Hver ressurs blir identifisert gjennom en IRI.
**I**nternationalized **R**esource **I**dentifiers (IRIs)


### 3.2
JSON-LD for linket data
{
	"label": "ISSON25",
	"performer": [
{
	"label": "Halliru"
}, 
{
	"label": "Stratos"
}, …
],
"superEvent": {
	"label": "NANOTEXNOLOGY",
	"organizer": [
	{
	"identifier": "Argiris"
	},{
	"identifier": "Stratos"
	}
	]
	}
}
![[Pasted image 20250818104953.png]]


### 3.3
Terse triple language (TTL)
Kunnskapsbase: TBoks og ABoks

- A **knowledge base** for linked data consists of two components:
	**Definition**: A *knowledge base*, given by *K = (T, A),* consists of an
	*ontology T,* describing universals, and a *set of assertions A*
	describing concrete instances of these universals.

ABoks- Assertion boks. 	![[Pasted image 20250818112316.png]]
TBoks - Terminologi boks



### 3.5 Spørjespråket SPARQL
3.6 Ontologidesign og -utvikling


![[Pasted image 20250818115225.png]]

Grunnleggjande ontologi
- Definisjon: ontologi som spefisierer «hva som egentlig mest grunnleggende sett faktisk finnes. […] Finnes det for eksempel egentlig tall?»
