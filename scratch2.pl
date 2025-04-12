% Fatos do ambiente
fedor(1,2).
brisa(2,1).
livre(1,1).
livre(2,2).

% Regras para identificar perigo
tem_poco(X,Y) :- brisa(X,Y).
tem_wumpus(X,Y) :- fedor(X,Y).
seguro(X,Y) :- livre(X,Y).

%fat(N, Fat)
fat(0,1).
fat(N,F) :-
  N > 0,
  M is N-1,
  fat(M, R),
  F is N*R.
