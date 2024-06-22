```prolog
borrar_elemento(_, [], []).

borrar_elemento(X, [X|Xs], Ys) :-
    borrar_elemento(X, Xs, Ys).
    
borrar_elemento(X, [Y|Xs], [Y|Ys]) :-
    X \= Y,
    borrar_elemento(X, Xs, Ys).
```