```prolog
duplicar([], []). 
duplicar([X|Xs], [X,X|Ys]) :- 
	duplicar(Xs, Ys).
```