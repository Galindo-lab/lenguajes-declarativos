
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
vuelo(cdmx, bjx, [1, 2, vuelo1, [lu, mi, vi]]).

%% Vuelos desde monterrey
vuelo(mty, cdmx, [1, 2, vuelo2, [ma, ju, sa]]).

%% Vuelos desde juarez
vuelo(cjs, mty, [1, 2, vuelo3, [lu, ma, vi]]).
vuelo(cjs, tij, [1, 2, vuelo4, [mi, ju, sa]]).

%% Tijuana
vuelo(tij, gdl, [1, 2, vuelo5, [lu, ma, vi]]).

%% Guadalajara
vuelo(gdl, bjx, [1, 2, vuelo6, [mi, ju, sa]]).


ruta(Origen, Destino) :-
    vuelo(Origen, Destino, [_, _, Codigo, _]),
    write(Codigo), nl.


ruta(Origen, Destino) :-
    vuelo(Origen, L, [_, _, Codigo, _]),
    ruta(L, Destino),
    write(Codigo), nl.




