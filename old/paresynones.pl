% autor: Luis Eduardo Galindo Amaya 
% fecha: vie 16 feb 2024 10:17:05

% Actividad
% -----
% Escribir una cláusula que separe pares y nones, los nones de menor a
% mayor y los pares de mayor a menor triples.

% actividad(L, R).
actividad([],[]).
actividad(L, R) :-
    paresnones(L, P, N),
    quicksort(P, PO),
    quicksort(N, NO),
    inverso(PO, POI),
    tri(POI, POIT),
    conc(NO, POIT, R).
    

% Separa pares y nones
% -----

% paresnones(L, P, N).
paresnones([],[],[]).
paresnones([X|R],[X|Q],N) :- 0 is X mod 2, paresnones(R,Q,N),!.
paresnones([X|R],P,[X|Q]) :- paresnones(R,P,Q).


% Operaciones con listas
% -----

% conc(A,B,R).
conc([],L,L). 
conc([X|R],L,[X|Q]) :- conc(R,L,Q). 

% inverso(L,R).
inverso([],[]). 
inverso([X|R], L) :- inverso(R, Q), conc(Q, [X], L).


% Triplicar
% -----

% tri(L,R).
tri([],[]).
tri([X|R], [X,X,X|Q]) :- tri(R, Q).


% Ordenar una lista
% -----

% pivote(A,L,Menor,Mayor).
pivote(_,[],[],[]).
pivote(A,[X|R],[X|Q],May):- X < A, pivote(A,R,Q,May),!.
pivote(A,[X|R],Men,[X|Q]):- pivote(A,R,Men,Q).

% quicksort(L,R). 
quicksort([],[]).
quicksort([X|R],L):-
    pivote(X,R,Menor,Mayor),
    quicksort(Menor, Men), quicksort(Mayor,May),
    conc(Men,[X|May],L).
