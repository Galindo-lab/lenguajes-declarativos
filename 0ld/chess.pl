
/*

*/

% pieza(abreviacion, nombre_completo)
pieza(r, rey).
pieza(d, dama).
pieza(t, torre).
pieza(a, alfil).
pieza(c, caballo).


%
validar_movimiento(Pieza,Origen,Destino) :-
    validar_coordenada(Origen),
    validar_coordenada(Destino),
    pieza(Pieza, Movimiento),
    call(Movimiento, Origen, Destino).


validar_coordenada((Columna,Fila)) :-
    char_code('a', A_code),
    char_code('h', H_code),
    char_code(Columna, Columna_code),
    between(A_code, H_code, Columna_code),
    between(1, 8, Fila).


% torre((C1,F1), (C2,F2))
torre((C1,_), (C2,_)) :-
    C1 = C2.
    
torre((_,F1), (_,F2)) :-
    F1 = F2.


% alfil((C1,F1), (C2,F2)) 
alfil((C1,F1), (C2,F2)) :-
    char_code(C1, Ch1),
    char_code(C2, Ch2),
    DifC is abs(Ch1 - Ch2),     % diferencia columna
    DifF is abs(F1 - F2),       % diferencia fila
    DifC = DifF.


% reina((C1,F1), (C2,F2))
dama((C1,F1), (C2,F2)) :-
    torre((C1,F1), (C2,F2));
    alfil((C1,F1), (C2,F2)).


% rey((C1,F1), (C2,F2))
rey((C1,F1), (C2,F2)) :-
    char_code(C1, Ch1),
    char_code(C2, Ch2),
    DifC is abs(Ch1 - Ch2),
    DifF is abs(F1 - F2),
    DifC < 2,
    DifF < 2.


% caballo((C1,F1), (C2,F2))
caballo((C1,F1), (C2,F2)) :-    % vertical
    char_code(C1, Ch1),
    char_code(C2, Ch2),
    DifC is abs(Ch1 - Ch2),
    DifF is abs(F1 - F2),
    DifC = 1,
    DifF = 2.

caballo((C1,F1), (C2,F2)) :-    % horizontal
    char_code(C1, Ch1),
    char_code(C2, Ch2),
    DifC is abs(Ch1 - Ch2),
    DifF is abs(F1 - F2),
    DifC = 2,
    DifF = 1.

