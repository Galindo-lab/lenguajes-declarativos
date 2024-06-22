```Prolog
conc([],L,L).  
conc([X|R],L,[X|Q]):- conc(R,L,Q).
```

