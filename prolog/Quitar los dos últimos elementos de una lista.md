```prolog
quitar([A,B],[ ]). 

quitar([C|P1],[C|P2]):-
	quitar(P1,P2).
```