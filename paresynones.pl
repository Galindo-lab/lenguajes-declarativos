

% paresynones(L,P,N).
paresynones([],[],[]).

paresynones([X|R], P, [X|N]) :-
    1 is X mod 2,
    paresynones(R, P, N).

paresynones([X|R], [X|P], N) :-
    0 is X mod 2,
    paresynones(R, P, N).
