man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

men:-man(X),write(X),nl,fail.
women:-woman(X),write(X),nl,fail.

% children(+X) - all children of X
children(X):-parent(X,Y),write(Y),nl,fail.

% mother(+X, +Y) - is X  a mother of Y
mother(X,Y):-parent(X,Y),woman(X),nl.
% mother(+X) - a mother of X
mother(X):-mother(Y,X),write(Y),nl.

% brother(+X, +Y) - is X  a brother of Y
brother(X,Y):-parent(A,X),parent(A,Y),X\=Y,man(X),man(A),nl.
% brothers(+X) - all brothers of X
brothers(X):-brother(Y,X),write(Y),nl,fail.

% b_s(+X, +Y) - is X a brother or sister of Y 
b_s(X,Y):-parent(A,X),parent(A,Y),man(A),X\=Y,nl.
% b_s(+X) - all brothers and sisters of X
b_s(X):-b_s(Y,X),write(Y),nl,fail.

% daughter(+X, +Y) - is X a daughter of Y
daughter(X,Y):-parent(Y,X),woman(X),nl.
% daughter(+X) - all daughters of X
daughter(X):-parent(X,Y),woman(Y),write(Y),nl,fail.

% wife(+X, +Y) - is X a wife of Y
wife(X,Y):-parent(X,A),parent(Y,A),woman(X),X\=Y,nl.
% wife(+X) - wife of X
wife(X):-wife(Y,X),write(Y),nl.

% grandson(+X, +Y) - is X a grandson of Y
grandson(X,Y):-parent(Y,A),parent(A,X),man(X),nl.
% grandsons(+X) - all grandsons of X
grandsons(X):-grandson(Y,X),write(Y),nl,fail.

% gmas(+X, +Y) - are X and Y grandma and grandson
gmas(X,Y):-grandson(X,Y),woman(Y),nl.
gmas(X,Y):-grandson(Y,X),woman(X),nl.

% uncle(+X, +Y) - is X an uncle of Y
uncle(X,Y):-parent(A,Y),brother(X,A),nl.
% uncles(+X) - all uncles of X
uncles(X):-uncle(Y,X),write(Y),nl,fail.


% OnlyFacts predicates - built by only using facts and nothing but facts

% fgrandsons(+X) - all grandsons of X
fgrandsons(X):-parent(X,A),parent(A,Y),man(Y),write(Y),nl,fail.

% fgmas(+X, +Y) - are X and Y grandma and grandson
fgmas(X,Y):-parent(Y,A),parent(A,X),man(X),woman(Y),nl.
fgmas(X,Y):-parent(X,A),parent(A,Y),man(Y),woman(X),nl.

% funcle(+X, +Y) - is X an uncle of Y
funcle(X,Y):-parent(A,Y),parent(B,X),parent(B,A),X\=A,man(X),man(B),nl.
% funcles(+X) - all uncles of X
funcles(X):-parent(A,X),parent(B,Y),parent(B,A),Y\=A,man(Y),man(B),write(Y),nl,fail.
