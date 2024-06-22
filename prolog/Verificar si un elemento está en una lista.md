```prolog
elemento(X, [X|_]).  
elemento(X, [_|R]):- elemento(X,R).
```

