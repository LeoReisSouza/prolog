pai(joao, maria).
pai(adao, cain).
pai(adao, abel).

humano(joao).
humano(maria).
humano(adao).
humano(cain).

mortal(joao).

mortal(x):- pai(x,_).
mortal(x):- pai(_,x).

avo(X,Z):- pai(Y,Z), pai(X, Y).

irmao(X,Y):- pai(A,X), pai(A,Y), X \= Y.
%irmao(X,cain)
