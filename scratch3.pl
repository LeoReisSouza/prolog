% Leonardo dos Reis Souza
% PARTE 1: CONSULTAS

% a. Ano de lançamento de American Beauty
?- filme(american_beauty, Ano).

% b. Filmes lançados em 2000
?- filme(Filme, 2000).

% c. Filmes lançados antes de 2000
?- filme(Filme, Ano), Ano < 2000.

% d. Filmes lançados depois de 1990
?- filme(Filme, Ano), Ano > 1990.

% e. Ator em mais de um filme
?- ator(Filme1, Ator, _), ator(Filme2, Ator, _), Filme1 \= Filme2.

% f. Diretor de filme com Scarlett Johansson
?- (ator(Filme, scarlett_johansson, _) ; atriz(Filme, scarlett_johansson, _)), diretor(Filme, Diretor).

% g. Ator que também dirigiu
?- ator(_, Ator, _), diretor(_, Ator).

% h. Ator/atriz que também dirigiu
?- (ator(_, Pessoa, _) ; atriz(_, Pessoa, _)), diretor(_, Pessoa).

% i. Filme com John Goodman e Jeff Bridges
?- ator(Filme, john_goodman, _), ator(Filme, jeff_bridges, _).

% PARTE 2: REGRAS

% a. Filme lançado após o ano Y
released_after(M, Y) :- filme(M, Ano), Ano > Y.

% b. Filme lançado antes do ano Y
released_before(M, Y) :- filme(M, Ano), Ano < Y.

% c. Filmes do mesmo ano
same_year(M1, M2) :- filme(M1, Ano), filme(M2, Ano), M1 \= M2.

% d. Atores/atrizes no mesmo filme
co_star(A1, A2) :-
    (ator(Filme, A1, _) ; atriz(Filme, A1, _)),
    (ator(Filme, A2, _) ; atriz(Filme, A2, _)),
    A1 \= A2.

% PARTE 3: filmes_por_decada(D, L) 
% Lista filmes lançados na década D (ex: 1980 para 1980-1989)
filmes_por_decada(D, L) :-
    AnoInicio is D,
    AnoFim is D + 9,
    findall(Filme, (filme(Filme, Ano), Ano >= AnoInicio, Ano =< AnoFim), L).
?- filmes_por_decada(1990, Filmes).

% PARTE 4: diretores_com_multiplos_filmes(L)
% Lista diretores que dirigiram mais de um filme
diretores_com_multiplos_filmes(L) :-
    findall(Diretor, (diretor(F1, Diretor), diretor(F2, Diretor), F1 \= F2), DiretoresRepetidos),
    sort(DiretoresRepetidos, L).
?- diretores_com_multiplos_filmes(Diretores).

