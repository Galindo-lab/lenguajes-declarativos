
%% cdmx: Ciudad de México
%% gdl: Guadalajara
%% mty: Monterrey
%% pue: Puebla
%% bjx: León
%% tij: Tijuana
%% cjs: Ciudad Juárez
%% mid: Mérida
%% cun: Cancún
%% zpn: Zapopan

%% vuelos desde cdmx
vuelo(cdmx, bjx, [3, 4, vuelo1, [lu, mi, vi]]).

%% Vuelos desde monterrey
vuelo(mty, cdmx, [2, 3, vuelo2, [lu,ma, ju, sa]]).

%% Vuelos desde juarez
vuelo(cjs, mty, [1, 2, vuelo3, [lu, ma, vi]]).
vuelo(cjs, tij, [1, 2, vuelo4, [mi, ju, sa]]).

%% Tijuana
vuelo(tij, gdl, [1, 2, vuelo5, [lu, ma, vi]]).

%% Guadalajara
vuelo(gdl, bjx, [1, 2, vuelo6, [mi, ju, sa]]).


elemento(X, [X|_]).  
elemento(X, [_|R]):- elemento(X,R).


ruta(Origen, Destino, Hora, Dia) :-
    vuelo(Origen, Destino, [Hora, _, Codigo, Dias]),
    elemento(Dia, Dias),
    write(Codigo), nl.


ruta(Origen, Destino, Hora, Dia) :-
    vuelo(Origen, L, [Hora, HoraLlegada, Codigo, Dias]),
    elemento(Dia, Dias),
    ruta(L, Destino, HoraLlegada, Dia),
    write(Codigo), nl.




