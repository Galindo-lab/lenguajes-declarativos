```prolog
aridad([],0).  
aridad([_|R],N):- aridad(R,Z), N is Z+1.
```
