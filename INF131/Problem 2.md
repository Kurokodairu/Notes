A.5 (oppløsning via protokoll), A.6 (autentifisering), A.7 (vedvarende metadata)
# a.16
@prefix A-gruppeA08: <https://www.nmbu.no/fair-semantics/A-gruppeA08#> .
<https://www.nmbu.no/fair-semantics/A-gruppeA08> a owl:Ontology .  

### Klasser
:DigitaltArtefakt a owl:Class 
:Identifikator a owl:Class .
:Protokoll a owl:Class .
:Metadataelement a owl:Class .
  
### Objektegenskaper
:harIdentifikator a owl:ObjectProperty ; ## kan haIdentifikator → peker på en Identifikator
rdfs:domain :DigitaltArtefakt ;
rdfs:range :Identifikator .

:harMetadataelement a owl:ObjectProperty ; ## kan haMetadataelement → peker på et Metadataelement.
rdfs:domain :DigitaltArtefakt ;
rdfs:range :Metadataelement .

:harProtokoll a owl:ObjectProperty ; ## kan haProtokoll → peker på en Protokoll.
rdfs:domain :Identifikator ;
rdfs:range :Protokoll .

# a.17
```python
@prefix A-gruppeA08: <https://www.nmbu.no/fair-semantics/A-gruppeA08#> .
<https://www.nmbu.no/fair-semantics/A-gruppeA08> a owl:Ontology .

### Klasser
A-gruppeA08:DigitaltArtefakt a owl:Class .
A-gruppeA08:Identifikator a owl:Class .
A-gruppeA08:Protokoll a owl:Class .
A-gruppeA08:Metadataelement a owl:Class .


### Objektegenskaper
A-gruppeA08:identifiserer a owl:ObjectProperty ;
rdfs:domain A-gruppeA08:Identifikator ;
rdfs:range A-gruppeA08:DigitaltArtefakt .

A-gruppeA08:løsbargjennom a owl:ObjectProperty ;
rdfs:domain A-gruppeA08:Identifikator ;
rdfs:range A-gruppeA08:Protokoll .

A-gruppeA08:beskriver a owl:ObjectProperty ;
rdfs:domain A-gruppeA08:Metadataelement ;
rdfs:range A-gruppeA08:DigitaltArtefakt .


# a.17
### Datatypeegenskaper, tekst tall data osv... owl:DatatypeProperty
# domene, bildemengde
A-gruppeA08:erStandardisert a owl:DatatypeProperty ;
rdfs:domain A-gruppeA08:Protokoll ;
rdfs:range xsd:boolean .

  

A-gruppeA08:erÅpen a owl:DatatypeProperty ;
rdfs:domain A-gruppeA08:Protokoll ;
rdfs:range xsd:boolean .
  

A-gruppeA08:tillaterAutentifisering a owl:DatatypeProperty ;
rdfs:domain A-gruppeA08:Protokoll ;
rdfs:range xsd:boolean .

A-gruppeA08:vedvarendeMetadata a owl:DatatypeProperty ;
rdfs:domain A-gruppeA08:Metadataelement ;
rdfs:range xsd:boolean .
```


# a.18
![[a.18_gruppe08.png]]




# a.19
(endurant, perdurant, proposition, quale, quality)
### 1. DigitaltArtefakt

Et digitalt artefakt (f.eks. et dokument, fil, bilde, dataset) er et objekt som har identitet over tid --- selv om innholdet kan endres, er det fortsatt "det samme dokumentet". → **dol:endurant**

### 2. Identifikator
En identifikator (f.eks. DOI, URL, ID-streng) er en påstand eller verdi som refererer til noe. Viktig skille: Hvis du modellerer identifikator som et objekt med semantisk innhold (en entitet som står for noe), så passer det best som en utsagn/proposisjon. → Mest naturlig: **dol:proposition** 
(Alternativ: dol:endurant, men da blir det mer som en fysisk/konseptuell "ting".)

### 3. Protokoll
En protokoll (regelsett, prosedyre, retningslinjer) er en beskrivelse av en prosess eller et sett handlinger. En faktisk utførelse av en protokoll ville være en prosess (dol:perdurant). Men klassen din heter bare Protokoll (ikke "ProtokollInstans"), og oppgaven bruker ofte at regler/tekster behandles som utsagn (dol:proposition). 
→ **dol:proposition**
  
### 4. Metadataelement
Et metadataelement (f.eks. "tittel", "forfatter", "opprettelsesdato") er en egenskap/attributt ved noe annet. Slike ting er typisk dol:quality (fordi de beskriver egenskaper ved et objekt). → **dol:quality**


- **DigitaltArtefakt → dol:endurant**  
    ✔️ Gir mening: et digitalt artefakt (f.eks. en fil, et bilde, et dokument) er noe som eksisterer over tid og beholder sin identitet (selv om innholdet kan endres). Det har ingen "tidslige deler" i seg selv, så _endurant_ passer.
    
- **Identifikator → dol:endurant**  
    ✔️ Også riktig: en DOI, ISBN eller URI er en entitet vi kan peke på og bruke, og den beholder identiteten sin. Ikke en prosess, ikke en egenskap, men en gjenstand i ontologisk forstand. Derfor _endurant_.
    
- **Protokoll → dol:perdurant**  
    ✔️ Passer: en protokoll beskriver/realiserer en prosess (f.eks. hvordan data utveksles, eller hvordan et eksperiment kjøres). Det gir mening å klassifisere den som _perdurant_, siden den utfolder seg over tid og kan ha tidslige deler (steg i prosessen).
    
- **Metadataelement → dol:quality**  
    ✔️ Stemmer: et metadataelement (f.eks. "forfatter", "opprettelsesdato") beskriver en egenskap ved artefaktet. Det er ikke en prosess eller et selvstendig utsagn, men en _kvalitet_. Den peker videre mot en _quale_ (verdien, f.eks. "Jørgen" eller "2025-08-18"), men selve metadataelementet er kvaliteten.


# a.20
Overbegreper:
A-gruppeA08:DigitalEntitet a owl:Class ;
    skos:definition "En digital enhet som eksisterer elektronisk." ;
    rdfs:subClassOf dol:endurant .

A-gruppeA08:Tilgangsprosess a owl:Class ;
    skos:definition "En prosess som gjør det mulig å aksessere et digitalt ressurs." ;
    rdfs:subClassOf dol:perdurant .

![[Pasted image 20250819095222.png]]

Vanskelig med DigitaltArtefakt og DigitalRessurs. Var vanskelig å finne klasse og overklasse, så valgte å ta at digitalartefakt var et objekt med meningsfull informasjon som kan deles, lastes ned, og gjenbrukes. 
DigitalEntitet mer generelt,  digital entitet som kan identifiseres og aksesseres elektronisk.
