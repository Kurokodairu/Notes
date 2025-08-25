-- Opprett database
CREATE DATABASE IF NOT EXISTS inf131_gruppe08;
USE inf131_gruppe08;

-- a.12
CREATE TABLE studieprogram (
    programkode VARCHAR(8),
    programnavn VARCHAR(64) NOT NULL,
    PRIMARY KEY (programkode)
);

CREATE TABLE student (
    student_id INT AUTO_INCREMENT,
    fornavn VARCHAR(32) NOT NULL,
    etternavn VARCHAR(32) NOT NULL,
    epost VARCHAR(64) NOT NULL,
    programkode VARCHAR(8) NOT NULL,
    PRIMARY KEY (student_id),
    FOREIGN KEY (programkode) REFERENCES studieprogram(programkode)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE emne (
    emnekode VARCHAR(8),
    emnetittel VARCHAR(64),
    blokk VARCHAR(8),
    studiepoeng SMALLINT NOT NULL,
    PRIMARY KEY (emnekode)
);


CREATE TABLE tilsett (
    tilsett_id INT,
    etternavn VARCHAR(32) NOT NULL,
    fornavn VARCHAR(32) NOT NULL,
    epost VARCHAR(64),
    stillingsnemning VARCHAR(32),
    institutt VARCHAR(64),
    PRIMARY KEY (tilsett_id)
);


CREATE TABLE emneansvar (
    emnekode VARCHAR(8),
    studieår VARCHAR(8),
    tilsett_id INT, 
    PRIMARY KEY (emnekode, studieår),
    FOREIGN KEY (emnekode) REFERENCES emne(emnekode)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    FOREIGN KEY (tilsett_id) REFERENCES tilsett(tilsett_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE emne_program (
    emnekode VARCHAR(8),
    programkode VARCHAR(8),
    PRIMARY KEY (emnekode, programkode),
    FOREIGN KEY (emnekode) REFERENCES emne(emnekode)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (programkode) REFERENCES studieprogram(programkode)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- a.13
INSERT INTO studieprogram VALUES
('DATSCI', 'Data Science'),
('FYS', 'Fysikk');

INSERT INTO student (fornavn, etternavn, epost, programkode) VALUES
('Jørgen', 'Svendsli', 'jorgen.svendsli@nmbu.no', 'DATSCI'),
('Hallvard', 'Skeide-Dyrhaug', 'hallvard@nmbu.no', 'DATSCI');

INSERT INTO emne VALUES
('INF131', 'Innføring i databaser', 'August', 10),
('FYS272', 'Energiteknologier', 'Høst', 10);

INSERT INTO tilsett VALUES
(1, 'Horsch', 'Martin Thomas', 'martin.thomas.horsch@nmbu.no', 'Førsteamanuensis', 'Institutt for datavitenskap'),
(2, 'Gorjão', 'Leonardo Rydin', 'leonardo.rydin.gorjao@nmbu.no', 'Førsteamanuensis', 'Institutt for fysikk');

INSERT INTO emneansvar VALUES
('INF131', '2025', 1),
('FYS272', '2025', 2);

INSERT INTO emne_program VALUES
('INF131', 'DATSCI'),
('FYS272', 'FYS');



-- a.14
SELECT DISTINCT
    t.institutt,
    sp.programnavn AS studieprogram,
    s.epost
FROM student s
JOIN studieprogram sp 
    ON s.programkode = sp.programkode
JOIN emne_program ep 
    ON sp.programkode = ep.programkode
JOIN emneansvar ea 
    ON ep.emnekode = ea.emnekode
JOIN tilsett t 
    ON ea.tilsett_id = t.tilsett_id;
