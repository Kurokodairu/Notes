% Signatur (klasser/egenskaper/individer)

class(digitalRessurs).
class(tilgangsprosess).
class(identifikator).
class(protokoll).
class(persistentIdentifikator).

prop(identifiserer).
prop(losbargjennom).


% T-boks (b.16)

% Subclass (fra modellen)
subclass(protokoll, tilgangsprosess).
subclass(identifikator, digitalRessurs).

% Disjointness (owl:disjointWith)
disjoint(protokoll, identifikator).

% EquivalentClass (owl:equivalentClass)
equiv(persistentIdentifikator, identifikator).

% Domain/Range (brukes også i beviset via range(losbargjennom,...))
domain(identifiserer, identifikator).
range(identifiserer, digitalRessurs).

domain(losbargjennom, identifikator).
range(losbargjennom, protokoll).

% someValuesFrom (owl:someValuesFrom)
% Identifikator ⊑ ∃ identifiserer.DigitalRessurs
some_values_from(identifikator, identifiserer, digitalRessurs).


% A-boks (fra b.17) – fakta som leder til inkonsistens

isa(pi, identifikator).
rel(losbargjennom, pi, p).
isa(p, identifikator).
rel(identifiserer, p, pi).

% Inferensregler

% Subklasse-arv
isa(X, B) :- isa(X, A), subclass(A, B).

% Ekvivalens i begge retninger
isa(X, A) :- isa(X, B), equiv(A, B).
isa(X, B) :- isa(X, A), equiv(A, B).

% Domain: typing av subjekt
isa(S, C) :- rel(R, S, O), domain(R, C).

% Range: typing av objekt
isa(O, C) :- rel(R, S, O), range(R, C).

% someValuesFrom: krev vitne (eksistens) i ASP
needs_some_value(X,R,C) :- isa(X,A), some_values_from(A,R,C).
witness(X,R,C) :- needs_some_value(X,R,C), rel(R,X,Y), isa(Y,C).
:- needs_some_value(X,R,C), not witness(X,R,C).

% Disjointness: ingen kan være i begge
:- isa(X, A), isa(X, B), disjoint(A, B).

