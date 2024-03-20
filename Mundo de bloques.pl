% Mundo de bloques
% ejemplo consulta: resolver([3,4,1,2],[1,2,3,4]).

print_list([]) :- nl, !.
print_list([X|Xs]) :- write(X), write(' '), print_list(Xs).

conc([],L,L) :- !.
conc([X|R],L,[X|Q]):- conc(R,L,Q).

inverso([],[]) :- !.
inverso([X|R], L) :- inverso(R, Q), conc(Q, [X], L).

elemento(X,[X|_]) :- !.
elemento(X,[_|R]) :- elemento(X,R).

resolver(A, Z) :-
    inverso(Z, L),
    print_list([A,[],[]]),
    solucion([A,[],[]], L).

solucion(_, []) :- !.           % si siguiente esta vacio 

solucion([[A|R],B,C], [A|T]) :-
    % si el primer elemento de 'A' es el siguiente
    print_list([R,B,[A|C]]),
    solucion([R,B,[A|C]], T).

solucion([A,[B|R],C], [B|T]) :-
    % si el primer elemento de 'B' es el siguiente
    print_list([A,R,[B|C]]),
    solucion([A,R,[B|C]], T).

solucion([[A|As],B,C], [Z|R]) :-
    % si siguiente esta el la pila A
    elemento(Z, As),
    print_list([As,[A|B],C]),
    solucion([As,[A|B],C], [Z|R]).

solucion([A,[B|Bs],C], [Z|R]) :-
    % si el siguiente elemento esta en la pila B
    elemento(Z, Bs),
    print_list([[B|A],Bs,C]),
    solucion([[B|A],Bs,C], [Z|R]).

