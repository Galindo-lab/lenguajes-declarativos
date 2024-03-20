% Mundo de bloques

% ejemplo consulta: resolver([3,4,1,2],[1,2,3,4]).

print_list([]) :- nl.
print_list([X|Xs]) :- write(X), write(' '), print_list(Xs).

conc([],L,L).
conc([X|R],L,[X|Q]):- conc(R,L,Q).

inverso([],[]).
inverso([X|R], L) :- inverso(R, Q), conc(Q, [X], L).

resolver(A, Z) :- inverso(Z, L), solucion([A,[],[]], L).

solucion(_, []).

solucion([[A|R],B,C], [A|T]) :-
    print_list([R,B,[A|C]]),
    solucion([R,B,[A|C]], T).

solucion([A,[B|R],C], [B|T]) :-
    print_list([A,R,[B|C]]),
    solucion([A,R,[B|C]], T).

solucion([[A|R],B,C], Z) :-
    print_list([R,[A|B],C]),
    solucion([R,[A|B],C], Z).

solucion([[],[B|R],C], Z) :-
    print_list([[B], R, C]),
    solucion([[B], R, C], Z).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ultimo_elemento([X], X).

%% ultimo_elemento([_|T], X) :-
%%     ultimo_elemento(T, X).

%% solucion([[],[],A], A).

%% solucion([[A|R],B,C], Z) :-
%%     not(ultimo_elemento(Z, A)),
%%     solucion([R,[A|B],C], Z).

%% solucion([[A|R],B,C], Z) :-
%%     ultimo_elemento(Z, A),
%%     solucion([R,B,[A|C]], Z).

%% solucion([[],A,B], Z):-
%%     solucion([A,[],B], Z).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
%% % get_pos(Elemento, Lista, Indice).
%% % siempre debe contener el elemento

%% get_ind(E, [X|_], 0) :- E = X.
%% get_ind(E, [X|R], I) :- E =\= X, get_ind(E, R, Q), I is Q+1.

%% %% solucion([[A|Q],[],[]], [[],[],B]) :-
%% %%     get_ind(A, B, Indice),
%% %%     Indice = 2,
%% %%     solucion([Q,[],[A]], [[],[],B]).
