```prolog
conc([],L,L).   
conc([X|R],L,[X|Q]):- conc(R,L,Q).   
  
inverso([],[]).   
inverso([X|R], L) :-  
	inverso(R, Q),  
	conc(Q, [X], L).
```
