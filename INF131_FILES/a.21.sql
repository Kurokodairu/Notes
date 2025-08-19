
CREATE TABLE DigitaltArtefakt (
    artefakt_id INTEGER PRIMARY KEY
);

CREATE TABLE Protokoll (
    protokoll_id INTEGER PRIMARY KEY,
    erStandardisert BOOLEAN,
    erÅpen BOOLEAN,
    tillaterAutentifisering BOOLEAN
);

CREATE TABLE Identifikator (
    identifikator_id INTEGER PRIMARY KEY,
    artefakt_id INTEGER,
    protokoll_id INTEGER,
    FOREIGN KEY (artefakt_id) REFERENCES DigitaltArtefakt(artefakt_id),
    FOREIGN KEY (protokoll_id) REFERENCES Protokoll(protokoll_id)
);

CREATE TABLE Metadataelement (
    metadata_id INTEGER PRIMARY KEY,
    vedvarendeMetadata BOOLEAN,
    artefakt_id INTEGER,
    FOREIGN KEY (artefakt_id) REFERENCES DigitaltArtefakt(artefakt_id)
);




#Er identifikator i oppløsbar via standardisert, åpen protokoll
SELECT p.erStandardisert, p.erÅpen
FROM Identifikator i
JOIN Protokoll p ON i.protokoll_id = p.protokoll_id
WHERE i.identifikator_id = ?; 
 
# Tillater protokoll p autentifisering
SELECT tillaterAutentifisering
FROM Protokoll
WHERE protokoll_id = ?;
 
# Vedvarer metadata m selv uten data
SELECT vedvarendeMetadata
FROM Metadataelement
WHERE metadata_id = ?;