

%%              CDMX, Guadalajara, Monterrey, Mérida, Tijuana
%%        CDMX,    0,         550,       900,   1550,       0
%% Guadalajara,  550,           0,       520,      0,       0
%%   Monterrey,  900,         520,         0,      0,       0
%%      Mérida, 1550,           0,         0,      0,    3300
%%     Tijuana,    0,           0,         0,   3300,       0

% Vuelos entre Ciudad de México (CDMX) y Guadalajara (GDL)
vuelo(cdmx, gdl, [7, 9, vuelo1, [lu, mi, vi]]).
vuelo(cdmx, gdl, [12, 14, vuelo2, [ma, ju, sa]]).
vuelo(cdmx, gdl, [18, 20, vuelo3, [lu, mi, vi]]).
vuelo(cdmx, gdl, [21, 23, vuelo4, [ju, vi, do]]).

% Vuelos entre Ciudad de México (CDMX) y Monterrey (MTY)
vuelo(cdmx, mty, [8, 10, vuelo5, [lu, mi, vi, do]]).
vuelo(cdmx, mty, [15, 17, vuelo6, [ma, ju, sa]]).
vuelo(cdmx, mty, [19, 21, vuelo7, [lu, ju, vi]]).

% Vuelos entre Ciudad de México (CDMX) y Mérida (MID)
vuelo(cdmx, mid, [10, 12, vuelo8, [lu, mi, vi]]).
vuelo(cdmx, mid, [14, 16, vuelo9, [ma, ju, sa]]).
vuelo(cdmx, mid, [20, 22, vuelo10, [lu, vi, do]]).

% Vuelos entre Mérida (MID) y Tijuana (TIJ)
vuelo(mid, tij, [9, 13, vuelo14, [lu, mi, vi, do]]).
vuelo(mid, tij, [15, 19, vuelo15, [ma, ju, sa]]).
vuelo(mid, tij, [20, 23, vuelo16, [lu, vi, do]]).

% Vuelos entre Tijuana (TIJ) y Guadalajara (GDL)
vuelo(tij, gdl, [8, 11, vuelo17, [lu, mi, vi, do]]).
vuelo(tij, gdl, [14, 17, vuelo18, [ma, ju, sa]]).
vuelo(tij, gdl, [19, 22, vuelo19, [lu, vi, do]]).

% Vuelos entre Tijuana (TIJ) y Monterrey (MTY)
vuelo(tij, mty, [7, 10, vuelo20, [lu, mi, vi, do]]).
vuelo(tij, mty, [13, 16, vuelo21, [ma, ju, sa]]).
vuelo(tij, mty, [18, 21, vuelo22, [lu, vi, do]]).


hay_vuelo(Origen, Destino) :-
    vuelo(Origen, Destino, _).


ruta(Origen, Destino) :-
    vuelo(Origen, Destino, [_, _, Codigo, _]),
    write(Codigo), nl.

ruta(Origen, Destino) :-
    vuelo(Origen, L, [_, _, Codigo, _]),
    ruta(L, Destino),
    write(Codigo), nl.




