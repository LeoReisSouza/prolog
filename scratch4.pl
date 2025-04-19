% Leonardo dos Reis Souza
% EXERCÍCIO 1

% FATOS INICIAIS
homem(joao).
homem(ricardo).
homem(pedro).
homem(cristiano).
homem(gabriel).
homem(marcos).
homem(barbara).

mulher(maria).

pai(joao, maria).
pai(joao, ricardo).
mae(maria, pedro).
mae(maria, cristiano).
pai(marcos, pedro).
pai(marcos, cristiano).
pai(pedro, gabriel).
pai(cristiano, barbara).

% REGRA PARA FILHO
filho(X, Y) :- pai(Y, X); mae(Y, X).

% REGRA PARA IRMAO
irmao(X, Y) :- pai(P, X), pai(P, Y), mae(M, X), mae(M, Y), X \= Y.

% REGRA PARA PRIMO
primo(X, Y) :- pai(P1, X), pai(P2, Y), irmao(P1, P2), X \= Y.

% REGRA PARA AVO
avo(X, Y) :- pai(X, P), pai(P, Y).
avo(X, Y) :- mae(X, M), pai(M, Y).

% CONSULTAS:
% Quem é irmão de Maria?
% ?- irmao(X, maria).

% Maria tem filhos?
% ?- filho(X, maria).

% Quem é primo de Barbara?
% ?- primo(X, barbara).

% Quem é pai de Gabriel?
% ?- pai(X, gabriel).

% Alguém é filho de Maria e pai de Gabriel?
% ?- filho(X, maria), pai(X, gabriel).

% Alguém é filho de Marcos e de Maria?
% ?- filho(X, marcos), filho(X, maria).

% EXERCÍcIO 2
f(X,2) :- X < 4.
f(X,4) :- X >= 4, X < 8.
f(X,10) :- X >= 8.

% EXERCÍcIO 3
pessoa(braat, nascimento(9,2,1985)).
pessoa(breno, nascimento(15,1,1985)).
pessoa(brine, nascimento(19,3,1953)).
pessoa(bro, nascimento(21,12,1983)).
pessoa(bruno, nascimento(8,11,1959)).

mais_velho(X,Y) :- pessoa(X, nascimento(D1,M1,A1)), pessoa(Y, nascimento(D2,M2,A2)),
    (A1 < A2;
     A1 = A2, M1 < M2;
     A1 = A2, M1 = M2, D1 < D2).

% Consultas:
% ?- mais_velho(bruno, breno).
% ?- mais_velho(brine, bruno).
% ?- mais_velho(X, breno).

% EXERCÍcIO 4
inserir(E, L, [E|L]).

remover_uma(_, [], []).
remover_uma(X, [X|T], T).
remover_uma(X, [H|T], [H|R]) :- remover_uma(X, T, R).

remover_todas(_, [], []).
remover_todas(X, [X|T], R) :- remover_todas(X, T, R).
remover_todas(X, [H|T], [H|R]) :- X \= H, remover_todas(X, T, R).

% EXERCÍcIO 5
soma([], 0).
soma([H|T], S) :- soma(T, R), S is H + R.

% EXERCÍcIO 6
factorial(0, 1).
factorial(N, F) :- N > 0, N1 is N - 1, factorial(N1, F1), F is N * F1.

factorial_list(-1, []).
factorial_list(N, [F|T]) :- factorial(N, F), N1 is N - 1, factorial_list(N1, T).

% EXERCÍcIO 7
concatenar([], L, L).
concatenar([H|T], L2, [H|R]) :- concatenar(T, L2, R).

% EXERCÍcIO 8
palindromo(L1, L2) :- reverse(L2, L1).

% EXERCÍcIO 9
alimento(banana).
alimento(arroz).
alimento(feijao).

limpeza(sabao).
limpeza(vassoura).
limpeza(balde).

custo(banana,2).
custo(arroz,4).
custo(feijao,5).
custo(sabao,3).
custo(vassoura,10).
custo(balde,15).

total_custo([],0).
total_custo([H|T], S) :- custo(H,V), total_custo(T, R), S is V + R.

custo_alimento([],0).
custo_alimento([H|T], S) :- alimento(H), custo(H,V), custo_alimento(T, R), S is V + R.
custo_alimento([H|T], S) :- \+ alimento(H), custo_alimento(T, S).

custo_limpeza([],0).
custo_limpeza([H|T], S) :- limpeza(H), custo(H,V), custo_limpeza(T, R), S is V + R.
custo_limpeza([H|T], S) :- \+ limpeza(H), custo_limpeza(T, S).

% EXERCÍcIO 10
ordenar([],[]).
ordenar([H|T], L) :- ordenar(T, L1), inserir_ordenado(H, L1, L).

inserir_ordenado(X, [], [X]).
inserir_ordenado(X, [H|T], [X,H|T]) :- X =< H.
inserir_ordenado(X, [H|T], [H|R]) :- X > H, inserir_ordenado(X, T, R).
