  
---

**tarjan.cpp**

1. _Kvifor sjekkar du `on_stack[w]` og ikkje berre «er w besøkt»?_  
    Dette er kjernen i Tarjan: kantar til noder som allereie er ferdigbehandla (popp-a frå stakken) tilhøyrer ein annan SCC og skal bli ignorert. Om du oppdaterte lowlink for dei òg, ville du slå saman SCCar feil.
    
2. _Kvifor er alle variablane globale/static?_  
    Dei er nødvendige gjennom heile rekursjonen og ville elles blitt sendt som parametrar. Ein foreleser ville nok spurt om konsekvensane (ikkje trådsikker, ikkje gjenbrukbar parallelt).
    

---

**[IncidenceListGraph.cpp](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html) — [copy_from](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html)**

3. _Kvifor kan du ikkje berre kopiere pekarverdiane direkte?_  
    Fordi [Node*](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html) og [Edge*](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html) peikar inn i det andre objektets heap. Etter kopi ville to objekt eigje same minne — double free ved destruksjon. Du må `new`-allokere nye noder og så bruke [find_node(label)](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html) for å re-etablere interne peikarar til dei NYE nodane.

---

**IncidenceListGraph — [Node::edges](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html)**

4. _Kvifor ligg kvar kant i [edges](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html)-lista til BEGGE source og target?_  
    Det gjer [get_outgoing](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html) rask (berre filtrer på [e->source == n](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html)), men betyr òg at [remove_node](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html) og [disconnect](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html) må rydde opp i begge noder. Ein foreleser ville spurt: kvifor ikkje berre source si liste?

---

**AdjacencyMatrixGraph**

5. _Kvifor [vector<vector<vector<string>>>]  
    To nøsta vektorar gir [matrix[i][j]], og den innerste [vector<string>] er for multikantar (fleire kantar med ulik label mellom same nodpar). Ein enklare [string] per celle hadde ikkje støtta det.

---

**[diamond.cpp](vscode-file://vscode-app/opt/visual-studio-code-insiders/resources/app/out/vs/code/electron-browser/workbench/workbench.html)**

6. _Kvifor brukar du [current_positions] som ein vektor og ikkje rekursjon?_  
    Fordi fleire kantar kan ha same label frå same node. Du må samstundes spore alle moglege posisjonar du kan vere på etter kvart steg — ein slags BFS-frontend.