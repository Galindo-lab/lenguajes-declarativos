```prolog
elemento(X,[X|_]).  
elemento(X,[_|R]):-elemento(X,R).  
  
union([],L,L).  
union([X|R],W,L):- elemento(X,W),union(R,W,L),!.  
union([X|R],W,[X|Q]):-union(R,W,Q).  
  
inters([],_,[]).  
inters([X|R],W,L):- not(elemento(X,W)), inters(R,W,L),!.  
inters([X|R],W,[X|Q]):- inters(R,W,Q).
```