conc([],L,L). 
conc([X|R],L,[X|Q]):- conc(R,L,Q). 


quitar(_,[],[]).
quitar(X, [X|R], W) :- quitar(X, R, Q), conc(Q,R,W).
quitar(X, [Y|R], W) :- quitar(X, R, Q), conc([Y],Q,W). 

% separar
separar([],[],[]).
separar([X|R], [X|P], N) :- C is X mod 2, C=0, separar(R,Q,N).
separar([X|R], P, [X|N]) :- separar(R,P,Q).


% paresynones(L,P,N).
paresynones([],[],[]).

paresynones([X|R], P, [X|N]) :-
    1 is X mod 2,
    paresynones(R, P, N).

paresynones([X|R], [X|P], N) :-
    0 is X mod 2,
    paresynones(R, P, N).
