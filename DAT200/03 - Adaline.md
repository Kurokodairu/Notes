Forbedring av Perceptron: Adaline ble publisert i 1960 og anses som en forbedring av Perceptron-algoritmen
Hovedkonseptet i Adaline-algoritmen er å definere og minimere kostnadsfunksjoner


Begge er klassifikatorer for binær klassifisering (problemer med to klasser)
Begge har en lineær beslutningsgrense
Begge bruker en terskelfunksjon

## Viktigste forskjeller mellom Adaline og Perceptron algoritmer:

#Perceptron:
- Vektene oppdateres ved hjelp av en trinnfunksjon 𝜙(𝑧) (som fungerer som en aktiveringsfunksjon)
- Feilberegningen sammenligner sanne klasseetiketter med predikerte klasseetiketter
- Oppdaterer vekter umiddelbart etter en feilklassifisering. Oppdateringer skjer flere ganger i løpet av et fullt sett med iterasjoner (epoke)


#Adaline:
- Vektene oppdateres basert på en lineær aktiveringsfunksjon 𝜙(𝑧)
- Den lineære aktiveringsfunksjonen er ganske enkelt en identitetsfunksjon av nettoinngan
- Feilberegningen sammenligner sanne klasseetiketter med det kontinuerlige resultatet fra aktiveringsfunksjonen
- Oppdaterer vekter først på slutten av hver epoke (batch-vise oppdateringer)




Objektivfunksjon: En definert objektivfunksjon (tapfunksjon, kostnadsfunksjon) er en viktig ingrediens i mange maskinlæringsalgoritmer

. Målet er å fange modellens ytelse ved å beregne feilen eller avstandsscoren mellom den sanne klasseetiketten og resultatet av aktiveringsfunksjonen. Vekter beregnes slik at tapfunksjonen minimeres (finn det globale kostnadsminimumet der feilen er så liten som mulig)

.

Kostnadsfunksjon J: Adaline-algoritmen bruker en kostnadsfunksjon J for å lære vekter som Summen av kvadrerte feil (SSE) mellom resultatene (fra aktiveringsfunksjonen) og de sanne klasseetikettene

. En optimaliseringsalgoritme kalt Gradient Descent brukes til å finne det globale minimumet av kostnadsfunksjonen J(w)



Fordel med lineær aktiveringsfunksjon: Hovedfordelen med den lineære aktiveringsfunksjonen over trinnfunksjonen er at kostnadsfunksjonen blir deriverbar. Dette gjør det mulig å utlede gradienten til tapfunksjonen, som er viktig informasjon for å bevege seg i riktig retning mot det globale kostnadsminimumet

. SSE-kostnadsfunksjonen er konveks, noe som gjør at gradientnedstigningsalgoritmen kan bevege seg mot vektene som resulterer i et globalt kostnadsminimum


Oppdatering av vekter med Gradient Descent: Ved hjelp av gradientnedstigning oppdateres vektene ved å ta et skritt i motsatt retning av gradienten til kostnadsfunksjonen 𝛻 (𝑤)

. Vektendringen ∆ defineres som den negative gradienten 𝛻 (𝑤) multiplisert med læringsraten. En enkelt vekt oppdateres basert på alle eksemplene i treningssettet (i stedet for trinnvis etter hvert eksemplar som med Perceptron-algoritmen). Dette refereres til som batch gradientnedstigning

Likhet med Perceptron: Merk likheten med vektoppdateringene til Perceptron-algoritmen: Perceptron bruker 𝜙(𝑧) som tar verdiene -1 eller 1, mens Adaline bruker 𝜙(𝑧) som tar kontinuerlige verdier 𝒘𝑇

Feature scaling: Mange maskinlæringsalgoritmer krever en form for feature scaling (også kalt standardisering) for optimal ytelse

. Gradientnedstigning er en av algoritmene som drar nytte av feature scaling. Skalering gir dataene noen spesifikke egenskaper, som standarddistribusjon, som hjelper gradientnedstigningslæringen til å konvergere raskere


## Matematiske uttrykk for feature scaling:
- Feature vector: 𝒙𝑗
- Mean of feature vector: 𝜇𝑗
- Standard deviation of feature vector: 𝜎𝑗
- Scaled feature vector: 𝒙ʹ𝑗
- Formula: 𝒙ʹ𝑗 = (𝒙𝑗 - 𝜇𝑗) / 𝜎𝑗
-
Feature scaling hjelper gradientnedstigningen (vår optimerer) til å finne en god eller optimal løsning i færre trinn

. Merk at SSE (kostnadsfunksjon) kan forbli forskjellig fra null selv om alle prøvene ble klassifisert riktig.